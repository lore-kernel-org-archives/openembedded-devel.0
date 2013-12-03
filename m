Return-Path: <andre.draszik@linaro.org>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1C66F6D3A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 15:20:57 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so1582893eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Dec 2013 07:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=XvdBLj2/tF/8m+J3n7IdQ5HnJPcNwOUWl9a6C8OmjQs=;
	b=k+wTmQca6RqIMunE+OBpRftPgidzhzfHIwq993tBjnxF/X3q45oYfnGDN1Ga2QBMf3
	bvUognG27Gf3P73JSkICYuYFQKM6eC3QdcQwOsr6/uumlplasD72/hTQqrVcxqDtmYEc
	ixG3NIhUI+PzxaphqhckO4hiebtjPfrSRd3lgqS94aRiOHLe9xP6uOTd12ZfDZXfbxov
	kR+HL+B04Q+WezYST3fRAbiWNHOFgyYYIeSDhRRpJr8PY67acjV2mJ+JXWi6GnRVN/01
	Urwo3xwlHnsD50ChU1LHtBjy9n3gJFFtaad/mQAdKxfg6czsZCLcHlcgLQIs6i9gMjt8
	Qd6A==
X-Gm-Message-State: ALoCoQldo7EtbuZDC+QkF7AsGKKrMVurkJF3DvYQ0h8/kUhQceHoc5WZqWxJ9I+I6uLF5WFHtUqJ
X-Received: by 10.14.5.12 with SMTP id 12mr71858544eek.9.1386084057488;
	Tue, 03 Dec 2013 07:20:57 -0800 (PST)
Received: from bri0771.fritz.box (pD4B88AB0.dip0.t-ipconnect.de.
	[212.184.138.176])
	by mx.google.com with ESMTPSA id e3sm46644937eeg.11.2013.12.03.07.20.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Dec 2013 07:20:57 -0800 (PST)
From: Andre Draszik <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Dec 2013 16:20:55 +0100
Message-Id: <1386084055-10649-1-git-send-email-andre.draszik@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1386083079-10368-1-git-send-email-andre.draszik@linaro.org>
References: <1386083079-10368-1-git-send-email-andre.draszik@linaro.org>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qt5.inc: allow to set the package arch globally
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Dec 2013 15:20:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@linaro.org>

If Qt5 (qtbase) is machine specific, then all packages depending
on qtbase will also be machine specific, because the (initial)
qtbase configuration becomes part of Qt5/qmake, thus affecting
builds of packages built against this specific version of qtbase.

Since it is not feasible to add PACKAGE_ARCH=... to each and every
recipe that is built using qmake and depends on Qt5, we introduce
a new variable, QT_PACKAGES_ARCH, that can be set by the machine
configuration as needed.

We have to be careful though to only change the architecture of the
resulting packages if we're not compiling a 'native' package.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 recipes-qt/qt5/qt5.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 7669efc..8d8438f 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -20,6 +20,18 @@ OE_QMAKE_PATH_SETTINGS = "${OE_QMAKE_PATH_QT_SETTINGS}"
 OE_QMAKE_PATH_EXAMPLES = "${OE_QMAKE_PATH_QT_EXAMPLES}"
 OE_QMAKE_PATH_TESTS = "${OE_QMAKE_PATH_QT_TESTS}"
 
+# If Qt5 (qtbase) is machine specific, then everything will be,
+# because the (initial) qtbase configuration becomes part of Qt5/qmake
+python __anonymous() {
+    barch = d.getVar("BUILD_ARCH", True) or ''
+    tarch = d.getVar("TARGET_ARCH", True) or ''
+    # do not do anything if we are building a native package
+    if barch != tarch:
+        tarch = d.getVar("QT_PACKAGES_ARCH", True) or ''
+        if tarch:
+            d.setVar("PACKAGE_ARCH", tarch)
+}
+
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
 # extra -dbg packages
-- 
1.8.1.2



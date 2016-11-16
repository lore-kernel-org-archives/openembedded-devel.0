Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E32B601F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:02:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a20so8839453wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 01:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u8zjj4CyaBSmuH8kq1PJ6qyqOr+/lIfuI0vqzwqt0RM=;
	b=F1+qYtpWULoqdtGx+DOdvVhtZDwmVQ00hyyOxFJPYvmFLa30lWVs3ahsZWB4GSJtjC
	KrGkpxvMZTMaCUGzeiJNjsYw/E6EBHXlDt/TnmSpSr2eJxeIa4gto6foPNbR+G7IWGzB
	Wz8I1M+vBP2dwq3J4MBW+Qe734QqDfs1GEPl28wo7KrnUwTltYlVHh9u5VnJ1qvhHBtR
	1HzysTYG/7wJLLSK5ngMpaQveTwM8KUuzIy7r32qXnPcQOZQ+Gl67mpNLjeXFAswGCKa
	LSH/EPqcXr8hGFoyasrVaXuw/RxVPDhdhSFODCGIr34l5lK3Z/QbcuTrzoOy4O+P7SFo
	e1Qw==
X-Gm-Message-State: ABUngveJv+yRSJK6rMo/3EAwUPykOoZeVqeFV7/m9LbNPfl2zVXBl3p77wnN25NEc8I1Vg==
X-Received: by 10.28.107.77 with SMTP id g74mr8142023wmc.109.1479286956311;
	Wed, 16 Nov 2016 01:02:36 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	z6sm39248754wjt.24.2016.11.16.01.02.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 01:02:35 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:02:34 +0000
Message-Id: <20161116090234.30806-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161115154311.30118-3-git@andred.net>
References: <20161115154311.30118-3-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2016 09:02:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
new file mode 100644
index 0000000..7bbaaad
--- /dev/null
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -0,0 +1,32 @@
+SUMMARY = "a fast file copy tool for LANs"
+DESCRIPTION = "ncp is a utility for copying files in a LAN. It has absolutely no \
+security or integrity checking, no throttling, no features, except \
+one: you don't have to type the coordinates of your peer."
+HOMEPAGE = "http://www.fefe.de/ncp"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+DEPENDS = "libowfat"
+
+SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
+SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
+SRC_URI[sha256sum] = "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
+
+EXTRA_OEMAKE = "\
+    DIET= \
+    DEBUG=nostrip \
+    CC='${CC}' CFLAGS='${CFLAGS} -I${STAGING_INCDIR}/libowfat' LDFLAGS='${LDFLAGS}' \
+"
+
+do_install() {
+    install -d -m0755 ${D}${bindir}
+    install -d -m0755 ${D}${mandir}/man1
+
+    install -m0755 ncp ${D}${bindir}
+    ln -sf ncp ${D}${bindir}/npoll
+    ln -sf ncp ${D}${bindir}/npush
+
+    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
+    ln -sf npush.1 ${D}${mandir}/man1/npoll.1
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2



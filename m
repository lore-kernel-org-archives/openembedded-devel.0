Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70AF0770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id a140so1214162wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=g/IFkoGoUYkbtHn+eBt6FbdkqCxWNauVyLzBFQ7DQ34=;
	b=uEWkrift69SVVx5+EKX6nUdLjoav4cYL+FToM9JWpuMnK0AYiheDjCKNLKZ1ZEgu2U
	KfB9+TRLgwPY74kX70044aP+JqQ55zSBp9oZ250jiWCDyjHR59CRjHDTHKacYTHZgOvh
	NGpKFy+p0qSCRcnY50HeY8qLVPWtbZeHX6LmIQvxDLI3sYqDiNHbBu4SMEjdySHl2Qms
	3l2WHKo6AIOr36coxuZFkZpjqDCQ0pys1SYd96mwGxssICoLvmLWLp08my01u6biIdIe
	i0MS3piMemCTfLLd76N5cdurG0Hu/QRZDn5KlG46nAypYEH8z4TxA7ZyM+Wh5QyS2Cym
	Ibsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g/IFkoGoUYkbtHn+eBt6FbdkqCxWNauVyLzBFQ7DQ34=;
	b=bWuZkU0IfgQWk5PgBr2wLulam3QLKZX4pt9USbenil5kI7MUZQ8Ki5sFXZZRbkUMaR
	EXQTOVdBVylb0ToU0cP4EcT+jUtBTMoajY/gCRKz9XR26P9BUYTTJ2igtqvb30HcheFF
	fT5Tif2ucxMiM6f36q3bBiXfT+JY5vkIIa9f9ZTef7cJGXRz6DKKaZ+fKJXGZXlXjwrn
	kMVXoAXjjuyUR5SSPrRvS4pPF0u9Pcuw+zdPDQu9WFwXBZa7svWOdCw3+NRfZcoVviUT
	8M2sc1z2I/9lfxUcs2b+jHOu26djAMJJr9Hwc3hvWisaJP8uC09wiXL2n0tfp2/YfqA8
	yvow==
X-Gm-Message-State: AD7BkJKCMmrYbE/S+ncocVgCV1mcmdpzJTSZsptOKxjT6BATsunpJEg9gk7Q7rnutOz47A==
X-Received: by 10.194.71.46 with SMTP id r14mr23198501wju.100.1459834761090;
	Mon, 04 Apr 2016 22:39:21 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:40 +0200
Message-Id: <1459834720-17165-32-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 31/31] qtquickcontrols2: initial add 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquickcontrols2_git.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 recipes-qt/qt5/qtquickcontrols2_git.bb

diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
new file mode 100644
index 0000000..41c781e
--- /dev/null
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -0,0 +1,15 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+"
+
+DEPENDS += "qtdeclarative"
+
+FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
+
+SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
-- 
2.5.5



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8326CFF9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2013 09:01:28 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id l10so101796eei.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2013 01:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fotNqX+oellevKa8aGHIw86pf6eDIg0hqdQgSsAWD2U=;
	b=oW+qlthehuCtkcnhsRrRyA5kxTLURYDEM1jPycgbsOXi22FkSpEr4iWEY0D0sWCR9z
	qhadgjEdtao8UC8W+Q9CafWn17H+hTnZXCAaxLWFe8c8SJCa/B/ZwMG/CXDUeGCXGVT/
	D0iiL3FzcQishJmDdAWK57QaBtVxYPTAzoWH/nkUSSdEM/lG5KSiKNuPkzFuwAXbD/IW
	iCmsT0enLtoVhyGHOYHjXRktlh/LsrtN9qZSXLy2wIrRLGePyLt9WummITUEqUTkJ4gA
	WmOzae6BSRI0zUsaAQZ+4o4EBkcu6/FoQ7rh3utvDz2CVFoHNwVzO4eMDoRNH5CbEAOh
	5Ljg==
X-Received: by 10.14.107.133 with SMTP id o5mr646024eeg.110.1384074090576;
	Sun, 10 Nov 2013 01:01:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm38464271eeg.13.2013.11.10.01.01.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Nov 2013 01:01:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Nov 2013 10:01:43 +0100
Message-Id: <1384074103-15556-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384074103-15556-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384074103-15556-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [for-dora][PATCH 3/3] libmikmod: use SOURCEFORGE_MIRROR
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
X-List-Received-Date: Sun, 10 Nov 2013 09:01:29 -0000

* archives are no longer available on old URL

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
index 4ab293f..e0a04ae 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=b2b941d484c442e5c031a51463d8e11b"
 DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
-    http://mikmod.shlomifish.org/files/${P}.tar.gz \
+    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
 SRC_URI[md5sum] = "60ac77a804d082230df3009af11ef44f"
 SRC_URI[sha256sum] = "2311b209255bf24e95161907a16778cb054ac6d447fd8d05f1f0e41a555c7580"
-- 
1.8.4.2



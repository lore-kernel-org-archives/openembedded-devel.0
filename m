Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1706B81C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:54 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so180908ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mWgTEwLA8e9l8siFCNE+IxON9OUKo6PHCr704cFRbr8=;
	b=NSspL5pUfNQaieB1CkVT4zQriX/vh+yaBRHFsj8aIjhjcqzz/6H7cX15t9YxUNrqls
	nl5mYxJnIgPHjNeJqS87e59TaWIgWdOa71BB/FKhPPonL1JcfcCIw4kW9v12vYCEX3k+
	nkS8mSM/vdJYxJJuh39Xw/CdPsFtViqlHhKKrLeHvKvjbBX9jF59ZwThymP94fcou+/2
	OfZpVZkEarqIr7zR3M5RgtaS4XMYds8RJ60fFEIEQcajivgDGw1zHaMwiVGcRLRWoEAx
	zp/SU8I6hLVrhc6tkD6lshKS3DtNiYV9WcB7M7+TbusTZ8Ylh6xMOmPUL0tGW4aTCAL0
	2EKA==
X-Received: by 10.14.219.198 with SMTP id m46mr20466046eep.41.1376551194836;
	Thu, 15 Aug 2013 00:19:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm81937237eem.1.2013.08.15.00.19.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:26 +0200
Message-Id: <4635c429daee04c76fad3c8c91815a7e4ca35837.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 46/60] usbmuxd: add PACKAGECONFIG for plist
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:54 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index bb92941..595582a 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -17,3 +17,5 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
-- 
1.8.3.2



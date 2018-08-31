Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0563F79567
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:41:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c14-v6so5300098wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RsjZ8VwQ8A8ziyMV1NlTDs1cQ/aQQ2UkBZothzc69vg=;
	b=GWusxu2Vz/KrUXNPPuloE81vQiwAxI5mbT4MYxxsjDOr98Zs3N9kh+DORr8z/L7LOY
	FYDcq6ncA4sy/NnjuSmxi4x3PurIAp1xA0LAAKAxvn1Lb6pAyAGpdvz2Cbae4fHCBnUJ
	aQpsDoVq9JoRCu2XeDrnKU7JjMfFfLWu0lGRLGcJwqakRHXVQmd1pWSXuuXKQlIog1EO
	3bxBai0j8V2SoSF3ZQZz2IfgXQJ+6xuuKD/TJMYHJcVPx2isw0udP/dOGr9SQsAfpzac
	d14sY6xeC3TW2mU78HXV8h+HkDbRJ/nH1lwqEOdymNtiNEkLmPzfqUavyiu0cx08ea0e
	8jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RsjZ8VwQ8A8ziyMV1NlTDs1cQ/aQQ2UkBZothzc69vg=;
	b=P42+bkcGADTowl6A5/lEpXepRzlMw3sPztGQWHpnxIirQ/VmvaifVBMW8VCSuypK48
	rTKlnfMG5AEuH+mz+WFnBrgnHq01P4pxDzAIaaIHM7CdMc/HeqFFcffdkaa1+gbr8aEc
	2ae5kfdNecVawrMB3/6zu0XKMiXy5WY01+niVSc6KCIBi7js50SYB+V51Qd02ZZY1JV4
	jrqvd7SkO/HbTOdOw1vILgy/jymJWo3LwMtkhdfuUIxr4nT2pV6iWtiUStkOf6c2OI0M
	RLQhE2P3RIZ66UAeR85QKW75KYVEBFDVOjVimKxWaTSxY3JVXLzyAMKty30jldtQkiIO
	TeLw==
X-Gm-Message-State: APzg51DjYCQJlkBtRrZotAlDtEDwJiU/uYxu8+g5mHT4dd85bfYesxOY
	VvKS61OS3Ai3u97kad3JwiadcHQM
X-Google-Smtp-Source: ANB0VdaafLtrUPVQ3YlxIvg1KpZDdAEAtxoYp21RnnxlbXIKhM1k/nf8RYCgWIqlpPEyAguWIttzjg==
X-Received: by 2002:a1c:a552:: with SMTP id
	o79-v6mr4703970wme.45.1535722889516; 
	Fri, 31 Aug 2018 06:41:29 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	z14-v6sm3947118wma.18.2018.08.31.06.41.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 Aug 2018 06:41:28 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:41:25 +0200
Message-Id: <1535722885-31725-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: upgrade to latest master
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
X-List-Received-Date: Fri, 31 Aug 2018 13:41:29 -0000

as of b9de21ef51a7ceab7122a707c188602eae22c4ee we can remove
obsoleted kdump and get the --no-checks option.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 14edec2..4518e70 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "zlib xz"
 inherit klibc autotools
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"
-SRCREV = "0481e9ed61ef80b3d851bb96b0c70a3d4a112c8b"
+SRCREV = "b9de21ef51a7ceab7122a707c188602eae22c4ee"
 
 BUILD_PATCHES = "file://0001-force-static-build.patch \
                  file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch"
@@ -82,10 +82,9 @@ do_compile_prepend() {
     done
 }
 
-PACKAGES =+ "kexec-klibc kdump-klibc"
+PACKAGES =+ "kexec-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
-FILES_kdump-klibc = "${sbindir}/kdump"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.7.4



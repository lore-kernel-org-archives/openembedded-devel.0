Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7C760069
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 23:23:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x10so118319wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 15:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nEV7jZQ9zwpQsA6r3HT4JS3Yd0Z986Ev2uuprf4Jka0=;
	b=lGwvtAZ1YWOd/7f5LYwNjD9sDH7SeFedIiOsl1NxFhAR3ySrKmOkhxPHxiYxUbmnpf
	h8+GP3KBh9MeKmvXgFCs8PTui9dG10f2V+P5qqc7UYWAy23kDFX8z6MTnYf25QPpF7a3
	PRlajYKNaRI4Uxrce+nbRdN1Owjg1CGxYKfM8QwJpxtIFLPZBPxsvStf5BlPuQhLmHlg
	NuWQAKs+LHh87ihOsnJoIdujk53DiKB45+bITPPfynyq4/kn18z3L0vXYSxK8Gt1N5DE
	GweEjp37jsXxejx/t4fg3UJmHR3KDgtGFARzlV6hmIE0bDLn5IQ43DFhxCMu6z3na65P
	yh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nEV7jZQ9zwpQsA6r3HT4JS3Yd0Z986Ev2uuprf4Jka0=;
	b=ZIYEIjtWH2kqbkJzFMbnCmUPRP2FbHMBHXm83V0fH74kULMINdtZwP7jXo1TBq4RLf
	dQMEUDXPHXH73x8LUOaH8ULSczo3C1fqxlmP6sB/Ol2tTuFF5Ux78ldzaKf6It9wjlld
	Ht/Ckw0pfWDfMTRSNuA7Pl+muqYoLOkYJi+im3ulUuRCba4acQhwRKBX36AYbHRhPn2z
	eW/fu+xLnlkVqf9eiCPb3peB9+hfYQ1xcuPej5xKFocyeWW5X06m5NOntxr/H36J3gV6
	eV+62e5wOTG1ICuT8IEo7/ibEx6Cun2Zo8UhLZBe3YOOTxUrHkBJnWb70BKqWjB+5mrb
	e17g==
X-Gm-Message-State: AA+aEWY940ZdwcT0Cyv5dqPCN+C0djl/9gjFL18n5FdcxdYRnBa6o3EO
	S1zU3drpwSlhbAVW75HXhSL+3RBm
X-Google-Smtp-Source: AFSGD/Wd1spNHqbDaitjIivouhkk3uLKQVqAZsPB/1sAR7aqIrtUXuoprTI5fjdfZcYqqWgLZPKMxw==
X-Received: by 2002:adf:a1d2:: with SMTP id v18mr18113185wrv.87.1544657038652; 
	Wed, 12 Dec 2018 15:23:58 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host55-101-dynamic.58-82-r.retail.telecomitalia.it. [82.58.101.55])
	by smtp.gmail.com with ESMTPSA id
	q185sm608250wmg.14.2018.12.12.15.23.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 15:23:57 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2018 00:23:49 +0100
Message-Id: <20181212232349.13055-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: update to 2.0.18
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
X-List-Received-Date: Wed, 12 Dec 2018 23:23:58 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index cc1c5518b..6ffa2aad6 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -6,14 +6,14 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
-PV = "2.0.17+git${SRCPV}"
+PV = "2.0.18+git${SRCPV}"
 
 DEPENDS = "zlib xz"
 
 inherit klibc autotools
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git"
-SRCREV = "b9de21ef51a7ceab7122a707c188602eae22c4ee"
+SRCREV = "5750980cdbbc33ef75bfba6660295b932376ce15"
 
 BUILD_PATCHES = "file://0001-force-static-build.patch \
                  file://0002-Adjust-the-order-of-headers-to-fix-build-for-musl.patch"
-- 
2.17.1



Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB006BDCE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:11:44 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so549453eaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=EjP65eeSQfGbfz8T04P8piMdq7K44qPb50SzL47IFME=;
	b=s8JzwSwG7SjZzrXNMZGvLvcCje8PHdOwuId7YeHRg4WslnqdS7dOxho3KCzZ1eH+Ta
	FLLyXOToYKT25wlG+VD1fBJFRL/WWgetZ1YUXRvjdRxua/c6FdzlvmSLWS+fzfYH+AKA
	S9xARTW6E+qzO3/WA8NvsJn62gGBX4cLQvq5ZfRJiZTVkSYD1IWoZFj7Bth+2D4cVNMM
	aVBXfozWwTmLhTAilFbRD4MbHjQLbUnLdl0V+FQfYxNnxTDblJ2R+cFgO2h82L+jDkA4
	t0jJuRm8NxU89uupgRSiQrqhL8Zwgw1BzUqZJzeyV8HOess3YtO1PTpeASq69kvZ6USn
	lJ+g==
X-Received: by 10.15.48.67 with SMTP id g43mr7533626eew.17.1377817904960;
	Thu, 29 Aug 2013 16:11:44 -0700 (PDT)
Received: from mizar.localdomain
	(host202-221-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.221.202])
	by mx.google.com with ESMTPSA id a6sm49952754eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 16:11:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2013 01:11:31 +0200
Message-Id: <0b233da1e62a781eb92c11b7737758873e083913.1377817383.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1377817383.git.andrea.adami@gmail.com>
References: <cover.1377817383.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] kexec-tools-klibc: fix includes now that klibc respects exec_prefix
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
X-List-Received-Date: Thu, 29 Aug 2013 23:11:45 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index a54d38e..b1b6ffc 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -28,8 +28,8 @@ S = "${WORKDIR}/kexec-tools-${PV}"
 
 EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 
-CFLAGS += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits32"
-CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${base_libdir}/klibc/include -I${STAGING_DIR_HOST}${base_libdir}/klibc/include/bits64"
+CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
+CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 
 PACKAGES =+ "kexec-klibc kdump-klibc"
 
-- 
1.8.1.5



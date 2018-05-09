Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 04308748DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 18:28:50 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id e12-v6so49220iob.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 11:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=9hyqT2khnopkmHFu74//BP6EA4uDAx9WDa3CK48kyIc=;
	b=uFbbgvMzN6NDS+aoXnobohIhMebsPj7okaQym3C1KEUGorFczrykLT5VJH5ZpCKSsf
	KWCL35XEVvgOobxviHJjVciXMdBXZEGT0iL0gT93mJSBf5n+Z/qf0LtOesUpVedr1Znv
	GC1ZLSe+/yuZh6twcl2+DXQjNgVtVt1hrBPDhAECu2wz25QFzdAUJ65YuNK60aJzDirW
	NSBkVd3hha64bAbA2JIlf0yoIqNtKovyg7jLi+hOEQd2/dOQIlQP33PQC0f5DJ5Oo3a5
	wAnqoTHPwVbWcnzCg+pUuNQh9XOmy8MkwG8d5/vDK0sP4TdM+IZdfe016jK69UbK0BRe
	VYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9hyqT2khnopkmHFu74//BP6EA4uDAx9WDa3CK48kyIc=;
	b=WExJH+edfL1P463NacwWyrYmGbTY6gIbZhKjeSNami0VrYdI/W7HuTyZMakHHEzc5D
	ivrBvA6Q3hrB6YOPMz2VZLGwEOtZ2H7dEBnVqytjxH4rO6G3IV0CuuYkPBxe8IZcMJdm
	vph8HmC0CKguIEdmLuwsU8HtWtMdc11Ns6sZ0didcbf3oDEukTJKC1tLW0FkAFRBs574
	bVgrqOQWwItMYBNAfQEg4oRT6ivPpyGRkEwiALBQdLlcbh4IOM+6ULZ7zW6guFIrBG48
	8ZhKuNhztHoHxKBKkEGuaJMXVdpwfJpRywzbooa0IbTwblRirEAQWA76SrTYzUnkWi4p
	7ZXw==
X-Gm-Message-State: ALQs6tBpKT+wQYXzFF6fOApd6ahXA+YMGqOMfzCX7/FAlotmLm7XdrqJ
	QU3FXzWj0gU0BHt/JaOUWUCuG2qG
X-Google-Smtp-Source: AB8JxZrBQ+AwYgXluJsp/q4xdjdB1sCtFxPfeZE3G3Ck58CIo3fmHVXvy0nC5REb1Gge4QIp5rmRGw==
X-Received: by 2002:a6b:83da:: with SMTP id
	n87-v6mr51508000ioi.268.1525890531109; 
	Wed, 09 May 2018 11:28:51 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	g16-v6sm5876963ita.0.2018.05.09.11.28.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 11:28:50 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 14:28:39 -0400
Message-Id: <20180509182840.21251-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-initramfs][PATCH 1/2] grubby: switch away from github archive
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
X-List-Received-Date: Wed, 09 May 2018 18:28:51 -0000

Since we know that github archives that are automatically generated have a
tendency to change their checksums[1], switch to using git clones.

Also, discovered that the sources for this project are no longer at
github.com/rhinstaller but are located at github.com/rhboot.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index 5a998248c8..dc3a70bb52 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -4,6 +4,7 @@ about the configuration files for the grub, lilo, elilo (ia64), yaboot (powerpc)
 zipl (s390) boot loaders. It is primarily designed to be used from scripts which install \
 new kernels and need to find information about the current boot environment. \
 "
+HOMEPAGE = "https://github.com/rhboot/grubby"
 LICENSE = "GPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
@@ -11,18 +12,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 DEPENDS = "popt util-linux"
 DEPENDS_append_libc-musl = " libexecinfo"
 
-SRC_URI = "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
+S = "${WORKDIR}/git"
+SRCREV = "79c5cfa02c567efdc5bb18cdd584789e2e35aa23"
+SRC_URI = "git://github.com/rhboot/grubby.git;protocol=https; \
            file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
            file://run-ptest \
            file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
            file://0002-include-paths.h-for-_PATH_MOUNTED.patch \
            "
 
-SRC_URI[md5sum] = "1005907b275d6d93368d045274537d86"
-SRC_URI[sha256sum] = "85f1c678484f74c8978e8643451594967defce463a86c35cb1ee56d12767a9df"
-
-S = "${WORKDIR}/${BPN}-${PV}-1"
-
 RDEPENDS_${PN} += "dracut"
 
 inherit autotools-brokensep ptest
-- 
2.17.0.rc2.3.gc2a499e6c



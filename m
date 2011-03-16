Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzuNp-0004FD-Mu
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:19:42 +0100
Received: from source ([209.85.210.177]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDww6VrXuHu+7O6ysJQc0S9cisiug8g@postini.com;
	Wed, 16 Mar 2011 10:18:00 PDT
Received: by mail-iy0-f177.google.com with SMTP id 40so2228584iyf.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 10:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=WmYt37CntVzfpbJfu4wSK3igzhyEjC2sUtRTh/GzeHA=;
	b=GAfnr3Cj0RNJf6+vzIzr+trdpRXNv0Sfh4D6SUdAQbmgjfK5kynDGXVryFOfKPNXeK
	pgDhtg1tULMzR1QDOtotwZ4rbX4SVYOjysqAU8MvteFAH9iKhOuPh5fsVXQkTyUjPBB1
	AFpIsBGdzRzeNB1WIVY1/XKWu6DefzslYXmko=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lw7OwEs2Yxwljwvja07nr3HHsKl9PmtXrJF16QqhwW1sPHBSEEC4qBqSc+x0PbrOFp
	c5uNxuAA6CTiPCZPyAoMa8ljdkUgn5r45m0h+DdkNk1+8QiiSXOy6tFoHPcpGEv8Gbmm
	WRmN4AWDf06qi0388XWEGEau5IliMNX5oiiw8=
Received: by 10.42.145.71 with SMTP id e7mr287731icv.314.1300294249169;
	Wed, 16 Mar 2011 09:50:49 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:48 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:37 -0400
Message-Id: <a96c10d6cff4f8298c43eccd9139dd20d41a4cc8.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Subject: [2010.03-maintenance] [PATCH 4/7] external-toolchain-csl: allow linux-libc-headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 17:19:42 -0000

If PREFERRED_PROVIDER_linux-libc-headers is defined as anything
other than external-toolchain-csl then don't PROVIDE, install or
stage the linux headers packaged with the CSL toolchain.

(Updated by Tom Rini to not modify local.conf.sample yet and to use
cp + rm -rf rather than rsync)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
Tested-by: Andrea Galbusera <gizero@gmail.com>
Signed-off-by: Tom Rini <tom_rini@mentor.com>
(cherry picked from commit 3116ad58e507c6e5dc7b7249f521c395db586b9f)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 recipes/meta/external-toolchain-csl.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
index 2e109c8..0761cf2 100644
--- a/recipes/meta/external-toolchain-csl.bb
+++ b/recipes/meta/external-toolchain-csl.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -21,9 +21,10 @@ PROVIDES = "\
 	virtual/libintl \
 	virtual/libiconv \
 	glibc-thread-db \
-	linux-libc-headers \
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
 "
 
+DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
 RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
 PACKAGES_DYNAMIC += "glibc-gconv-*"
 PACKAGES_DYNAMIC += "glibc-locale-*"
@@ -35,7 +36,7 @@ PACKAGES = "\
 	libgcc-dev \
 	libstdc++ \
 	libstdc++-dev \
-	linux-libc-headers \
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
 	glibc-dbg \
 	glibc \
 	catchsegv \
@@ -214,6 +215,7 @@ do_install() {
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/sbin/* ${D}${base_sbindir} \
 		|| true
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
 
 	rm -rf ${D}${bindir}/gdbserver
@@ -227,6 +229,7 @@ do_stage() {
 	install -d ${STAGING_DIR_TARGET}${base_libdir}
 
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/include/* ${STAGING_INCDIR}
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${STAGING_INCDIR}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/lib/* ${STAGING_LIBDIR}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/lib/* ${STAGING_DIR_TARGET}${base_libdir}
-- 
1.7.1




Received: from na3sys009aog107.obsmtp.com ([74.125.149.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1Pztxb-0006xp-RP
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:52:39 +0100
Received: from source ([209.85.210.173]) (using TLSv1) by
	na3sys009aob107.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTYDqbCoY+Cch+/REcEUB+opDMPuhqVuH@postini.com;
	Wed, 16 Mar 2011 09:50:54 PDT
Received: by mail-iy0-f173.google.com with SMTP id 7so2045854iym.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=A/TEYTOOL0rY/kIhgCwrQlgnPVZr29S+PiZL0j/+VKk=;
	b=SNkA5zFUPovoybBJxbzEONXI0mVN6RTdbAUIER367Uqn2erVTXtCucDmh5DpJVZJr4
	lmPG0QN6u0xUdahbD2YPvRB+DD55xnt7twzKQYpBXUBqXED2I57mIJOzzl95lCIrt14v
	tmT+79n9RVlRMSjsUovWtUkQ6vLUlQ+GEi494=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=h6aFKNYBmAecRxNlMSiwpP+b3fDGm+wGcaVUqOeMUZTZ0h8rFWa0XHfD4Q0YLUfWC5
	m6WJsLLaipW0Xe59WfW7u5AybAtDbMbw2/QECE+p3OL1j1N4SkaeKp5qHbLurX6MUYEu
	GpFm5leW5hFd9fc+FF7rjymYppU6YfZlQW+a0=
Received: by 10.231.130.147 with SMTP id t19mr200165ibs.55.1300294251836;
	Wed, 16 Mar 2011 09:50:51 -0700 (PDT)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id q34sm39593ibu.40.2011.03.16.09.50.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:50:51 -0700 (PDT)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 12:50:39 -0400
Message-Id: <2641cb6d7e2db1dcd2608bae7d84909915b1f023.1300293663.git.bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1300293663.git.bengardiner@nanometrics.ca>
References: <cover.1300293663.git.bengardiner@nanometrics.ca>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [2010.03-maintenance] [PATCH 6/7] external-toolchain-csl: handle packaging of gdbserver based on PREFERRED_PROVIDER
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
X-List-Received-Date: Wed, 16 Mar 2011 16:52:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

Allow packaging independent copy of specific version of gdbserver with
external-toolchain-csl by setting PREFERRED_PROVIDER. E.g. for GPLv2
gdbserver, add these lines to your distro/local.conf:

PREFERRED_PROVIDER_gdbserver = "gdbserver"
PREFERRED_VERSION_gdbserver = "6.6"

Thanks to Ben Gardiner for providing valuable feedback.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
(cherry picked from commit a47c14c83cf97a2c90ee50ec7212ec33bdafb58b)

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
---
 recipes/meta/external-toolchain-csl.bb |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
index e56b74f..619658e 100644
--- a/recipes/meta/external-toolchain-csl.bb
+++ b/recipes/meta/external-toolchain-csl.bb
@@ -1,4 +1,4 @@
-PR = "r9"
+PR = "r10"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -23,7 +23,7 @@ PROVIDES = "\
 	virtual/libiconv \
 	glibc-thread-db \
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
-	gdbserver \
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
 "
 
 DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
@@ -39,6 +39,7 @@ PACKAGES = "\
 	libstdc++ \
 	libstdc++-dev \
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', 'gdbserver', '', d)} \
 	glibc-dbg \
 	glibc \
 	catchsegv \
@@ -46,7 +47,6 @@ PACKAGES = "\
 	nscd \
 	ldd \
 	localedef \
-	gdbserver \
 	glibc-utils \
 	glibc-dev \
 	glibc-locale \
@@ -176,10 +176,10 @@ CSL_VER_MAIN := "${@csl_get_main_version(d)}"
 CSL_VER_GCC := "${@csl_get_gcc_version(d)}"
 CSL_VER_LIBC := "${@csl_get_libc_version(d)}"
 CSL_VER_KERNEL := "${@csl_get_kernel_version(d)}"
+CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
 CSL_LIC_LIBC := "LGPLv2.1+"
 CSL_LIC_RLE := "${@["GPLv3 with GCC RLE", "GPLv2 with GCC RLE"][csl_get_main_version(d) <= "2007q3-51"]}"
-CSL_VER_GDBSERVER := "${@csl_get_gdb_version(d)}"
-CSL_LIC_GDBSERVER := "${@["GNU GPL version 2", "GNU GPL version 3 or later"][csl_get_gdb_version(d) >= "6.7.1"]}"
+CSL_LIC_GDBSERVER := "${@["GPLv2+", "GPLv3+"][csl_get_gdb_version(d) >= "6.7.1"]}"
 
 PKGV = "${CSL_VER_MAIN}"
 PKGV_libgcc = "${CSL_VER_GCC}"
@@ -231,6 +231,7 @@ do_install() {
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/bin/gdbserver', d)}
 
 	rm -rf ${D}${sysconfdir}/rpc
 	rm -rf ${D}${datadir}/zoneinfo
-- 
1.7.1




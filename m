Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PvDZ5-0005V3-8R
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 19:47:55 +0100
Received: from source ([209.85.210.178]) (using TLSv1) by
	na3sys009aob114.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTW/iAjff1t5cjn0Hqo8L86eNJhdTpXRA@postini.com;
	Thu, 03 Mar 2011 10:46:28 PST
Received: by iyj8 with SMTP id 8so1103275iyj.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2011 10:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RPVGFB8RaOpY4Veb3khunwEgNU5QrDwUwvQYqPuHMqg=;
	b=n5DqPv+4QkBdyxu9rkX/DK9LG2ktb3k3uI6tULlGUbV6eW5W4g6osz0466gTYVV/2F
	1myKR316LpYKCN7lmjlLAdi5lKyd8Ce+od5aFz1n0Ae5/ukHsRL5H6/N+IEZYaJVXxUB
	brUtKM67gJzIb+WxF4P6LmWio8OvdYZaW4H5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=m81DCx/PIdhSybPPmTlosPtc9DcmUhKOCRgCPrVWHnLLaoaTrvmwhOc29RXPtrkpD9
	GCO74QMXHXwZI735af+r/fu9Z+yr+GFWLSKHPYHdINfZRgDthsphRHxKjYZxBExTus2D
	++W5skZWSwSSoL6navTB2Hl8Imck1eiwGNCzE=
Received: by 10.43.59.139 with SMTP id wo11mr1968841icb.292.1299176336488;
	Thu, 03 Mar 2011 10:18:56 -0800 (PST)
Received: from localhost.localdomain ([206.191.47.130])
	by mx.google.com with ESMTPS id wh3sm966093icb.12.2011.03.03.10.18.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 10:18:55 -0800 (PST)
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: openembedded-devel@lists.openembedded.org, Tom Rini <tom_rini@mentor.com>
Date: Thu,  3 Mar 2011 13:18:53 -0500
Message-Id: <1299176333-16449-1-git-send-email-bengardiner@nanometrics.ca>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20110303173224.GA16888@denix.org>
References: <20110303173224.GA16888@denix.org>
Cc: arago-devel@gforge.ti.com
Subject: [PATCH v2] external-toolchain-csl: allow gdbserver
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
X-List-Received-Date: Thu, 03 Mar 2011 18:47:55 -0000

If PREFERRED_PROVIDER_gdbserver is not empty then don't PROVIDE or
install the gdbserver packaged with the CSL toolchain.

Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>

---

Changes since v1:
 * test whether PREFERRED_PROVIDER_gdbserver is blank, not
   whether it is set to external-toolchain-csl. The latter results
   in a circular dependency when nothing is set, as it is in oe
   master w/o arago

This fixes the arago build
rm -rf arago-tmp ; MACHINE=da850-omapl138-evm bitbake
arago-console-image

on the following checkouts:
arago: d6634b5366be96e1d4c7ce12411e2058183d26cb
arago-oe-dev: (merge of 414823a3c0a88a3c6ff0f3b0187626b1905bfca4 from
git://git.openembedded.org/openembedded  into
0d7feb26d6d16da8327c258deb3260ac423813cd)
arago-bitbake: 789382350344a40a3d7c094b5a96bee2a69d01fa

The arago distro uses a specific
version of gdbserver and hence has PREFERRED_PROVIDER_gdbserver =
"gdbserver". Changing the PREFERRED_PROVIDER_gdbserver to external-
toolchain-csl does not fix the problem:

| Collected errors:
|  * resolve_conffiles: Existing conffile
/media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/device_table
is different from the conffile in the new package. The new conffile
will be placed at
/media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/device_table-opkg.
|  * file_md5sum_alloc: Failed to open file
/media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/opkg/*:
No such file or directory.
|  * file_md5sum_alloc: Failed to open file
/media/unixdata/src/oe-helios-next/arago-tmp/rootfs/arago-console-image/etc/opkg/angstrom/*:
No such file or directory.
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-arago-console:
|  *    gdbserver *
|  * opkg_install_cmd: Cannot install package task-arago-console.
| ERROR: Function do_rootfs failed
---
 recipes/meta/external-toolchain-csl.bb |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes/meta/external-toolchain-csl.bb b/recipes/meta/external-toolchain-csl.bb
index e56b74f..b0f482b 100644
--- a/recipes/meta/external-toolchain-csl.bb
+++ b/recipes/meta/external-toolchain-csl.bb
@@ -1,4 +1,4 @@
-PR = "r9"
+PR = "r10"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -23,10 +23,13 @@ PROVIDES = "\
 	virtual/libiconv \
 	glibc-thread-db \
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', 'linux-libc-headers', '', d)} \
-	gdbserver \
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'gdbserver', '', 'gdbserver', d)} \
 "
 
-DEPENDS = "${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)}"
+DEPENDS = "\
+	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'linux-libc-headers', d)} \
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'gdbserver', 'gdbserver', '', d)} \
+"
 RPROVIDES_glibc-dev += "libc-dev libc6-dev virtual-libc-dev"
 PACKAGES_DYNAMIC += "glibc-gconv-*"
 PACKAGES_DYNAMIC += "glibc-locale-*"
@@ -46,7 +49,7 @@ PACKAGES = "\
 	nscd \
 	ldd \
 	localedef \
-	gdbserver \
+	${@base_conditional('PREFERRED_PROVIDER_gdbserver', 'gdbserver', '', 'gdbserver', d)} \
 	glibc-utils \
 	glibc-dev \
 	glibc-locale \
@@ -230,6 +233,7 @@ do_install() {
 		|| true
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/libc/usr/* ${D}/usr
 	${@base_conditional('PREFERRED_PROVIDER_linux-libc-headers', 'external-toolchain-csl', '', 'rm -rf ${D}/usr/include/linux', d)}
+	${@base_conditional('PREFERRED_PROVIDER_gsbserver', 'gdbserver', 'rm -rf ${D}${FILES_gdbserver}', '', d)}
 	cp -a ${TOOLCHAIN_PATH}/${TARGET_SYS}/include/* ${D}/usr/include
 
 	rm -rf ${D}${sysconfdir}/rpc
-- 
1.7.1




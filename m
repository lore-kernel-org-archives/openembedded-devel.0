Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C80176AC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:41:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L8fJ6I012984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:41:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Fri, 21 Aug 2015 01:41:18 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Aug 2015 16:37:11 +0800
Message-ID: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] Upgrade packages and fix failure of atftp with gcc 5.2
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
X-List-Received-Date: Fri, 21 Aug 2015 08:41:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  autofs: 5.1.0 -> 5.1.1
  atftp: build with gcc 5.2
  ltrace: 7.2 -> 7.3
  libvpx: 1.3.0 -> 1.4.0

 meta-networking/recipes-daemons/atftp/atftp_git.bb |   2 +
 ...emd-allow-with-systemd-to-take-a-path-arg.patch |  47 --------
 .../autofs/autofs-5.1.0/Makefile.rules-cross.patch |  23 ----
 .../autofs-5.1.0/add-the-needed-stdarg.h.patch     |  24 -----
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   |  75 -------------
 .../autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch   |  28 -----
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |  32 ------
 .../autofs-5.1.0/autofs-additional-distros.patch   |  12 ---
 .../autofs/autofs-5.1.0/cross.patch                |  44 --------
 ...x-the-YACC-rule-to-fix-a-building-failure.patch |  62 -----------
 .../autofs/autofs-5.1.0/fix_disable_ldap.patch     |  42 --------
 .../autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch |  25 -----
 .../autofs-5.1.0/libtirpc-name-clash-backout.patch |  28 -----
 .../autofs/autofs-5.1.0/libtirpc.patch             |  26 -----
 .../autofs/autofs-5.1.0/no-bash.patch              |  20 ----
 .../autofs/autofs-5.1.0/remove-bashism.patch       | 120 ---------------------
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch |  39 -------
 ...emd-allow-with-systemd-to-take-a-path-arg.patch |  47 ++++++++
 .../autofs/autofs/Makefile.rules-cross.patch       |  23 ++++
 .../autofs/autofs/add-the-needed-stdarg.h.patch    |  24 +++++
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   |  75 +++++++++++++
 .../autofs/autofs/autofs-5.0.7-fix-lib-deps.patch  |  28 +++++
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |  32 ++++++
 .../autofs/autofs/autofs-additional-distros.patch  |  12 +++
 .../recipes-daemons/autofs/autofs/cross.patch      |  44 ++++++++
 ...x-the-YACC-rule-to-fix-a-building-failure.patch |  62 +++++++++++
 .../autofs/autofs/fix_disable_ldap.patch           |  42 ++++++++
 .../autofs/autofs/force-STRIP-to-emtpy.patch       |  25 +++++
 .../autofs/libtirpc-name-clash-backout.patch       |  28 +++++
 .../recipes-daemons/autofs/autofs/libtirpc.patch   |  26 +++++
 .../recipes-daemons/autofs/autofs/no-bash.patch    |  20 ++++
 .../autofs/autofs/remove-bashism.patch             | 120 +++++++++++++++++++++
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch |  39 +++++++
 .../recipes-daemons/autofs/autofs_5.1.0.bb         |  72 -------------
 .../recipes-daemons/autofs/autofs_5.1.1.bb         |  72 +++++++++++++
 ...n-Linux-backend-initialize-linkmap-struct.patch |  31 ------
 ...-ltrace-fix-gcc-5-logical-not-parentheses.patch |  37 +++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |   8 +-
 .../0001-configure.sh-quote-local-variables.patch  |  40 -------
 .../libvpx-configure-support-blank-prefix.patch    |  42 ++++----
 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb    |  55 ----------
 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb    |  53 +++++++++
 42 files changed, 836 insertions(+), 870 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/Makefile.rules-cross.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/add-the-needed-stdarg.h.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-do-not-check-for-modprobe.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-fix-lib-deps.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/autofs-additional-distros.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/cross.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix-the-YACC-rule-to-fix-a-building-failure.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/fix_disable_ldap.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/force-STRIP-to-emtpy.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc-name-clash-backout.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/libtirpc.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/no-bash.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/remove-bashism.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.1.0/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/Makefile.rules-cross.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/add-the-needed-stdarg.h.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-do-not-check-for-modprobe.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-fix-lib-deps.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-additional-distros.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/cross.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/fix-the-YACC-rule-to-fix-a-building-failure.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/fix_disable_ldap.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/force-STRIP-to-emtpy.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/libtirpc-name-clash-backout.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/libtirpc.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/no-bash.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/remove-bashism.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs_5.1.0.bb
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs_5.1.1.bb
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.4.0.bb

-- 
1.9.1



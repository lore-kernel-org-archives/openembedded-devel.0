Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 053E46AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:36:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OFaCeM006930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Aug 2015 08:36:12 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 24 Aug 2015 08:36:11 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 23:31:51 +0800
Message-ID: <1440430315-10963-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/4] V2: Upgrade packages and fix failure of atftp with gcc 5.2
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
X-List-Received-Date: Mon, 24 Aug 2015 15:36:14 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* ltrace: update patch to work with gcc 5.2
* atftp: just update commmit message, no patch update. The reason is in mail I replied in V1 series.


Kai Kang (4):
  autofs: 5.1.0 -> 5.1.1
  libvpx: 1.3.0 -> 1.4.0
  ltrace: 7.2 -> 7.3
  atftp: build with gcc 5.2

 meta-networking/recipes-daemons/atftp/atftp_git.bb |  2 ++
 ...emd-allow-with-systemd-to-take-a-path-arg.patch |  0
 .../Makefile.rules-cross.patch                     |  0
 .../add-the-needed-stdarg.h.patch                  |  0
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   |  0
 .../autofs-5.0.7-fix-lib-deps.patch                |  0
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |  0
 .../autofs-additional-distros.patch                |  0
 .../autofs/{autofs-5.1.0 => autofs}/cross.patch    |  0
 ...x-the-YACC-rule-to-fix-a-building-failure.patch |  0
 .../fix_disable_ldap.patch                         |  0
 .../force-STRIP-to-emtpy.patch                     |  0
 .../libtirpc-name-clash-backout.patch              |  0
 .../autofs/{autofs-5.1.0 => autofs}/libtirpc.patch |  0
 .../autofs/{autofs-5.1.0 => autofs}/no-bash.patch  |  0
 .../{autofs-5.1.0 => autofs}/remove-bashism.patch  |  0
 ...-pkg-config-to-detect-libxml-2.0-and-krb5.patch |  0
 .../autofs/{autofs_5.1.0.bb => autofs_5.1.1.bb}    |  4 +--
 ...n-Linux-backend-initialize-linkmap-struct.patch | 31 ----------------
 ...-ltrace-fix-gcc-5-logical-not-parentheses.patch | 38 ++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  8 ++---
 .../0001-configure.sh-quote-local-variables.patch  | 40 ---------------------
 .../libvpx-configure-support-blank-prefix.patch    | 42 +++++++++++-----------
 .../webm/{libvpx_1.3.0.bb => libvpx_1.4.0.bb}      | 10 +++---
 24 files changed, 71 insertions(+), 104 deletions(-)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/0001-systemd-allow-with-systemd-to-take-a-path-arg.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/Makefile.rules-cross.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/add-the-needed-stdarg.h.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-do-not-check-for-modprobe.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-fix-lib-deps.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/autofs-additional-distros.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/cross.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/fix-the-YACC-rule-to-fix-a-building-failure.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/fix_disable_ldap.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/force-STRIP-to-emtpy.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/libtirpc-name-clash-backout.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/libtirpc.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/no-bash.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/remove-bashism.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs-5.1.0 => autofs}/using-pkg-config-to-detect-libxml-2.0-and-krb5.patch (100%)
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.0.bb => autofs_5.1.1.bb} (93%)
 delete mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-In-Linux-backend-initialize-linkmap-struct.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-ltrace-fix-gcc-5-logical-not-parentheses.patch
 delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-local-variables.patch
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.3.0.bb => libvpx_1.4.0.bb} (79%)

-- 
1.9.1



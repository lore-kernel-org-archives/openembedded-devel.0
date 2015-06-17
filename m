Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0485A60097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:58:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97190612"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Jun 2015 16:02:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5H7uSBE016484
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:56:29 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 17 Jun 2015 15:58:17 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jun 2015 15:49:06 +0800
Message-ID: <1434527353-47017-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH v2 0/7] add samba4 and required recipe
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
X-List-Received-Date: Wed, 17 Jun 2015 07:58:05 -0000
Content-Type: text/plain

Samba4 has already been supported by some distro such as Fedora, RHEL, Ubuntu,
So maybe Yocot project should provide samba4 recipe.

Bian Naimeng (7):
  [1/7] waf-samba: add new class
  [2/7] ctdb: add new recipe
  [3/7] libldb: add new recipe
  [4/7] libtdb: add new recipe
  [5/7] libtevent: add new recipe
  [6/7] talloc: upgrade to 2.1.1
  [7/7] samba: upgrade to 4.1.12

 meta-oe/classes/waf-samba.bbclass                  |    51 +
 .../bug_221618_precise-64bit-prototype.patch       |    20 -
 ...4104_mention-kerberos-in-smbspool-manpage.patch |    34 -
 ...m_7499-nss_wins-dont-clobber-daemons-logs.patch |    47 -
 .../bug_601406_fix-perl-path-in-example.patch      |    15 -
 ...04768_upstream_7826_drop-using-samba-link.patch |    21 -
 ...ug_604768_upstream_7826_fix-WHATSNEW-link.patch |    18 -
 ...onfigure-disable-core_pattern-cross-check.patch |    20 -
 .../configure-disable-getaddrinfo-cross.patch      |    11 -
 .../samba/samba-3.6.24/configure-libunwind.patch   |    82 -
 .../samba/samba-3.6.24/documentation.patch         |   302 -
 .../samba/samba-3.6.24/documentation2.patch        |   314 -
 .../samba-3.6.24/dont-build-VFS-examples.patch     |    31 -
 .../samba/samba-3.6.24/fhs-filespaths.patch        |    65 -
 .../samba/samba-3.6.24/installswat.sh.patch        |    23 -
 .../samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch  |    54 -
 .../samba-3.6.24/only_export_public_symbols.patch  |    21 -
 .../samba/samba-3.6.24/pam-examples.patch          |    17 -
 .../samba/samba-3.6.24/shadow_copy2_backport.patch |  2101 ---
 .../samba/samba-3.6.24/smbclient-pager.patch       |    18 -
 .../samba/samba-3.6.24/smbtar-bashism.patch        |    19 -
 .../samba/samba-3.6.24/smbtorture-manpage.patch    |    94 -
 .../samba/samba-3.6.24/undefined-symbols.patch     |    24 -
 .../samba/samba-3.6.24/usershare.patch             |    38 -
 .../samba/samba-3.6.24/waf-as-source.patch         | 18534 -------------------
 meta-oe/recipes-connectivity/samba/samba-basic.inc |    55 -
 meta-oe/recipes-connectivity/samba/samba.inc       |   154 -
 ...arsing-linemarkers-in-preprocessor-output.patch |    68 -
 .../samba/samba/Managing-Samba.txt                 |    40 -
 .../recipes-connectivity/samba/samba/cifs.patch    |    10 -
 .../samba/samba/config-h.patch                     |    12 -
 .../samba/samba/config-lfs.patch                   |    47 -
 .../samba/samba/configure-3.3.0.patch              |    85 -
 .../recipes-connectivity/samba/samba/init.samba    |    58 -
 .../recipes-connectivity/samba/samba/init.winbind  |    38 -
 .../recipes-connectivity/samba/samba/mtab.patch    |    11 -
 .../recipes-connectivity/samba/samba/nmb.service   |    12 -
 .../recipes-connectivity/samba/samba/quota.patch   |    11 -
 meta-oe/recipes-connectivity/samba/samba/smb.conf  |   266 -
 .../recipes-connectivity/samba/samba/smb.service   |    13 -
 meta-oe/recipes-connectivity/samba/samba/tdb.pc    |    11 -
 .../samba/samba/tdbheaderfix.patch                 |    14 -
 .../samba/samba/volatiles.03_samba                 |     2 -
 .../samba/samba/winbind.service                    |    12 -
 meta-oe/recipes-connectivity/samba/samba_3.6.24.bb |    67 -
 .../01-support-cross-compile-for-linux-os.patch    |    24 +
 .../ctdb/02-link-rep_snprintf-for-ltdbtool.patch   |    16 +
 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb         |    43 +
 .../do-not-import-target-module-in-configure.patch |    32 +
 meta-oe/recipes-support/libldb/libldb_1.1.17.bb    |    45 +
 .../libtdb/do-not-check-xsltproc-manpages.patch    |    15 +
 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb     |    30 +
 .../libtevent/do-not-check-xsltproc-manpages.patch |    16 +
 .../recipes-support/libtevent/libtevent_0.9.21.bb  |    30 +
 .../install-swig-interface-in-SWINGLIBDIR.patch    |    23 -
 .../recipes-support/talloc/talloc/sepbuild.patch   |    27 -
 meta-oe/recipes-support/talloc/talloc_2.0.1.bb     |    45 -
 meta-oe/recipes-support/talloc/talloc_2.1.1.bb     |    45 +
 58 files changed, 347 insertions(+), 23004 deletions(-)
 create mode 100644 meta-oe/classes/waf-samba.bbclass
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_221618_precise-64bit-prototype.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_387266_upstream_4104_mention-kerberos-in-smbspool-manpage.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_598313_upstream_7499-nss_wins-dont-clobber-daemons-logs.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_601406_fix-perl-path-in-example.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_drop-using-samba-link.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/bug_604768_upstream_7826_fix-WHATSNEW-link.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-core_pattern-cross-check.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-disable-getaddrinfo-cross.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/configure-libunwind.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/documentation2.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/dont-build-VFS-examples.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/fhs-filespaths.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/installswat.sh.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/libutil_drop_AI_ADDRCONFIG.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/only_export_public_symbols.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/pam-examples.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/shadow_copy2_backport.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbclient-pager.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtar-bashism.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/smbtorture-manpage.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/undefined-symbols.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/usershare.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-3.6.24/waf-as-source.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba-basic.inc
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba.inc
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/Managing-Samba.txt
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/cifs.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/config-h.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/config-lfs.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/configure-3.3.0.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/init.samba
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/init.winbind
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/mtab.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/nmb.service
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/quota.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/smb.conf
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/smb.service
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/tdb.pc
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/tdbheaderfix.patch
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/volatiles.03_samba
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba/winbind.service
 delete mode 100644 meta-oe/recipes-connectivity/samba/samba_3.6.24.bb
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
 create mode 100644 meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch
 create mode 100644 meta-oe/recipes-support/libldb/libldb_1.1.17.bb
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/install-swig-interface-in-SWINGLIBDIR.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc/sepbuild.patch
 delete mode 100644 meta-oe/recipes-support/talloc/talloc_2.0.1.bb
 create mode 100644 meta-oe/recipes-support/talloc/talloc_2.1.1.bb

-- 
1.9.1



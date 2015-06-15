Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2161C73CF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:00:59 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97058802"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 17:05:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F8xOxu030477
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:59:24 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 17:01:10 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:52:09 +0800
Message-ID: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 0/7] add samba4 and required recipe
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
X-List-Received-Date: Mon, 15 Jun 2015 09:01:01 -0000
Content-Type: text/plain

Samba4 has already been supported by some distro such as Fedora, RHEL, Ubuntu,
So maybe Yocot project should provide samba4 recipe.

Bian Naimeng (7):
  wafsamba: add class
  samba4: add samba4 recipe
  ctdb: add new recipe
  libldb: add new recipe
  libtalloc: add new recipe
  libtdb: add new recipe
  libtevent: add new recipe

 meta-oe/classes/wafsamba.bbclass                   |    55 +
 .../samba-4.1.12/00-fix-typos-in-man-pages.patch   |   108 +
 .../samba-4.1.12/01-fix-force-user-sec-ads.patch   |  1448 +
 .../samba/samba-4.1.12/02-fix-ipv6-join.patch      |   266 +
 .../samba-4.1.12/03-net-ads-kerberos-pac.patch     |   962 +
 .../samba/samba-4.1.12/04-ipv6-workaround.patch    |   211 +
 .../05-fix-gecos-field-with-samlogon.patch         | 29894 +++++++++++++++++++
 .../06-fix-nmbd-systemd-status-update.patch        |    97 +
 .../07-fix-idmap-ad-getgroups-without-gid.patch    |    42 +
 .../08-fix-idmap-ad-sfu-with-trusted-domains.patch |    44 +
 .../09-fix-smbclient-echo-cmd-segfault.patch       |    35 +
 ...improve-service-principal-guessing-in-net.patch |   180 +
 ...x-overwriting-of-spns-during-net-ads-join.patch |   329 +
 ...ted-spns-from-AD-during-keytab-generation.patch |   159 +
 .../samba/samba-4.1.12/13-fix-aes-enctype.patch    |   988 +
 .../samba/samba-4.1.12/14-fix-dnsupdate.patch      |    51 +
 .../15-fix-netbios-name-truncation.patch           |   154 +
 .../16-do-not-check-xsltproc-manpages.patch        |    52 +
 .../samba-4.1.12/17-execute-prog-by-qemu.patch     |    22 +
 .../18-avoid-get-config-by-native-ncurses.patch    |    22 +
 ...systemd-daemon-is-contained-by-libsystemd.patch |    42 +
 ...-do-not-import-target-module-in-configure.patch |    28 +
 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb |   155 +
 .../01-support-cross-compile-for-linux-os.patch    |    24 +
 .../ctdb/02-link-rep_snprintf-for-ltdbtool.patch   |    16 +
 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb         |    43 +
 .../do-not-import-target-module-in-configure.patch |    32 +
 meta-oe/recipes-support/libldb/libldb_1.1.17.bb    |    45 +
 .../recipes-support/libtalloc/libtalloc_2.1.1.bb   |    42 +
 .../libtdb/do-not-check-xsltproc-manpages.patch    |    15 +
 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb     |    30 +
 .../libtevent/do-not-check-xsltproc-manpages.patch |    16 +
 .../recipes-support/libtevent/libtevent_0.9.21.bb  |    30 +
 33 files changed, 35637 insertions(+)
 create mode 100644 meta-oe/classes/wafsamba.bbclass
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/00-fix-typos-in-man-pages.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/01-fix-force-user-sec-ads.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/02-fix-ipv6-join.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/03-net-ads-kerberos-pac.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/04-ipv6-workaround.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/05-fix-gecos-field-with-samlogon.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/06-fix-nmbd-systemd-status-update.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/07-fix-idmap-ad-getgroups-without-gid.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/08-fix-idmap-ad-sfu-with-trusted-domains.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/09-fix-smbclient-echo-cmd-segfault.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/10-improve-service-principal-guessing-in-net.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/11-fix-overwriting-of-spns-during-net-ads-join.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/12-add-precreated-spns-from-AD-during-keytab-generation.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/13-fix-aes-enctype.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/14-fix-dnsupdate.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/15-fix-netbios-name-truncation.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/16-do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/17-execute-prog-by-qemu.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/18-avoid-get-config-by-native-ncurses.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/19-systemd-daemon-is-contained-by-libsystemd.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba-4.1.12/20-do-not-import-target-module-in-configure.patch
 create mode 100644 meta-oe/recipes-connectivity/samba/samba_4.1.12.bb
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/01-support-cross-compile-for-linux-os.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb/02-link-rep_snprintf-for-ltdbtool.patch
 create mode 100644 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
 create mode 100644 meta-oe/recipes-support/libldb/libldb/do-not-import-target-module-in-configure.patch
 create mode 100644 meta-oe/recipes-support/libldb/libldb_1.1.17.bb
 create mode 100644 meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtdb/libtdb_1.3.0.bb
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent/do-not-check-xsltproc-manpages.patch
 create mode 100644 meta-oe/recipes-support/libtevent/libtevent_0.9.21.bb

-- 
1.8.4.2



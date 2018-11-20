Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D106F6C403
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:37:31 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E66CC220045;
	Tue, 20 Nov 2018 19:37:30 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 19:37:13 +1300
Message-Id: <20181120063718.28683-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 0/5] net-snmp: Reproducibility
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
X-List-Received-Date: Tue, 20 Nov 2018 06:37:32 -0000

With this patch-set, I have achieved a reproducible build of net-snmp over two
different hosts, Ubuntu releases, usernames, paths, etc.
I have come up with a patch for the NETSNMP_CONFIGURE_OPTIONS problem that might
be acceptable to the upstream net-snmp project, see
https://sourceforge.net/p/net-snmp/patches/1384/
Consequently, I have reverted Hongxu Jia's earlier commit 57d8e2c6.

Note that I have turned off printcap support, hard-coded.
If this proves to be a problem, we can easily add a new variable, HAS_PRINTCAP.

Douglas Royds (5):
  Revert "net-snmp: improve reproducibility"
  net-snmp: Reproducibility: Fixed path to /bin/uname
  net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
  net-snmp: Reproducibility: Don't check build host for /etc/printcap
  net-snmp: Reproducibility: Set NETSNMP_CONFIGURE_OPTIONS null

 ...e-configure-options-from-versioninfo.patch | 42 -------------------
 ...ty-accept-configure-options-from-env.patch | 15 +++++++
 .../reproducibility-have-printcap.patch       | 19 +++++++++
 .../net-snmp/net-snmp_5.8.bb                  | 14 +++----
 4 files changed, 41 insertions(+), 49 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-accept-configure-options-from-env.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/reproducibility-have-printcap.patch

-- 
2.17.1



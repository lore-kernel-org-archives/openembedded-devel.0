Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68717C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:22:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.10720.1645449741270847245
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=q6p7uMJ7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449739; i=@fujitsu.com;
	bh=aH4JIJ2SC6yV7sc6eDRXJVlpAp0lOAaFMx/tqR+lIjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=q6p7uMJ7ib2bp1rxEfTrzlm0LS79UVrTr6AWgrDYNSmZ8O/5sVOCQypZAp7rikgHk
	 uIGC3uTH9jP0GD5CpcJvwZ/+8CzRPmFa2qJAl5PcBBfpaTurMJdmA3E4ISjBNpmqtf
	 SHn8K5GViKzFgzVnS+0S6qXfAZx7brqxQA1+jGlSOnrEqlVu3Xj0syyafqcNmvU1bV
	 bZ/A9PrK9NyOMjMhGUert7gVCRGTIkhmon5Q8thq3FQMqWd8eyLMFPULQNP+vjg2wQ
	 RtzLoP3eNvrGzdjx+9F7HMuee7bZxXcNHfWZRFIr6Qgsu/pqqFFS3gxgXQ03pb61hg
	 /XgVfZ0kP4F2Q==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id 0A/A9-12680-B0293126;
 Mon, 21 Feb 2022 13:22:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8MRoss9STj
  JYMJCTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePfm4CCndoVz77fZWlgnKPWxcjFISQwk0ni
  5tnDTBDOCUaJ360T2boYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFgiVeDa3j
  QnEZhFQlbjbt4sFxOYVcJJ4t282mC0hoCAx5eF7Zoi4oMTJmU9YIOaoSnQfecoEYctLNG+dzQ
  xRrygx+3IzVG+FxKxZbUwTGPlmIWmfhaR9FpL2BYzMqxitkooy0zNKchMzc3QNDQx0DQ1NdY0
  tdS2M9BKrdBP1Ukt1y1OLS3SB3PJivdTiYr3iytzknBS9vNSSTYzAkEwpVg/awfhtxU+9Q4yS
  HExKory17cJJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4hfuBcoJFqempFWmZOcD4gElLcPAoi
  fCWNwOleYsLEnOLM9MhUqcY7TkOT7i0l5lj55bLQHL/tStActOaG3uZhVjy8vNSpcR5BScCtQ
  mAtGWU5sENhcXzJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvMEgU3gy80rgdr8COosJ6Kw
  pWUIgZ5UkIqSkGpiKTXfcVN8moy/OrHhZeVNol1VctEH2/zMTNQzPH1VjvxXK5Vbqoqf3U/bk
  7vu896bteH/TNai32YUl1a1d5dB3PWcrx57sKGXOve7X+mSufm1msv+nyL6vRsOxo/JZ/nKzY
  Me4P3vVShqOtpzevzNVR1TPwk/rf9sOOTYFuY2Tf+vfMww32meQ/vKAmm+i6L3YpcnRHP29rE
  6FBonyi48veSMmxad/pXBfOed7kUf6TfGSzI5T/T3tPy2cdLPUYu/7309lvPlTV5ikF8hmi3Y
  7SrvefNS/z3Cm0KmnK1Uf7v+1gKM55pxIr9BqLU72F/O2Cja//v1Lv46Rf8aypUvVsoy/r1b3
  WrqdQ+y0EktxRqKhFnNRcSIAzWV/UWIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-571.messagelabs.com!1645449738!35765!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8829 invoked from network); 21 Feb 2022 13:22:19 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-24.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:22:19 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21LDMIS7024801
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:18 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:22:17 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] iscsi-initiator-utils: upgrade 2.1.5
 -> 2.1.6
Date: Mon, 21 Feb 2022 21:22:06 +0800
Message-ID: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95411

0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch
removed since it's included in 2.1.6.

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D
This release adds more bug fixes and cleanups. No major functionality changes.

 libopeniscsiusr: extend sysfs ignore_error to include EINVAL
 Fix compiler error introduced with recent IPv6 commit.
 Remove dependences from iscsi-init.service
 Use "sbindir" for path in systemd service files
 Updated README a bit
 Finish ability to have binary location configurable.
 Fix iscsi-init so that it runs when root writable
 remove redundant params in Makefile
 Fixing last parts of sbindir configuration
 Cosmetic cleanup on recent addition
 Update the iscsi-gen-initiatorname script: harden and generalize
 change iscsi-gen-initiatorname option -b =3D> -p
 Add man page for the iscsi-gen-initiatorname script.
 Install new man page for iscsi-gen-initiatorname
 Fix issues discovered by gcc12
 Fix more issues discovered by gcc12
 iscsi sysfs: check state before onlining devs
 iscsistart: fix login timeout handling
 iscsid: use infinite timeout if passed in
 iscsid: add error code for req timeouts
 Improve 'iscsid.conf'
 iscsiadm: Call log_init() first to fix a segmentation fault
 iscsi_err: Add iscsid request timed out error messages
 Fix wrong install_systemd destination path
 actor: add name to struct actor and init it with function name
 actor: print thread name in log
 actor: enhanced: print error log when init a initilized thread
 initiator_common: make set operational parameter log easy to read
 iscsid: Check session id before start sync a thread

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...or-introduced-with-recent-IPv6-commi.patch | 43 -------------------
 ....1.5.bb =3D> iscsi-initiator-utils_2.1.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.5.bb =3D> iscsi-initiator-utils_2.1.6.bb} (96%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch
deleted file mode 100644
index ba0ca4ca0a..0000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 424d5967e94f6adf4c0669d390779af8da0bef20 Mon Sep 17 00:00:00 2001
-From: Lee Duncan <lduncan@suse.com>
-Date: Sat, 18 Sep 2021 16:10:50 -0700
-Subject: [PATCH] Fix compiler error introduced with recent IPv6 commit.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 76350316de38 ("Handle IPv6 interfaces correctly.") added
-a string copy that creates this gcc-11 error message:
-
-> gcc-11 -O2 -g -Wall -Werror -Wextra -fvisibility=3Dhidden -fPIC -I/usr/include/kmod    -c -o idbm.o idbm.c
-> idbm.c: In function =E2=80=98_idbm_node_rec_link=E2=80=99:
-> idbm.c:999:17: error: =E2=80=98strncpy=E2=80=99 specified bound 65 equals destination size [-Werror=3Dstringop-truncation]
->   999 |                 strncpy((*node).iface.name, iface_name, ISCSI_MAX_IFACE_LEN);
->       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-So copy one less character, maximum.
-
-Upstream-Status: Backport
-[https://github.com/open-iscsi/open-iscsi/commit/424d5967e94f6adf4c0669d390779af8da0bef20]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libopeniscsiusr/idbm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
-index b2524ed..6f57e45 100644
---- a/libopeniscsiusr/idbm.c
-+++ b/libopeniscsiusr/idbm.c
-@@ -996,7 +996,7 @@ static void _idbm_node_rec_link(struct iscsi_node *node, struct idbm_rec *recs,
- 
- 	/* use the interface name passed in, if any */
- 	if (iface_name)
--		strncpy((*node).iface.name, iface_name, ISCSI_MAX_IFACE_LEN);
-+		strncpy((*node).iface.name, iface_name, ISCSI_MAX_IFACE_LEN-1);
- 
- 	/*
- 	 * Note: because we do not add the iface.iscsi_ifacename to
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.5.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
similarity index 96%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.5.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
index 26b5b5c34b..e85fdd7856 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.5.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
@@ -12,11 +12,10 @@ DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV =3F=3D "20d0aa96f2170339b1967f4be81e9c5042bbce03"
+SRCREV =3F=3D "ee575fd19429ec6dc24b49f2ce3822b4a01f57de"
 
 SRC_URI =3D "git://github.com/open-iscsi/open-iscsi;branch=3Dmaster;protocol=3Dhttps \
            file://0001-Makefile-Do-not-set-Werror.patch \
-           file://0001-Fix-compiler-error-introduced-with-recent-IPv6-commi.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
-- 
2.25.1



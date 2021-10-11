Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3210AC433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:39:35 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.7097.1633923571378253453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 20:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 19B3dTxn019667
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Oct 2021 20:39:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 10 Oct 2021 20:39:28 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 10 Oct 2021 20:39:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][PATCH 0/2] hardknott merge request
Date: Mon, 11 Oct 2021 11:37:43 +0800
Message-ID: <20211011033745.32284-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 03:39:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93211

From: Changqing Li <changqing.li@windriver.com>

postgresql: 
fix CVE-2021-3677, refer: https://www.postgresql.org/support/security/CVE-2021-3677

vsftpd:
fix vsftpd, refer: https://security.appspot.com/vsftpd/Changelog.txt	

Changqing Li (1):
  postgresql: upgrade 13.3 -> 13.4

Mingli Yu (1):
  vsftpd: Upgrade to 3.0.5

 ...-allow-newfstatat-and-pselect6-sysca.patch | 51 -------------------
 ...llow-syscalls-in-the-seccomp-sandbox.patch | 46 -----------------
 ...-with-musl-which-does-not-have-utmpx.patch |  0
 .../makefile-destdir.patch                    |  0
 .../makefile-libs.patch                       |  0
 .../makefile-strip.patch                      |  0
 .../nopam-with-tcp_wrappers.patch             |  0
 .../nopam.patch                               |  0
 .../vsftpd-2.1.0-filter.patch                 |  0
 .../vsftpd-tcp_wrappers-support.patch         |  0
 .../{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb}      |  5 +-
 ...n-bypass-autoconf-2.69-version-check.patch | 11 ++--
 ...{postgresql_13.3.bb => postgresql_13.4.bb} |  2 +-
 13 files changed, 10 insertions(+), 105 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-seccompsandbox.c-allow-newfstatat-and-pselect6-sysca.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/0001-vsftpd-allow-syscalls-in-the-seccomp-sandbox.patch
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/0001-sysdeputil.c-Fix-with-musl-which-does-not-have-utmpx.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-destdir.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-libs.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/makefile-strip.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam-with-tcp_wrappers.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/nopam.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-2.1.0-filter.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd-3.0.3 => vsftpd-3.0.5}/vsftpd-tcp_wrappers-support.patch (100%)
 rename meta-networking/recipes-daemons/vsftpd/{vsftpd_3.0.3.bb => vsftpd_3.0.5.bb} (93%)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_13.3.bb => postgresql_13.4.bb} (78%)

-- 
2.17.1



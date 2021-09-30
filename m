Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DEDC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 05:54:42 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.8653.1632981281361459301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 22:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GNxT31bk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632981279; i=@fujitsu.com;
	bh=uqFjwRjPk1y/WBQMaATFNLHoNJVDHjjuTGdickLq3z0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GNxT31bky+hayeFawcBBlJ2QGkE+8/YJzd+pQKc4gH5YsyKQFKIC88huNYlU/jndD
	 dVQObKKWEnQb0lCMPXScy+F13jOL0Lgb8HMoEiPyNs3vj2Qg4aLqVQdtgeVCKP//Yl
	 GIZvqqZmaHKtgTSASLpUpjSt/KnRjV/H/FkzOLaAD/djH+CE0E2uqq4OOkicYCffu7
	 u5F0JsE3IvbWD2YyJgxXGfKk2Hn00D6K4RJVY4w0AaMylENMOkY4opZnhdQjtGaEq+
	 y9jsdoF1gcRArzUc9VrAYuJs53MXLiB9SThyXm5piLqv2zJQY7vwYnSictTgsBamUk
	 uy8S+Z5FZaBfg==
Received: from [100.113.6.157] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id B6/69-23198-E1155516;
 Thu, 30 Sep 2021 05:54:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1ZULDE0
  0mHZKxuLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdi+vImtYDpHxZpzm5kaGLeydzFycQgJzGaS
  6GqaBeXsYZRYsPoFaxcjJwebgK7Eucdr2UFsEQF9iaWz9zCD2MICHhJN3RfB4iwCqhKdC6cwg
  di8QPFt09eD1UgIKEhMefieGSIuKHFy5hMWEJtZQELi4IsXQHEOoBpFidnT5SHKKyReH77EPI
  GRZxaSjllIOhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11TUyMdRLrNJN0kst1U1OzSspSgT
  K6iWWF+sVV+Ym56To5aWWbGIEBlJKIevHHYyHXn/QO8QoycGkJMqr6BOaKMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mCV9wfKCdYlJqeWpGWmQMMapi0BAePkgjvdj+gNG9xQWJucWY6ROoUo6KUO
  K+EN1BCACSRUZoH1waLpEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHk7QLbzZOaVwE1/Bb
  SYCWhxVnsIyOKSRISUVAOTgLch1+6+46VxZq/Wrz9+v6uq6UHMiReLb7B+vvPl/9lTGxW/nec
  IV2o/u/TkBPWe2yvN3Iz6eJx7tS2LNnqoVMqt2cgjsHWecGrhmV/L3yS8OJKbFhuwXbUv8Z7b
  +1Wnw8yvnNmU/ODOG5Ot3m8O/ugTZEq1evPPQOLeRbt/SufV63TKFvIHve2u4HJZ1rR7y+fdL
  6doXmuzanm/zCb4Et+1+berP3PNuZaXKbT2voBDSaM2k8JkwZZjNu3THZxfL89WnDWv7OLhVy
  /+ftg2wXS2bIPK0/lXz/uZX2GbWpR4RCHjxPv6hrdMbnN8+IKl8u5ef+0iGuJfPqF5cbZig8T
  OW28/Vh42M2nKNmDuU2Ipzkg01GIuKk4EAAitpGsfAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-238.messagelabs.com!1632981278!120863!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5787 invoked from network); 30 Sep 2021 05:54:38 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Sep 2021 05:54:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18U5sWH1012091
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Sep 2021 06:54:38 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 30 Sep 2021 06:54:31 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] cifs-utils: upgrade 6.13 -> 6.14
Date: Thu, 30 Sep 2021 22:54:22 +0800
Message-ID: <1633013662-14499-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Sep 2021 05:54:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93177

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../cifs/{cifs-utils_6.13.bb => cifs-utils_6.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/cifs/{cifs-utils_6.13.bb => cifs-utils_6.14.bb} (97%)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
similarity index 97%
rename from meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
rename to meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
index a8d3e91ebb..5fafb4ef69 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_6.13.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_6.14.bb
@@ -4,7 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "464a60344a324311a6f5bb326fdf5f422a3c9005"
+SRCREV = "8c06dce7d596e478c20bc54bdcec87ad97f80a1b"
 SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
-- 
2.25.1



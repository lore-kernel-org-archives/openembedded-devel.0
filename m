Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DFBC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 00:05:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.5301.1644969936822260443
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 16:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F6P7f1ct;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644969935; i=@fujitsu.com;
	bh=pK50lXVjpI+k/nrJjRcNMJvem93m98n5+3L2aDP0TeY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=F6P7f1ctuYDlbcpeaFdNS8cx05WkRKzDImLubgz6F91vOiuqqi5x4ucg8QgZWMhYH
	 wgRIqCVf7DsFgEhfAwO37+OPS0pfdNgyB/m1QisPNA+BLOs1/GeKiQhO8NMmmBGcvm
	 gDZ+TSuhBX5538OpwpeLd6gwLXnbIvfSP1VzOj19kZuNSbTgbDVURPkWmQscG86Luh
	 oGlrIIu/UK66l2vL2TzERnnu6BrHB872FPVZ6ricMrkbPA+Lun9aVMUNbpbYfnr+wn
	 uSII1iLiZ/iDefzW+UiA5zSvZvB1lWcS5ow0XoGCsGNjCiFEgIgb12rtEMuVhw+ww+
	 wmD2SRB5t0l0w==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id C1/8F-29321-ECF3C026;
 Wed, 16 Feb 2022 00:05:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsViZ8MxRfecPU+
  SwfMjShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdu2+YC+5yVkzdNY29gbGds4uRi0NIYCaT
  xP5pvWwQzglGid2PvrJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D1iNsECwxMfbv
  xhBbBYBVYlzS7Yygdi8Ao4S297OA+uVEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjKDH7cj
  MLhF0hMWtWG9MERt5ZSFpmIWlZwMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hS18jAQC+xSjd
  RL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8vtWQTIzDMUorVT+xgfLryp94hRkkOJiVR3rYb
  3ElCfEn5KZUZicUZ8UWlOanFhxhlODiUJHj5bXiShASLUtNTK9Iyc4AhD5OW4OBREuF9ZwmU5
  i0uSMwtzkyHSJ1iVJQS5/WzA0oIgCQySvPg2mBxdolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6
  OSMG+aLdAUnsy8Erjpr4AWMwEtVmzkAllckoiQkmpgsviaNnvHwt2JC2xlxS4aLnx2cFGGG2t
  O/JN9q7zzdd2nn/r2pu1YT/WTVz1OU7MXXNSsjjt/XbB2xWO+tjC7aQc+Vm1s45jbKRNZdcsu
  7Nvcwri7Hukvs1Q3fvgtzzlHu+a8wiTjDTdX9e/b/kjj7IVT0QVX7gvXG3tVnV3lGaked/a2f
  L7e5jtWsmslrr/8mFyhZSLAzKJSyfG9xOMi1wdpwykpWap3LYr2i9ptnuJkMIO1TOPJmfduzP
  ePpG6135l9rvCnqea1q5XvDu34Ouvek5z3gVWGjA0ZaSVu9Qd7tO3m91398vi86MJrxgfk0+V
  bpGX0o5ykpolHeG1cMiPR74Hc8lDprl+ydeujlFiKMxINtZiLihMBhZx4XC4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1644969934!14501!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26602 invoked from network); 16 Feb 2022 00:05:34 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 00:05:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21G05YhR031829
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 00:05:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 00:05:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcrypt-openssl-guess-perl: upgrade 0.14 ->
 0.15
Date: Wed, 16 Feb 2022 08:05:24 +0800
Message-ID: <1644969924-7715-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 00:05:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95326

Changelog:
=========
-fix synopsis

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...l-guess-perl_0.14.bb => libcrypt-openssl-guess-perl_0.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-guess-perl_0.14.bb => libcrypt-openssl-guess-perl_0.15.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
index 1bf5b207c1..6e1ea54611 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.14.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-guess-perl_0.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea914cc2718e8d53bd7744d96e66c03c"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Guess-${PV}.tar.gz "
 
-SRC_URI[sha256sum] = "e4331977e1512a3ba51d7fa2d642d3e79d479dc23483246ebfaaef80ea8573df"
+SRC_URI[sha256sum] = "1c5033381819fdb4c9087dd291b90ec70e7810d31d57eade9b388eccfd70386d"
 
 DEPENDS += "openssl"
 
-- 
2.25.1



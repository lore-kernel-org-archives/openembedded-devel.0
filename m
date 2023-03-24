Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BC7C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:28:13 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.90468.1679617686896477535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qGSRChiT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617685; i=@fujitsu.com;
	bh=zmqaLbmZh10vW6ZzZ7d/5VaYCRMT33mIGRFRRvRyGuY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qGSRChiTzJ43LQXDg7p4hVKzDOrMPbs4/Bjeh8l5hTQ2t+cyR6XhOukL5X5Ed3mAc
	 jcY6sJMDSeWmUoYIz1Eay2o6WPYBBRdmwktTYLMINN7e2UAHouTUbcT6yqpO84HdM4
	 eSyGqJQ6wG/DOOPZggX7lSOJyDJpqbk5IDe8cMHBYDsMNUkUj/LqoaTGGw+nD5uHmg
	 hJNxWx2sHdLE+3JG9oJE/xO0SoOITAneh5hTzvqCqUjrKWM8xMU2+1ZH+FpwbtqS58
	 38HpZ6UNxZPT2zGQ+esPlSoht318AFiiAl5ZOKOOg1m+wSWIa2U7TEg0oDmVsf4LwJ
	 aqGJx4xoxkBRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8ORpDvlnUy
  KwYZwi4uHlzI7MHqc27iCMYAxijUzLym/IoE1Y/anaywFN3krLv09z9TAeIani5GLQ0jgIaNE
  y4cJLBDOFSaJqTNXQDl7GCUune5h72Lk5GATkJK4cf8/G4gtIqAvsXT2HmYQm1lAReLFb4gaY
  QFfiS3rPjOC2CwCqhJPHvUxgdi8Ak4SC/vng9kSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy+YIW
  oUJWZfbmaBsCskGqcfgupVk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNdSL6koMz2jJDc
  xM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMBhTipPP7mA82vdX7xCj
  JAeTkiivRKh0ihBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3s9vZFKEBItS01Mr0jJzgJEBk5bg4
  FES4T10FijNW1yQmFucmQ6ROsWoy3H1ypW9zEIsefl5qVLivIlvgYoEQIoySvPgRsCi9BKjrJ
  QwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5hYMwL8WTmlcBtegV0BBPQEc41YEeUJCKkpBqYavi
  8TPOcunVl47kX8PK9zGqSPq/xxeuqjvOz8kulzBWSdbc2HEmdn1ekUc0UXXqD4/HW2IJvp3K6
  A+ZXnm5w0w/+p8OuFW6yySy/XutoiTTHdMOg2Rlvlfvq+GbFv/8ZriMnVPW0TezJ+ZdvefiV7
  XKWe96dcu2vySGhs4psy9+tyNx3dn1I3BvL6DnCb8puPmhlPMGhulCPkftUbb7QudC5Xp9O3v
  L9r9/z4ELESvZblj+/eFXKb5e89tLj3nKLO2925euoX9dxaVGfm35jyoy+7oW7xW/zrDmyeJ3
  ggnUsU9++DCgwtZUONb96/KS79V3PpOcz3p95YpRu6X10utzsdyJ8Z5nKDAo1ep8psRRnJBpq
  MRcVJwIAZBT8Ik0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-745.messagelabs.com!1679617683!653890!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17947 invoked from network); 24 Mar 2023 00:28:03 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:28:03 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6662F1B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:03 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5B3431AF
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:28:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libio-compress-perl: upgrade 2.201 -> 2.204
Date: Fri, 24 Mar 2023 08:27:45 +0800
Message-ID: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101678

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Update Gzip.pm
   https://github.com/pmqs/IO-Compress/pull/49
   6d0514b86ceeab56884c43fd1e6f09f839c12b74
   feab074420bf4059eb6fa9d0553a354e2dd33e95

 * Allow Z_NULL
   https://github.com/pmqs/Compress-Raw-Zlib/issues/17
   c42da1483767bc8afbdb2d8b03ecda7b67b4d022

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...io-compress-perl_2.201.bb => libio-compress-perl_2.204.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.201.bb => libio-compress-perl_2.204.bb} (84%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb
similarity index 84%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb
index fb4efee42d..8d4aec709e 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.201.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.204.bb
@@ -14,11 +14,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=00f9580b6984ffc2d5f1dc4cc7c3dfcc"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8e78b88f9c8ac08ae03e8ea81195ca45"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "f6c55c4e39cfaa3219965dd3b36c9de1edee9a82a10a9cadeb3b74a9ceeeaaad"
+SRC_URI[sha256sum] = "617784cb8543778681341b18fc67b74735e8b494f32f00814dd22f68ac6af018"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
-- 
2.34.1



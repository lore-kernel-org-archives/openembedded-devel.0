Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900A6C64ED8
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:40:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8086.1676878842980096598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ivcM/IcV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878840; i=@fujitsu.com;
	bh=JyEkh8l/9GINIXLOZlWDlg/QfXesOSTlIqkKXvmZgz0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ivcM/IcV2hOm4RtLJypsq2CzljljXAsQoQPWEWx1+mJHo20troP1LLAr+WJwJ3O2J
	 uLhEi0Bmbcd5ecW1BzxzTCk/qToT5OFUZ/cwCV+f8A3Gsl27FO8BAQXElFnPHYBA87
	 oa8D8Ht6xHlTs19ujWUqI/HkZbGcYCxao4xFBKvcxDOjhSPAu5TQDfHu5qtzpukoKt
	 FdQk4mp/WFxE1520StWv++yoEVSUIqNvlaKakMqw0T4/yT8tlnxw65WQvAFqcAm1h2
	 fsOZuKWeZmE//MI1HVYX7UOQhJ7Otl8j31p2rBG82IKH/AlLsOAurXAJhwBU+26nfW
	 N53o/68njbUzA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSfeH8ud
  kg0ldPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bsjoUsBQt4Kp4e/8/awPiWq4uRi0NI4Amj
  RMOr2ywQzg0miW/HW5ghnL2MEgt3H2DsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAVeLtzm9gcRYBVYlduy6C1fMKOEkcPjoBbI6EgILElIfvwWo4BZwlDk9aCtYrBFTT8u
  4uVL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0BI9M
  qRvPi1KKy1CJdQwu9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzAAE4pTqzbwbii76/eIUZJDiYlUd5Nwp+ThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwV
  ikC5QSLUtNTK9Iyc4DRBJOW4OBREuGVlgZK8xYXJOYWZ6ZDpE4x6nJMfH5xL7MQS15+XqqUOK
  8CMDaFBECKMkrz4EbAIvsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe4yCX8GTmlcBtegV
  0BBPQEe4/PoAcUZKIkJJqYJpRFfOg7O7GzFSbp7+mVuVExtVGfGcN6btWu6K9WT9Esvm8sNwX
  pzS9JxZ9ekmeurIfVmzaYs58z/yTYrGoVtEF6QcW9zoNZh2Y5RfIuri4zYpH5g1rr+/liNr5b
  x29c/bw3PE0MAze22EcfcM7Kz9TNuzKtf3TpZ+7/ryYHuSqMd2sNrCg5n4sW39BioOL0MfbAs
  fvfPxZfe69nUul2HPb9FUb3rWavVhsd1CqSqu17ibvVO6vCTf+vNvdw9HxsODZM7PZRckPX0o
  UzLKL+7Gm+cZqWUe5hWeeffyfOvf33J5fD/fHp76sYX1a42GjnPj4evH/n5pc224uejRv7vVD
  pzlOzWH6csh2/wy/y0osxRmJhlrMRcWJAGvsJsVnAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1676878839!318690!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7645 invoked from network); 20 Feb 2023 07:40:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:40:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9C0DB1000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8FD6C1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:40:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] sshpass: upgrade 1.09 -> 1.10
Date: Mon, 20 Feb 2023 15:40:19 +0800
Message-ID: <1676878821-15492-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
References: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101157

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Convert repo to git
 * Remove sig unsafe functions from signal handler (Ticket #22).
 * Allow -e to explicitly specify the environment variable to use
   (Ticket #5).
 * Unset the variable specified with -e before calling subprogram
   (Ticket #25).
 * Change the logic for setting a controlling TTY. Fixes compatibility
   issues with OpenSolaris and MSYS/Cygwin. Thanks Marcin Olszewski for
   the fix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sshpass/{sshpass_1.09.bb => sshpass_1.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/sshpass/{sshpass_1.09.bb => sshpass_1.10.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
rename to meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
index ad7b08310..81c5e4800 100644
--- a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
+++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.10.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
+SRC_URI[sha256sum] = "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
 
 inherit autotools
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB18C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:03:50 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.7385.1637593428749103810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QoM0vy20;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593426; i=@fujitsu.com;
	bh=ndHb8yulhMZ6S4UDiZKwoQfXAoFBXrmNIO1HblXhHhg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QoM0vy20QpaX/SY+PSsGfccTja47H+DF8gGFjx8YJ7rS3snFp4faop0jZbS5bYi2Y
	 QA/nYNmFKxmdcT3aJ7/DSel39DLWhV+ip9zAJphWSzEn2otNlCP22RwbqaL5c0W6Gf
	 QlRxXhwn4GZ9bzv248Wjg1X+HPjUii4dTs2cezShpBXCGZOQ469MOSEqT/O99KXkDy
	 RXbib6+vmbvCF5z6mOce7BmRaLWgtVE3B58cQihb6Ti5VSydHJEETd+gUuNM5fcByw
	 KXbCM43sly73ub+Z2fYJBkBuIH7xW3aL2k4k4G/hJp7NxXh9r5DV1Hr9QqbARpVjAU
	 gd/f4qrmzX37A==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 69/22-17294-151BB916;
 Mon, 22 Nov 2021 15:03:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSTdw4+x
  Eg4uzNSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyPN2MKujgrOn4dYGpg3MjRxcjFISTwhFFi
  wdtLzBDOBSaJM982QjknGCU+PvzC1MXIycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgJPElC+T2UBsFgFVie1LLgDFOTh4geLNJypAwhICChJTHr4Ha+UUcJa4tWMxG0iJEFDJk6
  4qkDCvgKDEyZlPWCCmS0gcfPGCGaJVUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRvOkosz0jJLcxMwcXUMDA11DQyNdQ0tLXUMLvcQq3SS91FLd8tTiEl1DvcTyYr3iytzk
  nBS9vNSSTYzA0E0pOC60g/HN6w96hxglOZiURHmNZs9OFOJLyk+pzEgszogvKs1JLT7EKMPBo
  STB+3gdUE6wKDU9tSItMwcYRzBpCQ4eJRFeB5A0b3FBYm5xZjpE6hSjopQ478ENQAkBkERGaR
  5cGyx2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5l0FMoUnM68EbvoroMVMQItPH58Osrg
  kESEl1cAk4+/wtW+DiuPnddLR/RsaFrL07JiknxIonnFH1rBU70FKYdP+P28ca97+zeFu/c+4
  7+IJoUP/0tmPXg56xVWYsY+H/9FRdakLeRaPPi1Z9kh/2yP5P7++Bhq7FLZcZDljdUK2/LyFT
  6DV5iq/1Q+/J0nNSjILFJ3KcLGUucz/l/r3i3e+TVWsWXtgzmrTHK6+K9u9fkse2nD+lVnro1
  MXZZZfnO3Mas11eEJKkIYFf82sVs6Ik+GuRqU9woGNs462TBPhnP/WhGmeg1/Gz2t3fn35sFs
  ieIllCcuMC3MaepgX5V37qavecPxg+2qN+U9erA010Tod/+511fe3OsonVklazX81/U/Znp0/
  V2toKbEUZyQaajEXFScCANG1swNYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-291.messagelabs.com!1637593425!328228!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5140 invoked from network); 22 Nov 2021 15:03:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:03:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 272BA100468
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:03:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1A679100450
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:03:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 15:03:24 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.4.1 -> 2.4.2
Date: Mon, 22 Nov 2021 23:03:07 +0800
Message-ID: <1637593387-99348-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
References: <1637593387-99348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 15:03:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94097

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.4.1.bb => cryptsetup_2.4.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.4.1.bb => cryptsetup_2.4.2.bb} (97%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb
similarity index 97%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb
index 7f7c350a63..621ac0f2fe 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.2.bb
@@ -21,7 +21,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a356a727a83a464ade566e95239622a22dbe4e0f482b198fdb04ab0d3a5a9c5f"
+SRC_URI[sha256sum] = "170cc2326a9daeeeb578579176bd10d4a60ee5c4fc5bc69018ce67dafc540b9c"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1



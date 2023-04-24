Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B74FC77B73
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:33:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.42938.1682307184040679646
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kyqryncI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307182; i=@fujitsu.com;
	bh=kMX/6yF4z4RegG8jJR6IvP2mc8XlGMKNvg01bgC+pA4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kyqryncIWRwfHS1QAgOhTacOt872PuGulwwlBf4BYsTW+sKwzTovWUeG242+lUXeM
	 D6mulyQabHCeSJW6MWNwYEE4sGnYxzAr/5+BIj+5rBcFddU/6Mkf3QiypB7UMaRJ65
	 AvEaIDlMrxKlPn58pNs2as+8OkrfhH4vAawdYHCXQ9atmDIIVnEQdWIoRj5Ar0ebeo
	 M+H/Ps8ME4DuYJA0/jkqULkfowgN7yyx/cQiSkwR/NQEzHHepRx2xyW8FmTme6WER9
	 aowUUSbBI3FjoZl/zXPNc28ZdDvXUofqFh1FtskbcNqNIaKEjOhb9Nn4itMYgKBvzm
	 HuqxQCDR2qb7w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqJv7wzX
  F4OY7GYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPv7s9MBS84KiaevMvawPievYuRi0NI4Amj
  ROP5n1DODSaJ/u+bmCCcvYwSRz/uYe5i5ORgE5CSuHH/PxuILSKgL7F0NkScWUBF4sXvHnYQW
  1jAWeLezF9gcRYBVYl/p3aB1fMKOEm8/dYBViMhoCAx5eF7sBpOoPorO9cCLeMAWuYkMalDG6
  JcUOLkzCcsEOMlJA6+eMEM0aooMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJFpFaN
  ZcWpRWWqRrrFeUlFmekZJbmJmjl5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTopeXmrJ
  JkZg8KYUJ7vuYLyw86/eIUZJDiYlUd4lG1xShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwFn1yT
  RESLEpNT61Iy8wBRhJMWoKDR0mEd9kXoDRvcUFibnFmOkTqFKOilDiv7XeghABIIqM0D64NFr
  2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzSn4AmsKTmVcCN/0V0GImoMW7uF1AFpckIqS
  kGpj2trX2PQ14sUZD3vlgfe5yliCm9YrT17a4WMwXkzdf9HIfszi740JmyeLgmCkRXlsOTrRr
  PXU4Xej90u8PG/+9jdk4izurs3jG7013N0wVuSbdd5L71KeTc5bmNSgYPTi6RXiHpIn3S89kF
  65FPKH3XdXE3qbbbL0rY2s0oVCH9Y3r2a8bOf68X3tpWqO0q5yY7fqOGZud+i7Juxv7deptOG
  yxse++ZdncuTbtD58uyr3Ct4R9upLR0xlS2fvi711gu8rwpGfprpruDx9c26SSgpYvM1NL7Ms
  q8f36nn11RE/jVr+yMxObip4u+7JMXvcZ45NZ7+eJLjz+7WSujWHU8TccrFFL+42fqdm9Db6r
  xFKckWioxVxUnAgA48CmFlkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1682307181!221910!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26658 invoked from network); 24 Apr 2023 03:33:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:33:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EBB861001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:00 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DF49B10019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:32:59 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] redis: upgrade 7.0.10 -> 7.0.11
Date: Mon, 24 Apr 2023 11:32:39 +0800
Message-ID: <1682307162-12043-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
References: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.10.bb => redis_7.0.11.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.10.bb b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.10.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.11.bb
index 5d21f7e87..462604478 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.10.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "1dee4c6487341cae7bd6432ff7590906522215a061fdef87c7d040a0cb600131"
+SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1



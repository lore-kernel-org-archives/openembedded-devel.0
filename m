Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08BFC4708D
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:20:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.101818.1670066429585815207
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pkkJCPJ2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066433; i=@fujitsu.com;
	bh=veMFgzIDz8elBkmp4qEnewPlYAuouO/7Y1yN3bonWzM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=pkkJCPJ2+O8DNHuoOviqwGVgLU8Z9iKL+2Euec+GKkEgM1ukEfp5x01LariDF50X8
	 T48A9EvuMnKs7vfpqS0QRmezfJE9SFbGiFynmcjdXrXeta2nA1Rgti1HS1Hh9GzW84
	 SkpOxxaqx+rQVlHSzr7r+6ZgSKKMzGlfHFVk/bQiYO8Dfms0RX4E1wP2m1QWwK12eU
	 C4UexEGvcqWO0IEfOo03pAEvxZADsJqB9WmD1+Bnsvb1KndYtBpkorDRWaYXZO9pk2
	 IrvkVbvAhkvck3XYbVdZt0nXjZui2q4Dt/Aw+T2O5CoaT39O3xAHnX73oBt1ypm8fU
	 WJHazUqZErfAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpMtg2J1
  s8OU0t8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnG416pgEmdF7/7NTA2Mizi6GLk4hAQeMkoc
  O9HCAuFcZpL4/+ImG4Szm1Fizd9jQA4nB5uAlMSN+//BbBEBfYmls/cwg9jMAioSL373sIPYw
  gJ2Ep2zVoHVsADFty+ayAJi8wo4Sfy5vgssLiGgIDHl4XuwXk4BZ4mujYtZQWwhoJrJXXOh6g
  UlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJlWMZo
  WpxaVpRbpWuglFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxi
  BIZuSrH61h2Mh5f90TvEKMnBpCTKeyysK1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG+gfneyk
  GBRanpqRVpmDjCOYNISHDxKIrxdqkBp3uKCxNzizHSI1ClGRSlxXiWQPgGQREZpHlwbLHYvMc
  pKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmFdMDmsKTmVcCN/0V0GImoMUb+btAFpckIqSkGph
  CKx9MzFLgrUppYVxreueXrf6rL7F7p1kLMXcUhT1qTvX5mtl1yrj3ffXD8zOmuQUYt1w5/CNd
  u/e00AYDpT7R77yu5xfLH/r/ZuPKkxqFiewxsyTW3iuUijwZHFJ+atfrVdLLN2jHcjFteuGoI
  FK1Yf8J397Q/ynTyxOWl/dOXfTraIjILusDJp1ZiZWb00J72+ekRjbmZPyoDzc1uJfoPHv/1T
  0mSSsPPF+26FhIiOCrG+kvjz9vXOufL7Pd94FQx9OnDvVzlEPUKi33RdUu/n3z9pK7LY+zejv
  vnWPQ/3FRo+AGQ+21nbPeWf5PMatq5fQ+cvbeRJfCJiMtcZcyrg1TtjzJKr3O96vatkeJpTgj
  0VCLuag4EQDBz6tnWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1670066432!65084!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29644 invoked from network); 3 Dec 2022 11:20:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:20:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E228A1AD
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D73F17B
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:20:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] zabbix: upgrade 6.2.4 -> 6.2.5
Date: Sat, 3 Dec 2022 19:19:56 +0800
Message-ID: <1670066396-24989-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
References: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99940

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.2.4.bb => zabbix_6.2.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.2.4.bb => zabbix_6.2.5.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb
index 7332e2820..df9c20b31 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.4.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.2.5.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.2/${BPN}-${PV}.tar.gz
     file://0001-initialize-msghdr-portably.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "e2526603d9b487a26046de3022e1722b66f4b25542886b3e40a8e2b3bbdbd3b5"
+SRC_URI[sha256sum] = "457e129b3cca47f90fcb33b84dd5a215a24bd10fc74c8048f47839f71db7336b"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1



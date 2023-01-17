Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A44C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:26:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.191119.1673940395379593952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NzCNR1Eq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940393; i=@fujitsu.com;
	bh=edNZM9NaiiJeywiHlDuIaL3+J+/Jcnt7KqoknN6UHEE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NzCNR1EqG0AINvjABL5sXpVxf4nEPPd5eIrzZj7kqTyrZnOc/SG3486DGGTZ9AjHS
	 0cxxcq78r2GfUZNseZou9K7fLOqCRo2tqbCiQocpYxU8ggjlMpbtlcJRC3YgrtXOJP
	 tzkgfzfPl7W13YSawruM3+L/rKgUWs87bm3TMyDy1s5TeZZhvtmCqQz2xR+QyatBTW
	 cTCdHjrAl1EMioYn2SyUZLgw6lsf73jjRJ4aENI3BxxwksMe9Cxxb7owlfQvhXnfB1
	 YVj4HHw9jaTp9HeTk2GRFtiwoTEYL1BDi02SHhtHOaZSpMfp76m7Ko8Q9xUGUK1S54
	 LwlAH7P9PB8Qg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORqLvS91i
  ywbtki4uHlzI7MHqc27iCMYAxijUzLym/IoE14+fEZ8wFC7kqPl5dx9LAOJuzi5GLQ0jgCaPE
  4mlHWSCcG0wSx/v2s0I4exklNm7Zy97FyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAp4Sa2d9ZwKxWQRUJSad+wVWwyvgJLF72UZWEFtCQEFiysP3UHFBiZMzn7BAzJGQOPjiBT
  NEjaLE7MvNLBB2pUTrh19QtprE1XObmCcw8s9C0j4LSfsCRqZVjObFqUVlqUW6huZ6SUWZ6Rk
  luYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSnPp6B+OxZX/0
  DjFKcjApifKeND2WLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC95QXUE6wKDU9tSItMwcYGzBpC
  Q4eJRHecEugNG9xQWJucWY6ROoUoy7H2oYDe5mFWPLy81KlxHkdfYCKBECKMkrz4EbA4vQSo6
  yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeR2+gKTyZeSVwm14BHcEEdIRHyVGQI0oSEVJSDUx
  GHeUTlVbsTFi1ZP8ai3+bbLam8RaGSLzdVn0r2JnpxqxjvzPE85ILywxzbyrcWxn5R5ZddCPv
  09+3RfT3Ck/dI+znOa3YyVu7ede6M+8C8ucfPxtQNitcNXjShvuSP4+qVbFO/71v0j0+zv2fS
  ibdOvho5YdVTs7n515xPX547TyevALJKrMdPdbiVz6ziuwoNWsUd6v3iOd5I+b2Omnv5k8T2c
  ps1jF8vr7s96LtU3eErOwx/sNbqNeyvombYVH2kn0v++bfr6tqsclwFwjs5923MyN9WamppvM
  0Z437Z1Wuur1Z8aB75fMJ25aFcK448fTtjrJAW/7ZbGmuE1b84eX85sUrN8ts72fl7l5tJZbi
  jERDLeai4kQAkwpDgk4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1673940392!378577!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6855 invoked from network); 17 Jan 2023 07:26:32 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:26:32 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6D09610018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:32 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 484C4100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:26:30 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] xfsprogs: upgrade 6.1.0 -> 6.1.1
Date: Tue, 17 Jan 2023 15:26:14 +0800
Message-ID: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100625

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xfsprogs/{xfsprogs_6.1.0.bb => xfsprogs_6.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_6.1.0.bb => xfsprogs_6.1.1.bb} (96%)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb
similarity index 96%
rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb
rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb
index 13467630d..6267fd9a1 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_6.1.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
            file://0004-configure-Use-AC_SYS_LARGERFILE-autoconf-macro.patch \
            file://0005-Replace-off64_t-stat64-with-off_t-stat.patch \
            "
-SRC_URI[sha256sum] = "eceb9015c4ebefa56fa85faff756ccb51ed2cf9c39ba239767f8e78705e85251"
+SRC_URI[sha256sum] = "05e8a137870db1d6182df72dda98ab7a7100deb376947e854b9d59c914c2c7bb"
 inherit autotools-brokensep pkgconfig
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
-- 
2.25.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A580C48BEA
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:43:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6278.1659447810030614634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sjvOABw9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447807; i=@fujitsu.com;
	bh=a/LNJWmVd6yyz76nGIVPzjFlIgqfMNf/aOmJ7ckdMhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sjvOABw9aMbB8LZyYuFwKBL2fs6nbMuG8drY9Oa2GgMMnzqfkSPatRJ4KUjJBEmKt
	 UFGgbsXOS43LUa5GsCxVpXxPa/EEWm9PPU7WkDUqddzuKNZQMdbTu8DiiPhG9YWos5
	 TSdoyr//wra/rR30EbQz3L4fA4tuA+jqge+82tgSkXdk7Kqa5/eGUWpzVf4EhnO1gF
	 XdgWFxfZRmpWFM+PYsXBYuAGfCWfcAgBesrssMDrFiuGBxlFB8SftMHtYsNhj4XGkW
	 XNgQvvqiMUApK3uDVmDgmu/BUKpqRbmGdCaiWDrv7Fl91c/ycUG9PxwY8wJIkv5aBX
	 Ho2/5blaIfg8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWfe/5ss
  kg7uvJS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxf7QsYC1ZwVPxt/sjSwHiJvYuRi0NI4CGj
  xLHF7awQzmUmietLrjJDOLsZJW7/egqU4eRgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEGi/8wJJhCbBSj+bP9RsHpeASeJTauPgNkSAgoSUx6+B+rl4OAUcJb41G8PEhYCKul42M
  wIUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNNUlFmekZJbmJmjq6hgYGuoaEpkDbUNTTVS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzklOJU/h2MN/b90jvEKMnBpCTKK6f4MkmILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBO8tVaCcYFFqempFWmYOMKpg0hIcPEoivGc1gNK8xQWJucWZ6RCpU4zGHGsbDuxl5pj5te
  0AsxBLXn5eqpQ473KQUgGQ0ozSPLhBsGi/xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9wD
  IFJ7MvBK4fa+ATmECOkWH6wXIKSWJCCmpBibjnlafoL8P3S8V/Xi5N1F6ufzjx8YGbmvs2bUy
  /3B2OKpeDntxP9mr2Gymjhdj7a+r6xmWOJZI7190wcPY62DQJukzsbMy4soDJinNev5lwZZoV
  pd8Q55jcs3zInapu9Sl7PFy3sD7bOfH3ZuUQs0D3r79wnHK+vLE9U/kp4QnVCfVHLrhYt38Z6
  s2v/8iz8Z4TfneIl+1OwqcauyBXiZXPzduWfbkkv6KQBaJI6Hvv3xXYnJ8WSBxMy9860aeHsb
  E0qRoYfNKcX+fbv7ojP/pJ26zFbEJLbKq/mTd9mbxTObQLqe4py0S+vsitrWuct3LWv7rr+xl
  2wd/fUrOKLzVyk370CfbVNmw5rW1EktxRqKhFnNRcSIA7C04qHEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1659447807!22958!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22038 invoked from network); 2 Aug 2022 13:43:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:43:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D0F6314C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C48A975
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:43:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xrefresh: upgrade 1.0.6 -> 1.0.7
Date: Tue, 2 Aug 2022 21:43:09 +0800
Message-ID: <1659447791-24448-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
References: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98095

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xrefresh_1.0.6.bb => xrefresh_1.0.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrefresh_1.0.6.bb => xrefresh_1.0.7.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb
index 99dc3b5aa8..6f6ad73e63 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrefresh_1.0.7.bb
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dad633bce9c3cd0e3abf72a16e0057cf"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "c56fa4adbeed1ee5173f464a4c4a61a6"
-SRC_URI[sha256sum] = "287dfb9bb7e8d780d07e672e3252150850869cb550958ed5f8401f0835cd6353"
+SRC_URI[sha256sum] = "a9f1d635f2f42283d0174e94d09ab69190c227faa5ab542bfe15ed9607771b1e"
+SRC_URI_EXT = "xz"
-- 
2.25.1



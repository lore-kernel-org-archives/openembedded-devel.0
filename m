Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339FAC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:28:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.6998.1641565692645196085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kw1mIAcy;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641565690; i=@fujitsu.com;
	bh=V+HqGXGE8XNKOWx9VJPIc28AVngcL+eijkN6BwflZv0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kw1mIAcyZeP1WDWsX04ipKKHaEGxURJb/wp+/1q9w4/Gsj9udntc3AneaFVzBBnvH
	 WMigtbdIauJsJl9cjzpWh+2u0QXa14gTH1fNOW1AjNk6u4hnEphGulF8dmTI7CYoe0
	 uOk2iGBY+hBHAV/cnmaew4Zuk5HdbE0RnPsd7kcGLKzHMLI9TZ75rwMbmy6JC3uGLk
	 hjxSCxiZp4+GHtgEEKwDBhZ95b8hFvuvqgOqcrxnKgOPTevQIh8G+dmQPT2uBazlKg
	 IkFaEVflks1IywAki0Iy6MVpnCb4SoWSSVtFfY3lntfeL0I64chPWRycSTcVuSZJPZ
	 67gDzhQCVMrgg==
Received: from [100.115.6.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 5E/7B-30341-AFD48D16;
 Fri, 07 Jan 2022 14:28:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleJIrShJLcpLzFFi42Kxs+FI1P3leyP
  RYO9XPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPt/A7mgikcFX3rjjI1MM5i72Lk4hASeMIo
  8bB9DxuEc4FJYu+j84wQznFGib9LTgM5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N0DN
  IqDQ1jASeL5cnWQMAtQeOLeGywgNi9Q+Prcb2CtEgIKElMevgdr5RRwlnh4ZBcTiC0EVNP07D
  kjRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkarpKLM9IyS3MTMHF1DAwNdQ0NTXVNdIyNTvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src
  5JwUvbzUkk2MwCBOKWZ9uINxcd9PvUOMkhxMSqK8us43EoX4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8Fb4AOUEi1LTUyvSMnOAEQWTluDgURLhvQqS5i0uSMwtzkyHSJ1ijOV4s3bJImaOt2Cy7d
  5dINkOJmcuOLiamWMWmLzffghIPgCTr1t+7mAWYsnLz0uVEuc97A00VABkaEZpHtxKWPK4xCg
  rJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdxPIaTyZeSVwl70COpoJ6OgVwtdBji5JREhJNTCt
  YA49G/QiSvnL4sXhC0/cUBTlcT3/rObp+3ULDE7f4Tw7y29OUuIuofXXl0VWWCg372LOYRSsr
  PthfFn0yAu+c323GCc25LYZTTpovoxNo7j8S8UWG5F5pyao/zjmrxLU80z+460nDHV7PGYJlS
  rNkE24YfzlqcURL/vPOy/PvJFuzugqr2Mhs05lf/1tmRilld8PLJT4WpH14c67Zaor6zP3T33
  gpi3TxPjmSMbOvnSfkIetHHdzNbMeLL208Uas0iPxuaYJnivmzXpzoJWJU+7elAi9NxIhtjMC
  OTg7F9UtiRJbrHm698AE7c28UntOngvUYFVZmRzOpaj/7iVvlajxizcy4oyKofM9P25RYinOS
  DTUYi4qTgQASOlxMZkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1641565689!13591!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3606 invoked from network); 7 Jan 2022 14:28:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 14:28:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BC1AD1001A5
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AFF5A10019B
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 14:27:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 1.1.2 -> 2.1.2
Date: Fri, 7 Jan 2022 22:27:33 +0800
Message-ID: <1641565655-53792-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
References: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94688

Changelog:
Bugs fixed for this release <https://github.com/manatools/dnfdragora/issues/#####>
=========
Fixed wrong access to manatools.service module (issue #202)
Fixed issue #189 "No line break to fit the width of the window in dnfdragora"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
index fdc164d56..a67bd9bcb 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_git.bb
@@ -9,8 +9,8 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-PV = "1.1.2+git${SRCPV}"
-SRCREV = "19e123132cfd4efd860e5204261c3c228bfe80a8"
+PV = "2.1.2"
+SRCREV = "5cbbc07c9d015af284a424a172a379b385f05b6f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



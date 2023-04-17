Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3331BC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:38:41 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.48363.1681717111142937207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KbEHiLMO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717109; i=@fujitsu.com;
	bh=hwjtO9xeGpiKZUj6EfdqT5kI1w/pu38tqrKXcXnVUo0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KbEHiLMOVFHIQlwx0R5xkoUdMlf2Esg2M/6RPap0SjU3dXvltgzdV3h9T3TV4hgpj
	 d0n26OEFAt4eUvNVP0azoOztwxl4MBgxAd1IcaNpns2T6M7PIY4BvAR9PiAjnTAK90
	 37iowY7QMl7sy0djUppGM7kF43Rr6+UhUHr0plITYC/7+GPOtbprGwQhCqcUhd34Oe
	 zt3RIskostHzubwjR+jpmSbUZuFqpEz/1ZP7jBvfrrsJvzdujMb1Y3SDKFIh19uzsq
	 /QIzxhUdhUwVYGkE3aAMQmjRu+wkDuOxr3LGb+I3tF0GGlJVtW9qaG18OiF7tn1tGx
	 U+WtODX5nRRqw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpFvy3Sb
  F4P55aYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWnodsBQc4K7ZcvsLUwPiAo4uRi0NI4CGj
  xM4nt9kgnKtMEnOnNUA5exkllq56wtrFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICzxMInH1hAbBYBVYnfk2+D1fMKOEnsv3gVrEZCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFumZ6SUWZ6Rk
  luYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSnPB4B+O8vr96
  hxglOZiURHlfpFqnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgXfXZJkVIsCg1PbUiLTMHGBswa
  QkOHiURXuNnQGne4oLE3OLMdIjUKUZFKXFe629ACQGQREZpHlwbLB4vMcpKCfMyMjAwCPEUpB
  blZpagyr9iFOdgVBLmDf8CNIUnM68EbvoroMVMQIvllMAWlyQipKQamMKcjkcZflQ80XAg9cU
  dg6ubd3qtuNLI5LlHeOWlN0/DJlhOu7mgtNrl8JM7zkX7ptt8fDy1f1+e/m0RZUa3WqY9UiuP
  hyy5YBPxbuO6XJ99XKc4z5WZivtPD/WLUla8OXnet1lrhS9zpsvfrivO0NwydcmxenO31w821
  /bIPA1h2bTr0INqA63Vl9kmqu0rEOlw1NFrUXuen2mu969xw8OwJec4uGpT5zmKrLzi/l+Gt3
  J90MaIBTtUXwUsctwg+2SpXumn6r3X3+W+75aKzTZ+Kpbberj+8CJvk9N8vKIZX4ISJWLFnFc
  zqW3QjZULOlHXlCPC/YV74oedW9PnPhTRWHR/R7TT7E2mv3/2nVBiKc5INNRiLipOBACHVQSu
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-30.tower-745.messagelabs.com!1681717108!218195!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8050 invoked from network); 17 Apr 2023 07:38:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-30.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:38:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DF5D81B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:27 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D368E1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:38:26 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 0.10.3 -> 0.10.4
Date: Mon, 17 Apr 2023 15:38:02 +0800
Message-ID: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102102

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.10.3.bb => capnproto_0.10.4.bb} (90%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
similarity index 90%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
index bf98d561e..bbdc3b597 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.3.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
@@ -5,8 +5,8 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.3;protocol=https"
-SRCREV = "a16468f296a9584f4068072efecdee8a9eb9c2ed"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.4;protocol=https"
+SRCREV = "a91ec65323c2577732224d0cf6f5bf1e79d3a724"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.34.1



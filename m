Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E616C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:41:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.6293.1659447686510685602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N61lyJ/b;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447684; i=@fujitsu.com;
	bh=7aFdfEH4Twzl4t7zlO4SSIKgo+JJyPi3x17XfEyjGE8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=N61lyJ/bJC/tNtKw4HHk6HQOsAR4/w6V2GCnz4+Ov1jcK1V+QXRWgXO+Gxry2Z0l6
	 NOZ5xJ+EPa+9XAiY/523C0+h/iiqWVv7LoRfQlyDBryAVnfFQdSv1R6diYOcO9kQi5
	 EjmLJVL7Wt2Z0nTIpTTJJb1mN3LamFIS4pR7KKwor9/CDS1yoZxFEQuvl+WicwH4Hd
	 rOuXkHDeddxhWggrP9VG5FtBJOu/5WUqwEyfOj/+tKqBnNKj0PBajXRCHhlgrokpPM
	 D8tJifQhIYN9nz0pBZ5Du0pT2Y7btaBN3lbiYjyZRH/aWNxRcoSNioMJEYpEXXZlWy
	 ICz0K9wd1T56g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqNus+TL
  JYOJ2PYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPtyyPWggUcFa8mnGFpYNzG3sXIxSEk8IRR
  orXxCJDDCeRcZ5L48soMwt7NKPG0MwjEZhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHrBeY
  QFbidU7OplAbBag+I7L79lAbF4BJ4k9DQ9YQGwJAQWJKQ/fg/VyCjhLXJp0BqiGA2iXk8T29Y
  UQ5YISJ2c+YYEYLyFx8MULZohWRYnZl5uhxlRIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/AyLS
  K0TqpKDM9oyQ3MTNH19DAQNfQ0FTX0lLXwkQvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIRTipNDdjCe3PdL7xCjJAeTkiivnOLLJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvLdUgXKCRanpqRVpmTnAeIJJS3DwKInwntUASvMWFyTmFmemQ6ROMSpKifMuB0kIgCQySv
  Pg2mAxfIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC8fyBSezLwSuOmvgBYzAS3W4XoBsrg
  kESEl1cCkr2Fo2GywXcZb+rxy1sevd7techR73Fb8JnZm97N/Ry129komnVn5JOSIxMwGH8kl
  Xstr/iSHz830vH/0T9uGMv+TfW4Lt94tCrvDGvTkjs7tqX0bA3Ra+x8t9zLQYZRc99fid2Bf6
  bRblVH2cdsOcMq0scqctPmS/fH8lwn/l5qd9Zdd43B5s2R92h2ny6HsN43Wzdm2e/+2uP2hpT
  Ynm+6uzCxvFK0Qb/3+Rf4487rvCyzfcC9t2SPQavUp+EMil9HdZ29k5nWevdiVFvxywUaTWVm
  L9fT97Sc+d9sc0n+0VPww37b+7QErmkTXv3F8kPU5O/D26RlybqUFP1Lm91TYHJotknfXKGRF
  cmGLEktxRqKhFnNRcSIAFG2t6lwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1659447683!2710!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17186 invoked from network); 2 Aug 2022 13:41:23 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:41:23 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 263BD100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1AADE100193
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:41:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libmxml: upgrade 3.3 -> 3.3.1
Date: Tue, 2 Aug 2022 21:41:06 +0800
Message-ID: <1659447669-24388-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
References: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98089

Fixed POSIX thread cleanup bugs (Issue #293)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmxml/{libmxml_3.3.bb => libmxml_3.3.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_3.3.bb => libmxml_3.3.1.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_3.3.bb
rename to meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
index c8e2167795..b81050b25a 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
-SRCREV = "0237559fdbcecae34157b547aa2b99e12de305a2"
+SRCREV = "fd47c7d115191c8a6bce2c781ffee41e179530f2"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1



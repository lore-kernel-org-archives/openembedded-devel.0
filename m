Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A92C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 09:46:26 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.4438.1722851160338434623
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Aug 2024 02:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=FTMTxsir;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=d2CG7qNF;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1722851160; x=1754387160;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NVkM6GqAf+1L8iPuGywmZr/4JDTTZqC1BzFyDOsy1y8=;
  b=FTMTxsirA9UraMFfp4fIz/+yYXQ4GZ1iFnjBS/gRreaEVGr2kS90xkfX
   2aJD9pmKAi9NJ/IaIvtlzzRwA21KDwNqfoV5yVXUseCzwHa/yzR35+GqA
   /CsovyV8VR1xgFmwYXvevRI5k6yTl/BsBbLffuQGSNx4nlWYLNOYT7IEJ
   wPq5kKskoyGeSn/RyYKIkWd2DvHf62DFi93qNZvUivMQNzktb4T2ov+We
   iwMg7tnBO373vqbwhsw1/SK52EQaywLyZMaT/dPO3EJpTK9v/MtBzgUd/
   nC80Qye6JAlkjMZfHax0kY77faz7wkPgQFyQraUZhh2PoafREdqxKkNCB
   w==;
X-CSE-ConnectionGUID: BZsrkXpzSZK+zfQXIDfGtg==
X-CSE-MsgGUID: c3537/PcRSmvi+CzqcCQ9w==
X-IronPort-AV: E=Sophos;i="6.09,264,1716242400"; 
   d="scan'208";a="38242508"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 05 Aug 2024 11:45:58 +0200
X-CheckPoint: {66B09F56-25-E6D9A9-F72EA055}
X-MAIL-CPID: 2D94A017C29075DE66C957AE4F37C1E6_4
X-Control-Analysis: str=0001.0A782F1D.66B09F56.0182,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61ECC166B1C;
	Mon,  5 Aug 2024 11:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1722851154; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NVkM6GqAf+1L8iPuGywmZr/4JDTTZqC1BzFyDOsy1y8=;
	b=d2CG7qNF5yn7UJsnlBMszJaEul+rN053+lmQALI7S6+vJskUQ5VLwUkyQb/kOCeNyZeabW
	Dc3Dnagoi7S8vypB231W/Ya67+jMflrwxcKnCJRDl36Hx7jSXz9o78hlx0z7LcGBrSCky5
	b+fST03l5gkFRabffCB/XqIqyJeGzzqRlQz5ai9Lmg1lS/Mrd9zJL+NTlfVdQKm/07E8ZX
	PUdraOjigAT7EPCwN7LtFZ2s07l05JsY39nUplxCVpuUB1/oBfNDJNpmPGlX6EaU61uLYG
	0cblzS1pooihdONH1jzfkIL7gWSmftcw8r5hDIJ2z75sj8JBWqhuPOMRnsLnlQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe 1/1] luajit: Fix host development package
Date: Mon,  5 Aug 2024 11:45:46 +0200
Message-Id: <20240805094546.115663-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Aug 2024 09:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111511

The 32 Bit host development package needed is libc6-dev:i386, not
libc6-dev-i386.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
At least on my Ubuntu 22.04 the package libc6-dev-i386 was not enough
as /usr/include/i386-linux-gnu/bits/errno.h was missing.

 meta-oe/recipes-devtools/luajit/luajit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 240271d41..418921754 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -21,7 +21,7 @@ BBCLASSEXTEND = "native"
 # Host luajit needs to be compiled with the same pointer size
 # If you want to cross-compile to any 32 bit target on an x64 OS,
 # you need to install the multilib development package (e.g.
-# libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
+# libc6-dev:i386 on Debian/Ubuntu) and build a 32 bit host part
 # (HOST_CC="gcc -m32").
 BUILD_CC_ARCH:append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
 
-- 
2.34.1



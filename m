Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176D3C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 08:06:46 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.54811.1723104391256854965
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 01:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=VG9xHZZf;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.ew.tq-group.com on 100.100.100.100:53: no such host" header.i=@ew.tq-group.com header.s=dkim header.b=EkO/eQ65;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723104391; x=1754640391;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NVkM6GqAf+1L8iPuGywmZr/4JDTTZqC1BzFyDOsy1y8=;
  b=VG9xHZZfh8KR1ONnZMYwR2rchiC51a2pugCRmDBeTUJKTaR1DLhytmE3
   ZfrxxoqRY4chv1/CQ2Sxx3xow92lRlRtSQMOY6tp6rmAWSK+MDzhxEBgX
   FmpPKpoQt1c+aBV7X1HBLxLJ11vXkR1/Hy5Fq2jIW0HaiS2RrWZpuDPiv
   eMjgZUJkLm/SXfFUDrmezic4WmClUmxJ/j/Mn209wojXshb7bsQaL5JFf
   NPmUJl2JS+a9Ng8b5fhYmlDVSbpe5jorc7FhHUgX/LQl17jGw+8h/cFW8
   WFYTnj+/UYwDcScobEdY3+3qMCN2DOPz0ym/VM3Gr4FQNKj8tiAiQsGPI
   g==;
X-CSE-ConnectionGUID: dIRxNxlHQ6eDBeDMmlEasA==
X-CSE-MsgGUID: Sj22zsh7R9eAcnFoj2dazQ==
X-IronPort-AV: E=Sophos;i="6.09,272,1716242400"; 
   d="scan'208";a="38308676"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Aug 2024 10:06:29 +0200
X-CheckPoint: {66B47C85-18-CFE9415D-C7159436}
X-MAIL-CPID: 39ACF37932048BC8775907C2D6B0D171_1
X-Control-Analysis: str=0001.0A782F27.66B47C85.00AF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12AA9160BC4;
	Thu,  8 Aug 2024 10:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723104385; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NVkM6GqAf+1L8iPuGywmZr/4JDTTZqC1BzFyDOsy1y8=;
	b=EkO/eQ65rLDq3zynYryFBTW8Mv8tteadphle72diG9AuUapUP0Ier4JcBjyq2cJSvkHNyg
	Zbsz4XvUMnHC6h4W9G12qy76S1W9WoEJ2alt2Vq2Ipfiy2C0AORZE5jV2T8eaqL4cYVADv
	fsQkedvI2Pb4TKoAV5xbAUtM7jsqUW9zfy8j6PwkwTslKesy35/iF5HCysEHxqkzUa9wuo
	h1zSLPOAr2r8R7Om1hAxYY5xklfgRlsS8Kj0TQQovJBqvPSkvDw0FsUpHuAr6OEJhuCM5Q
	pW+s76EzUOsYT1hM5ozn4ozXwlVWUVfzLkSS2b/OKAgtB7PIpKTdspkIiz/adw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe 1/1] luajit: Fix host development package
Date: Thu,  8 Aug 2024 10:06:18 +0200
Message-Id: <20240808080618.373849-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 08:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111647

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



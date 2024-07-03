Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC16C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:34:15 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.47193.1719999245334260989
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=hDsga1DM;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=QKLA+3IdEZf7UIR32VvH3SCxodAodCuEVaz5UNPjycQ=; b=hDsga1DM8P/SJmhf7q3eCN7UH7
	z24nGTvuCHc1v1vYF+b76IABHcd/5Tex+Ekkrvgmbg5TVuZ9ZGSg5DFa/VnM9hUHgpZTbQ9Eya/8f
	2N7UI0mT3crbskHZggE4aFnBrtS0aG0VdIANHtEaSrrUJwhGNX8wLeAB15UEp6QQdiAqDdwhSqSBK
	wOgprE9nWhau/VTuOIRpC37XxQAww3V8mRHKpf6ibQvPGCwlLTp/OAAKTFRjdjkhVf5/NXFXCgva7
	NOUfvgGVrzNeDTEAPY9Tf9VFANtvqbd1S69Tp0/7A+EwG6CPWftAJDV3OaWJzcbREaXR6+J9Z2Z4r
	P4K07DfA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1sOwNG-000I8t-Ok; Wed, 03 Jul 2024 11:34:02 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1sOwNF-000MjY-2T;
	Wed, 03 Jul 2024 11:34:02 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [oe] [PATCH] openocd: Enable linuxgpiod build option
Date: Wed,  3 Jul 2024 11:33:41 +0200
Message-ID: <20240703093348.1152878-1-sean@geanix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27324/Tue Jul  2 10:40:44 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111223

Enable the linuxgpiod via PACKAGECONFIG to allow to use swd via libgpiod

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff..2f27bb672 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -51,9 +51,10 @@ FILES:${PN} = " \
   ${bindir}/openocd \
   "
 
+PACKAGECONFIG[linuxgpiod] = "--enable-linuxgpiod,--disable-linuxgpiod,libgpiod"
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
-PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+PACKAGECONFIG ??= "linuxgpiod sysfsgpio remote-bitbang"
 
 # Can't be built with ccache
 CCACHE_DISABLE = "1"
-- 
2.45.2



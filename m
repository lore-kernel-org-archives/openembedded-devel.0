Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68525C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 10:45:30 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.11494.1720608322392576626
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 03:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=wXMT5uDZ;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=D1797ZGiTyU6jLnT1xHDRzQv0KC6HDgFb32759M/DHA=; b=wXMT5uDZrbJZHv2wJraQeMPNuQ
	gdNHkBh4cBagOWxssabiGzof/1XlqKExM9hGNqGDo2XPEGHsTXwUqKe+7E4byGkFmXX6KKwcMyi2t
	GftaRrRLI0DEKMXm+OBJRiUGjC3qynftVx3SpApQb6ivMdULq0h/W++dbqve5RlWCxOzx1LeDvYk3
	34i31ViCxEQYHYo+K4meehBuZ/zJmlSKOUVxm26eb2emWSPTheJOk7wdwbE15VBj64EAKFzdXFOCT
	I+pabszCN34Pg2b2Njrzu2C9VDpMUeDF4qXZMwmW5duCS2wRrPBP2SiXa/RZTNptuaPESrPRN2Nrg
	YJ9+GB/g==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1sRUp5-0006CE-Ga; Wed, 10 Jul 2024 12:45:19 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1sRUp4-0006VB-2Z;
	Wed, 10 Jul 2024 12:45:19 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	bartosz.golaszewski@linaro.org
Subject: [oe] [PATCH v2] openocd: Enable linuxgpiod build option
Date: Wed, 10 Jul 2024 12:45:03 +0200
Message-ID: <20240710104505.1215103-1-sean@geanix.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27332/Wed Jul 10 10:36:46 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 10:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111294

Enable the linuxgpiod via PACKAGECONFIG to allow to use swd via
libgpiod.
linuxgpiod requires libgpiod 1.x, so it's required to add
PREFERRED_VERSION_libgpiod = "1.%".

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

@Bartosz it would be nice to be able to depend on libgpiod-1.x.
Guess the libraries could co-exist and then the libgpiod tools could be
from the 2.x.

 meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 559fe29ff..8c411ec5c 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -51,6 +51,9 @@ FILES:${PN} = " \
   ${bindir}/openocd \
   "
 
+# To build with linuxgpiod it requires libgpiod 1.x.
+# Add PREFERRED_VERSION_libgpiod = "1.%" to local.conf
+PACKAGECONFIG[linuxgpiod] = "--enable-linuxgpiod,--disable-linuxgpiod, libgpiod"
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
 PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
-- 
2.45.2



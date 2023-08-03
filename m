Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01705C41513
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:49:07 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.9949.1691052539134602177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=a8dlyW/u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9BB1224000B;
	Thu,  3 Aug 2023 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Tb/qevgBQqj1Bk9ABNZWR7P6wgQMOB4+GFRXxYru3Y=;
	b=a8dlyW/u3gQOBUJPp6Np0f1GL9k9otfFMBDT8ThUonTZ0GMidin5UPxyWGVTCLbeoNzHCp
	jHMRodGw1jlVRAQlVftkurUhuGdBwkh7/lhDcYktlMSnlpme0W0MaHX6iSi5kM3kSzHrkR
	lD6BXMDQRSIWETm6vl9a80bj7zLzZm00S7uiXF1C3TQEs4uuJXTfCZC5z8BYWUQ3diekAQ
	pAlG32AkSlHclF4iVbuAkbgjGq44Qwv7pW9ArFp5p4ITK5emayfr5jf2XZdFxBpqXNiaEp
	4F+DQg5RNLG8kuqH5Y06QDFWSi898+wSsPhlJ2S9eTJBE2XH3mIQiPyiclMDIw==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 7/7] [meta-multimedia] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:39 +0200
Message-Id: <20230803084839.3012610-7-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104217

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
index 52a672f04..9895e8976 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-0.2_git.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Multimedia processing server for Linux"
-AUTHOR = "Wim Taymans <wtaymans@redhat.com>"
 HOMEPAGE = "https://pipewire.org"
 SECTION = "multimedia"
 LICENSE = "LGPL-2.1-only"
-- 
2.34.1



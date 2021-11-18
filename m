Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88752C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 02:41:26 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.92.1637203285684917662
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PpGAyTDM;
 spf=pass (domain: gmail.com, ip: 209.85.210.49,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so8293950otk.13
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tis1Ae25sisP4hRPFp2iV+IhMTqQwQaxdV0T5Fi05Bo=;
        b=PpGAyTDMEugXm918sI6q4N64IrULu26cLQL26MxzjKhB8ZWWMO/pZ5ER/5oK0eQdha
         pCc+RDqs3c/aEipIpkMzzrOgpCA8Fqw6PEVyD1bBEIhtasFPw/+IuhOU+hBl8ArBJak1
         KvPq7R+y83YylbXdEYrg0ZPahTTPdzuJIWHYO8vfj2fOq3Hv8zwHOrc6hrdbUBRc+SOW
         dP7Wk/oF8qVhkuUUZdZLi9BikN0l9tGiA4rLV2ioF6FVZ21L+PknVTISq0TyyEZG4yn6
         tnzpVZRCAxFI9cTzN/4V/I9X/MwpIo1xqA5jUauStTRSOUmLopVX6fyMRpgcNkA64hvp
         fGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tis1Ae25sisP4hRPFp2iV+IhMTqQwQaxdV0T5Fi05Bo=;
        b=mBJTeuF2Ut5Oi4kUG/0YXyv+R+tfgoIrrViVMkArTbo5PjQnJhkdgMON85GlwhMhUs
         XixRZGOTbP7vGtxa2jf7yzvGi2JhctJ1wv48JSKFnsLf4b8PCmzE6K53f1PNHW9kD7oC
         onyikOAx5HwcSWbHPTXRLZ7X6UQhste1jedAdNKW4CGvzfTxcx9gjrYs8WINgxR5Ahna
         jllYhI8hETF6d3nHeJQr8178mJtQDVC52vGXoscPGayHJ3ThicQ4ntmWWtMh7wY2sunl
         EXgcpxT89Wdsx27Bnm3Ap5AtMY7aEIeHR6na8/RXgZ/PmarDF2hVF/Aswcyp/X+oDJN3
         kMgg==
X-Gm-Message-State: AOAM532M7BywX7nINhKGk9xMAgCjyucySL+sB3baQAKLxrWEeHyZYiKr
	W+L0G4SlP0hjiaLz9EYvaiZLwKwk55M=
X-Google-Smtp-Source: 
 ABdhPJzdBCfTJR0+LYVho7AlTxl62S5gErEiAszJUk1jwAssgcTQoIkAVWq3uIRFfdJnk2WLYZ701A==
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr17977991otu.184.1637203284813;
        Wed, 17 Nov 2021 18:41:24 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id h1sm324662otq.45.2021.11.17.18.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 18:41:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] colord: introspection is not valid meson option
Date: Wed, 17 Nov 2021 20:41:15 -0600
Message-Id: <20211118024115.477216-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 02:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94012

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-support/colord/colord.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
index 563a0ee00..e30022251 100644
--- a/meta-oe/recipes-support/colord/colord.bb
+++ b/meta-oe/recipes-support/colord/colord.bb
@@ -4,7 +4,7 @@ inherit meson gobject-introspection gsettings gettext bash-completion systemd fe
 
 # polkit and gobject-introspection are mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 DEPENDS += " \
     ${BPN}-native \
-- 
2.33.0



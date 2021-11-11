Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1A9C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 16:03:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.1562.1636646608966941436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jLSVY3tL;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b15so25859278edd.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCilP3yHqtDL7Gw56zoZI95WNpRQ8rccyDytE4MSckQ=;
        b=jLSVY3tLkNEPzt5RmqG+7/GMLFsqQlM7M6m+/c5aowbCACFEULQZBxvJIxu2ZqybKi
         LgmteVj1R8z4dGTTegvn5rgqjtEh5EJr7fbH1Oeup43b0rPSMUo/UJX/d5s1EC1by2Sa
         x5iJ2YbDAoafaWoLvqu7IkB6/2Ja/SSBWSps/iFukCu7rbQxCneKtK7eLDShjLybAJo5
         +TRlHEReTfABLTYe4W84zeluLk8CmL/BMELGFugYHP6mKbMOjRICAGWQFYr1fRyCtIFQ
         ZXQ54tEYX5rWtF0AP8nOZbrQRwkv+gVjYHBeywHALpE2c+z8sTBzQUAkNu5ggbMeNoUM
         Vsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCilP3yHqtDL7Gw56zoZI95WNpRQ8rccyDytE4MSckQ=;
        b=SdQ3QI6x8HdLZwXvBJddYwjUh8KcQ1njjKnn3yCGuVcOQCrJ3S7VlCc/Q9XcMGnQ0A
         k6yNnYvfO7oRQ52i3gSNyxyFPC9NnB1yUH/jHu25sltJL1nLFpCccVYI++ZKgOC/+noM
         0mbw7OJtn1ULIhSzIXhNdRuHzco6hZyikf6LxhCHQq5aRQxQn38FZ9M4vPx9e0amuf2/
         sZXYvz12+zdYG/hoODutwmicaiufl6jS7YqPH0Y5Aoxi2CWvFhg+l4I6FlxF5Ug4/lLr
         KQUc6q05nxHnmDb4RnA10YCbp/IL/7RKLpR5IvZZPIj5UOZnnJLvnOXp9WZuHbpsgGJe
         G1mQ==
X-Gm-Message-State: AOAM531z2mcjFQxIzMIH9f3HaKs2xmZsf4PcWV0MsHxgb/ggnQC/2jjV
	EIaixeRsf8sJmRuNAHxoEdsElGBRz70=
X-Google-Smtp-Source: 
 ABdhPJyrX8KP2LNYAKpU64tkNbzVZitijO+cctdZ8WKECzVpirJVR47ifZ48O3N+ovykX+4Q1oUiZg==
X-Received: by 2002:a17:906:a392:: with SMTP id
 k18mr11037198ejz.99.1636646607043;
        Thu, 11 Nov 2021 08:03:27 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 o5sm1998253edc.25.2021.11.11.08.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:03:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] libgusb: add PACKAGECONFIG for vapi and keep it
 enabled only when introspection is
Date: Thu, 11 Nov 2021 17:03:23 +0100
Message-Id: <20211111160323.45859-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Nov 2021 16:03:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93909

* vapi depends on introspection being enabled and libgusb build was failing
  without introspection with:
  | ../git/gusb/meson.build:182:6: ERROR: Unknown variable "libgusb_girtarget".

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
index 7020ced72c..51e7349043 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
@@ -6,6 +6,9 @@ DEPENDS = "glib-2.0 libusb"
 
 inherit meson gobject-introspection gtk-doc gettext vala
 
+PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
+PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
+
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
 SRCREV = "db9edbd8b45662d551194a0985173732f8f557a5"
 S = "${WORKDIR}/git"
-- 
2.32.0



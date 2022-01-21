Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1CBC4321E
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.559.1642801158721669323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CmpVDhuB;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id az25so1983553wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uFQ2aL306hR4HDzIUClVND/PYpnepd2Lphgwzfw1tz8=;
        b=CmpVDhuBNXcfQ0aui6HBljo7t8eVfwqQnE+q314kBWR09W+ZdN9fGGdx5Mj30ldNCQ
         r9Vbgn8er3IDVEDvbPBf6/O69RfCvcewx/5VOIcYJzjtNxb03Ag+o2TJDPNVQ+sbB6eK
         e7njiBQxV6XiYtl7AFUvd4VkXAvS/ej2Psln2sFOa9F9fxbUvCIltk066pkpCrykPvA1
         cBD8pMNyPn/feqm16NPnAVBHymEsEpyNfu8Fs0cCd+AeErheYT95wjT9KYm8Ofcwencc
         G4PR+m8sqf00XRaMdgbS6sdocmSJBVAJygXyWxrDYVkQa+TsuJqR1TLP6hc9vA9b9se+
         kHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uFQ2aL306hR4HDzIUClVND/PYpnepd2Lphgwzfw1tz8=;
        b=Ny4fCnxNZA9QidG8pShkRwfl09glr8DZS9VX0+jLz5ZIYWmAIY8D4G3p7bbPZYSV8v
         FZfs6eY9MP1+DKCKu+eVzFgFMGijDMGBFZuvKC2no1eTerAooATLGIgk/eCsbTfnlDoI
         sGyNRKDLMqABLhTKLLALtxilVDQUgqxuap24h55QiXuFXx4TNSHGsFJYLcpj60Isotu6
         +v8Oy5JXGwSkb/2lbbY/dkIjvlSduOn3a3+39Qn9R0iXa6887gXGpkK5+l9QWTzzZsK6
         VrdcC18XT5FHi8Q4UC/6APf7IxjTaCBgbZJ8JyRX6M6mTbq7AugLI3Qja5CiXqDfQpw7
         2BTw==
X-Gm-Message-State: AOAM532bZdXYOzK7+yPqFuQtLXOmCmayBHvOIWUp3s3D+bEsCaeyUJWZ
	aL+kZW/MA5k4chU43n7J2YuPmQJ+0MI=
X-Google-Smtp-Source: 
 ABdhPJwYx1IM+960I+WASU9H3XAxeTwpMKZPP3/hKotoXNGyazIHb5PwBVvo/tD4+iSZF+2zA+e3zw==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr5311041wro.532.1642801157325;
        Fri, 21 Jan 2022 13:39:17 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/19] gthumb: fix meson 0.61 builds
Date: Fri, 21 Jan 2022 22:38:52 +0100
Message-Id: <20220121213858.762625-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94991

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...001-LINGUAS-removed-duplicated-entry.patch | 23 +++++++++++++++++++
 .../recipes-gnome/gthumb/gthumb_3.12.0.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb/0001-LINGUAS-removed-duplicated-entry.patch

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb/0001-LINGUAS-removed-duplicated-entry.patch b/meta-gnome/recipes-gnome/gthumb/gthumb/0001-LINGUAS-removed-duplicated-entry.patch
new file mode 100644
index 000000000..b50b175e7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb/0001-LINGUAS-removed-duplicated-entry.patch
@@ -0,0 +1,23 @@
+From f3d399892e59a2e850be1d0de30c429417c78360 Mon Sep 17 00:00:00 2001
+From: Paolo Bacchilega <paobac@src.gnome.org>
+Date: Tue, 11 Jan 2022 12:30:44 +0100
+Subject: [PATCH] LINGUAS: removed duplicated entry
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ help/LINGUAS | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/help/LINGUAS b/help/LINGUAS
+index 0e8a52d..fa1fc3e 100644
+--- a/help/LINGUAS
++++ b/help/LINGUAS
+@@ -8,7 +8,6 @@ eu
+ fr
+ hu
+ id
+-id
+ nl
+ oc
+ sl
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
index 4dbd82dc3..e9c52f347 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.0.bb
@@ -26,6 +26,7 @@ DEPENDS = " \
 
 inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
 
+SRC_URI += " file://0001-LINGUAS-removed-duplicated-entry.patch"
 SRC_URI[archive.sha256sum] = "3deffc030384e64b57361c437c79b481ae1489ef44c87ae856e81bb10d8e383f"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.20.1



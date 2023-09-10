Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F24EE57CC
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 03:22:34 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.30345.1694316146213584214
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Sep 2023 20:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C3a+v9d9;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5733710eecaso1957528eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Sep 2023 20:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694316145; x=1694920945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJDYi3m1U6Tte+OkFi8CZJCFmgBktbRRxd7oLNWZ53w=;
        b=C3a+v9d9lZ6tyoYhBxIc86/PAJciJNEdciMC5B8FBCJipwwQZckMyDrbbnB+hp4fAg
         E0lFruS8XywB94GYw1swbpgn8rqjHqkP1A2U/B5/rh4ixHK+EFu54Wfw8V/Up5Y+CyWq
         CNzBcPyiRcs3zwb2OQkcVE6NsqEi1Y4jGcajBjW6+NwWqkeWPzmIfsLvNIBFMnGVQcpe
         T+lIMh5b2etdB6Sy2jfKXz+oqMtSfEVLhmE2w4Eu1xKs6Vhq9c49SMJWQAki87tUBZnh
         SYHbq33yPW4+zb3euAJtGChtYUEKbPHHMGIGWsQ/FKZTSWpkgooyAOuXTVPqNDgDsOyD
         83TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694316145; x=1694920945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJDYi3m1U6Tte+OkFi8CZJCFmgBktbRRxd7oLNWZ53w=;
        b=KiBTebkxvsdJ1/REOw73xx64QQwERPRK5r4ZBdgXIAK6BVqdXH2rVdMizQs/VEdgoP
         Aqm0zKcuyKMFmQ0BHSFAYGdZfW/8jYxQ1hXj9xQhk/PlgSfpDXT0cJszZwATMldmZgAT
         Am5qrx4AS0LglhrDoKWCuwIG4ldyMVJRhiy3qwzMzChgwgIY4hPRXJOu0NCMAcsbbW/E
         78xVsAChUJG3KBhQfqQ/ZqhYEUyldsfsdFBTLPi1icffyQK3Cz+pYL6NfjDBz/iNCJlC
         dhO6+PBj6IdBAmdE1HS96emTYoLEappWu6yvRmkyITg0MHIRvV2PAdBH8sfZJiiM6bHV
         K1mw==
X-Gm-Message-State: AOJu0YxGoNZzMcez6WgnH6/8EDcnlWYSSFgKU4BY9y9+NOFKvl+antqR
	4GnH3nqySB3WY/Po8/kyTXrVGAejFuk1yQ==
X-Google-Smtp-Source: AGHT+IExDOI/BHhK8w6Lgj/i1UZ2gEqCw/3u7EgSKgFVCAqdZyMMpI4uwULveTseQBUdh7K7GwyeMw==
X-Received: by 2002:a05:6358:9142:b0:134:e964:134c with SMTP id r2-20020a056358914200b00134e964134cmr6949165rwr.11.1694316145178;
        Sat, 09 Sep 2023 20:22:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id t10-20020a170902e84a00b001b7fd27144dsm3906763plg.40.2023.09.09.20.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 20:22:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] vlc: Fix build with gettext 0.22+
Date: Sat,  9 Sep 2023 20:22:22 -0700
Message-ID: <20230910032222.2252748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 03:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104818

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nvalid-.oc-translation-format-string.patch | 44 +++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.18.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid-.oc-translation-format-string.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid-.oc-translation-format-string.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid-.oc-translation-format-string.patch
new file mode 100644
index 0000000000..866ed03294
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid-.oc-translation-format-string.patch
@@ -0,0 +1,44 @@
+From fc4bd86bea0b81da0b6fa5be0a352aecc8fa690a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 9 Sep 2023 20:13:55 -0700
+Subject: [PATCH] po: Fix invalid .oc translation format string
+
+gettext can validate format strings now [1] with 0.22 and newer release
+
+[1] https://savannah.gnu.org/bugs/index.php?64332#comment1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ po/oc.po | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/po/oc.po b/po/oc.po
+index 667696cfe7..ddb1677d8a 100644
+--- a/po/oc.po
++++ b/po/oc.po
+@@ -5298,18 +5298,18 @@ msgstr "Comanda+"
+ #: src/misc/update.c:482
+ #, c-format
+ msgid "%.1f GiB"
+-msgstr "%.lf Gio"
++msgstr "%.1f Gio"
+ 
+ #: src/misc/update.c:484
+ #, c-format
+ msgid "%.1f MiB"
+-msgstr "%.lf Mio"
++msgstr "%.1f Mio"
+ 
+ #: src/misc/update.c:486 modules/gui/macosx/VLCPlaylistInfo.m:138
+ #: modules/gui/macosx/VLCPlaylistInfo.m:140
+ #, c-format
+ msgid "%.1f KiB"
+-msgstr "%.lf Kio"
++msgstr "%.1f Kio"
+ 
+ #: src/misc/update.c:488
+ #, c-format
+-- 
+2.42.0
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
index 92f05544dd..12b32879a7 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.18.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/videolan/vlc.git;protocol=https;branch=3.0.x \
            file://0004-Use-packageconfig-to-detect-mmal-support.patch \
            file://0005-ioctl-does-not-have-same-signature-between-glibc-and.patch \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
+           file://0001-po-Fix-invalid-.oc-translation-format-string.patch \
 "
 SRCREV = "e9eceaed4d838dbd84638bfb2e4bdd08294163b1"
 S = "${WORKDIR}/git"
-- 
2.42.0



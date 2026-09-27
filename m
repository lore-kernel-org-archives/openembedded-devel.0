Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C24CC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 15:51:46 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39667.1790524299441454608
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 08:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gvw6csIh;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso2321772eec.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524299; x=1791129099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9ir65/5FZnw2PrmeFTs78ZDhkbYd1wX4ILOSCJSAw4=;
        b=Gvw6csIhXbJFn0cY/l62o+MxlxJhCHqWJqHe1B/7N5lfUKNTuXCXCR7YPeRMZX5C1k
         5Ec0Cedh8b48oKbxfOqPuEdMKjSQwsHq+i6cOn/Vr5srSvsKQZb4wYgqhkdILyOoHjpy
         ZVxeGqcX1A+4W15hY2rBZw+0LRbwKoNdAK4ASVTUHiF4PUI0ubpSJWXRANgCzU2s5RU7
         OtHaXCeVEwRJB2mDCCHalZT+CM19k6SmzTpWpsB0JBYYQMDMPXTXIQQNF6mak9yUs0Hk
         1U4ESa+RDldVJPGwxFIhxfDVrK05sdekxnm3BtXzvgz0laCRUJ6DxlUasEw1qGwpMxLl
         CyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524299; x=1791129099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9ir65/5FZnw2PrmeFTs78ZDhkbYd1wX4ILOSCJSAw4=;
        b=laGjxhwgbMyWuUntjcQcNQBknME/4aIP5cXSwviuQWuXmJerbyxg/uSn53/MRMCF0e
         DmNRmSliuYHpL+EMuNtYnyCp39/yhjw7Y+i84OUhNPtl0PFJoQ65muRVbDFLUIkemfhb
         hdbWHdX0s5fZ6GHjrLNoZ5ZemooTTxGkBxcuao1uIDXecFYn/4Ppw7s99rA6bInJdA/7
         vhkl+R4kE0i+9pEwzcwz/usG8EZ+We/420u7WLdfx+wzh2brlftBMd4HUETEvqr4aP5M
         6Vv9zAjNnjqQaB6UVFR5dkFBxKY3+gr4dEcm9i1wKrfIQwW3ZwPP7oyjIdzcq+LmisYF
         ltDg==
X-Gm-Message-State: AFuF++mwkGKV+u5oXIKlIdz8e4z6QnLoHkyYX7ANrZLLl/5j81jG0hZI
	xVq6uXkLRm99D4F7qbJtiVpWJ9wFVXQwrD6f5IAUXObhsxbXyfGhb7nXaPA69WeN
X-Gm-Gg: AYBFou0v8uO4mQmFG7wkaezsMRqR/RaiyhMH34UnhUangrqZPpvE8YX7+wI9WLvg65x
	u0sC0Z6v9sIY2Pk/ZKq7qUJMJny8MwZssKlTN9QBh1RH5cGc8oxNLSC8DteAR+/JjOXONlpmEDo
	FuKKMfcjl7tifkiD9t0TwFZkGeyjB1uZoNh6ZxDYcBTBJUTdXqldgwsYsrRvKFjLBUQSIrX30Dw
	LYiNQ2ijRyKGuPBpuX7GmdV87pfyW4mEnnmZ2/ok/BAumDYjajVElh/xVc87w2WLFe+k4T1vIcd
	EoWHReBzhWyBfrarYpN9Zh2PnNgK8R9Amz6O1Tf4mlqT2zchLk8N2niJhZCntXayBdzqTE9C3bs
	NdO6YN68hGpHDxrhOUcPcjZmZLz5g5WKh46lo4+CQh9ihPhKkEuCC22aIU2MFqyTu4wMCbhijy0
	hCY+k3Q8WUBDNeY8MQDffq9lSWVMFQsHwxV8HLvVOaXVJ8zXyg2C2286XbkQ4sRM/UGfpDZ0tfc
	Gsq0gyZqJokzbmOb1NxFFnvvddL9BJS7elhOESJDRD2SH5GmXguScYBd3QkDOC2arVS1ow04BdD
	H4oujTrBviEBy4xYbRBbUrAS84EiiFMeGXF9COc4mCNW82ZLQzLOUp2+6SrvC4cC25xZ2F1C8GX
	TMoeRFoJEkDiEwso2yOmR5TtbaCMyuly7A5XOqbEUarR5GOjeZkfbLp+T3k2NIwKAMofu7BCFiE
	lJ1VCqn9zIQ6XDGW9wuM5ibPJ0U+scxvc3ajjjSw==
X-Received: by 2002:a05:7022:b044:10b0:147:9ad0:cf32 with SMTP id a92af1059eb24-1479ad0d333mr5552897c88.31.1790524297335;
        Sun, 27 Sep 2026 08:51:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c3f8sm18790849c88.3.2026.09.27.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:51:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] v4l2rtspserver: upgrade 0.3.8 -> 0.3.13
Date: Sun, 27 Sep 2026 08:51:32 -0700
Message-ID: <20260927155132.1277867-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
References: <20260927155132.1277867-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 15:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130374

- live555 is now found via pkg-config (see the live555 change adding
  live555.pc); without it CMake would download live555 at configure time.
- Disable CMake's Git lookup: it runs "git submodule update --init" and
  "git describe" from the build directory, which can act on an unrelated
  repository enclosing TMPDIR. Pass the version through
  V4L2RTSPSERVER_VERSION instead.
- Add openssl to DEPENDS, it is linked directly.
- Drop S, the default now matches.
- Turn the automagic ALSA and systemd detection into PACKAGECONFIGs
  defaulting to DISTRO_FEATURES, and make log4cpp a PACKAGECONFIG too.
  log4cpp was in DEPENDS but never used, since upstream only links it
  with -DLOG4CPP=ON; it is now enabled by default.
- Register the new systemd unit, but leave it disabled: it streams
  /dev/video0 to the network, so images should opt in.

License-Update: License file renamed to Unlicense.txt; its only change is the unlicense.org URL switching to https.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../v4l2apps/v4l2rtspserver_0.3.13.bb         | 23 +++++++++++++++++++
 .../v4l2apps/v4l2rtspserver_0.3.8.bb          | 12 ----------
 2 files changed, 23 insertions(+), 12 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.13.bb
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.13.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.13.bb
new file mode 100644
index 0000000000..93e0d62878
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.13.bb
@@ -0,0 +1,23 @@
+SUMMARY = "V4L2rtsp streaming server"
+LICENSE = "Unlicense"
+LIC_FILES_CHKSUM = "file://Unlicense.txt;md5=d88e9e08385d2a17052dac348bde4bc1"
+
+SRC_URI = "gitsm://github.com/mpromonet/v4l2rtspserver.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "fafc8cbd1c93bf0f7453efa8b7718c68941fd5eb"
+
+inherit pkgconfig cmake systemd
+
+DEPENDS += "live555 openssl"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} log4cpp"
+PACKAGECONFIG[alsa] = "-DALSA=ON,-DALSA=OFF,alsa-lib"
+PACKAGECONFIG[log4cpp] = "-DLOG4CPP=ON,-DLOG4CPP=OFF,log4cpp"
+PACKAGECONFIG[systemd] = "-DSYSTEMD=ON,-DSYSTEMD=OFF,systemd"
+
+# Keep CMake from running "git describe", Hand it the version instead.
+EXTRA_OECMAKE += "-DCMAKE_DISABLE_FIND_PACKAGE_Git=ON"
+export V4L2RTSPSERVER_VERSION = "${PV}"
+
+SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'v4l2rtspserver.service', '', d)}"
+# The unit streams /dev/video0 to the network; let the image opt in.
+SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
deleted file mode 100644
index 1a15a0cd0b..0000000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l2rtspserver_0.3.8.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "V4L2rtsp streaming server"
-LICENSE = "Unlicense"
-LIC_FILES_CHKSUM = "file://UNLICENSE;md5=911690f51af322440237a253d695d19f"
-
-SRC_URI = "gitsm://github.com/mpromonet/v4l2rtspserver.git;branch=master;protocol=https"
-SRCREV = "b12cf350dc573ab0ff9d1b51a21daf3c218b614e"
-
-S = "${WORKDIR}/git"
-
-inherit pkgconfig cmake
-
-DEPENDS += "live555 log4cpp"


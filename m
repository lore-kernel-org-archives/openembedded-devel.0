Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D526FE63C95
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 07:40:20 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35143.1769326810880073005
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 23:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MqiJGf70;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314f52so1923448f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769326809; x=1769931609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvBiV35hoTCCSSMKlsF3OFlWq5n/ms5++j9xrUMBJnY=;
        b=MqiJGf70gthY5nWi3IHb9kbDADkO6nahR/DA+LMy0FOCkUL3USJaVUORo8KN290Fdz
         llSWFJP2ECpkoZ3Dx/p0x0O+Dc7liGDca007lO/FNiSxjMJSMUHqjwGSzIbilaljk7qJ
         u++cGWPu2XSLmFCjkl12Bvpsb8+RQJ6kQ1RarDBt8co9NAReMmqSyrMFosBwvlgFbeUN
         hKeBUr8o5yM6l50vhFL55eFGaUEb0uM5YSKChrW4YUdKheW4W/dOtmX4uJpYOlDGXeg7
         q+CDi4sTSzomplxUV7MhlqTAGjKQtuBQ3zMPcFVP1pwBExCdJtqhXkSTjJszMmqjTPzG
         RDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769326809; x=1769931609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SvBiV35hoTCCSSMKlsF3OFlWq5n/ms5++j9xrUMBJnY=;
        b=K1jUfYbAEyohZfJjSopSiHOCgyGqGOYiTjdiqruW7tFzDg6x1x11hWUP42GCWEOFzv
         A8oRJvkjPskTkhA2zF0DxvyLEhJJJSFpPzj+XA91fn59KdO2TToGLiEABnE5Czn0CgvZ
         LooIGa+Ir/0gorRdV5w/+IZL64Q2GQAPPFbEtbbIypkU4NwnZf4fmjzqLtHWE1TXvKfD
         pawFvP8wdOIl5MWGUmBCMGPnHJS9Z0vTGAW/ny1e49nOfwdYvSzYeviTIDNir4LjQDKB
         yk74qxqKMJ7TJRvDhpL+ut6Cu0HFpInTBjVNKBrJCH8uHcJll36dBG4TWsgzFQLVyY3y
         ar+A==
X-Gm-Message-State: AOJu0Yzfy1bTbtIVgV3wm1c1+Gt2jycYCEZ+A3zOMv++51rJjcuqdhNp
	fQo25PwjU3f52dr5U0Y1pKyB9143O7Yk0uZ+3CwkRKfNkUXJxKoAhMRV2zcwng==
X-Gm-Gg: AZuq6aJ/pkpAUcYBIOM2zaBM4HrxfSqZ1/WnCotht3KMpgyTdg3KfCoVb1IFuCFDGzy
	PQC/FhujQlnfN1+c3N3zKRg+kHn4gPb/KhfzNBxveFLKLHUTbsTGYsGcXKCzQmmZNJ/p5AdVmW9
	m4Tye5HPsF3SglgiVYoqtCCoUXnDH5GepDSgOpdrb5mGVltL0L2vqIUG2Ja1l1t0x9wrkNJBQKD
	qpeNfj5mhTuKdfeXCiW3Tzg0+4LvjAkTA20xk/Avmlp+rBCZZBqHXZsbkSHZFvZU9aAPyJuiA/y
	DLEpdvhhxuHvgojvAy/T21aGKTM+CCJgRt9GPmn3OZKVctqDLKB5ygz6ikYiaUmMV04D32CSGR1
	tFoTc01INTqsU24K0Xb+VACqDy2kfOiNhNpmr2hWrjAsE7wYoSbyErCyqd2AhhJWcYdgDWKZgYF
	x6VEId/5HB
X-Received: by 2002:a05:6000:288d:b0:435:94dc:8c78 with SMTP id ffacd0b85a97d-435ca1ada73mr1485579f8f.40.1769326809171;
        Sat, 24 Jan 2026 23:40:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm20265542f8f.20.2026.01.24.23.40.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 23:40:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 5/5] gnome-desktop: upgrade 42.0 -> 42.10
Date: Sun, 25 Jan 2026 08:40:06 +0100
Message-ID: <20260125074006.244692-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125074006.244692-1-skandigraun@gmail.com>
References: <20260125074006.244692-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 07:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123836

Bug fix release.

https://gitlab.gnome.org/GNOME/gnome-desktop/-/blob/42.10/NEWS

Changelog:
Version 42.10
- Updated translations

Version 42.9
- No changes

Version 42.8
- No changes

Version 42.7
- No changes

Version 42.6
- No changes

Version 42.5
- Translation updates

Version 42.4
- No changes

Version 42.3
- No changes

Version 42.2
- Don't try to use bubblewrap inside snaps

Version 42.1
- Fix build_gtk4 option
- Translation updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-desktop_42.0.bb => gnome-desktop_42.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_42.0.bb => gnome-desktop_42.10.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.10.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.10.bb
index 6eeaed0e1f..59ec9cdbba 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.10.bb
@@ -16,7 +16,7 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 GIR_MESON_OPTION = ""
 
-SRC_URI[archive.sha256sum] = "f3caa293a5e86f6ccad18f817273db1c67061e680d79d839aa8a7528e5bb26d6"
+SRC_URI[archive.sha256sum] = "c5afee410bcf07fc7742ff74d67feb86d09ace34e9ca9743f86ce179a4fc7199"
 SRC_URI += " \
     file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
     file://0001-meson.build-Disable-libseccomp-for-all-archs.patch \


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A36CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:08:38 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.40751.1757578107935523589
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ieFwkxJh;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-622b4b14a75so808958a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757578106; x=1758182906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u1GuJWBe6zVBqIvbQiQDZ2ycQhnnrM1EU6Lk3FuAEo4=;
        b=ieFwkxJhZdcVirK7XAFcs90ZhmRaakPAdISU85c4Vn+jXWO3V6C0yK2LnLSKyixCdZ
         RqnUD/1DyKkssrewDbv4O74HZiMAO/2WAyIHo3Cuboc0x/3gHw5XZzS0Ylgyx5/pKulM
         LbLrTRwXuDgLQaVzXu21abjfVXWUxRHAHQMyXGznn7tDsi0SON+HY3yx3hOzl5leVDMJ
         MiBbTNlaQ5L49GUteOub9hdmb+lNds0O6iMpJEwrtPDvKXGtyDy7MKhNWQ5JHG47/ZJC
         VahrSQKojesyUfYdoTJlh+n59ET4T9zcgO+i5BS5+OUKsCxM+eNY3nhHnGev6Qbd9Xvy
         FA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578106; x=1758182906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1GuJWBe6zVBqIvbQiQDZ2ycQhnnrM1EU6Lk3FuAEo4=;
        b=FbrmrFhtlbGDF14gAtVbi7NAlRj2AFf6HFL+WTPLT9Rcyi4lpiXk077D6AqUZ+8rDa
         vwtXtbJ+fP5Asef/uwwmsqsSXhpW84pP48R6YCOcp3TlB23+32hSqQWDZRzHX8Gw61LK
         Ck+5S8MtIHddx4CqQZsu/P7khojVLKnLESNcM5bp7+knmVEyF2HAAyfzLLVMCfgeQwyF
         GPiAMvDRTvyu+pQqg/CO7GkdeO4SYhW7/LxMzzSQh7jFwQxOMVzj3J/1J7pH1RxteK+S
         GgbxUf/uNROwY+gjRz8X62INhM1IEXqtp7nVjpMQuAx0eWqrjgEyIAyGnDFlMz3lZHDX
         ypBQ==
X-Gm-Message-State: AOJu0YzYFMvuDcaflJZ56LLsxCTXjEP3KB4OMoJ4wc7pzCBI9Qw+AmqD
	tfjyrtbmam4NTGIa0ciANuZjNR0+jHVAhCxwQpriPC/0ji6kBH5tn9U0QUS3eA==
X-Gm-Gg: ASbGncsdX7QZEUCuwPX6cYgFJ2OFCwnWLZkm4g14kTBzpyk2TUFl5klzoBeAsgsKHZ3
	snf6kc5PAitkPuSm4KcC9BA3lpaY3ooEsAJgJ2aT8XYnPaecV/7mgBE9YNbA2I7fEk99Bs3m9Ak
	uShS+ojRTrO+LmfQ3CmlsP4b0BgcDNkZjsAGj47CKW6+GTNRXYMGZsbfoPtLkn+B405yU2gCYFT
	oU8qPK2x+zN+AqBJFqjRV0G3AYmU40NxXT00i88ZrAxnFKx3YLCHlh8+bJaiBXyKezGNuUsobf6
	KX/UQTMcSKRdWk+mlC2uqKnja2Yb4iGRVT1lez1zcSulybvT4FmgjfAYqF7/EZSkI8vLIjftBX2
	UqtTahRDBFTBJ00bBycwa77lJBVoSMkw=
X-Google-Smtp-Source: AGHT+IHGVAdBJodLlpcsJK0kSPctnmh/IpqZMRSFgqHqZUJtGubMsTRTCoBlAx9jMq+fRc2yPR5Z8A==
X-Received: by 2002:a17:906:fe4b:b0:ae3:b2b7:7f2f with SMTP id a640c23a62f3a-b04b154324bmr1795235266b.40.1757578105486;
        Thu, 11 Sep 2025 01:08:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da310sm76387166b.20.2025.09.11.01.08.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:08:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] metacity: upgrade 3.52.0 -> 3.56.0
Date: Thu, 11 Sep 2025 10:08:24 +0200
Message-ID: <20250911080824.1704259-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 08:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119356

Changelog:
3.56.0
- Use window icon for the menu button.

3.54.0
- Add basic color-scheme support.
- Updated translations.

As an oe-related change, it also solves a build failure for 32-bit targets:

| ../../metacity-3.52.0/src/core/screen.c: In function 'collect_timed_out_foreach':
| ../../metacity-3.52.0/src/core/screen.c:2431:55: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
|  2431 |   sn_startup_sequence_get_last_active_time (sequence, &tv_sec, &tv_usec);
|       |                                                       ^~~~~~~
|       |                                                       |
|       |                                                       long int *

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../metacity/{metacity_3.52.0.bb => metacity_3.56.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.52.0.bb => metacity_3.56.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb
index 32f0801706..b8b248ba3a 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.52.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "a72438ace6d5903ae79338c6098b1b35ab91c8a97c4323701d3bef1f3eeb191c"
+SRC_URI[archive.sha256sum] = "7554997104b26ff0e79a02b37a2ba189bdf4e7ccd54226f0faf4b1a59006c901"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"


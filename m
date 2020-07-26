Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.27144.1595762510226045635
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 04:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=agZODNtT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.177, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f177.google.com with SMTP id t6so1297615ljk.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmzxJxs8io1QnrZfsUalv+hP4vWTa540q3is3oLe2s4=;
        b=agZODNtTqbLxd+z8QUHsudiI51W2mkuX7oGZPQFRNlIGkzkPOrQ2QAErdxUK0T1hs9
         VvfgxgoUkB8NvloqcvuuzrLb38Sfh/50UM+MKF8ORVdOOKaAMYCa+ga0zSIulullulXE
         F8JhahjndOsGzrg73sfq1wqLY1wwK2jJzOvXUy6vE0xQl+265mCgO4FM58b5N/oFArhX
         ZTPjF+b7xlz35Sg6yXqo2cB/XTs0GT32FXH8J2ximl/564gGpJOiSmmbckL1Ri7s572W
         BVHBzwLdO27c4mnMDqqEZsNHMsPzumcTVTxu+rFeU94qPfHxAJSOr3bkss7Ee+xX/MAa
         heag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xmzxJxs8io1QnrZfsUalv+hP4vWTa540q3is3oLe2s4=;
        b=nhUyo1HMjMh7KGp5KREpNYUhDRIFqg5hrCgXnJAPZQsvT4tm5qsEa4mKjSVwozpmrP
         py/gxOtugJ/4Bv1WvggtdSh4xZ77B4NJWAp80RLRISNXoNTe1vVZEGPSajbuGV0gx3vT
         cm2I3Sd4+QR5Co9zEk27hZt8gskKdVBE4muatelhiEndXDwuhZyC5TSzWkceAQdQSuaI
         Tof7WuJ/MmUrK6zMjNfSCq3ILWHdEpkcq9BEAT2SUsxNfYv5fU7l5lb20mkUJAfZFnJE
         HxDx1MbDSw9Sr9TCQ+yvFy9aXJms8cdB3mYIX1i3m1KMOmOTilNqyXbR8eHzfO2Q/sRQ
         dQ2Q==
X-Gm-Message-State: AOAM530PTsrIZWgwFwf43V/bWKjmWzlPSjejfLdTOYnebl8XU7m/kjfi
	h2+5AdvCogqW2agBn9z1cb0ItbVIjqo=
X-Google-Smtp-Source: ABdhPJzCAavfIK6kkBr2DVJMT9elveYgrEUkjK+BWYZuY92K2zKRmysvqKFgpPyu+WVGvUXCXeeKWA==
X-Received: by 2002:a05:651c:50d:: with SMTP id o13mr3452827ljp.287.1595762507878;
        Sun, 26 Jul 2020 04:21:47 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id e24sm1981868ljg.18.2020.07.26.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:21:47 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-multimedia] opusfile: update to 0.12
Date: Sun, 26 Jul 2020 13:21:44 +0200
Message-Id: <20200726112144.4020474-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../opusfile/{opusfile_0.10.bb => opusfile_0.12.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/opusfile/{opusfile_0.10.bb => opusfile_0.12.bb} (72%)

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
similarity index 72%
rename from meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
rename to meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
index 3f6dbb8e92..c775cef5a1 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ac22b992dde6a891f8949c3e2da8576"
 
 SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
-SRC_URI[md5sum] = "ab3f7d15d766f5b36b0951ee435f9ebf"
-SRC_URI[sha256sum] = "48e03526ba87ef9cf5f1c47b5ebe3aa195bd89b912a57060c36184a6cd19412f"
+SRC_URI[md5sum] = "45e8c62f6cd413395223c82f06bfa8ec"
+SRC_URI[sha256sum] = "118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b"
 
 inherit autotools pkgconfig
-- 
2.25.1


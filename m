Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.959.1632338537606586979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 12:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cIhZ/RVZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id m26so3591116pff.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 12:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4q7Qhfr9G1dqT+ubR2SPx6HFKHTFfViAcDP/JkCy2tM=;
        b=cIhZ/RVZrXuJ8nx73lQTf/YR0xIOwo5Nbftr9FwVVsyN1omfWOcRDXw1WALYFwsbBN
         UPXyNvBPksxU9LjVmpdidt/dGgNI4o7OuQv8/8Tdx9r2yXI8YXUhRgqeXas8tNrzOmar
         EQG18DQ2vtzGIyq1IOoCK8Q4pUv6z8tplpxKx3GIRyjH7DNKK6NbTGfHtTU4OOKbGLa2
         FbxKHZchSV9m2XSnVAC3R4U71soMAms9kGN+8NVi8mP3KmD1Pv7rzQPup78EB6wVgA1V
         J8B5rNybEbdVsdTNCMwLiObpN2Eoi9xYO61rgpZH1QotNVNtpORbMCDfcHt9Y6tPzyUs
         y62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4q7Qhfr9G1dqT+ubR2SPx6HFKHTFfViAcDP/JkCy2tM=;
        b=mzMeMHZgZ3sPLO5Krf1znKfzOZ7F53X3uya+LBqzuoeaTYBR7vRtx/pKbzKiqm+2Ah
         ZDL90Oq0yIhnayDH+R2QkYoFyfy+2byKrHGjPG3Vn5xRtR8D15iAxh+nCAB85d00zLhl
         eK15N5rEo0ue7D+s5ggKnoLScXnauBfzhWJP1twE9jQ23W6WJR1WKBC61nSOhFBR9ZLd
         IAUIo+qY5yW0v8tXPRIGJ4Ju/tWyudDYMFFQGYrV5Cs1DdcVnlMF90PxAdjlvWf08Es/
         X6AZrrwzdi0xO2wmzCwEfjF+pJq/CCWKXwy30YGpNWGYr4gYn+lXcKJGoUnYs05U14u8
         xCbQ==
X-Gm-Message-State: AOAM530D5VCLLdQG8Am3JO5NA2GOScYNZG4wMoJMQmY6b9sT/zMy/q36
	POhY0k5lZkm+k2aUwB5B2Cez1mY5aawYUQ==
X-Google-Smtp-Source: ABdhPJyiM1KWTJp8G+jWAgOD0tMY/0YEY2qoYGS3rJtctg24Op3yXH4Ju6V5C+JZsOzmBxcjN37xiA==
X-Received: by 2002:a05:6a00:a10:b0:412:448c:89c7 with SMTP id p16-20020a056a000a1000b00412448c89c7mr352176pfh.83.1632338536960;
        Wed, 22 Sep 2021 12:22:16 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id y13sm3083119pjc.50.2021.09.22.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 12:22:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/39] libgnt: Inherit pkgconfig
Date: Wed, 22 Sep 2021 12:21:36 -0700
Message-Id: <20210922192213.3062719-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922192213.3062719-1-raj.khem@gmail.com>
References: <20210922192213.3062719-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb b/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
index 7c9a2cbf6b..2450d31966 100644
--- a/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
+++ b/meta-oe/recipes-support/pidgin/libgnt_2.14.1.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a1abacd0166f595a9fbe6afb1f0d5e"
 DEPENDS = "glib-2.0 ncurses libxml2 glib-2.0-native"
 
-inherit meson
+inherit meson pkgconfig
 
 # SRCREV = "0a44b1d01c41"
 # SRC_URI = "hg://keep.imfreedom.org/${BPN};module=${BPN}
-- 
2.33.0


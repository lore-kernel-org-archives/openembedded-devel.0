Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web08.251.1617899797012602472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pckBsHog;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2952590otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=pAcS1pqTAcMPJ9vGI6D6pNbXN2Rpm/RjwIMT7BNH6ew=;
        b=pckBsHogRGX5P9A/mQjoS2Xx3MrSzcfkQ39+kDsZYpBv5cv+enB72EhWlORi5AsgZ4
         dnDvHeW6Fp3taFqcftmDnBiN+lek2yLDik+Ewzm7BCAPxyygQgFvkq7OEn/dZAlCQMsk
         HKTT4mYCWFBDfbb35AbZ6nsdkk9diN/vdVVf12n5QTgEVLU0pxsn8nm5Z7dAF1Cw8hW0
         EqPzun81N7u+gZxO5eZXCJCvpB/Ueh6NCSVooZedQ8n9RWlJmpfEXYFIf7H8vSBXh298
         /PUOuxxADaRtXjRJnZZ/L9JcgvhwDfsRoHAapsaEZaZSkYt6OgqVfH/g2cUEnwV5grGp
         9a9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=pAcS1pqTAcMPJ9vGI6D6pNbXN2Rpm/RjwIMT7BNH6ew=;
        b=be18F7gOTrl3qrAmYYKDmmb7hC+BHCCLwLfRuBp8q7LDQZHI2jpYyCl5SFG0HqWSDq
         CDz/wLvtjhXZsBhLjfvNLj0Q18jcC0iSzxlUfDsuLrSzp4AldOY4z1ElK4jYWfmxDuxP
         xG7AUZNTuA89Mp/tTal4vjRgsNK+LP0m8c2Gl/Yo+LO2XiAid6QiWTfmUfpGWOaRa6B1
         oLhoE0TySeDS5W8uHenpbvrLjbb0VpfJYrAs54JOHEBlMSOXm4TdcJed5VnsGkMtcZlf
         eiYq+XoGxGN6z/xH6J9C8hpkscOm+BsD7EAt+xDHFyu23ziHBzy0wIhNJKQyuh07u5jZ
         soiA==
X-Gm-Message-State: AOAM5336Ck65lKRaBej0lUGwdB110pYRjt5aa49z61c2cg9ZXFolJP7o
	v7PGNxg0Zk9SwT3tjxaxieHh/inE/4I=
X-Google-Smtp-Source: ABdhPJyhY+HJ2jSiRz8OJpk5b5B48LWrEcHP2+XDms5IyFncg3aOzWwAca/c4H1o0YuLaekMSOtzVg==
X-Received: by 2002:a9d:6d87:: with SMTP id x7mr8438646otp.250.1617899796264;
        Thu, 08 Apr 2021 09:36:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 25/64] gnome-autoar: upgrade 0.2.4 -> 0.3.1
Date: Thu,  8 Apr 2021 09:35:32 -0700
Message-Id: <5012073635e33595a40cd51a6d8d0f6a1aadc754.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a281dd572c730a5f107b7cd524c8bfe66d366104)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{gnome-autoar_0.2.4.bb => gnome-autoar_0.3.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-autoar/{gnome-autoar_0.2.4.bb => gnome-autoar_0.3.1.bb} (66%)

diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
similarity index 66%
rename from meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
rename to meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
index afeda3e9319..5e833a91acf 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.2.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.3.1.bb
@@ -9,8 +9,8 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala
 
-SRC_URI[archive.md5sum] = "36ab263f477eeee3c95c9381766eb3c2"
-SRC_URI[archive.sha256sum] = "0a34c377f8841abbf4c29bc848b301fbd8e4e20c03d7318c777c58432033657a"
+SRC_URI[archive.md5sum] = "3149496d0189623a8e1289bbab4d8385"
+SRC_URI[archive.sha256sum] = "0e78713e6f0de339fdee16bab82753ae290fe80fa7b4ba6e3db8c1465b81d0f8"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/gnome-autoar/.libs"
-- 
2.17.1


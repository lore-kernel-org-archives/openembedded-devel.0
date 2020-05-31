Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.18195.1590941803182937052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c+pnzwu4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id nm22so3217555pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1p0PdjHZFvcvFtidXkCczQpa6CYPtxXJ5F+wPncLDvE=;
        b=c+pnzwu4PNyN0HwaEs1+mb+MVS93z8f9BPZftFpZ0tSFAAFAbHahCk76dJmgqE/h6J
         YyKOtWl0aC3oPq4D6aVXo5vcyit0w8W1BICy/A50+x7U6gIqa6jhsVSb8U3P+SMO7FPw
         712BftFYPy3oKL8mnkJhxv1XIc6NbiJw9Js+BT2TtKgxGZWmhjpODK6WIoI+djxWbz5j
         T9u//iH7nYF/YjYvWbbdtrRIba1ydM9mpdoDMG5PJzwLvGmq23ZgEX9WoxTy4MdNDqvO
         aTedCOnyCsTD8CBSbl9cbWa5ROWmTcJh5iv6WMWUkxTY1bLSNKXyjaUXyWqvtBsXWLs3
         dN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1p0PdjHZFvcvFtidXkCczQpa6CYPtxXJ5F+wPncLDvE=;
        b=gPVWvEtg4PiOQMyQpnCAfjsaVf58bMJbeTf4i0QQwyB82Yn6o+ikJFltBxUdjVJoAr
         iIKBLXPzgzNd9/vGAyrmTV1bon+9loJ1h3Nbhkx6kYOdB3fkcgQq0fK6PS9/V0jx/zXE
         v1/UJ7frA4ddnSdSet5PfVcXL1CUVfARjJ2dhBVkSYgmy3ONn9uC7NOQG4JruPLPkKps
         k1nPlbYK22wbcqt0r7m7GyzAlH9A+7DqRIrKtyoe2VLd1eJoJxVuCzECaFsk9TQZMU+5
         htSzNytmY9DrWchBmtlW2AQBpgdajXr/9RX62wSyIOoJ/PWGqRaUvAwxfGzWAzrRBHsV
         Y8wg==
X-Gm-Message-State: AOAM5335oDK+Bhn4mXc6yUQZi3xLximAaJIeZolBlaMNhekEaMuhEfZQ
	A+ircU7sjmIii6oa032xCIWD+0ks
X-Google-Smtp-Source: ABdhPJyHV026ebk+b+vj89mXcDR8cEoT00onlBwxagz9FgH1HQjjZOxrjA/n1nZ2MD57zDsCmZitRg==
X-Received: by 2002:a17:902:ac97:: with SMTP id h23mr8191263plr.64.1590941802507;
        Sun, 31 May 2020 09:16:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 14/35] jansson: upgrade 2.12 -> 2.13.1
Date: Sun, 31 May 2020 09:16:01 -0700
Message-Id: <4546f855752e65ef3bacf687ed8753d4a907c68c.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

-License-Update: Copyright year updated to 2020.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ddb9565aeb8938911cc94c04e6a94b5373af4c6b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../jansson/{jansson_2.12.bb => jansson_2.13.1.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/jansson/{jansson_2.12.bb => jansson_2.13.1.bb} (60%)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
similarity index 60%
rename from meta-oe/recipes-extended/jansson/jansson_2.12.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
index f47fe5725c..d6e56ea768 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.12.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON d
 HOMEPAGE = "http://www.digip.org/jansson/"
 BUGTRACKER = "https://github.com/akheron/jansson/issues"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fc2548c0eb83800f29330040e18b5a05"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 
 SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ed1f3a924604aae68067c214b0010ef"
-SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9"
+SRC_URI[md5sum] = "570af45b8203e95876d71fecd56cee20"
+SRC_URI[sha256sum] = "f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f"
 
 inherit autotools pkgconfig
 
-- 
2.17.1


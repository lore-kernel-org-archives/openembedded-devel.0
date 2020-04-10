Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.1917.1586556600159747685
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 15:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bcE2YMsL;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id h9so3860444wrc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gI5/7v58o+2JUqvS1UNlxSOxi2tKaCXf2D6pupwvS5A=;
        b=bcE2YMsLH84jBKPCVBnn2OSOm140vajjt2bd5m1ttC8O7pG6uA6GDFI++hjm5SanOG
         ISe7BnV5NNWgLtLg0nVJPUu03S6eP2oKvxC281uXnsuoMngkTSY+VXw+j+Gdz2b9nWeq
         VYlPB5uoTaj6Flthf/vmAckRrPVGI8yReYCMNmN+oPbX3LQkLzcs/BGMNeK79zFrz9fe
         U+JTH7HWCmA9oWQ+Qu5LTminP4xmSNptmPfhcgFBWSHz8rUXoHl9GglIYPIsEC55+zC4
         HT5eJBxEmmxTX4NVhdDlK2kVW9qBUkZCCWGn5o9wzPYEi5R9qGueEBoUSf5Crh0d67NL
         686w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gI5/7v58o+2JUqvS1UNlxSOxi2tKaCXf2D6pupwvS5A=;
        b=L9wJhdiUsoblaLWkhuw68ioLqiKTKmXbaR2ipwePu8+I8bnalC4p2nhiDHOkYqwYUv
         vCJ/3lPAE2EpxV6xMD5c4MB5kiu7v3kBEf7sObq+s+Au7gfytuRLNo8IvLRBEPW/cK1t
         pCIXncZT9Kd6uNjIWFr25Owq141P+HZKI2Pembb/DRIhgMdbrxusw4RRSbgPPd55SyZx
         jegcJsesXh2Qy3yBf6PjfDvPQWNHTi9CBcUe/zpgasekXWQdloaPJxKeFeAaKmXBlF3Y
         CTPxXIXhRJWYwh4eTDZs1YNGckpaGcaZ3EkzqRehzcbANwwouA2MmwjK3xqayf26Wsua
         joXA==
X-Gm-Message-State: AGi0PuYRbEkVxZAYbV5iY0j2VTL8HZLCl3RDv2CPgHHxIKjzL3ZIxz54
	swRjuWG7R8RCldJ3XkhAxlGH6EYko1c=
X-Google-Smtp-Source: APiQypI3QOJ+TTbDvHNTt1WCcRl37PAKsS82pmsKsJhRv0q9QgMGG9i8ryY3id7mvVqRZKKkfWJT6Q==
X-Received: by 2002:a5d:53c4:: with SMTP id a4mr6325869wrw.47.1586556598179;
        Fri, 10 Apr 2020 15:09:58 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F05DA42C8F51B0BBAC2F53F.dip0.t-ipconnect.de. [2003:f0:7f05:da42:c8f5:1b0b:bac2:f53f])
        by smtp.gmail.com with ESMTPSA id i9sm4664773wrn.25.2020.04.10.15.09.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 15:09:57 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] fluidsynth: upgrade 2.1.1 -> 2.1.2
Date: Sat, 11 Apr 2020 00:09:41 +0200
Message-Id: <20200410220945.23712-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:
* fluidsynth now exits with error when user-provided command-line arguments are out-of-range (#623)
* add verbose error logging to opensles and oboe drivers (#627)
* fix a memory leak in oboe driver (#626)
* fix a NULL dereference in the fluidsynth commandline program

[1] https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.2

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 4fb622c46..73858b020 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "3b851da6f721fcf15ec0b935eba72707bdb53d7b"
+SRCREV = "d9ad6a0725840388a48f45e38eda903a65ec1cf5"
 S = "${WORKDIR}/git"
-PV = "2.1.1"
+PV = "2.1.2"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.1


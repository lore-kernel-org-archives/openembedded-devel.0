Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7762.1793057201379799176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V8e2P0BR;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-188406bb948so2821940c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057201; x=1793662001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tACmqgBo+BLSsB2MUDc9kLqJi8DQIhxD34TCuyZMJuQ=;
        b=V8e2P0BRErSQCoR+gr+PjNpjSWO7y1tNFS6s1eeNMn3PAUO1SHd+tKnKo+Tm6kOZsa
         iQkOr4DHDDQx7DqdJw9qj9AaP6x1HLY/HG4L5x+42eznbUj3LC9LOU3mntgf3M5w/PC0
         gNZ27rayGKPqTfXvn1T1ka1V59P6mbR5lBYAtK4YN6uHMJChohzHN01eIhV3OssWcQYq
         MS2Q+zdK9tcf/zAJmfaB6Vbas67uni4G3bxSRyQQWp0NV3o8WuQKgA9KrKZv5SPzSGPF
         jmq9NVviauZ00Ju5zXDBQiovyDigMm0RUwQtPXwwtQ9HW3+6MwLJS3lJZWs0n58Uv7Fg
         mEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057201; x=1793662001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tACmqgBo+BLSsB2MUDc9kLqJi8DQIhxD34TCuyZMJuQ=;
        b=qLn37SlbTUvVwtom7iDO5uJj+2ccMf4wRhQEO703iP8hbMN+CNZCO0EDYsKkbC5UeT
         PA1ITvaYsQeF3do4DrRHuY3wv4s9Bd/Eul+Vqj7UbTmpD7tFCtI8QVgHLTKW1xpbwEot
         GfGUlZnseXjg1bYc+59lkY2SSkJ3DYfY6jD0yjUArNCFtidCW6wvWhNPHgeu5CEBHF7F
         mUyActrL1kw7cU0FxdaUfM/1ZX5u6rSNLLOp9dNlyDcgbhpibFwBoB0NWOTRWgfljLZf
         w3DXm9w0AH3tCBcVzrgvgjoRNqsqBVuVBJVQEO9OTmCOl5BeL2byEWD/GCIwMXgtr9Ja
         AIbA==
X-Gm-Message-State: AFq9FYI3DPgir1HDKxt5O3kvOU/lWcSJO5T0I4mS4Yi++E6ZzmNfQXTC
	TKMzPmyoefdeQmPMxvbHSaVTQ79KeCuAmYWHoBYm9PKgHnO+aV9izfLAC08Hmw==
X-Gm-Gg: AYBFou1XQNkmuQtO2U3lkzUkqVv9hhPAkW+x5H3D1Nyj88pjjuVLP6XfqrL5cDLC6Ql
	5zTwyZmxDUlJzXXM2noyNFPKOY3DWsGW7yZrnSFp1zBjiBYdd81lWJPrM2pVTIQymjo8M/elkll
	7z23bmh8JdOlhfRb8Cb6+EYnrNNsuhGAuxjuJDyVl82K1YZux5ZCBmnZC85joZ5P93BVzGqvDl5
	wwh713TagxHJdK9Tp7CEXHoxKRUDx9d6OMCmxvT5C3qkk/E6Umzvwzei5Swbeyi+/QhH03AcaB9
	2BmF4ygTN3UcpuccnEK8BJ6SJ2XtmcWPspZYfTFus0NYFeir7o7VI8dCEw9OuDko1eXbWwly9h8
	pTU9p8Au5ztEOcU78a+R6jw4zR919fWjkNqS8T0l0m1MVyiIEbS8Zv75La0aIjxKNs/ml1Yn4s0
	U7i11tYH48m1eDv1iQP3a32m5Rl5fSMxYBQuTeoAb5LQ8rSFBmZEUN2qv2BuS+Qbd/VbKipr8Tq
	emqyv5r7XpbS2zyliL/29HltE/36Bv9TTgu6glDl3FfbgiFhoteGXyvOSUsFo10zGnYrxwo6nrU
	H4N6qeUdcUUZskZK+HjUl5jDDg0EMB2+gg==
X-Received: by 2002:a05:7022:4387:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a1897459a7mr5596385c88.30.1793057200534;
        Mon, 26 Oct 2026 16:26:40 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 5/13] openh264: upgrade 2.6.0 -> 2.7.0
Date: Tue, 27 Oct 2026 12:26:17 +1300
Message-ID: <20261026232625.1275411-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131445
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/cisco/openh264/blob/v2.7.0/RELEASES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openh264/{openh264_2.6.0.bb => openh264_2.7.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.6.0.bb => openh264_2.7.0.bb} (86%)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.7.0.bb
similarity index 86%
rename from meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
rename to meta-multimedia/recipes-multimedia/openh264/openh264_2.7.0.bb
index b210454efd..33f6301df6 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.7.0.bb
@@ -11,9 +11,8 @@ DEPENDS = " nasm-native"
 
 inherit meson pkgconfig
 
-SRCREV = "19120fcb8f89b16126e9cfee096b2f0751554fdc"
-BRANCH = "openh264v${PV}"
-SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
+SRCREV = "1bca62311e447fd9c39fc93de2c4b96cd5ce971c"
+SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=master;tag=v${PV} \
            "
 
 COMPATIBLE_MACHINE:powerpc64le = "null"

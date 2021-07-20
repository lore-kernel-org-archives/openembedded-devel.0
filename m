Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.4209.1626761655763904666
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jul 2021 23:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A3hThlgu;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id r11so24672154wro.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jul 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+VmjAdbFAjw8/dEZYaLro1vyMPQU0p0B+rIBWu+M8CM=;
        b=A3hThlgu8ZcOs89u7Swle2gwNg2Zi3YPYjCOU47sR7e44XXG4MppCRtWaADg11muEP
         b8ON7S5Ww8lSkF7YhWaj5uX3UGUfM9CIWxnStxMB0vB+Ks/uHGTKaBwjXDOeQKW0ZQuW
         m3AxAKP7Jx7IU+0OVShqO0DUlXyXv/IZfMvfJKT9ZeOff/tuP61ggWjumsCnq5GH7Tvc
         iOGuGiKDqGdUXPhOKNhehr+txSF3OjccElVBdqZbM7202QNhxXzcKlXOEXjMZAgdBd9/
         xgj8Rcnb2hlNL4MtfpXreLSLAgdO0oanrh78ifJM5IUE3maqiXncbdxrjsssvti1MVZm
         si8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+VmjAdbFAjw8/dEZYaLro1vyMPQU0p0B+rIBWu+M8CM=;
        b=BN2F80QWXTMYKBEVeTdh4Eb0gRaggevupAYbINReXKCCueVr7npiTsTxrycMEpbtPz
         yP+lltXG38zWarcdaQV3zfEfhtqMU6jyE32EUKygskLljebcXXcpUcEC7TIbcsw2AwDO
         /R/PgDfb67LPIOTeQ0+cwQgQxhaMGm/6fHq3LvdBX8sn0cczPjp3wihdcU5SG+NNBsF7
         l35BCaFRU3EZ6sahuTsgsO6xQiPjkGTND0w8Ac0Sg7zqK6EJ7l0/EmAXSR9OC7vJ77me
         rD1fQ0+kiMnILSdS1ybOFQXiiXCOQWazwiGwCEqNDzbxisE3x9wgktYHQ9ho9XRUoH8L
         TPow==
X-Gm-Message-State: AOAM531rLY0O2vdgVXeieBgs5hQrXLKQ19Cx3n3hQcoQXX7C/8fzoOe4
	8q9pUJPY+pqx9lh/w2LmGLbSRkoFb74=
X-Google-Smtp-Source: ABdhPJzFTntzUanNHBV7gs2MKwv2sX7S1kpw6jiTJYern/XjzYULwurQQ6l0grNZxm0ItRGGBRK06A==
X-Received: by 2002:adf:ef03:: with SMTP id e3mr33496222wro.316.1626761654443;
        Mon, 19 Jul 2021 23:14:14 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f02a430b7203cd4bde6d1df.dip0.t-ipconnect.de. [2003:f0:7f02:a430:b720:3cd4:bde6:d1df])
        by smtp.gmail.com with ESMTPSA id u2sm18205922wmc.42.2021.07.19.23.14.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 23:14:13 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] jack: upgrade 1.19.18 -> 1.19.19
Date: Tue, 20 Jul 2021 08:14:04 +0200
Message-Id: <20210720061405.2255027-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720061405.2255027-1-schnitzeltony@gmail.com>
References: <20210720061405.2255027-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:

* Add jack_position_t::tick_double, and flags around it
* Add zalsa "-w" argument to wait for soundcard to be available
* Bump internal protocol version to 9 (due to struct alignment)
* Fix alignment of fields for atomic accesses
* Fix build for platforms needing __STDC_FORMAT_MACROS
* Fix compilation of documentation

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../jack/{jack_1.19.18.bb => jack_1.19.19.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.18.bb => jack_1.19.19.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
index 038e9ce11..934e994e5 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.18.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.19.bb
@@ -17,7 +17,7 @@ DEPENDS = "libsamplerate0 libsndfile1 readline"
 SRC_URI = "git://github.com/jackaudio/jack2.git \
            file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
           "
-SRCREV = "5041ab0fe7fb719efa5122386d355397289a91f0"
+SRCREV = "3e6ca6b734b69e2f5dfb85935068e15006fb5acf"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


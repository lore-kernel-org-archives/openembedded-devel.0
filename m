Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web08.30576.1607925872292819544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Dec 2020 22:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ge21mYNw;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id t8so11395570pfg.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Dec 2020 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iqvLs4ernPtvDo7uSdG68fuhdYnrciBZMSCyrp8JZI=;
        b=ge21mYNwXtgDYLkPHvRBfwu6/ojsURyzvpG23WeZE2UkEzd1H/45msAiYzeUpw5eym
         ftPAfQoOUl+O+xmwQJ27JipAHFYy/ldoxjwMfo2eheLi1JASQFTwTaVGOgw4QB59eG/p
         DJblTOqmtnlnNzDdxhDfGkdtnysf/7PGtIGTQ/nZAyG0We0IGoIeRhjG4hmYus3k7WMk
         4iuUDEo+N+cl0hY1ARPvFpvUW8yKxAOkLT/SUw7XLjir3P4h11w7bJB/1erCiw4ANCWx
         WzkMOGMyE7k/fFX/m8DyTPNGF7V3kaHvwj5LSJjJd9BiNcfMUkIvhhIp+pfd3Tkon7JN
         k0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iqvLs4ernPtvDo7uSdG68fuhdYnrciBZMSCyrp8JZI=;
        b=E399YSAeFp4XiK+KWaEC59Of2Wsh3wwwk/bgd9tISZZs4DQHnoYl6e1/YQHlfLbc82
         BtR0dMsIF8TShKofLBoGHA8WEdqZE+UGxXi12lqmHQJmbq6k10lDS/pex/NP2ZacMIwS
         6hBlp0OEwwMb9gsZNGhFbKGKxW1E+AD7KvRj/4cKI92dc7J6gGtuM0QimjpUNBCV7KMU
         262PW0C+N2EtBDkB1QZELN24GDzvfdM7PdRG8AgPxH02QDm4mphnTtTy4nsOv4wGtCNo
         SYntfPmowyDRFBJEy02S4MPrDOAly2XSDGCmJE2/WvBwXWE/UZpygfnXT5o2kwM9Mf2B
         5KgA==
X-Gm-Message-State: AOAM533SrsI3V8L7yWfD/5kRmoVilw7F0KD7i5wq/teYY8g8YXvgXJVZ
	v1m2pmaVOZSMAvAhItZvwALmvODAi4UNiw==
X-Google-Smtp-Source: ABdhPJw/o/Bc65U6GA0TnnHWM2IA5o/6E9+LzFULatKxL9fY29PS5NNxfp6YskUShT6yJwDh/PdFHg==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr22667151pgj.325.1607925871547;
        Sun, 13 Dec 2020 22:04:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::64a3])
        by smtp.gmail.com with ESMTPSA id e29sm18071084pfj.174.2020.12.13.22.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 22:04:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Roland Hieber <rhi@pengutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] openct: remove lines that resulted in a no-op
Date: Sun, 13 Dec 2020 22:04:26 -0800
Message-Id: <20201214060428.2133-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roland Hieber <rhi@pengutronix.de>

Also remove /run/openct/status from FILES_${PN}, which isn't being
created at all by the recipe – even openct's configure script references
it as /var/run/openct/.

Fixes: 387824f1763c573fd05c (2016-02-28, "openct: Fix rootfs creation errors")
Fixes: 8e61ff98e9fd83aad1a5 (2019-11-21, "openct: merge do_install and do_install_append")
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index 1514c7a958..f647786e2b 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -46,7 +46,6 @@ FILES_${PN} += " \
     ${nonarch_base_libdir}/udev \
     ${libdir}/openct-ifd.so \
     ${libdir}/pcsc \
-    /run/openct/status \
 "
 
 FILES_${PN}-dbg += " \
@@ -79,10 +78,4 @@ do_install () {
     so=$(find ${D} -name \*.so | sed "s|^${D}||")
     sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
     install -Dpm 644 etc/reader.conf ${D}/etc/reader.conf.d/openct.conf
-
-    install -dm 755 ${D}${localstatedir}/run/openct
-    touch ${D}${localstatedir}/run/openct/status
-    chmod 644 ${D}${localstatedir}/run/openct/status
-
-    rm -r ${D}/${localstatedir}/run
 }
-- 
2.29.2


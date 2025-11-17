Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AAACEBF93
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:57:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5997.1763373427612669210
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:57:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDL68EYq;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so6804158a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763373426; x=1763978226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Friba4NOXSjw6JqNm5dRJ78TO51z9N9oe/26cahpAQc=;
        b=GDL68EYqPXmfPcIuBqWZFqQwoNSVyilEuIFU6NDKYY0O1bjJOJmXVUsahyEaW5nUtv
         flzAiawdfgLQpTQ1dYk+EfQbqM5eJYwtaSJOG2c3KDsnAgSeUXJwhTnsOTIuWXIGRx/9
         hZ9uWue3P4pPEf9hKnbuTLil1mebSLpAFnhNJWEeGOzlHv2YmTsjZe1kN8P2w/6rcrvL
         Cn7R5X8eqAsJD7dgyTD6LDSw/cCxGXn0k0ovXaSHLZdhXVJ7m6WksTArr3Eo1lqF1QIx
         Tkv299tHDQ2GkjNB+xQyDjrEPIG/lj2vdA9jM7PAwoa8d70sT+qbpkE9EAH8Y0cfdavM
         EYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373426; x=1763978226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Friba4NOXSjw6JqNm5dRJ78TO51z9N9oe/26cahpAQc=;
        b=uuQ5k1SowmIHiOW8MpT+HEG1HMUvEpepXpzHuybLnVOUAxAgZkaihwrK5NhSmA8Qlv
         5m568HcoPK9jOV9TKOI2G5qBI7k/PiOSAHAKIFkBBm9T010aTlLW6JCuiBkEovsl9MNn
         8ZJYL0oeM/jMrBXgTjQvICfRihMzLEKMh9zspz9fGKnN6bJp+lK384CFQFlBLkmNPzSd
         RvYMsYmfXu2Bb6QG+mBVKMZPzyEldjzOC2LjSK9e8n+Ax+hgzAynAFZ1jM78QIh/cOYA
         qy3wAipb+cQSo41A+p+0bpAh057aUqJ9vWUNRF1FoC1KSJ8SlQbjMe2k9PVcIAGKi+9C
         /4vQ==
X-Gm-Message-State: AOJu0YwJ4tnPzWBsdschW86OBkgf7FG2JrCXlZONpshGtajzAdhNSuTY
	GuI9haZqmcMVcUd2/RnctAkxEKNLYdXIiMkM7crPq98YCODmd988YZ4gmtVIgg==
X-Gm-Gg: ASbGnculAYVL0hdOfr8YsDiaJitYcW4mOkfJnPMpGoKGw4+/pcJoj8wM8vU3s/rHCax
	nMLyIszCPMMq7sHYnEo9yt05MkiAm1XonACfWU4owRi5GYG0CI28BAUTHPCQxBxHLjJEfsBjTi+
	rNGCVQrZmEiekx8dQPxE93hSHFZnn9h57Ev2Vlp9zWVOhPwar/2n66iyznKHsApWTEWuKprq3yJ
	lqNg9Rq1YQdzyeViRtt/HZu/5SBxBqZkN9XmdTI7lA99HrXwM6PSaSUEShFYvcPpEcpy9f4OzYL
	Q4qqpjcut8rtVWnV7ma7ki+eIT10TnbYM+xKDP/xU7FrXELjcvY8ssEGvS0k+t33LdmhfAwpDj8
	TCB/CRO9qc7E+CGyFXj7Zwcvic/LYcAv4KPctpD3lRxkO89m1Az4DddYvueOJHTozed7XYIPI+M
	31n4x8/SS/mLVw4Q==
X-Google-Smtp-Source: AGHT+IFJEelflYdznSHjdn1yuvEN64tOqT57sK3gijGkzLpzs9Vftq8daJKMGfVTZaRfqi/X48A+rg==
X-Received: by 2002:a05:6402:2792:b0:643:129f:9d8e with SMTP id 4fb4d7f45d1cf-64350e0468bmr11018892a12.8.1763373425665;
        Mon, 17 Nov 2025 01:57:05 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1db6sm9830918a12.26.2025.11.17.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:57:05 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][meta-oe][PATCH 2/5] libwebsockets: Fix reference to TMPDIR
Date: Mon, 17 Nov 2025 10:56:56 +0100
Message-ID: <20251117095659.937489-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251117095659.937489-1-martin.jansa@gmail.com>
References: <20251117095659.937489-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121772

From: Khem Raj <raj.khem@gmail.com>

.cmake files encoded absolute paths, fixed thusly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../libwebsockets/libwebsockets_4.2.2.bb                  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index 24b9e9a071..22bf5f1145 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -30,6 +30,14 @@ EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
 "
 
+do_install:append() {
+    sed -i -e 's|${STAGING_LIBDIR}/libcrypto.so|crypto|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/libssl.so|ssl|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake
+    sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets/LibwebsocketsTargets.cmake \
+                                       ${D}${libdir}/cmake/libwebsockets/libwebsockets-config.cmake
+}
+
 PACKAGES =+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evlib-ev"
 
 FILES:${PN}-testapps += "${datadir}/libwebsockets-test-server/* ${bindir}/libwebsockets-test-*"


Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11776.1795762883892881028
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HKSCbPMl;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so1572385c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762883; x=1796367683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3txZJq2OAgQcUYm5cntoEM2HMqcGqt8QS0KhwFqJmTo=;
        b=HKSCbPMl5KyutX2H49FM5wcgiRnLF3JEvx5K9HN+m7WOkrvJGjGxwV2dmiTIOzyg3z
         Su8N6ggaBk/x08VPWqACjcfW8rIMOpBtPzKKhxQ9bL+A0NpeXq0UtR0dv4jRv1roF1Fu
         my+0qE00n/GlYT0kVpVwYnYyhgIenb15wZPT/GwymkTLzo68Z16Vxi6Zl7nXmEtA+agC
         /I9ut/n64w6k2bYdyAMetXg02D27cLzrg2a9MW968MQgT0LJLbZdl+GqgMimZHHFgdwC
         dA1yv804lTTvU0jI7d+sGIu90vFIS3mtaPZW9bpWm58OgNZ6yWcOkqIRaEMgnM1A/iVC
         CkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762883; x=1796367683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3txZJq2OAgQcUYm5cntoEM2HMqcGqt8QS0KhwFqJmTo=;
        b=AXj2wbFazlWnVI+evvad3TxEvWpRw9DPGROgPOOjNGCSf7UZ2Bguh4lezNAvv8FkFF
         e2hRehaykFinDk8aPtoYqtOVH254hiMpPX2ksXsLFFL7BtV2KW6XyZWL5Mq7qIxp/Ogh
         Qaq7GV8TL4ZtTipADBDU4vvSi9Cbwa56o990nsHeU5H+i7gW055AQTGd9ofVyU4j17m+
         r/p3DqAVW90WkVWNOcTAbWxCUuErHMbGVqcZJQj8IpsyDoEUY3YosWnJetvh8QpVzIxr
         mTLWdIp4krEIu7f3apHlRZTCgx2C8Y9uo48Jot1e0N0ns8oMhI7JIxTr84O3hWna1Wjl
         1Pcg==
X-Gm-Message-State: APuU4Z/eXEj2ZGoo1tJuVIiBan8UQr6JE6UxZMrz6talLCqYlNClNPbE
	CVIP692RAMeROvlkZNkVeP6CEOfT/cCYYYqyQTb2FRwR9NAXjMr9sUX8yojoHfgy
X-Gm-Gg: AZFdTZcqhoUA20qpVPEsRlWFu5JqAdlZHy6Yl59x6Nl2b7NBtLRd+tApGmEbHp7Liqd
	XSVwiVMyXFO6/cXAkiFIfUYJXNuChSd74+9MVOF6wkt9witIQhTZ2V8KBx3oVj1z81f5Y08TUJs
	L7J1WeCKhG9mJwqBDsEyTb0u1vr3PMfPwVLYBq+VrvhPnK9+SXtCyRmo29QyINHaJ7pfMT3Va3H
	1lUsan8dP7YwQgJNdift/b838u6RQgLY7Qe6sPrQE2j1iolHWOoEaMOgAKItvnRlsqqCKsOUjz2
	J0ct4dcDCP6OyORRPUNKuoAxO3kcGX0jtcphoaZMeAZimTv2wtiiz0zqhoSa5p1slWq1YkusFsB
	xnNDav2GneBKDwweipcg9bHk73MwoZu7MrVcAWNaxMb3msz8OyshjpJ5klZa+v4LAfTTDCBO2Fo
	xEP6L7Ua0T7vG7t0exJKV6FACAAAaxd5urM+q3tinkSuLwA/ZFdkP/qDT6O270Bl/WZolGJYTNb
	p+s+2iookNaAkBV9mPA1uP+nvHP55dgg3o66178u2TKd+LSKGCvCTrt4aeUIzLbmnZzL/IoJXlz
	sGqPpdAkHSRrYQ9C/dMl8sxWCe4KFUdeHP2RKWTk9yGP/3WGG8XJhqSIpw6I/OXB7+gknltQjoR
	2oc2TU3btudo5EtEQgocvS5vwW4e+g4AEVl7SSvppEdPzZNXgnha++3C7imy05c1QWtiB8hXTld
	Pm5IkdgYqkapdj0RJx5ayVX6oaOKuqaXg3XML48yGryI3nIb0jw8dVdmg0UNA6Tr6YTI30wsnfZ
	SZJMQuUhnIDnjmOvI33oZcWCKcdCBNHJ+sOUac2g5MeH4I/qKthCD6aPJ+yFv0ChHf/3rRpvWfD
	FhCutw==
X-Received: by 2002:a05:7022:23aa:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-1b5568d73acmr28029130c88.24.1795762883169;
        Thu, 26 Nov 2026 23:01:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 07/14] alsa-equal: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:05 -0800
Message-ID: <20261127070112.2273685-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133312
Content-Type: text/plain; charset="utf-8"

The Launchpad +files URL is not a directory listing, so the check
found nothing. The original upstream site is gone; check the Debian
pool, which carries the same orig tarball.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/alsa-equal/alsa-equal_0.6.bb            | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
index 92f7270972..7d90362939 100644
--- a/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
+++ b/meta-multimedia/recipes-multimedia/alsa-equal/alsa-equal_0.6.bb
@@ -15,6 +15,9 @@ SRC_URI = " \
 SRC_URI[md5sum] = "d2edc7710c72cbf3ab297c414e35ebda"
 SRC_URI[sha256sum] = "916e7d152added24617efc350142438a46099efe062bd8781d36dbf10b4e6ff0"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/alsaequal/"
+UPSTREAM_CHECK_REGEX = "alsaequal_(?P<pver>\d+(\.\d+)+)\.orig\.tar"
+
 S = "${UNPACKDIR}/alsaequal"
 
 EXTRA_OEMAKE = " \

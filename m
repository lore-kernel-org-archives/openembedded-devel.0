Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36078.1793161573248301002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NFnwIHg1;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso318168a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161573; x=1793766373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzwb18IX82J2jZjACC1WDiXNaFJqOJrGuwWoGPsrXa8=;
        b=NFnwIHg1A8V3+jf9cH5jwRY9VbIPbhAh/bjB316UEDAnw/JIMZdrctrUo9X4T/SaZB
         8NPVybro9tcuLFYT29D81DQB7Wm6XCnJ0UrLeRpUOvfq2SS92jvv4BV5fkch5UGLXcFf
         OWYGAi4d+WVplet1E195/RpbJ110qs2GNASh0lNrmpa6Wk/Uo7kdoVST8i/bswoqXQZy
         VMzQUVIqpSqwGaCRtkkg3GpUdvZxMK89KCgddN5LTu1/w+eYYJo9dginAJRLUSvWptPj
         Hb/3SI13vsgYye1oIbeKGGkYKwv9ylYCgcYy81hGoZeuSRorc8MZFT0cP6XyHuiAeJEq
         Rq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161573; x=1793766373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzwb18IX82J2jZjACC1WDiXNaFJqOJrGuwWoGPsrXa8=;
        b=EmYsqjh900pEda5pWVlxiW/aNzWu0CcKl51suC5g3OlQkaRQw7VIGFI2DmTfYD/Fap
         4DkT9jeRbiJsfHfX9mHbKwGCMFcbJcBHaDeiDeqwIVQuO6Py8d99LQdvkIx/AwmqQD/l
         TcF82gjmSiCc4W9S89kLeeuC3ciMrB70jLbuWoPliWiklnORv9g6hoQn3uXAZfNYmFvq
         06+pDYNd8TalMDCaKPJnFgpiXwLL7HKcyV0XaTd+SKfrq+NbB7SJytwz0Zh47Y+SBbX2
         DhUGwth6LTLU87PAVhPBeNKmjGYdNA7wQ4xjw5OehQoyFNTV60mIskOY4aa0kY9JpSw3
         JLow==
X-Gm-Message-State: AFq9FYJwurWecmCqFtkYsXudtxQo7WQYZ7Tit1YmVSrJLx7bsYKKfHgo
	NCWT3MZhn8Rs2ZsvdUTERrokFvQ0jTQGSzVDoGwTPB52f7rtejHqsRAja8/SPA==
X-Gm-Gg: AYBFou1NMtklsn8MH1OuNecpKEFXmMN02NEL99Jd0LRFWZIYs+uvJL1YKUbBwdQCf/8
	cyUnpkQqxXFhRfti1xIQlx9EpdVwa05wgHDqvhF3K/VuZox85timCOyS00a6UNbFHc0Qny9UHvB
	XrmUuIVcCKRyOkZtg7CX0lo1YEBfiNxSnlTM0L1zSotKEhZ50t/rSHMEmt75nnLEPxB3I789W3z
	Uoj1t+ltSGkU7sjub6gIFoBVilbkWQv+FbMMt/n0WfUNLmLVe01iL5x+SYSTh57rWjWFNwTZsAe
	rc6zflsuBaspE4jZFx2ORn9U9LQq8/KsHFNEDvaZwnaJSvA2+IXpWlA21Gs2dARFpXZEIa5iHCr
	PeFQD2IaqJeJKQz9LyVT+gr5haA8XjOZGNAKAMiVOLnWQr2uz66Tx5cvyyNAeU2DB/qleffI6Qj
	SRZ+Pm9AGYaqGXq2PcUhLM215xp/3qxHlDCRcJSU8QoENnXyT44vMwWnO1NkZ42NHEjjW5cqTaj
	sE9xhPt1MtuEXhGG523NOxAPdjH6lzNQhxXMovocSpI4ZpUmuWBNW6XnQeKQqTfkYvLyp+6CHgi
	4NrqjLCJi9t+wS5CbSAcO3AaDyvRgIs1X7cy4RkwMKL/cRoy9vdLG5bBtsnllRiwqwncdEffAhf
	hxmvmZ/A=
X-Received: by 2002:a17:90b:3d90:b0:3ab:be66:ddb6 with SMTP id 98e67ed59e1d1-3ae580ae5edmr757114a91.20.1793161572632;
        Tue, 27 Oct 2026 21:26:12 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 50/60] ntpsec: upgrade 1.2.5 -> 1.2.6
Date: Wed, 28 Oct 2026 17:23:48 +1300
Message-ID: <a252864b768ffc29bc192910df1d0ed5673e7aee.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131602
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_6/NEWS.adoc?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b730ef39a1ee020404c54922e1467403c1533a25)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.5.bb => ntpsec_1.2.6.bb} (98%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
similarity index 98%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
index 26348f7c4b..832619edc4 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "6fb191cddaf607e7754b1f6915a1a61dc4018b3e4eef3d2ffacec961c9682949"
+SRC_URI[sha256sum] = "8023beb9a0c86a93f0bf94d43fd388c71a6fa54d80bcbd747d899915191bb592"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 

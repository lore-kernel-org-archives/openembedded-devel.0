Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11777.1795762885898509576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0B2UIfuA;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso10940267c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762885; x=1796367685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1Xz6VoqXf1LqVbPgktFOTIAMHSYRQ5XSzb+GKlaAAk=;
        b=0B2UIfuA0XJUewxLD6bHNGK2jkjIBNTDU7QF7kA4n6JO953h0flhrIm2Xa9ylvz56A
         VVAxdKQulaFr/qcXDsL6uPH/4I3QLBuMN96aDHNzBQpGNr2HmIQfX0Uwa0xkIa05YE1q
         hM8grlH5oxoAnql683fzOU5sE1pU5fKXNBC8eAlqhhAIKsC+6DQuP5dtEOdNijpGcuOU
         I95wm250VIdsLZtawNnfs/Yq6g82CyUbwQH+NFjR74Dyyq8ReuuGefJYuoe9eDFlWWMM
         JJk6hHIH0PZ6YPIgmUZYL21osirtyM3pZtgMPl9Lg3r55l0PIxCZTWucazkWP/BzrNDY
         e9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762885; x=1796367685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1Xz6VoqXf1LqVbPgktFOTIAMHSYRQ5XSzb+GKlaAAk=;
        b=cP0yTeMbnX5Iv+Mvzssa5+4GudlDz/juyMVX9r277J+kpD0dty/iKcE9qEZV/XPKNf
         xkVEw9Y/aqJa4z8wqff1oYL4F6zT0DsIqRd7aZbHr6JIKqvei6rv6XRjRl9LJXT4sEim
         zJVgdM8e0YFgAH0IpQXlexWWhLlDdUBmHoO2Nc/y4B8eo4wvsWb4B397XivBLZt/E6mV
         7KcX42FQHW8YKINWt1fxkpAzaU+qgujTO6LxbrUURqI/yqtoGWlw0DXh6QTGd3XrJgC+
         Asstzfkl7TFgUxPv7pPAfAVUSs6oFjH63q5WZPZfJmB8Dlo66y8Q+Sv7f5+ZSiy/FfcY
         ITZw==
X-Gm-Message-State: APuU4Z9QnwwIqIkGGDbG5AWFeU7pgj55eRCuWFxAHM+VsDV98gRQofek
	ouWT3Y+5YjNgnVv48TF/BTCORdzdgqgKioogKyejwLOYoqt/1/v8/jLwzz3k1/jb
X-Gm-Gg: AZFdTZck//k9WGFFNZjaYm7q04B4SvqvPS9Xgm7jFYNeSt8rELPr7ZZgbpGYQi5M+8J
	38rPggkM7tAl6UIkuDxKr9bzb6YXQVupROwWyQlbUQhHmy7zcQ3IRCLNMqsFjQbHRU+iREcpLLb
	innPb3DGvDFOUlU6xLSH1H3h9jBtVygUwCGF0kli0cT3QvxMrre2EqB86j3qlOEEqeDsVPHDene
	PPqaeXTOybAxcxTP5ip5EX8vShcwtL8lNDkqUMzXfQu7Qo39XvICXGG5vP4DEq0dOgGD9XSUkOx
	oiJXu+GcWTwwwxzDMjIkUpjFJq+WE55z6LqLs08INntgNlmB/4HeuO4xFCaWf/IMq28NZm4ZcFq
	4kx70d0bkH2yrShUz4OLhtTes/kUfuCfDMM8OZjURtMq3WJA3725ueevYlaLSK/SaF7D8UlCpRv
	pJqo4Sruo2AJYzsdcZQx6ti51eA1glX2RcXh+aQDMduheSOZCk9WizJoKCPsXpHeIbX84b3wj4O
	SqXEo/MN6SiQPKoiLe39hHznjfvt3n5AhapyWOdlpPrHqDh7eU3o0D8/hhjJOaMJusQ4csyX1R+
	bUbOItiZ7smIyXJznz61wmdvB8GR2UuWJSA+vu7jJarEKwg7XQ0U8jBrNeR93fI+bfjxFQ5jCoo
	cSbMCu+H0uRxy3fn2NbzXesNp+eFggJm1tUTnE3KSbsDF8GPxWt+VBdxBYypJbBt6edlMHjgUmR
	M8FJ6KOw+0eupzxCdVTovAEhDlJaJZMRJQ1njMqJPYAeMXRdxcdkN9AhSsKHxvd6HygQW5I3olm
	SASRtW2wDUoG1oYQbEep9zNhNrmsvwDxj/etnHxY3jAJSHbp8Z6IhJSIJSbO600dZWTxPVyKspH
	mFT0rw==
X-Received: by 2002:a05:7022:4099:b0:1b2:3e9b:3dcd with SMTP id a92af1059eb24-1b5568b2e59mr22207507c88.10.1795762885182;
        Thu, 26 Nov 2026 23:01:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 09/14] caps: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:07 -0800
Message-ID: <20261127070112.2273685-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133314
Content-Type: text/plain; charset="utf-8"

quitte.de/dsp/ has no directory listing, so the check found
nothing. Check the project page, which links the current tarball.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
index 964d18a5de..fa5318343b 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.26.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://quitte.de/dsp/${BPN}_${PV}.tar.bz2 \
 SRC_URI[md5sum] = "36b30c7c7db2d2bc5f4f54077e97b5ee"
 SRC_URI[sha256sum] = "e7496c5bce05abebe3dcb635926153bbb58a9337a6e423f048d3b61d8a4f98c9"
 
+UPSTREAM_CHECK_URI = "http://quitte.de/dsp/caps.html"
+UPSTREAM_CHECK_REGEX = "caps_(?P<pver>\d+(\.\d+)+)\.tar"
+
 EXTRA_OEMAKE = " \
     CC='${CXX}' \
     CFLAGS='${CFLAGS} -ffast-math -funroll-loops -fPIC -DPIC' \

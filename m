Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34314.1794851694849418694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I05Y7xr/;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36dbde64409so5473236eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851694; x=1795456494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMsb5hcrCm3wGWcWBJxsV7phBpnWk5/4rk2gOUEGdwA=;
        b=I05Y7xr/87Gmv/4LKLxG+LzYjgV9or40gn/yXjvTyx0wXNJF6OHF6/biciYN4Gucy5
         5eLHm8OspXwVrsLuMrbyUKKcp0t3u2EWu1sVXKq/ykjXkxI5R4jKZri5VQvp6jwXmpXR
         24bm2H2jpqI1PqGXt/cb+ig2hhebNj2k+qv2lKkcs6VDuubJLpGpPnJ9LtCriBtXKKg0
         q0wANLOjMejoGKVcSDTOyxqDmr68tUbK+EP82fH7EdIQ1xbIxwllgyaLbg9GgKdnMgua
         eZxc0yTeD4uOhgDtxduqEn7wOaL1ZRP6qHEQaDiFbnPMfN6YU3ZIrKTaps2kaOyqzwl5
         UYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851694; x=1795456494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMsb5hcrCm3wGWcWBJxsV7phBpnWk5/4rk2gOUEGdwA=;
        b=OlTFoA+Ikf3fd5uPAhzjI7v2w0oqXelQKd3g5I+X2YDw0rLCmvB1k0UsVkHOI7vem/
         4KopOED5oQqObvo5eIeM7UGka+Sq7OvqcH0wkWQ885b3oBU0Hb9WB2kT+kPGkcGW9IKe
         nF7hiQwqCfs5e/U50dP0sqdD+EaroDqhpseoSX0ivqOTQkYlqnqEwVNwY+0Az1Xf16/U
         oQ47XwdknSAmZc0tC83XV0gG2kkUCTDwNUsWj8dq0Ia7uBJSyY0KmZHJiSJ1iItV2WDi
         G1nrCgGHXB+FXkP/KraHZIFRvuMAhBkfZ1/w+Bo00dik4Cxra3a6bvmit8y07pSqTUYl
         KgFA==
X-Gm-Message-State: APuU4Z/vR3+/56gA6e7cvmPdPoD8DHyR1i69fznUg4gVWZjRQ8NZzxti
	VW1DQB/c+jzHQSjY2fe8wZLhIH9Ck5QBwAO7JkLwEgQMDEqFtnnLvVC7GAwHE9MJ
X-Gm-Gg: AYBFou1IlHddIppHjC5Jej2vfX23kFLQLcaFi2ECw/gFNNx5mUUoZf98C6SfaxZmSXp
	nXvat1QYqHB9rprZUIJhjQNjxtdfr02OnqhblxSXfLt0MoPQNEEVD73Ne5o6Xp85QAdhBHXz5W7
	+Mb+ZsI9b3SmKHjavF0Isr5e7ViPRqP3JoCVCJ2Xa6DDRr+qhl6nJkSITmnkG7M5+cMR/c1ghw6
	s5aYuyO6MWY8Yi9yS9fufkTJfgCwURPwlba78XynWB8meDhbKlFO1gjsMiq30B+45l7+wCg2SIg
	hScukPER12CLAOdPNWuF2GR9ivgAzzXPz6E4RDLXJp+qahHLwa5nYn0hkkWTmtm6c/XvbqhKiIk
	JQYGYW6qBDLWTQJGVhMWwsyYFOs88ZIvZgmVrAusXO4By4oCXvBrXtrBPfGuRLRA2uHIlgaTCvi
	B0gzBDqaBB3urLPXQFm7cgQuu9wiOE0CEG2YjmJrEOxfAIJDeAvVKFzAvQN3Ayw7+o9Y2b4oo7Y
	m8iWsCfv59LWJS5n14xV5YvlpHu4WK3YACHt1CCl/wr3bMzled9e3KgiwOsS6wlYmfFXWOyCXuh
	EI3FT6vTMxKIMl20aK6MKhD08cb5FxFqsq63pi2khyvMHy8M3cTlXrGp3ieb7dN1GSMtfwEXZ1i
	ezc5Y8ldGHH4QS+HgybCkImCff6jNaT4uP8UsmzvpMwuSzY8ti6eEISShg2tMha2x/+TTuPp/w3
	17CUrvQpi9VBM1Kdtb+hNDdRo0+s4pw5fKbT+lfPucq5T+tm/euYHdOefFPsNa8qoCwdEWkPoim
	RhBZ3Cz0dD6QadtFsDaxYYnhSTDR50E00VlK9hzWP0jcFLzHA7OVirJAlJY/Uih+RbnlJzfiDPj
	nrrvkzViRTlAE+jrVknOGsigjXs=
X-Received: by 2002:a05:7301:782:b0:376:bb3d:5af4 with SMTP id 5a478bee46e88-37965f9ca89mr9654737eec.10.1794851694039;
        Mon, 16 Nov 2026 09:54:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 036/105] python3-google-api-python-client: upgrade 2.136.0 -> 2.202.0
Date: Mon, 16 Nov 2026 09:52:48 -0800
Message-ID: <20261116175359.342679-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132492
Content-Type: text/plain; charset="utf-8"

Changes:
- BREAKING: drop support for Python 3.7-3.9 (2.199.0); add Python 3.13,
  3.14 and 3.15 support.
- Validate module, class and filename during MediaUpload
  deserialization (2.200.0; hardening against unsafe loading).
- Auto-enable mTLS when supported certificates are detected; read
  apiVersion from discovery artifacts; import urllib.parse explicitly.
- Fix installation of pre-release dependency versions; drop universal
  wheel setup.cfg config.
- Regenerated discovery documents for many Google APIs (new services
  and methods).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ..._2.136.0.bb => python3-google-api-python-client_2.202.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.136.0.bb => python3-google-api-python-client_2.202.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.202.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.202.0.bb
index 9dfb2d67dd..b105d29783 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.136.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.202.0.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "161c722c8864e7ed39393e2b7eea76ef4e1c933a6a59f9d7c70409b6635f225d"
+SRC_URI[sha256sum] = "ae126c8e91f43c331e23dbd83bc4a8075699dd48089cebc7295f6ab2f5850fc5"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE_SDIST = "google-api-python-client"
 
 RDEPENDS:${PN} += "\
     python3-logging \

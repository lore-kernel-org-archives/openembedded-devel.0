Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8053.1795739673735096258
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qiuuy5v4;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386bd881d39so7949396eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739673; x=1796344473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lIyyP66I9t4rC/Qby0WdO8YzYNMn/56bn6CpDKZDPw=;
        b=qiuuy5v4l//pY94xm8cy9G6DAVzEDM+iTBDsdo+6IoM6996F9r6Kwa7ZMPPNML1ZYf
         rRCde7GrbDlFty9b+9Nrdy50cLaS4DBaa5cSj+9IGs95mSb9cgtXv9A03loFPMp+V8Sg
         52HYqk1caz4DVX3PZdlCKX6jHyo+ilZ+Nuh+3K7f5U33FLkYibzGMblR24bRLrvORjVb
         nxBs4Wa6kELTPOPe2ovPEXlOqd05YPkZC5XP7f2KUdRsoz7KjroVHADfb+M5eeZBlnbL
         M/BIeuB/hNIq7CJR1W0/A8xYCrsF9FvpyxjYandfix19d14fr0qr/oguHdAieB92c6BP
         pKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739673; x=1796344473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lIyyP66I9t4rC/Qby0WdO8YzYNMn/56bn6CpDKZDPw=;
        b=DjWK0gOkx6e8YqcklY+A4dGarBzlEZ7G7xNQTcK8eA+CahvljWI0i4kVuDlCpaO/Un
         EYgobqMjNXCk8iCkLR98jBvxX4JU69wQgYIx8ON61H7xnvKLdbwMJKgT8GhuiYFwLdSm
         AwenVEZEESsn8TlkZ6j/KPAV/1jJa7uOLLmsfre4smlT2c4JQaU805Jo+Y0zN8Jscrrb
         0F65JHc7rOh4b9C5O6bC26ehCBwjqniX4zWq/1u3yysiSppLPzyEOJ6Jm+NXs2U1Tz7s
         Fp0dkJUXRH5kVpxjk+64aXTzydLsp5VVURDM9pkdwuBhKdHotws3DJ1jImAC83FVfcU9
         W87Q==
X-Gm-Message-State: APuU4Z8Rvd5kCR7Q13lQQSkYIQ5rwtsz/+dbywmhzPAjQKYiTNDXl4Be
	kPmxE1D7LOIcxxwStAwMoIRZu5QFebB3j+U/91z3UxI5J/dtfblUSQMOqOQGzCVI
X-Gm-Gg: AZFdTZcOKWttHcXmqt5xXWOyRX8sfxkwOofPg1McjCZWorEXVIWwleo8/asrT1Tq5T8
	ppAFA1OOo65ULh19ebScwKMub4oGITF49W5qI3b5+zAd51qUhhqueQdtrp8PW9SM4TLvL3oZuKH
	b0DvK0REzI3vy9OnBOBWPCc9d6oqtEkfAv/GxqZM/r+N5Vosr7DM6fUVbKlIek1vOsMO4uG+2S1
	VEx3/3B9D8cpdGCpCHWfy9x6xoeuFtxKIFqC2tldNnnkKOZhkOywxye9cPDNp3I5aMROjG/Pq30
	z4XjBtAE86OW27JxHsuZXyaqhEP7Xoep9Mmwv2h5GA1nEh/4KZRzOjQhaNc0SLWMpzLh2df62uL
	+tBvvFwAzeeHUKEShDqL2LOKLHHFGLd4liNq+GcTFrfYNNoMaq+rH3QZonZI67qO+JJdc7K46jl
	st22yHfqTEVgk67LPv4/3WrFFVrjrJULb8+5gIydlbXDzSLo0OE+kJ9uEVKXrg8ZA4aSSqKBhg6
	utbSbucDDze2cjR5tq6cxxXGSVEMruvZimYyxLnWbhnMEpus8a60u0yEoqjSzeVLh+2JDJRlUy3
	HwqCIUwlMn3j+9JcQiN6mk0clRkCyePzYIkC122tjRrFVxMI6cRjvhoZU+7YajYQhJXCDpM1fd/
	4Si7BqFyNXrxRRWx6SmEZSsZXSGkkOB/fSGWMFMXnMGv3nxzgW90TJEpv+80MgfJK/QRW6/SbbX
	8nHH0lMBhitmccketNd+WZ4otZXYeSMAg+i1tXUoVqkWi0TttJUtqO5FValPep7xQ9foueR+JN2
	rbE/5HPHhuEkea+2wBbWeaJWSGeKKQBynp19TRTFfs2zQrKiXbzThQPyxRRj0d0QcDbSUUfd095
	zCufvw==
X-Received: by 2002:a05:7300:4721:b0:386:da66:671f with SMTP id 5a478bee46e88-386da66762cmr4098497eec.28.1795739673041;
        Thu, 26 Nov 2026 16:34:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/69] fwupd: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:18 -0800
Message-ID: <20261127003425.2166632-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133102
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
index 31b1121c83..9b78dedc66 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 SRC_URI[sha256sum] = "cb23ab505cabaf616dacfc199f710f883329e8782ca3aa67548bdb7181d62fab"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
 PACKAGE_ARCH = "${MACHINE_ARCH}"

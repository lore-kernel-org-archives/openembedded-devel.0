Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11767.1795762884860546986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eKpHn8Tq;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6787782c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762884; x=1796367684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87mb/qjwsmWzfqqucTEHaPRvc3jFcLAR9pjO5abSWRM=;
        b=eKpHn8TqgUTIvcvwK8IcbP116lRQiWJRYwy6GSTbguXWOH72WsbGt7+iAogggCY76o
         t8V6n0w2iw1lrteB9kT+yt5ZMoLnVhYDRBraofIrS+pcgMj2YM5crI0M5RyG54MF/UGN
         KSn9vQgdeZkew0rLOgl80iC/t2XAWjRLyDM0NGGZjjyiyLnA8YArO5UbB9JU5UVmN0dS
         TJXNl/XuqHG//Qv8Mbez4dOnsUaxFLfWUViNWhLLihcwqTy2PWQU2WAGnS3NUyu46H+Q
         mRhW3aeEwNg5pdM08GxT8dVNlvegPRAQyk6DfzTHE+39u3KxpVUnxE3tddhp/w4wXxyO
         v8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762884; x=1796367684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87mb/qjwsmWzfqqucTEHaPRvc3jFcLAR9pjO5abSWRM=;
        b=xUZ4uqqBqNEkOYeha83DonmNgbxaEMnp5yeKAktNaYMOCPdUJzw9x09uvpYif6KS7T
         Md8D9PR0jQwyMJvVbAGb0VmE9BJ4ynaETmsElY+y92Qrttk3O7uRVyPLjJwNaxy3Vbw2
         eWVC+TwBhWTK2pnMOcah2P8+uJOEv6l47MghZL19svQjavsi9xdJNclRdlyt1yN93M1G
         BHjx/fOyW2ElPgkZdeoIQvtiYne7tPcGI+COH6s6qjpbbUX4mGG1UZOcOFQnbCg7NB21
         m0n1Vc3f9HrSREkvpU9wcURK83o/qeaJt+ADnB2CXqrk+ehqzmJ6Rq7AC2Zw5gsUbX1E
         I88A==
X-Gm-Message-State: APuU4Z8JaG7ddhv7vF1Sgot1ab16EyfxdNlMG1XlZaSefwhRrw+rqNGW
	CRxJYgQY/XF0EnFx3VRXsr6rfADQl5VHNxUIfkyJ/DEBFq183lEthb1zwwGd21BM
X-Gm-Gg: AZFdTZe1PNuHq7v6KFQsfkxAavcDz7m5tQM2C8f9KI1aQ40EFLo+mrIZ/77IaOh4Xie
	YWqHvIKNE/xHkAwFNgtEL3rMOMGecQ52dwYEQer8l28O8TgGlxJXOYvbVZFMeQ3LAKAlabXJkow
	VPw9gmuPLllK+QOedN7V6iJO4ub046gskO8rDgdiXWjOkOsEHCQ6VWlkLa15sLolsTeEpGN9CUu
	6TVuUyYV3b9z5lEjVGRwz17ov5FrZVRuj4wtd4VeYnmqWsjrdLaO0Sq/95moBbjTwqyyuxDfstG
	DOyf2uOjmsf4f9cYTLw6dKcXULODrOngffGImGIsZUTaaC4vbGf14HD/cNEaq7C29XRgwNH79cU
	ExBn/M/K7ksA2FwCfx47RmkdVFTg3vYffHniKEwpbWf7bCysEKmY2gH1cBepkrZWm1NQ6LlQ0yv
	lI2TQ6uNGbqHrmn3xl3Xa9CtUI5boCSv2ToTwN5TAeENZELT61D+1Yci+jnEQQmnoO5EobrijqJ
	p5OHgSdRKlYk6G1VFVECGouXE2ONm7n5XcM8cRy7H+F7qwFZW60Nv8/d+eKgi8Rwihri9lE8VbV
	LmdXA9rYh3HuFaM7O6kJXx+DBNNv23k1kniyw4ScoS4vSlH3jpEjKEm14pFtEsdXB3R+nmWvJ4O
	X0j5Vqs91a5mH+hJi9JYceXjasEUJ26QOliPVXJVGy1OqopP0ma9tq0546isIySzAGstlXWwLao
	/sSMfv2Y635hW79/gg971uex+iG92nJWghmGD5twA8V4yi1+uhxmLPA+nC3jali2JYmdpXXRZvl
	H8Ac/Z/DZOIpiTgel/XqcKbHa8SOx9uA8epHxuWDsJxSg8h28ofB5hNIb1kTyam+nFe1W7Nuum7
	scjO
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr25280083c88.31.1795762884219;
        Thu, 26 Nov 2026 23:01:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 08/14] aravis: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:06 -0800
Message-ID: <20261127070112.2273685-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133313
Content-Type: text/plain; charset="utf-8"

The check reported 0.9.2, from the odd-numbered development
series. Match only releases with an even minor version, anchored at
the end of the tag link.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
index 0af3b9bad4..5404e4c372 100644
--- a/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
+++ b/meta-multimedia/recipes-multimedia/aravis/aravis_0.8.36.bb
@@ -19,7 +19,8 @@ SRC_URI = "https://github.com/AravisProject/aravis/releases/download/${PV}/${BPN
 SRC_URI[sha256sum] = "246deaa0042a387ff1bc00332d0fb80537ce14abde2c28d1a54c91f17adc51bf"
 
 UPSTREAM_CHECK_URI = "https://github.com/AravisProject/aravis/releases"
-UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+# odd minor versions are development releases
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+\.\d*[02468](\.\d+)+)$"
 
 EXTRA_OEMESON += "-Dtests=false"
 

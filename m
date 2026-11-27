Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8088.1795739731782831394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eM92nwlJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso5373425eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739731; x=1796344531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCjWBZAAzPKA92lbKbX5YR/qcEvq9+JKsz7GdW5HvNE=;
        b=eM92nwlJ1PGxp33QcLgtZFMCCXZ99r5/24lkxeYJYZRBKzTVzp7EhixSMs+qcXKQvk
         C2jFJUpihuOG5nxpRYdTSwnxyvf+FoaNcbE5WuLiszd9+9n92TGTcPwFfVGMtsyRD51z
         lA+nPkHKvPvrb0lMD0P8sptyE4wkFR/aoqqJKc11TknwARbfatkaAiVM1otuDreAlCGX
         lsJg0sFVZpdqQ+zeH6o+QhQJzyUn/k47vCe2KeVOgk2C3myKVyWEYnluD4xZV3R47EdI
         FDTCdJ0IgppGGr+pUv2ZhULogNUcdo1XjUC6nGwrkeq7QKrlcCa1XVVuE69+YVGSHmCn
         E/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739731; x=1796344531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCjWBZAAzPKA92lbKbX5YR/qcEvq9+JKsz7GdW5HvNE=;
        b=VNmgIIgrmMcilOAa8C3MPynHHLodVET8EmgGdY3XllY4oE6reYF7Iauh13fmRC3oS2
         wFeo19qXmSleVpB3k7In17cQuJDRxiVJlyyiHHYYHP5Is2Kn6xJkKDhd4XkfK+tO2Jo4
         N050Q15UM8L832pMrlkCTL1dWynybVLgXjaV5q/UjKKy+RHGAEQqXVCuugE35aAh/SA6
         2G1MDtvLEsNUFa2+7mVb5pBYdQog19BX3VVcgvVsc0qFNVCJq9TTW60JyS7Iqu5Aw4HC
         zDagqnYpeJl0mQEGDjnWNJibmT080C+IbdC3XGm2p282XydxxF0Rd3/IT1ERyrhi3QGE
         Y/cA==
X-Gm-Message-State: APuU4Z+ryZRlWGVCQNuQAyd/iuGTbEa350EgajV35Y8UWwvuoJ4nkGjr
	CI3eQL64IA1OtjG0P8s9uFc2YL9OSVSbct4byeaMKqE1oLnPnGXg1PcekBGc1rLz
X-Gm-Gg: AZFdTZecc+T2QcwKwLoK2Vophxhc/yjXTb+on+dyMwrV1yBfYgpRNkI+NfnKm/+5YBs
	Sbot+7hKPOq379D6e6FS//JG47Syc6Jvi37LrRMEQY095UbCTarJbhK4qLlOUAXTz3Ocz+rhl91
	05sk3eYhRbmG/Iifi3lSGJkofqQb3xw9PRkWmW2+FpbEMqxTUhC8U2jTtdP1jrnFmdI+K2GbISh
	f9dZEVv4g2CWJwSRPts6uYBn0cErfdffeQOvm0W264fBw2lohK434j3wszmjgE2EsU7gyoX6/gk
	r5H0CXT/z+CsGO+2ztb0CCY7EBxIMNelKl3tFcbR7KrvVBolDT/deeA5Df8vzRoqhjaAdcgf7o/
	R6yx0eTvJm/gmYpl2K7Cy5PwJ++rXtusbFEzPxGj+UX4Wxa4VwSTxZIDyVJqWz8S+TYj+qkK2hq
	Hk0GNO3VqN8cI6SLQa7VKqvGm1ctPmWf4nnpbog6Ssxsw1GL2IwpQ8/Buz8ymblstIZithsqW+Y
	d9szGikJDPu1maF73567FgomrHfx65RjmaBYDvz2EKGS0yUXldslUBUnOd5NAbddg8ElqwOWc+y
	yOaZKGKLQvYPNF5qPHqqIwK144XgnjWOZwp5ONkvpKP6DWSSR3bWrgqZ+uUWVNGza/7p0OxQIqg
	ew4DTPQOn70CZjG4LILMxBNsVT0OEUNOr4aNtGFLSPtNbHYyr88agSrO0kAN+3lnXW0WViJVkIf
	0jE/SI2PVCu5fjaXkFOIaaqGOMybkcjyGH6aplbMEZslTYuqNR5uKvy6Wy88RGecBvBySRdkK5M
	Jagxs9A9WujCZvNWkpYOVmHgBjEVxyDNPHrHCQv95QWYkL2ds+iEfjhtEZ/EKfUIihppUzK+Vb6
	/PqhNMkicFVEfVDIBuW5BF/w+Q==
X-Received: by 2002:a05:7301:6e9a:b0:383:71a:2b14 with SMTP id 5a478bee46e88-3856f14bb69mr21239544eec.10.1795739731128;
        Thu, 26 Nov 2026 16:35:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 58/69] hddtemp: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:14 -0800
Message-ID: <20261127003425.2166632-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133158
Content-Type: text/plain; charset="utf-8"

The default regex only captured the beta number and reported 15. Match
the whole <version>-betaN part of the tarball names so it compares
against PV.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
index 5930a8c95c..732fb294cd 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
+++ b/meta-oe/recipes-support/hddtemp/hddtemp_0.3-beta15.bb
@@ -17,6 +17,8 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/hddtemp/hddtemp-0.3-beta15.tar.bz2 \
 
 SRC_URI[sha256sum] = "618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b"
 
+UPSTREAM_CHECK_REGEX = "hddtemp-(?P<pver>\d+(\.\d+)+-beta\d+)\.tar"
+
 LIC_FILES_CHKSUM = "file://GPL-2;md5=eb723b61539feef013de476e68b5c50a"
 
 inherit autotools gettext update-rc.d

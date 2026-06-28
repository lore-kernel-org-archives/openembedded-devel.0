Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C66C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:59 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14761.1782634371636834291
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fcv2wNp4;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3078e0dcd67so4007050eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634371; x=1783239171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpv6p9TXVBWzSRG207kQkeNGXTxeydbQ77R34NH2D5o=;
        b=Fcv2wNp43a+wJpPDFIhC74GBpPOYsOsAfOALKfg1SvVXdhv/56KSgf4N64jZdh35cJ
         skEz+aOaRaZ+Wp0riUbspMmDc/1iYHqemjwgVjVerJ2Pg7Q4qqEPWD52/Jz3+H6ii01T
         kLE9tpdnshKxWizYn1bRhGoFJ8guW1nN+qMeejBs+dLBmFMHfRckh7XJK9aPCQLDfC1q
         IMhkAkjug3Gfl9Zo5h1TsHFjHDmBdRvb/x0y371ucIsni1o1N+5NHmo1mmvzqbNZ+I78
         NHU9/triPly+QuBH5gQTjquocNQW1GFEhrp0t0VENhQ0kypCcOxnUyVcKQibIMmp2ZJM
         H34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634371; x=1783239171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpv6p9TXVBWzSRG207kQkeNGXTxeydbQ77R34NH2D5o=;
        b=JPXSpkHUMLb4r426Q6Fb9/cc2q8mHC6flkIG+vGYY8JhUNRsfmXZ2HzUhuHUk5hp/F
         6Xw3gMAfqRQ4+mv7DAW3be5CcHLOoOYr3U+T///BV1SiOT7lpwvcBOf/7CQW67XLo+Nv
         VhNCRxABUdXmVrTyyvSS1ctNleSLjoHfnwl4EPNokfMQeTpmLokJy5fmDdkyp0RSxDss
         JNjqNlUkQH7vjy6yA4/VT0GiVOYmuJL+DbCBdkcfsJTLuDmVyncA8I53i4MXzls+aUTv
         NBjHMDwewXkGtbqprDumvAa1JJfkqdIPRVIGhzsikUUkSGPsHfyy47PYvw9erhDa+n5B
         PoOQ==
X-Gm-Message-State: AOJu0YycO//bOsJxZJnjvP++M1Zip+d78wIDoiCVcN1wZaHrHeKDOIJB
	6/0EKfF8Ph++XQP59brFMSWNplHCz7EJLEuJV4jIqApSyRyuV8I83rBp6PLzP/Ktc0N+Ag==
X-Gm-Gg: AfdE7cngjqkGT+oz5Oy01MiStKjRGawhjLCw4YDrUt0r4EN4MthEEsefWgVVXpTJuZB
	31hJPO3inlt1pwruaV9tSgqfBlItGcZSlKp5sVp2iBGd677booGjE16kVXDIMSfMDyAXltkS8EK
	UJDvXO9GpCbNkG+5YTDpmPuPzg1/YQ3uTSj8HJHFo5iJ+wbl76RG7WV9+HV/IMDxpNlWEuTUL/E
	nyn+A49pt2FNOkxL8phys/4l2Cki7Zf/YyBiaZVUgmMZFtIFFvsThp8TYWjKh0ebFieeXUzMo2W
	DgoS4cRpBVYrCM1xnSkfYDOFKO1WP3tpq4jfcIqUuQ4uWUeH9sNpuRf41IM5wGFihxvD3Wb4BT6
	fCO+aJB1RNLJTOlDmxOQ5dNimaxiJiCEIBIlouydoXRsa2HzcveLHvxQf5oDEia6ZoxKYNq815h
	WmDZx+CvvVV4bEPVDJQZ0uWJ1M9lEV6dNLzZvNi0r4I2Id1Iu2FhbPrwN7MBdRtN9Nq2obfkN4A
	yL4lKQmgwaSlWvPqlobJLN8/ZMaAofz327pQMfHMYJpzDgvj8Y74FZICpsC1ksv1wE4DIajI1w9
	YnpgplhlfEnWSXMvGoKp/oGOrfUVqg==
X-Received: by 2002:a05:7300:724c:b0:30c:ab4d:381c with SMTP id 5a478bee46e88-30cab4d3c02mr6444549eec.40.1782634370846;
        Sun, 28 Jun 2026 01:12:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 093/128] libmodule-build-tiny-perl: upgrade 0.048 -> 0.053
Date: Sun, 28 Jun 2026 01:10:44 -0700
Message-ID: <20260628081122.178348-93-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127903

License-Update: bundled GPL/Artistic license text reflowed; FSF postal address replaced with a URL (Perl licensing unchanged)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-tiny-perl_0.048.bb => libmodule-build-tiny-perl_0.053.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmodule/{libmodule-build-tiny-perl_0.048.bb => libmodule-build-tiny-perl_0.053.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
rename to meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
index 52c6088b51..7b15ccf597 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.053.bb
@@ -10,12 +10,12 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/release/LEONT/Module-Build-Tiny-0.048"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b9e8b5e2bd19fcc97ac84b78a271a64"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3eab9a3cd580096821fd1e657e2f31d5"
 
 DEPENDS = "libextutils-config-perl-native libextutils-helpers-perl-native libextutils-installpaths-perl-native"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-Tiny-${PV}.tar.gz"
-SRC_URI[sha256sum] = "79a73e506fb7badabdf79137a45c6c5027daaf6f9ac3dcfb9d4ffcce92eb36bd"
+SRC_URI[sha256sum] = "3726d622da6f655e88fdf89e4fd597709c44970b47de65082003e8d86b5e193a"
 
 S = "${UNPACKDIR}/Module-Build-Tiny-${PV}"
 


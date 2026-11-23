Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48050.1795411886061793052
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YUstoCUY;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3869f03af6aso1937189eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411885; x=1796016685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lt5Z1aQT37MDagcdR7jsYROSzzHkrp9ozEdQSbf/5a4=;
        b=YUstoCUYfVNwf9H6zP0+j451J8YO5q1z/EUJbtpPNAjinPggopuStrMSN3kyCY21ax
         GOKCuZe55mYE6tDKGMqnGIW0Eps9l5YEDigS1OolAP4XAucudfRz/aMntCF1xq6NEhmC
         i5HpFuYeRjgXXLOoOX5nxEYHEpgjW+UVZUb6zEp2NLvQA3ybDwskazojHA/Vm8FU3w5w
         AnO27pFpW9XGmiGlcCF7gKUAlIBTSe+JeHXiIQlK4Y1dovmZtuLllnHnrQMADJf4Y4IO
         V7Iubunr2exx/FeOAC+YN2mHEBV7MO8LIc+LspuJGodwLZYd2lE2iKqhkvHBsfMho56K
         RpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411885; x=1796016685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lt5Z1aQT37MDagcdR7jsYROSzzHkrp9ozEdQSbf/5a4=;
        b=zzUPM1rQtjrOHIOeofAEs9FZj6Od/nfsrQgH6Lv68C45lgwSQQGAZyvbmPrsxbORPd
         cY+9Qu7AYXRDKSTVvP6oU8CgWdxZhBUt1PRqQva580Ixqe8NT3MZoYvUsEA++GARLHO9
         6BEoIMHKzrakI+yJ2kiPChCaaVSaQO69tm/bZN5YS0ZDHfTRWUfeLCeEhQ8xhj68VO3F
         /c+x4mlFHx3AV6fVr/AzLnm9Ss8+/I7aY3Zqdl0S7Q9jPJOtQJuHFiBe+ufB2N7WupUG
         wg3TNqGVc9IpfsVc83pEEH+MINJRS97INtR+EVpt916jVJ2iRb2xTAjLF8f9MhWAiNRl
         8gIA==
X-Gm-Message-State: APuU4Z9zmod/vacLjIb1w75zDat84rfYQ5X7rKVV3A+3VGI+AfO4oOL9
	mZQVhYtpY8zHXdhVk66Z8PUdSWL3kJqOLlFFlr0e/YzSnkKryeAyEDZOzAvnL+/cg+Y=
X-Gm-Gg: AZFdTZeZQXf+EEWU1qF4nahLAtmRT8OrPWbMSBMFcvifpZVZFYiXOB2ibhmP/ffrAuj
	1ks7b52iewTbENTOGYRt16sA4YfWIk/y9qgmoUyI99SeFi8AWwFxuZpBaZ5dAWtr4v+LZSJTrVH
	6DdM6oBxyyc2ReVX9FXiVjocrepkn/D1/I0eTdf46eYTN40G1fYTpBslr9+UeVbBpqaySbcIGaW
	Kwh5checP978aAPLmpwk5ThVeV/k5uBshKogZFuXMwC6+u24YK6Xfx11nfaLkEHE9kJ6KRt7FyG
	dnUr89ozUrokAW74BiQoaKibIjEsqtxJ1/PgLCEGzXEFaTuAPKrHUxcK83JyqCeQSFfSWKfzYQ4
	FoS++Ni+US7HObJ5KXd/RIP2o1r7XbnUnasdRQ3bgHMCTmCNYg3fqXqpVmwIr9BDDCyK340cpoc
	nSIzlChS80fh6CFiCcv00MxoEsxpDq9iMa4kgLEitS40vhrkUPtm7HqEnXElFeIbcvY8qg1JboN
	Fu9j07UJVEe5b9/998+WXtSst33GnPqdybklLu4ATwX17fx2pBkEAVcIwg3wT0ysOMMtif2Ewg5
	7j5ikCrFzJoDIvNSe1EWJvRQcmA1E7YI/4Qzh/8KN0M4AUDTfUtS5Xw/3qpk15sARGaTS3xA+cJ
	374hJtgw+c/bshrgxTYMxAsfnI66XteuCOKoKQWJPtLCxSlNXJyej0qtdGN/31BLOvZZ75+FRLo
	w+Kbo5ME4C3IcvN6sXuxNE3qUEjyiAtoBKQRR3gMuGUqfQXdhEX0rwPJDNdPnB2LBLdeFuSBVqm
	8jhMGQmhmrcJevxzeA2EUCYBBwDktpIoVnKHULjYVqDMa7bRWPZwQ6lH1b+kA3AKA9yXpBm2jxP
	90NE
X-Received: by 2002:a05:693c:414b:20b0:386:a10b:f709 with SMTP id 5a478bee46e88-386a10bf99bmr6383177eec.21.1795411885334;
        Sun, 22 Nov 2026 21:31:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 2/2] libnet-dns-perl: upgrade 1.57 -> 1.58
Date: Sun, 22 Nov 2026 21:29:29 -0800
Message-ID: <20261123052953.3658549-73-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132860
Content-Type: text/plain; charset="utf-8"

Implements the DELEGPARAM RR and fixes predictable query IDs
(CVE-2026-101340, rt.cpan.org #183247).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libnet/{libnet-dns-perl_1.57.bb => libnet-dns-perl_1.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.57.bb => libnet-dns-perl_1.58.bb} (96%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.58.bb
similarity index 96%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.58.bb
index f472758535..f7522554c9 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.57.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.58.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "7c98de329cb5d6a99abbb03aaad2866cb041092ed9936a7246908e170005b058"
+SRC_URI[sha256sum] = "6335e9e253bc457c7f7e26aaef673c613f62bde26ab8d1cbdd3ddfeb402871a7"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 

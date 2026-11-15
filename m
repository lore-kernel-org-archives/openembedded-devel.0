Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3845.1794728972804022103
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CtpMXKI1;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37000e7234bso1044742eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728972; x=1795333772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qixTN4qwTHog331O++n3O2rpTerS1VmdF+ZrZJO49/o=;
        b=CtpMXKI1KfFi05hDRBGV1pBo6z/7jgABE3nzQfxgFURP9hDQ4s3QpZeUH8slSjzayT
         7QkWnOOnkGt4b8z8zKQfBa8VVBKimBY0hSwdm1wonG4HI7dgR108o9dsLUD+R6cBXhyf
         YLFg3qU7LgVJPixoFpZCK0lRCyOQjU/0QIFNpcauO5DukmFgfSw6naScgSlBGGXg97Up
         AVmEb/7b3QC2LA0F1zS79aRQgVaxkhR8Q/x6spSp607dB7uaehpann0s9iWN8uw4Gthi
         j6sg0aR8NYfMt4HNMEEAp7uUanUE1PB2j9esHy3R/vQ+AYNUhrVTWJcIZTWFDATtp+2s
         2cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728972; x=1795333772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qixTN4qwTHog331O++n3O2rpTerS1VmdF+ZrZJO49/o=;
        b=a7ScWbAm2vlqFxPs2Cg04kSA3lfUqwwwYGP0b31PD7KXc5ePlpkDZK1aKQYAfBi3ou
         tvHbe9FLPZreJoISlzPsjCGaUU4ORBiSvctyIZ0OEUXXixgtEZLQ0bJKNvl+qsosszc+
         MTbdELXhn4RoSs4Q7s10IE7ZbCC5yFhO5xV2pR8eyvFEI3Zrpg8Q7GDxWkkBJ0RSiPgt
         R932O7unr3Blgm/Jp4JfiWA32r1KS2IxD9U6RGNDK05lVnLFoKxvSu5z53IWTFKAWXbh
         EhwMEjRDp2UT5JFheFNMIIMvKtEFRlewXNMkfrB5b97qpxMFSrlYDftt2olhErGhsGZk
         xtKw==
X-Gm-Message-State: APuU4Z8L4CcLTYY20CzEQMXwCF0nM1Lf+92D2KrJXANPkB/uXWFb+RqU
	vlKtrAyyQ9mI5o7H53BTM8PXgR3fPGBlqCjZMSRI523Xp2jHA+THV+RRkELL7wag
X-Gm-Gg: AYBFou2VZFP7OppANmM0hft0PCThuGquQT0/JpxGDuv85oVQA4xaVlx8RHmepXwfq2y
	DEIoTDTWhDA8xun3AlAELhpyrGG1IIWQWM9gQfPE/k4B2+z0eLrVd9hPvh5VcV65qcM6shu90YH
	dpVpmDIU7H+A9IX1aAJIj1AdRkd6GVxLtfdaZycz6e7bD/wJhK8haxkgPqBjYcCFZA39SZt8ugn
	RoVKpGBfbZRluoUHzAp83I4vQUZaf7tuYLh5HMws0sHHSXxONG9KTsUVTI01RU195RTTROJgm+R
	Lhsov/vWGM1M31DzhlGoIowsE27QVMdToKcyDqGoX+MOlEL6KmP29K6geSCK6ggSVO5qRfeI0aE
	oW/tAkcmpTq0ZeS57OXgnuT9nI48lMuEOdedapA9F96Ci3KKaxQKZlUvHAxh9N82BLqPMZgKYNN
	f7KCcN/q08Xx1NwkztDnUUmNYm7NvVEsAkIHrMV68L+DM8cATBdve+8h9GV7EIsg/HTc2zyKJiZ
	/repQ6CEAiZYHzLZ3wv0+ZfUpjck6HrqHKLCd4PF8sFzuNgfrf70dvvjevReo/3zg3mcWBrfcMM
	lKNyLOv9vgSmi+TzaJ8toaoXPfUvnP2rt9WPwLWS776bpnn9dzAXSTaCcf17ETKQ1KDwNRDCivb
	7JpWvem3SPnmugc5Q0OIOC85tLruNjo1gnurA2+rklv6mKbBbRdpIRWFHCt4wTLp+/zNXPpvsxW
	PMfipGafmvro2J6dCc9jkLb7rHqstmSoJMooOrYWKddSngp7tam1XAVpUduyA0CJ1fGZGDQrwkg
	1hgPYZzQwW9XhZ1Qnv6g4kJf/kFWBXU9yAqJA/5hLhiqPecCSfjv6nqprKkdwBU2s+X9yEJ/vcJ
	iRB9w8xgXy+c73KegChIDw1v+g==
X-Received: by 2002:a05:7022:1701:b0:1b4:f5cb:ebe3 with SMTP id a92af1059eb24-1b50311597dmr7209038c88.16.1794728972097;
        Sat, 14 Nov 2026 23:49:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/96] gperftools: upgrade 2.18.1 -> 2.19.3
Date: Sat, 14 Nov 2026 23:47:45 -0800
Message-ID: <20261115074918.2932593-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132277
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gperftools/{gperftools_2.18.1.bb => gperftools_2.19.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.18.1.bb => gperftools_2.19.3.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
index e4b7060c78..22cb19c0bd 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.18.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "d837a42788ba591d5d791c3b686f2738e7a93562"
+SRCREV = "f21715726a385adba7ce3a9db2df6e18b5b6bc5c"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https;tag=gperftools-${PV}"
 
 inherit autotools

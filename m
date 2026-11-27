Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10347.1795753042095823176
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=g8knXg/q;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b546061d58so17751808c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753041; x=1796357841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCJvsnoasAd0NY61DngnFMDtRACxVt4SSqg2Ef6h8vg=;
        b=g8knXg/qAFIXlqOpw6/SBRKflKTWCc5DkEclMgrP06H1Fuz5u1Y4rGAZntip5GvGZA
         2xLKGsNiMIXPSJ++XmSMwLXAZL7i9kkIj0jKl7esl+b6X7FMuVd6DaamInhuNPyU8Xqf
         0OCjRRq9ZBLvXJJE0VNooIZb/5/t3xK4Gf7bzlpmPdBSVC5dCErplzbrkSkzVKC+fsmk
         UQP/e6geFHkf+MotN0gNlcnsyC8Ee5SeClVRzP7lnKJmAGNSqjcSYvAzRj30ermOvnUS
         YSyA5Gmj1WhRk1ncbFTxFE8BHkWKSDY5sy394Fovk1vmJpKEXMf/ANT97XP2olk8VGLR
         bZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753041; x=1796357841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCJvsnoasAd0NY61DngnFMDtRACxVt4SSqg2Ef6h8vg=;
        b=BjIc3X6GvETsjO/oMKECWRKGXKSdenyxujuL13pb6t/58G/Ckz/7We/MfLsbbTexrN
         Nw5opxj46blUtBFa9KhqlNBGwlHvSzIDI3Ib5+lThyvxwxMvwU6vtqHuu4bkSVIjc2sG
         kOmUdAr1YA4H0ohXAlz/TJbiMRdNFcS/PjV7oeacDCkp3ZlvF115UeyBaEI6PgSDMEmU
         6a3M39WsjNOWGBng+2H7GNpKso9MphizUPlWqoraaIfIhqKpoTjCl+4sleGlQ0jykfbl
         17FGN8umhyYC1G4wkE1W1FTevSZD5F/r4Ib0hxmvA/xoODZnXOpgH4BzZfriF//Foa7I
         OW0A==
X-Gm-Message-State: APuU4Z8grYPm3QBCrr16f87dteZ0XpWQCC4jv0mRwQx66FigZ3JGrVPF
	+OPovjBqfMMmtmE4lStejbxyMIsA8jihR3jsLc3NKyAJqgaYiSAk7g5tFG4kluGN
X-Gm-Gg: AZFdTZeB6yvt97gNoTxGYuqybpHqbzoP/UnSGSxvLOoO+mPLLlLUEa8Or9y1z6W9qxX
	y8JfgdLIQDaBMYNiB+Y+cu9Ce68eDiIglGXBRcfTfv0eAt5VwZjnUIQpJ6QoQe9I+ITXcv8EZwU
	lIUQ8VVX60ozXLE+EOwqJ4h+3f6VNCoO79qvfRtlB1ChV2ZIGVpOzrYaqNOJIVI3EJOBBvltZ7K
	ZAmJrC/6JHxyLOjsCZdyUPLbQ9ZXUb0yFFcdzJwfaFhZqcncMVqxIt/VNO9aKX6ccDopDc4RWb9
	5PWh4ad+/WDbWUqrHRayWfP740dLWIaOs4tLbPS7MhqQwUWLS86dMMuxOLN/g5VXGxbcF3TOyR2
	p+Dqs/RaUMksoIBgqrpRZqB6g7IcJX9GMa9l5VkR0mGLWgyIZpQudeRgxUGkpzBkUQKQoOzW46d
	4L6p4temtps5gLZJFDbsdJ+zPyrAgQWSEm6su7RH/Wlt4U9ZlBEpSak1AwzXCF7x0Ow+MbSnv1T
	F8hWzTDDCh2FS9GTyPH76QYe0/QHp/b3BMomKHxlXjwNcfE9di8R1VOPYoQbRPubLnhGRFQYrMe
	SKQoGOLuMh7qevXp9aSREnX9fXcX+j1BaUvG4Hn2IkNzEYoTXhqE1aTGaifM4nYILUx13sUqYBX
	UB3cQimbPgb42p0y6Ub0Z8sjzvx0H9kDFBz4jiWRVc38SH3Casr/8cv8ajyXH4mdfeRmGciIkI5
	NpcRLLL/c4OSRCOt5TeXxxvaDtpFCYWvC8NB6RoNT0n464TxR2q3PcccwCBiScUyxsn/h1H9WSV
	wUce+HZzzvPhF/QUSJxeUAMxpplPAXJ4xeUW4Gny7Iigghhe46tDigky+tqWk9X9T6sxmmGWlca
	1sc4
X-Received: by 2002:a05:7022:b0c4:b0:1b3:b455:93db with SMTP id a92af1059eb24-1b5568eec9fmr22328849c88.24.1795753041472;
        Thu, 26 Nov 2026 20:17:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 03/35] daq: Restrict upstream check to the 2.x series
Date: Thu, 26 Nov 2026 20:16:43 -0800
Message-ID: <20261127041715.1776485-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133255
Content-Type: text/plain; charset="utf-8"

The SRC_URI directory on snort.org is not a listing, so nothing was
found. Check the snort.org downloads page and match only daq 2.x, since
DAQ 3.x is packaged as libdaq.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/daq/daq_2.0.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
index a686ef5840..993c0dbc14 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
@@ -14,6 +14,10 @@ SRC_URI = "https://www.snort.org/downloads/snort/${BPN}-${PV}.tar.gz;downloadfil
            file://daq-fix-incompatible-pointer-type-error.patch \
            "
 SRC_URI[sha256sum] = "d1f6709bc5dbddee3fdf170cdc1e49fb926e2031d4869ecf367a8c47efc87279"
+
+# 3.x is packaged as libdaq
+UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
+UPSTREAM_CHECK_REGEX = "daq-(?P<pver>2(\.\d+)+)\.tar\.gz"
 # these 2 create undeclared dependency on libdnet and libnetfilter-queue from meta-networking
 # this error from test-dependencies script:
 # daq/daq/latest lost dependency on  libdnet libmnl libnetfilter-queue libnfnetlink

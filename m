Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8110.1795739780161813161
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oYzPUzAn;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f052ae3c86so40812305ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739779; x=1796344579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9TfNlGZNNipUJ9GLCDmCjWcSpEhYytnDEXj1bSnQE8=;
        b=oYzPUzAnMg5PCq0bbMSHF4b6uviqx1H+W8TR7PRmqFxZMEWb42y5uGvo8GvTxI+esP
         l+P/xrLTIv41YVon5VkwUkQpJ9HEJfi4v/3Nc3jywpsWpELPuHaurpns0fe3ZUYK831U
         4vTssUu3CTAblx3HR3PecRqXqjd+6Dt0kw5WlbD6PPNA0BzmJhjFfQQw3xHZi2tZORNt
         ODKfWKNZ6jSAjvEmoBj2x/pEK2xVkzdJooasHidw2lQbD23ArOWUkYVVCXi0O/GfjjnJ
         brFEHljR+N0ySU+yhG4nu3Hw6r1c7/nYSfswZRGGAPnFyt2T+s/eOp885VQOjNpAgdN1
         GlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739779; x=1796344579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O9TfNlGZNNipUJ9GLCDmCjWcSpEhYytnDEXj1bSnQE8=;
        b=a82bXXPfCumCx1r7Q6zvZbG7krPLQvy4QtXWviq1yBks7wm00brcTyhOGAOuePZKWR
         rTFkQDzmyP0zJ9FvohGBWvKqp/T1ieQ47buL7i/05jwzuqnSZC9smsPYCnx3zix73htx
         rs7t3MWJA8Y4j36Bt7URVheMhh2xEV9d5gWexqMCTnDfpvoHCvXmjGfUY6kcBvBol3+7
         QUawVob2tBUrPo3ErU9yWlf3ScRJqsCTxpCaux5g+O1Etlf3wr9tM6PliaS2bG0e077m
         z/zSosQlXE6jkMNcWEZvrVeYNWcd+Lo1B9goKEBT5KUdXFKHTIE19fDeSRJe4BPh3Lak
         zqhw==
X-Gm-Message-State: APuU4Z85Y67W57tjBsScFrTXkDlHVYH3G6h8Qye9KTznzoHPIYha2YG8
	SugP+WHrf7B9z6VHL2PCopRGaCBU5hoTykAeNPron/prt4BKPL6ROK5BZTDOZg==
X-Gm-Gg: AZFdTZeQBdRqj6hl15uetD9qZxPyE3j20zpYqCecCrl+JfF3OOOErQH5qJ2Kcq5SJ4V
	RxHKJK3ClXG78NfvySErZQPzbaYPaesRBMr2AptNHCI01VgSkj50QoYaSJWF7DJbKhj8+cbuq7K
	N83oqOSeFY0O6Dirfm9CREiWOmg6AOUSmA/cK5rsPg0oOkEuHU/2EVwwoYjhsSmKPNMAkroeXPp
	oRG1Sozfvjw4VJl3MeBeaJa5ZheSwKh5Qwc3KkMAF6KoCO/WWUzP+oz/zkTGOcyZNTRcczrUvop
	mjWAL8q1e42N3Ks72Y0GKWPMk8Z3S40S3XE6wB3zZVdfyn3tarFQ/FFvomt07v6VhLIZ18NX2WW
	MRTzHZ/1Xnt8LhX95Yani+kBnIqG0as5SzflV3xdUikuGXPb6UttNvQFNwJlWBx2WUNe1NRQhSH
	rC3GglgBm1CeoteJoINv/m9YibmIrMH2MYbFKxwToqT3mqg//OR0nYk0WjwwBsXtuLzNAAu4LyN
	gDWA1rZJr8txSYZfeWabVSM0bRxOQ6NFXD8xQmUDEMlAmINJVMx03fISvFryk7pyJcikt3r78Ce
	PwGui+3FnRLvEMuNVzhAcAyOAEoI2JDihlrCNwdpFQkJQ9JokWfnKU9I/EaFBYb8e4BAe0irRlO
	MALgAz6wUTEC8e5aPkEC1PGm2IJNmt/MjOYoz6CauxDpsvLslGh/jpWhrCz9qBeuBnEjFnwimuE
	EJogvvdYDahLDJP7p/HTVtXsQ5CFGcqTIKZ4p35HGNuiU09eZQWB0ROWrE0b0mLFRrxxPYSEemC
	lHdaEoa074REVDA1q+WfSkNzA1iPOHpFgQTikRHN6gUVBYXFX7l+zHEABggIS0wInqexd6SQwT1
	X9SR
X-Received: by 2002:a17:902:dac1:b0:2f1:6bb:55e0 with SMTP id d9443c01a7336-2f106bb7a79mr13791265ad.47.1795739779422;
        Thu, 26 Nov 2026 16:36:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/39] fwts: upgrade 26.09.00 -> 26.11.00
Date: Thu, 26 Nov 2026 16:35:17 -0800
Message-ID: <20261127003543.2167775-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133183
Content-Type: text/plain; charset="utf-8"

- ACPICA updated to version 20260930.
- libfwtsacpica installs a region handler for PCC operation regions.
- tpmevlog: replay and compare supported PCR banks, support saved event
  logs and PCR snapshots, bounds-check variable event fields.
- iort: allow defined Named Component node flags; brs-i fadt: fix
  architecture check.
- Many additions to the klog database.

All patches still apply unchanged; only SRCREV changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-test/fwts/{fwts_26.09.00.bb => fwts_26.11.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/fwts/{fwts_26.09.00.bb => fwts_26.11.00.bb} (97%)

diff --git a/meta-oe/recipes-test/fwts/fwts_26.09.00.bb b/meta-oe/recipes-test/fwts/fwts_26.11.00.bb
similarity index 97%
rename from meta-oe/recipes-test/fwts/fwts_26.09.00.bb
rename to meta-oe/recipes-test/fwts/fwts_26.11.00.bb
index 0f9cee8fa4..e1e18cf349 100644
--- a/meta-oe/recipes-test/fwts/fwts_26.09.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_26.11.00.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/fwts/fwts.git;protocol=https;branch=master;tag=V${PV
            file://0005-Undefine-PAGE_SIZE.patch \
            file://0006-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            "
-SRCREV = "f06eeafe26509961bfdffa60feb855623d79224e"
+SRCREV = "0bd8cc696caf7552f43a3c77c720beb5e6006e85"
 
 # fwts.ubuntu.com no longer serves releases, use the upstream git tags.
 UPSTREAM_CHECK_URI = "https://github.com/fwts/fwts/tags"

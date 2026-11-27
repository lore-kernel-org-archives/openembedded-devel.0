Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8120.1795739794139039128
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0SG5R55l;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f037bc348dso59867535ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739793; x=1796344593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoNo615kTshPQSK/lR+jnl5BZD4ft+X5bqM1+EmctgI=;
        b=0SG5R55lgj+E0Lug+c3cLiWZjONFEg7PguzPXsfIAnJ4VWIeljAQr3v8GPE3MgRk+h
         UQemueWNW/Rq9pV/kqv97LZVx5ZFX4ISNGdpxiqEoXiaCfOH0qRuEEngqjfQ4sDY78OV
         6VVdZmo1sjvl1xyAsIAAzLC3u9euYIFs+3i1F9iYXHHWKq81STXq2R8X133eXDmTKQ0S
         hpaopXPO+vV/6x95kouBLQxoGtP4CnZZrY6M1YDMLlaH/fN/OktZBG6j9FtvqvrRWYur
         eb8RVhCZ1dYxWuMDpoq86liveRZgTMckg++gP8vs2KJFfqxqpQ8TkozQkGI7eU6NKBoL
         tzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739793; x=1796344593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoNo615kTshPQSK/lR+jnl5BZD4ft+X5bqM1+EmctgI=;
        b=xUisaF707igo6/gj1XBI89A8uQgni5m3B/yMFzC81NkqacCBhbeD3DxqIH8jmT9rbW
         Z7jI6/DEDV6Dgcg47A0OlW+GcNn+1b2MDVELM3mHX7apy39akoyome//88FHj5Q8ekbt
         nCJFsoQ8YtuI99lYp0dNfIeTILyiR9DDxucfs2Qm8PpP136udDULgzp+RaqLHYZ+8QcE
         j2zKtx2j2R0gqxHhTCks0iYi+UQVGMSzO1Kp8H3BdRRQbsheSAGo4t5nQnEEfAIBC44H
         KwEsHKQRXmPDctF0ntioYdqmm8cXRLdLlbRYolT3OCwLKVqoyek6qTTreVRGhxCuAbUJ
         Wwyg==
X-Gm-Message-State: APuU4Z9M+Kw2+5V5YNnLW8uqCiKMJ/lWDLkuuThLYcJf8/iyAZOs5HbR
	vQyzm4dOUNgAe2I/09a6Q9Z/4ZNaO1In9S3KeJ4wHY2BiuEh7YnOE8MHdO7+BP40
X-Gm-Gg: AZFdTZdAgMcNM6gUYntepoTkHHchoYgZbU9PDsib1CK9nAvorUwjGCDb4Sre2dqcQXr
	CFgtR/S8Dqy7OFlUKqPamhcBBt/pXRq44OLO9JyEESS/+5XjgFUfJEoeQIcQCcWOd55pj55Dxh+
	3VdqgXDjzYfkJKz8oTNWuyPQVlNHzvW4An18Yx8HIaIiARMBxwzfCLTNX319Bwyixa9s4OJx0tz
	aHZgKXSC740DAsgM/Z7M6LiPLNuPRegKqxDVj1qRmz7emdOqGKQWIQiTg6nEHx42/AbUeKFPtjV
	HwORksRsanr++YbfeZPCp10978h1xXezd5ktmQH1izbWhfUlEHKpQ8Lp4R0hUy1tZLcMpm/I5Ok
	bA9P6xs6WrVrHxbmkajgvE2k7MCCpzPtTLKP7DgpOqySbkAOXoQA7fUCq8J3NGllAAQcbf/+U2p
	/u6lNYS1BOhxj5whZW8f0x+dkFmySIhnaykXgTnm6Wz1otwbXQtQ5d+idnUDO04zI6xfLw907XE
	yXXwBbaeK7DuoXzzUubmjZKacYxNWG8Gk1f1gNV39tjmf+KWyCD+Pi3D/SuUa3gyAuY626QpMMR
	S5PJyDXBQqE1ILESudrbDi+lNO+jCWInynqK6vPv22ZbaKAmI26kvvoYYQP3NXHfUqEAROABIKA
	2vQ4+ruBCf2xarJ89fU/Xm0KobRtKHq2H+dmuwQCjIzEpRvawMM/cp7G+21Qg8heCjft3Av4Uxj
	LdAHWETuurCF9+8X/4RODmq8sRr1cBave7HarJXRfLYIwDxSP57s5ciDUwiMKQ0dO7uexBQEcxu
	zvSN1UBASBYvr4ATqAz9ejhG0oowK0Pn15ar2qbdifoZ1wmAoGbVAkFA5i2ytdMDBNNZ3CSTr+e
	vg2QG3fPepzzsHcK8uvj+JmGKA==
X-Received: by 2002:a17:903:4586:b0:2f0:1f25:a4f1 with SMTP id d9443c01a7336-2f03f1cf6f1mr235467715ad.15.1795739793568;
        Thu, 26 Nov 2026 16:36:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 24/39] parallel: upgrade 20261022 -> 20261122
Date: Thu, 26 Nov 2026 16:35:28 -0800
Message-ID: <20261127003543.2167775-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133194
Content-Type: text/plain; charset="utf-8"

Monthly release with bug fixes and man page updates.

Add UPSTREAM_CHECK_URI/REGEX for the ftp.gnu.org listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../parallel/{parallel_20261022.bb => parallel_20261122.bb}  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20261022.bb => parallel_20261122.bb} (86%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20261022.bb b/meta-oe/recipes-extended/parallel/parallel_20261122.bb
similarity index 86%
rename from meta-oe/recipes-extended/parallel/parallel_20261022.bb
rename to meta-oe/recipes-extended/parallel/parallel_20261122.bb
index cc49bfdf5f..13e7da485a 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20261022.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20261122.bb
@@ -12,7 +12,10 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "4fb0d2d4d14a4ef6448c788cb2bcfde9fbe00b8d4bdc637a7e4c08f8c5453a55"
+SRC_URI[sha256sum] = "95d3f68a482561c68fbc1a136b7e10098b7068493451b53380b322388403aa6f"
+
+UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/parallel/"
+UPSTREAM_CHECK_REGEX = "parallel-(?P<pver>\d{8})\.tar\.bz2"
 
 inherit autotools bash-completion
 

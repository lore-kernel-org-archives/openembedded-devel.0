Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FABCCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:17 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13813.1762853895547761571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=beKbPIHb;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b67684e2904so2478545a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853895; x=1763458695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9wyVq3jJ75z5Baw9DAah3ebpoFaTjIhzQzJ3q0bi4o=;
        b=beKbPIHbkxlEHiTEZ764WN8MFgtbwLqxrDOBiBU4+241EUHhm+Su9fomQCdB5t1PU9
         vnw9+4xFfv4Qb//PpcPixZx0Y5ytWQgPjjN3G6SQmEht8OAkuQ+SooJ4Pfz6sRA8tb+7
         mSzQSKqOG1vL/K9t3pfMK8lZz1qRnhOS0B9XqttwzGZtOdv/rb8PvfaFSvMHS5H8Gp39
         L6iS6Tr95GmaEH0elnUDIDgSlKg25lZa1Eg1eOfSozQbWVa8VvLOOH2T0moq7pzjwe/e
         4AZ7k31hT1Gl4CMuSQbiN3AsC8skp1YbrYIQoKzY4ZVXLRZTbE43VQfjl6QyXmC9T4cS
         RyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853895; x=1763458695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p9wyVq3jJ75z5Baw9DAah3ebpoFaTjIhzQzJ3q0bi4o=;
        b=dR7rmxda4Jc0H2bjXo4R9mFDRdL9XyCsQ/3uoL2bPsBOXkySdjf1A7PxO4IqbsQ1WH
         y5Aw99v5m3TZlKdr0RN/bW/s8y8GoESKIEtinLWuAPYcNyrNFDLCZYyDAhcmS1EXVwBF
         zQ4YG4S7ehuS0fPPOKlgUlt38OyPrgtyz38hfx8IwFUBrPIOK2wYUuIOKfvIMtbEZkLH
         irDnT4UtkR1ivXBUcaQEmmnPNhFi5wCrSqTBUKzn+pVBSk7bfiHN+oN4nZT2A+owRVT0
         MAbcljMFYbkL9VnI5jddGqolA3qnIj1GFEYbETVvxCTtEMfOF1OvgP78PGLOar3XXKo0
         0fxQ==
X-Gm-Message-State: AOJu0YxdfRM3Hl1JdOcGWAqhJA+4iG832wp1l+m9Dx+HjsILJEizOS7A
	KAkTw6iCkuKsoHChIupWHXz9SY+f4glX11W9iv7uC5yVSjfbtIZU7G3gVY4wqn8NGvI=
X-Gm-Gg: ASbGncs3OAdEUMpPqqPsovFiypvTYWCH2MO5CNyDzwhGALpFG2gF74fBFefCxYdt9L+
	j4Btan0o5oueR4D0Ud/7143mSFIYKw0wRXlxnLn3QiA21xwpg4+I9yrtlQNk3BZR/6tN8hdIyRR
	CQ28Be6VUxpSBVdDjVxA9lDkbgI9he2GVzAE32q7BdTgFFzukTy6iRdCskp0Nn7KDArxqKF2dof
	fQCRuWvdt9+qQDSPElPBxQE290L/h0zE/0oZjVbOiQaI6lGsBFPfEM825sGeMvmYOAFUlcR9+tD
	ZVnn1sIVbOWC28CK+jQKJA4550w/pouOEgyaoLUGohe8s1sfrBD1jdjZ19DIbZifBMrAK0C+AGl
	LzbC41ubVwJyy2muToUHx2f1Ndib9Z0SjYSiF/Oj7i6tM2GGZ7DFaaZAU3SyXqDBQZzAUBifFlP
	BOhCX/mTEeeydBzg==
X-Google-Smtp-Source: AGHT+IGPIl/CeygDJqZPHVCf5NyJY2iBugr4nAg/ws0BCRBUiICKh7B9tidTzqkcxsOOkNaAKsxA9A==
X-Received: by 2002:a17:903:fad:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-297e56f3743mr127627375ad.53.1762853894691;
        Tue, 11 Nov 2025 01:38:14 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 13/18] pureftp: fix autoreconf
Date: Tue, 11 Nov 2025 22:37:28 +1300
Message-ID: <20251111093733.1393568-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121516

From: Ross Burton <ross.burton@arm.com>

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 76a756989a0bda434a2295a0ad9b67c951c270df)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
index 1ce3c468b7..8a56ad5078 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.52.bb
@@ -15,5 +15,7 @@ SRC_URI[sha256sum] = "1126f3a95856d08889ff89703cb1aa9ec9924d939d154e96904c920f05
 
 inherit autotools
 
+EXTRA_AUTORECONF += "-I m4"
+
 PACKAGECONFIG[libsodium] ="ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=yes, \
                            ac_cv_lib_sodium_crypto_pwhash_scryptsalsa208sha256_str=no, libsodium"


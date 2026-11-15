Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3825.1794729037192231226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZZty7sF9;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3168139eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729037; x=1795333837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BX19Ay1wqE0cRt3DKVVVJ9bz0ZpzQ5x5oySKqGbjH60=;
        b=ZZty7sF9aeMukrqt2UtZCiVfqhOov0JCzWmG4DR1araA6dMIV/fFJnBQGoeWPuIyzH
         T1hkGjvcNaz9pNKYQXvcTEP56pH4Mb6wOTkfo9x+bdcIJxlRaKYI0oerzE+bMqMFtkpH
         KxPYzEA+K7XPtOPAHH7gmWGBtW530ztjm7wirw1MP6zY1sqEf2DSNDicOxqeAGx59JuV
         1mXdesC/m4f7Y/6Vy/cM6XQoOfWylzeZvnIdvHOUbTVoQImRJJarHZ56oi1V0mZGeil3
         kbmlZdJne4KIX7e6uZj9hDPJQPOkKeDw4ns9Rieq1G+hyhm+TnY2SX9GNlhmmpv3Bhtu
         zrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729037; x=1795333837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BX19Ay1wqE0cRt3DKVVVJ9bz0ZpzQ5x5oySKqGbjH60=;
        b=E6fr46Q49sQO4s+nJVUmNNdnbY7Op4E1QAnI2RNW6VcJnrvgkpBuVvSOONxvY1Cl7d
         JyxItrs/CO0MfP7NIxwnP77Y+CVPLbas7N7wzdhMBVyFobd+rZHAz3rGZqbW3IRXLnRv
         +Bs59GcHmdGGVeivaa94QsPG3W14FPHXLeBYW4r3UeEIpnDQ4t4SDI1MHFabuREVVobj
         sGWCCc0IZiBCoBfth6iO3RkAfRH5aKJpIB61f5dbr5EAHM7oSz8noBhRiariIXdXbUdS
         TClSzu1hFBBq3hmEFL2YLW2ppEmBacjSlf/V1VN1xC65o5Dqm4/wZ0Mkxb/++5kT3/8W
         1Hzg==
X-Gm-Message-State: APuU4Z/01kHEXVNwntZJsdR82a6D8IQHnBT51j5px+s6x9kPwxjtlC96
	6Uq/QXFJqRsrJvF99zUePhA1LoTUMkEDYf0joFL/YPeOb3goZ1bx2hOYwBYK7rAf
X-Gm-Gg: AYBFou39Ti5hrbUb0e9RfHmgl1HXBUbJKQB1awqmCY4CkzyQuu3FDNO1peXGBNsKyew
	THmJEhya2xelmeapR692u28NwtiIWh2f7zChDdnQ4qJIOp4MYPsKYZIr0GxgnGcBDhXHCBaVVGZ
	VXphgH9zOV5g/5z5vsZ+UEYIwSVDUd9FffrXNj0p5n2crM2hfkxBfPQylC9w99exPYk7JnbJw3n
	eBqTSXvp5Wtxik/w5UK2yuMyL52pjk2RF2xePUxBdX1eyrbhDul/ZBieSG/vElhI8kZH9tdRAqi
	+CaozOsQGUs0GQv1AkU55bcEiLpV/8j7DNvX0KZrTwkdAqjqZQjaYDEEOaupvHzAcxXJpHQr4pP
	9YEJB3MllILqjLpCbAH2mOlvHlh1twHvK4nsFQ+6p7NjwRDMOnBHRWz6WtesmDAcYXc0HlbETp3
	SDXET9cMGXFvdCukRxPZv+L74Dk9wi2GIiqN0XqSkH59xqfTagIRu7thOnv7x8ZHPQZ4jV+rgZl
	F4UY3r0L5ZAt0RBLmkrfvlDeMvECufkPVvrYF9tTRQsRl6/xv7zabLxgnBrfl3pqPCpShnLAf/r
	vhti/mH4q2LnS7mEgn9NRec+B++lt10L+sRkU6DI91Csw3ab20BmSda6RSkEEKx//IvnHTa3UVD
	WSpKGsyl+rC+10Cf+04e8VNhSHXAZEFUBgReWANO3TirOuTQWhcJEONMo3Xh3cdJ9bJpj8Urn6W
	0b7iiyGyxMXKvkLDLMnPYVPw+5okDLbktVIwYXSaYLE7hKrrkPdVpaVBU6EawfswoT/9aXTalKB
	iarPeKN196FxauPk+3VPFld055MM7isIK6eMbr2cyen2nhmNR+PdB5WevusElavnNTruxgwrszs
	id7O
X-Received: by 2002:a05:7300:d181:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-37967cde7c5mr7225103eec.20.1794729036601;
        Sat, 14 Nov 2026 23:50:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 47/96] sgpio: upgrade 1.2.0.10 -> 1.2.1
Date: Sat, 14 Nov 2026 23:48:25 -0800
Message-ID: <20261115074918.2932593-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132317
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/sgpio/{sgpio_1.2.0.10.bb => sgpio_1.2.1.bb}  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-extended/sgpio/{sgpio_1.2.0.10.bb => sgpio_1.2.1.bb} (100%)

diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.1.bb
similarity index 100%
rename from meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
rename to meta-oe/recipes-extended/sgpio/sgpio_1.2.1.bb

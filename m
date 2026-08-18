Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9E7C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2541.1787029369656730714
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MJeiXJtm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cca0c5799eso38889745ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029369; x=1787634169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZ68GfCwEt0ypTZsi3fLOI4Y9eGxDGaOfVaOX8A/mw0=;
        b=MJeiXJtmpBqxQynrV8y2VJ2o0WyygJWGl0u6zPesohf2ALoSnAvch01cIzZoGM1TGW
         rQ0p/VVxdPocO9IQprbpdnbokTsVd3W2xhjcAhWeC8MrG8YoHDtiTl0KqIghpRmG3KF1
         Knb2XXyi3xCw3AO6SfEbzs8IitnraGcK9MuWkMC7Ab5MkinBJxv9ysNMZAELwfJ62O+4
         qyggVz9yFPUMwEdPguwFF6fF+kyFOAinRu2CgVZq51mNiLjHJvDfTpKW0Rm4+fZUFfeA
         xmlIlmRTDhS6UzG+EUja64ANo79WJjtsUMoayLnsMRmwxU7w29QLG2QqgFrlMMhrm8PW
         oyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029369; x=1787634169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZ68GfCwEt0ypTZsi3fLOI4Y9eGxDGaOfVaOX8A/mw0=;
        b=IUFOnKkkveper4+41uKoUdJj8bAxGxn9nOv14m6gTES6i2Jirqd8f5Mp1cn7AcXwWz
         SZTtbDNCzTZowYgrayxX18q2oRTKlSdBfitzs7Auz2mmmXbIWOyzHnqS4MZNQr/ylF9V
         gm1gaOsSQ++mbuMrf+ZBWQg5hYIpk1HEvTOyutfGKhcehTGIy9HKgjidiqIbQ/4nN0YX
         803CW7gRhxP0J2/k+96oE2U5L+ilqvKzmz8OKNlgS+UvYFJP1Cci9d1u4tHE02mk3Qdb
         tJInaxI2pswrWi/BGYcU0CTGRvbd7YloPwD2iSZ0sgbwz+JY8eBZ3TxieOPNRezasdxR
         yLAw==
X-Gm-Message-State: AOJu0Yzml4hoU/iN57RRmxPyMWd2YDDIUGibNJuIaM5RuRDLaA/uryL0
	DB23rDuPWt/Ro11yjUPuqg5Dw803c3Cr0mD4NRpkHlBAi3r8yxhd4SIZDVbHT9iu
X-Gm-Gg: AR+sD13Q9Od64yy1fa/zfRD/K+SNaZthVAPLw3ouJ/2pdjvlmr2wbMzzGXC68bElEHo
	FtgOg5pO+zVWnfgyEqJRUzoR82g8L5iqoKwt3jXreLGqdwEvnoebN0yDZwyr8sVbTY5MbyqBQjg
	GNoo3GacYOB/SQJSg/hwTiSsRo8fzi3iqm/XxSbHIeLQnG3zQTIx1cahR/7+gq1M9NYyC37FAYp
	X5T+mwDsPnbwmf9USkryyakX/Ia3hwATklop1Kzs2RaglozZjPSMV+4pJZl5qvIiSY63+9wL/rO
	UAikJQv1mhp0lL2BtfzvuThpBozrrK9+0GatrwYKVwLCuybfQrPK4hifEUbH/N9fuwIWeGDg8gw
	zIQUDmA1V1yVjn0bzXZ8XVu5Guv46Ni4wdz+bRTs90M/zGpKZ8OUZ4Ab9Mwwwy3+6YnwkglxSZp
	851fiooamJAcke1t/p1PZ12scyBS39llgtTByZFKGvAqFKs+V8SfCZvhZtpoj67v24hsE2TLPiB
	w==
X-Received: by 2002:a17:902:e947:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d3b0ad4dbdmr353272535ad.2.1787029368902;
        Mon, 17 Aug 2026 22:02:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 25/27] libmaxminddb: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:20 +1200
Message-ID: <20260818050123.2901739-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129224

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libmaxminddb
...
INFO: Current version: 1.13.3
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
index 102a074202..32b3a941ea 100644
--- a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
+++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "a66502ea76eadbe17f2cd6fd708946777253972d2ae8157dee1b23a2fb
 
 inherit autotools-brokensep
 
+UPSTREAM_CHECK_URI = "https://github.com/maxmind/libmaxminddb/tags"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"


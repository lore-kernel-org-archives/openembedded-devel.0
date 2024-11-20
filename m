Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A1D743F5
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 23:42:12 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.2237.1732146132344955030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 15:42:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UW3KxCsQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7181eb9ad46so136445a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 15:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732146131; x=1732750931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBqVTQ6FvFoswQmVhFUI9q98KGTj1nlp7By+bvueA08=;
        b=UW3KxCsQ98yyWdKGf1Y/2GS4uTWPGcULjkNqZOobtmFnSHcIlKe9UX8JZOwsb1Vvyb
         kmzV+LeiFLKGyIW3Et/IcsOn9i8nTi3gs282BgOGHJExIARgi4nrwz5pVAb0jTm5fR/p
         6Kb6NofjRjORqENBPSQaCh8h5B4exJyGRN+dyqVCZsNN81l5e67S3ol4dLsUZ940SJDl
         TUDCN8kvAISWfam9LfCsEYRX9CN3l5lLay8OESynkerIjlCRg/t0U4lV9HtMEndbt33H
         hI+bP9EfrPcI+LUzq6zP4DuXnGZdOoejUksY/wMVXG/0qEgM2c6qBnn4aoDRBWBpfDaE
         1Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732146131; x=1732750931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBqVTQ6FvFoswQmVhFUI9q98KGTj1nlp7By+bvueA08=;
        b=Rsa6fcA6gRTwV+Il0H0uvCJ73lRSRc7hxBcT6s1IpGyFH+RqOHuwS481EvWaO+huak
         8fVjE5KqWlI8M9bTqJjyoNCpuNPhr7+o73RGyv0jozAMC9vw5nBbZzpHf3BzL1d3ngKY
         bqTZAbWrBPvXWClpAvC0Ai2qIsaSxz/geTnrtwOrDjlawn20lnmZ7X6iPEsilRU3TGM6
         nHpzLx/heuYTqJ0O+6G7lvqajF5VJmIlmhhGXS2O/0WchWMnTfF7D6hHMxOFzr/yTGir
         3gni1UvthsL47t6yk15dUTPxSxBAp4UcSiWO2eL/aN4eh+TmbTa0eByI/R1Xz4cUNf/j
         RfSg==
X-Gm-Message-State: AOJu0Yyct7skhitrn8AAIpdPp3V515f/wlp53j/0OvTj6TTqdP36dDsK
	R/VQv4tWtH8DFcbGHeIR27NrS09WNBhUIPHM/FzrD1+SEJ+WrM6pteyTGA==
X-Gm-Gg: ASbGnctP/P1J1SZ940r9tB5rEJA21+o69OOvtb5Z1T6eVCiHalxh3wM86f9sc7oQwkT
	wvMucdAxCbGwuO8IMzeDxOzTwChJ4eOdgk47cuDA0qhyvYZeI/6MzRV0/8+zkZZajqjTXmNojRP
	ajIXgGL+mvtivVBSDwackbjqVvlcxc5IRb01R36xAirPGUK+Zr5OEQWYNVCK0j8lkFLDD4Mrhvw
	sf+6nicx9qZ4z06st+jquBvOwe/R0nV3APXnyGA7T11wnhs4+IQ
X-Google-Smtp-Source: AGHT+IHaf2UI0OMdg61ifebPDCZ5ec2EvAb+KUsDAlz/WGpIoHhCb3M3bwCze5l+PMQ/e0bzb3rDpg==
X-Received: by 2002:a9d:590f:0:b0:71a:8048:404e with SMTP id 46e09a7af769-71ab315c296mr4361747a34.11.1732146131348;
        Wed, 20 Nov 2024 15:42:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb6581098sm97163a12.67.2024.11.20.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 15:42:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-yarl: Add missing ptest rdeps
Date: Wed, 20 Nov 2024 15:42:07 -0800
Message-ID: <20241120234207.753368-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120234207.753368-1-raj.khem@gmail.com>
References: <20241120234207.753368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 23:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113944

Needs rich and colorsys modules

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
index 17fbaa38bb..07dfe4b635 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.17.1.bb
@@ -24,8 +24,10 @@ RDEPENDS:${PN} = "\
 
 RDEPENDS:${PN}-ptest += " \
     python3-hypothesis \
+    python3-image \
     python3-pytest \
     python3-pytest-codspeed \
+    python3-rich \
     python3-unittest-automake-output \
 "
 


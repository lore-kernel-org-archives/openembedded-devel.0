Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FDECD1296
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 21:25:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.92293.1712525154198899423
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Apr 2024 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ror/vfAP;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a4702457ccbso497075666b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712525152; x=1713129952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5JuklimNceLxm+/Pa1oUnrIOBblOLzzs9klaU5d0WI=;
        b=Ror/vfAP0ivvkW+QUadm5ZJKxDBqGCrrGdOJUWMb3p+2+30IXSmmwKc9vzKPqVOtp5
         Xnu2kkFyW4UkpBBUq/hwlaDSHM+3mgeoxlolOb2b0B/cIH8UtqQXCFCcjjpbU5NiVdXU
         841bfINDoXNHqxpbv2sfguhE0IOLIYhrYFn01x6wRF3Gbx4PrU06xVa57BHmX6hdSBjZ
         33vmH/YCtdagwNIkqAVW33Gq79KOX2IwU966USXXJAED2ZMah2XJMxxOZMZ+Kr8PnkvP
         AKG9k4Ypul/F90/IA4etiYIv0u7/wyfJ65nmopGAoGStb4msDwKpzHbWv58xUaZrdFSg
         b4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712525152; x=1713129952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5JuklimNceLxm+/Pa1oUnrIOBblOLzzs9klaU5d0WI=;
        b=ksbYXn1NTOMdGU6EUYWlGm2XoN2SBlAbSf4O1omcEGZ97I2Lfkg/6l+nTIC0Rztuwp
         xjEJXbk6OwCNKlQw8q6L9WgpbT9zbU7uZdsVxiQ2a6zvvK8Eq4ZH7aRptiCa7aWwcXS7
         EqG0sbPMT+prOuoAOHgdourOhCwflRoAFmVzTzywmv2XdQELGzWqJUVGh6j9AAgR+UQ2
         huNXWYeK0sY5vfa/0nHR51p1JXvV0jR27FXSfpjRmmtG+kMDVOcwTYIZOrVNso2CtsIj
         UlclW5+Mho0R7on9+luLjpieBHHWqLSHp95h8eRiuyvNP1eWn57NI2l26s7+UcqKEvHF
         pz2A==
X-Gm-Message-State: AOJu0Yw8aS43Wbj8wly+2ZowfgA560/RH8j5lr8fTFNuv30hlxZlH3KR
	cmb1wfOI+56eXEtzhZn0o59ELX/zd4bTe3URRz4SrPiV00cWxZAu0pLd8AVeF1M=
X-Google-Smtp-Source: AGHT+IHVs79npDNrp2CZv+FYEZbo+NnGCOkvAy4vLhxRuVugsx/865ptocOHbcy+Zaz1lygNAUZdcw==
X-Received: by 2002:a17:907:97cc:b0:a51:d522:13c8 with SMTP id js12-20020a17090797cc00b00a51d52213c8mr775477ejc.60.1712525152053;
        Sun, 07 Apr 2024 14:25:52 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm3560974ejc.23.2024.04.07.14.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 14:25:51 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-charset-normalizer: add native build option to recipe
Date: Sun,  7 Apr 2024 21:24:45 +0000
Message-Id: <20240407212445.667665-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
References: <20240407212445.667665-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 Apr 2024 21:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109855

Packages such as aiooui need charset-normalizer as a DEPENDS instead of RDEPENDS. Therefore a the charset-normalizer recipe is extended.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-charset-normalizer_3.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
index 0e6d62fc2..ca9a88ccf 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.2.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += " \
 	python3-codecs \
 	python3-json \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1



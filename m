Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3878.1794729039811548764
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JqA3I9xd;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37071c0f42aso3571052eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729039; x=1795333839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21AuoEDXqZzN+Q0EhIgtroUzSiZxAe6FSlmRRS4xuZA=;
        b=JqA3I9xdI1j1kxRoNx/AFFaPSeeVdyN/XzHGeNGKr3rxbBL0lvejdhoKwA18Bw8eDT
         5I1bAWHYzsRPJF7a/Vkswka/NFe1iOUf+yigpryTmRMCf82SGEsmGX0/Tgf7QPhE3IlF
         6VUatSBN/W91ICT8cRwJ0SkrNZ/MwBW94GuZTa0c0LJjVeSagKHyEpbr1n8EHXRiTNne
         GeQBm5gTD4POgIfg9J611oOeD1SgR8CCkjIlax6t2uyK/YWN6GOEOBHs7RmraMO3nbU3
         BOz2XBh/XKkjWGDD4zyls3eTiUDu1RaWLMpWxyRB1Qat67Xv5fk+SvjS2DHP0rwtGwl5
         kSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729039; x=1795333839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=21AuoEDXqZzN+Q0EhIgtroUzSiZxAe6FSlmRRS4xuZA=;
        b=oGshTd7RrXH1MWO0R2o7nLeUX+6HFYyX8ta3Jp3S6PVzYRwFFX080q6qywwsasJui3
         XfWH4Ylp0sw+clcCGkJNc/R4AJ8vN4G6ajI9BYMmb+7/4CJjqRIWJ5JA1tZC7AhIVNza
         VBzsTBhJLH/0LqY1XVjcHqi81Z8i/0lJd94s/zfQd508hCrkX6vUdHdsvrzhywkm4667
         fOM1Unptpt6vMf2nAnIexMQQNzFPvL7Vied8luIM1ZbE1+ghKIYq2px67+2EiCe0Aj6z
         MM+771COaWOhkqs2zpRgnvgUUZUO1VCP9Oec8phK9jGMpsGdP9C1ciMOTuhM8ySJy90L
         eFcA==
X-Gm-Message-State: APuU4Z8XSw4MkryiTmTRZVy32nZvtte8YBbPalsA95HglHhCzLmILvtZ
	5vTiALAAHnmeKIWXLxO+1yw7RDLpr98r3VEmTKXhf/SJeWkuAdymlZePmjyMs8Ii
X-Gm-Gg: AYBFou05H4JAzCpEW4YPWxiM6acWCL8spNRt3Nb+WJNIImLkc+fU/8lmMXHN63P5IEp
	DZCCB7xfY5Zn2JuukjOfxI4uZQNRTJD8iREoEv6+aN5q8udQWywRzYcZ0pA7Q3Q7GkChi+gfJuc
	Qe9n761wQDNPVQb9gLizUVeAXepbaTdkCmYw92ux5txphCOr8fllD3Btzy/xYAMWVCay+whS3BR
	pF4ntXNygrA+Y6FcAeNpe1IoN37C7cY4gAsnLIZt7SgFS+X3JeRwN1wqM0+CUUEEXB9Pioe3Ucd
	9ajE3OlhgvLclDI5clw1racS6rJnfpZetMImlYGcLcjjgO2dML2h7kJ3tkHuOmd+XMl1eh/eXaB
	ZQGW9FSCuSIQjE0j7z9Oi8vCJ4pwiraJkhSPgXSAYxgzwoSuX3yFUTyUYICrEzXKvE2kaR6mt49
	rZzjye6YeQklYvZflt2xCXuEhjlcKjeHWiHNTjgKNxglGQd2mPsVfk7NgekTMEb+CReh5JAwq/m
	yhsLyBqJJ21ny+NswrM2NIReAd3Ve++3+O/co1rCKXaG9AndlEQaQb7atLo+7E7DeeuI4uOuxqe
	GqDDu4UcGzBae4SZgUC8oAOU3Ew86+nWAmulbZZROtcoG6SFUMtPQNL3XGvgowHWRqkcoRXGnD3
	9FVbYW60IaAxxCZhk3i6J+tMTxGb01OuHDdtWvBQkEkGgdFNC3tPIc+rBngbat9k/7VclUAVPBD
	v2yKdL5AIyE2wuO2w3E+UjM9XDd93aVyGN9ULXWexJqMgjgalZumzrd8A2I078kRl69vq4N6zk0
	rkuyH8CvfvXzMUr/U8L7ZStS0nsXJ4yRUwy4Nwpbre7RBDIts6xFxddxLxfFnYYgTe67EuGHdyw
	W7q0/Q==
X-Received: by 2002:a05:693c:63d2:b0:376:f63a:cb24 with SMTP id 5a478bee46e88-37963376ba5mr5822657eec.3.1794729039089;
        Sat, 14 Nov 2026 23:50:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 49/96] snappy: upgrade 1.2.2 -> 1.3.1
Date: Sat, 14 Nov 2026 23:48:27 -0800
Message-ID: <20261115074918.2932593-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132319
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../snappy/{snappy_1.2.2.bb => snappy_1.3.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/snappy/{snappy_1.2.2.bb => snappy_1.3.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.2.2.bb b/meta-oe/recipes-extended/snappy/snappy_1.3.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/snappy/snappy_1.2.2.bb
rename to meta-oe/recipes-extended/snappy/snappy_1.3.1.bb
index 7601fdde50..d42d9e30fd 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.2.2.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.3.1.bb
@@ -11,7 +11,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
 
 SRC_URI = "gitsm://github.com/google/snappy.git;protocol=https;branch=main"
-SRCREV = "6af9287fbdb913f0794d0148c6aa43b58e63c8e3"
+SRCREV = "9c28114a38866f6deeaa826db918293bc28ae410"
 
 inherit cmake pkgconfig
 

Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.242.1617899808803593808
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X5gLHJ1V;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso2953163otp.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/6HeRsYWzeAMgTt16LRY1W35Y069AKcuIW2BxbN8gAk=;
        b=X5gLHJ1VQIG68AQSTi78k6NTqdl604NmmQOs2boKW7cadrez+uRIkqGh6/tpjZaOFs
         wdgAsiyGWoL76ZfXSUajzxcTIMhgPdrUO9hqPN6IVEkqI+vORxWwUtvRXcnC3RF3bFmM
         rki8wh5wV8N+CFbBUFcJaqmgv/VI87ZftwASgo30gEJ+cRPCeMihz64dwXLUnR4HHtRt
         p4G+lBi37gRopG/U5jm2fsnIkqHdtKVlIlthb13SZGBqmeXE8SGjriRY3UJIhiwTUJ6C
         GaR/hN1EjnSodPoBDl6MvI6/LfRn8CLTZic8X8FUxDxJWtBrAkOUMz0kYV7F/DfP3k8R
         fjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/6HeRsYWzeAMgTt16LRY1W35Y069AKcuIW2BxbN8gAk=;
        b=Fb2f9OsvsMlLPr5/I7g364m6l9kESbCqqXCy8/OCb10O8fnkO658iG5UtUCnnqK7yx
         YpLksxQtG/K4ipVcKnMTAtkHGzXT9vEUytujRECIl2ysyu6v+IUKI2GCZXRHuZx0m655
         N31478mt/RZymYNELQPequi335iPfRB5F4Zc2DEVM0Lh77kmsV+VI6ufirj6kIzbaZFL
         IoqNZfrJf/lT8X5pOV/IlIVpo18WgHXTxcSKlIPNP3oHj5EYijGG9s5j+AQ+00+drC17
         DcAR1WYChvCsmtFb2P9XmP57AwE0DFvl2DHyKCvoFNcWwyKNHNe0KC0iJmLXpzc9Nzls
         wchw==
X-Gm-Message-State: AOAM530mpFzAHFK9REEuKy/vrfD4tjWGnofXXDhwlhMfVsDptKnwu8dl
	gBr8sqaw0DN6va11N9BRmbSvKGI50GY=
X-Google-Smtp-Source: ABdhPJx3w67Pnw/+xmuzexvBPiDCs2v16ml02EV+r6X0YLmT4wJfdmo8FhTihrY3n1pTg9deHRwELw==
X-Received: by 2002:a9d:7c99:: with SMTP id q25mr8534774otn.339.1617899807900;
        Thu, 08 Apr 2021 09:36:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 38/64] python3-pymisp: Upgrade 2.4.140 -> 2.4.141
Date: Thu,  8 Apr 2021 09:35:45 -0700
Message-Id: <d6a31cdce720031677bcf730a666f8856e589a9b.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.4.141:

- Use get_uuid_or_id_from_abstract_misp in tag methods
- Skip nameless sections in ELF
- Make reportlab tests optional if missing dep
- Enable taxonomy failed if global pythonify is on
- Properly pass content-type
- Re-enable support for uploading STIX 1 documents

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b3b8d4f6a637ce695030921d4d335f5941380b53)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pymisp_2.4.140.bb => python3-pymisp_2.4.141.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.140.bb => python3-pymisp_2.4.141.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
index 32e673660cf..c8bd52f105c 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.141.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "39a7b8242f0d3022276d417ec334bb46b890ff23"
+SRCREV = "4a0c1e1dc42af171d3c1bcaa12436f79ff6cfd9b"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.17.1


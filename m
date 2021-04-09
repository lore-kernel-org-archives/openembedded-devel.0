Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.3630.1617934865397243303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XTdgRS3k;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id a8so4273041oic.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=u7VS+gIxX8LAxYO8fgd6HgR+cc7d8NpGceXQ9OF48No=;
        b=XTdgRS3k0LfwJP+V626R1qFP9W0UURMPIb/oJE669GErIiee76MiCpHWtBLtcip5cp
         mP4L5xURqO0WIqpagBYBfRSsXdE37ubboWUDb4k/S+ZAYPFuHnq3vZHLMMauBl+qMiiA
         +MPIU/gq8SdG8Hh2k+dGUV7nZy3B9S4SIjs5qaPqBEclJI4ZmaVn+zrcEOqQz1YLsxxn
         VLp+D2NMb3mu9JOZyu7IpOMlBTPCBiK52h+QEnLEvVMSMk3yqETivoT7XLgC/GDG7WO+
         WGj9PmLr6DmeW1Q+Fs6v5Sg67g7QtC5V4kIB0rLv8E4IscQLFA3VdbQCVZl9vBeOvDe7
         3A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=u7VS+gIxX8LAxYO8fgd6HgR+cc7d8NpGceXQ9OF48No=;
        b=baRRelRvl6p8ZGmCmvcNM8aXO3HOHfQ1ZOvu/cjC1TyH4Q52LrPdKuqAM2ZqimDVaP
         REjtDrYtsWdlUAXlBfFTV6+Ks5RCYsDZyaXgFIM1HVfSDsE9dUBQVZmqe2xyGfnBHiy6
         KITf8B6vUVdrM2Dhgcd0EExan9nZ6z5/JUmRs1viewkkZAeBqe46cP2/+OxrmgqcnkNZ
         GTcHc7bPkxweF6iX2cDxtDGNreg7ou8pectGebojpVwz+Q/elW8PJg++Xe2eTxsMwaVJ
         NMkErp6jEJ+GETUj3rpc4tHLN9+M0WRKxlrNXZKwjlY9513kvAOR7JRMayq02WZ9HfXH
         ZW7g==
X-Gm-Message-State: AOAM532Z1LCoCJlk1Z23fEyumjtKpj/qKLx89RIZI6bwwSHBsYsCnyV8
	0lirZoE8ZLRt1pUSHHYhqxDeMf834ic=
X-Google-Smtp-Source: ABdhPJxB5qAz66s6W+vcOUxXY3kZbsw3BeFHK6vYsRYnj4HjZPEltvTpwpViNeH1nWwN1g9REIgZ6A==
X-Received: by 2002:a05:6808:14c3:: with SMTP id f3mr804959oiw.52.1617934864602;
        Thu, 08 Apr 2021 19:21:04 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:04 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 13/36] python3-transitions: Upgrade 0.8.7 -> 0.8.8
Date: Thu,  8 Apr 2021 19:20:26 -0700
Message-Id: <04849afa784feea8f0fd9ede932adc0f5a8cf8e9.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.8.8:

- AsyncMachine does not remove models when remove_models is called
- Introduce try/except for finalize callbacks in Machine and
  HierachicalMachine. Thus, errors occurring in finalize callbacks
  will be suppressed and only the original error will be raised.
- Show references in graphs and markup. Introduce
  MarkupMachine.format_references to tweak reference formatting
- Introduce Machine.on_exception to handle raised exceptions in
  callbacks
- Machine.get_triggers now supports State and Enum as arguments
- NestedState and HierachicalMachine.add_states now accept (lists
  of) states and enums as initial parameter

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit dce8ef5add115eb1ecdf39d547e5c566a92b2bd6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ython3-transitions_0.8.7.bb => python3-transitions_0.8.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-transitions_0.8.7.bb => python3-transitions_0.8.8.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb b/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
rename to meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
index 04a033742a6..2b82df5814f 100644
--- a/meta-python/recipes-devtools/python/python3-transitions_0.8.7.bb
+++ b/meta-python/recipes-devtools/python/python3-transitions_0.8.8.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=baac7be1f4c17620df74188e23da6d47"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8c60ec0828cd037820726283cad5d4d77a5e31514e058b51250420e9873e9bc7"
+SRC_URI[sha256sum] = "e7a86b31a161a76133f189b3ae9dad2755a80ea4c1e0eee1805648d021fb677d"
 
 RDEPENDS_${PN} += "python3-six"
-- 
2.17.1


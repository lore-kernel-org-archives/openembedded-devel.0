Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3895.1594353676450902425
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 21:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dZpDRV3o;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id j20so1953990pfe.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 21:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Jri8Nruf0EcWOAXeOy+IzGRC4n3K7YNCBYFFTb9DL/A=;
        b=dZpDRV3oBKEbQ3lWOSV+/RUSXak8eCC6wMbX/XaMcFPiMY05TKQP70SWwe8u0koVBj
         7eryC9NglxENLUvpxBEhxzmek3hH6Gyi4Sf7XsSkSp5H87Gz7coqKr/uOojlkJrfQnvZ
         aYlLmv56hx/JPqm+DRSCHlL4Hu7mF1IlSUWnElyhTRS8q9f0M2kQP2I8oh0aH/FvPyMG
         UIO/kqexwPyMY5SsomVDQ9St6D6JJ0NGXiybrhPOEv9dduyFN9GEQtWMX2PH2XFn9RMU
         5nP5ngfxk33YllR3WDTZdplboI84WJxhWEInqyID/KTLM56ArVxstPV1LxGVbl4pOhkG
         FEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Jri8Nruf0EcWOAXeOy+IzGRC4n3K7YNCBYFFTb9DL/A=;
        b=qHIT0S87Q/3hqX0VNPiCljQLv9ZLVOMNerihbnsIEankkOUfTa+mwXGGUjo1u39b51
         FBi2E+CG8kT/EKjEIB9h4Uxv6of2zfj249Sd3Wf77MLK42Ztz4VvS05jTmBwh0iOlF5j
         qMD1SkRFSxRxniPemqRt47auSf4gEYJ3xkudnA16SFrhxQaZVrCGJ58aFJbJ0vziS0JC
         OxIrlyjVukLet6EUtHm8EiNiOfabYt7pjRcyyeHlxrEomNzpB+4+tN2YLEPsVYg5x70H
         cVb9LLH27zMnwaQjrixbaNyFCAA4WmciLGmT7ZgUAv+23H7gTfTh9zQ83Qd+FheD8VCx
         wF/A==
X-Gm-Message-State: AOAM531YkngHLKCeJIWsKGQC0XrsWuX4UEFpxVQyT+BvwdBasfd1bFzb
	LrCKCQF5Gx4PHUOu+vI670UYtk6dX5Q=
X-Google-Smtp-Source: ABdhPJz8Er4+d9nFfcVnatXyzPuODQYZjyXl3a0fhMKTarskgXpzzWDt+vsRCcVp6CqDTV0sIgShRg==
X-Received: by 2002:a63:140a:: with SMTP id u10mr59356656pgl.238.1594353675829;
        Thu, 09 Jul 2020 21:01:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:396f:c9d9:1d67:d8dc])
        by smtp.gmail.com with ESMTPSA id b21sm4101405pfp.172.2020.07.09.21.01.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 21:01:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/4] python3-croniter: Fix missing rdep
Date: Thu,  9 Jul 2020 21:01:09 -0700
Message-Id: <20200710040109.22600-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710040109.22600-1-akuster808@gmail.com>
References: <20200710040109.22600-1-akuster808@gmail.com>

The last update introduced the need for natsort. Fixes this error:
  File "/usr/lib/python3.8/site-packages/croniter/croniter.py", line 13, in <module>
    import natsort
ModuleNotFoundError: No module named 'natsort'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
index 0c28948f63..123d176137 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b149
 
 inherit pypi setuptools3
 
-RDEPENDS_${PN} += " python3-dateutil"
+RDEPENDS_${PN} += " python3-dateutil python3-natsort"
-- 
2.17.1


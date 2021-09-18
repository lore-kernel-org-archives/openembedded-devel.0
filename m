Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.868.1631984272003212391
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mw8ieZJU;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id s16so3941519pfk.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0X9qiEMO9t/JaOdlwDKlafRIWsrDvi9CRTI9Hz9NF68=;
        b=Mw8ieZJU6VfUT1PWPPxLrBPlX+yyetgwrboe3mDjESe+4w6Cwg1p9e2Sb+jbPi7uoJ
         pcwgXYfuhos9Vj3nNtWsdfp+O9Bl9G9URU5dlChAiJjATWdXgq3c+677D7ebV1v0Z8j5
         ItqIsEarz0JmRAZVKApIqlI82qJ/dZxLoVsKGZMkZtKQwo/r23wmlbsOb2e+SJVhMopj
         ivI/I+iiKW8DjEaqxB4M+NIcMqkz5eShr+n2hjXprgSkMsgdav4fTBsVbqGODtKr0XwN
         ZjRtPFShSRz+nSPJXdzi3XQGZfdr6Yu6maoPwJ3nxepVUl9f5aTPVJuqq2dXpmK+CZdW
         DX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0X9qiEMO9t/JaOdlwDKlafRIWsrDvi9CRTI9Hz9NF68=;
        b=AeC/klYpuQzo8maLZ9afVrY8pHGC2s6usajGpMxFO7LeYkFvP6Lul8CKCdcYnErY4h
         Oml/IFobvmIjptxVAM854l01SimrwTKd4CKjNeWsjaKbFJTCaEdyLzoG/v50JRU/x93z
         oO7IADN/r4fFRgq305c/sBL6bLx+O7V1DU0iJVS/4KvVt/k8DYZyMnoEkUBunnb78Tpy
         ZsgVHU8WFqsjrhJOdFno6SyXPpgkuraNN8Hwn2NMT/4WZk8Td4qwxIJyaNB76k7THWfn
         +Add+CyXPE8Li64MOTFIWFVO4jwXTyFQntJnIzm7zLXPfpKStNg3DrmjhJsqhMEp3hd1
         /yFw==
X-Gm-Message-State: AOAM530OOSGrryX/p63udGyuwELDPz0cR267Syg7vPk+vcjmbf3DiOl6
	0vrEhhFSk4OOpgtIDikunupJ0wkl7Tk=
X-Google-Smtp-Source: ABdhPJzHoOJeiuA+5MgfZr6PafasWv5nY9Xzjn4/1uef6q2aIUmrIFiCz/JGj4VXdY7kESBGbZColg==
X-Received: by 2002:a63:9911:: with SMTP id d17mr15615896pge.111.1631984271373;
        Sat, 18 Sep 2021 09:57:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:50 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 15/18] python3-kiwisolver: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:35 -0700
Message-Id: <20210918165738.2581429-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
index cf14c49e6c..dac6cd48b9 100644
--- a/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-kiwisolver_1.3.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A fast implementation of the Cassowary constraint solver"
 HOMEPAGE = "https://github.com/nucleic/kiwi"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://setup.py;endline=7;md5=e54bd74bd9d0a84ae3f8f6d21ada0ab4"
 
 SRC_URI[sha256sum] = "fc4453705b81d03568d5b808ad8f09c77c47534f6ac2e72e733f9ca4714aa75c"
-- 
2.25.1


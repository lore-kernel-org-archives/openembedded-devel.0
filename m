Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.13130.1589110148491388309
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2020 04:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qqei7bSA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id 50so6692854wrc.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2020 04:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aS0J3tA5n02WgrXJ7gZK55Ivr0vGl9bcrxNjnRgR0iU=;
        b=Qqei7bSAYwGe0Fenour0MbP9j+c/Xhptel599jkvg5VdbasGt4CHI8Y3FER0doE88S
         IYgzrKxUf6NGDv/mw2KbnoHEwkZJijJoqamssCfXfLh0FGfz8vwltRe47Wq0ssllM0XT
         SoV3mUqngtGtAN2tMrfcZ0MwID2GhOvHt7wLqcnT9OJDmAeO6S3TuKwJlFnJXbq8NAso
         5T1tdM5B55eK8xvdwKFtVfGtZYpM0OPKH5JfBEwkunTy/Z/1jUazKjz1juyBb98keQTH
         esiFDIQ5huvAOIZT/CXK4DcLU/OiVXHjyXQTe653Fuyk38lJnQHP+xxLq3Z2IBw4IgKD
         ch3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aS0J3tA5n02WgrXJ7gZK55Ivr0vGl9bcrxNjnRgR0iU=;
        b=nMDFXAN4Z3QUvkvpBn74r8lKKiQVHsZjkAf/r2D7E+3sR3rz//BwdwmER0/qg9lQa5
         mJyeNc8TvQ6o2DpwtlmkuKceFLQMklkSCWkrNbBWFWAXgKnWwOhin0p43e8Uk9siDS8D
         vnG7FXl6dOj6mjNEgiSPiHjErTeh3KYn/mi8ln1Qwaise6yRZeEWD+18UaqGAe7qUTCL
         CAD4CpNdA/A7RIOb0i28LOx5fGpsLVCaYsgWVRTGcyhESUQOTnyOWc3gNpMmuVSL/Kc0
         fDWAHH6rbbxXmO6mrcl6WLPVpuFclBCLK3zM0Zx1drZ50qC390A2dUa15hdy3L1RG1lI
         PoqQ==
X-Gm-Message-State: AGi0PuYXhW7igbCUSruIyhiZerl5k1wjP9Qxv3RQiVNvIhTFTxveXCHK
	3pABJiDxADP2A+vR8TQfNY78EkFA
X-Google-Smtp-Source: APiQypL6nnU9/qr7lwPjm4qROfg8DWXiEvQOjh7MbQEJgQnhGWuDYH2WiOXDLHV2Clc1/vrgK5Cg/w==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr13454707wrs.350.1589110146860;
        Sun, 10 May 2020 04:29:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F085F042F904D54ECAC10E7.dip0.t-ipconnect.de. [2003:f0:7f08:5f04:2f90:4d54:ecac:10e7])
        by smtp.gmail.com with ESMTPSA id k5sm11733319wrx.16.2020.05.10.04.29.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 04:29:06 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] qpdf: link libatomic explicitly on mips
Date: Sun, 10 May 2020 13:28:51 +0200
Message-Id: <20200510112851.31218-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200510112851.31218-1-schnitzeltony@gmail.com>
References: <20200510112851.31218-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index f04e437d3..3883a8dcf 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -20,6 +20,8 @@ EXTRA_OECONF = "--without-random \
 
 EXTRA_OEMAKE_class-target = "LIBTOOL=${HOST_SYS}-libtool"
 
+LDFLAGS_append_mipsarch = " -latomic"
+
 S="${WORKDIR}/${BPN}-${PV}"
 
 # avoid Makefile returning error on 'make clean' before configure was run
-- 
2.21.1


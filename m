Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.13087.1592815990596083450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 01:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OV7AWVp5;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id y11so18358760ljm.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2020 01:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMW375rJ97lMP2KTuiRwtxLyak7GuXq2wY5HfzyB4BA=;
        b=OV7AWVp5CXO+iwbluiNVhLewsdVEjJNdiPy1nJu/d6mhOpN9B9THQ85FqAtop22ZDk
         dWKVzSi8XFP572J1842iW0fp3AuRnPCHq049TyUDy8/FiwTCbihA0lQXXIzWRKrhqhT/
         YVRkWv7H9CODz1krV0GtwUhYR5ud6keJk9wEKxWVS2aejvmk5lX0eJ9tG+o54BQ8w7OV
         sE/iAF5AGqqTtWDo0ax6YELIxHNjGkL2zLlxt9NT6ygoIxrgleN6BOXpzqT+W7JqwuN+
         wv3dF74KUjx3qf5oFwO1V4dNW5uziDdoooHcViXq+whe2BZd0M8D34jvvUCUOYtPFUhP
         noVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMW375rJ97lMP2KTuiRwtxLyak7GuXq2wY5HfzyB4BA=;
        b=YeFvxaFbI5L/lul7v3ScYCNpXFECtvKQt/MroezMFjTsFbnWiU+/+31DzWZ0ZvVm3w
         6sY4LVwr6NnoPPkcfnvFqgAbzCOabcI0oEYiIL26sVKl+xJAsOuUqfgkvv5otwS6yABc
         TOMCEArDar6PgY+n65Og7H7OhvUS/SxzYL1dvvbNBkpm7YJjmPedLRj7KJhtZVFAl3ST
         /M81LjDEgI2frPv5AlZU+bb04zQnfx7ScDEiDrko+Lv9mqFK+9x82akDQEWoFAugXc6w
         VRJd5qN3JfjiM7Gw//2uQUJ74I6ZSrIzdiVYvmkhzwsLPQtlFQ5nrS4iFCSZEKWYK+VC
         /vXQ==
X-Gm-Message-State: AOAM531FuQQ0nys5vWNSujbaHPdPViWRELTPQPubvudpiFv5vD6j5bvp
	exyARBNETkPEKp3yBf9flCP3QKqTABA=
X-Google-Smtp-Source: ABdhPJxGqFCofiX9+JM5/ik+W2kzLcKSMWSQwqdTEb8wqKDpd3RvqQIViX92FZETQjc5Q2Y0k4mmDQ==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr7253038lja.117.1592815987364;
        Mon, 22 Jun 2020 01:53:07 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from eriador.lan ([94.25.228.18])
        by smtp.gmail.com with ESMTPSA id w6sm2616453ljw.11.2020.06.22.01.53.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:53:06 -0700 (PDT)
From: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lmsensors: do not depend on lmsensors-isatools on non-x86
Date: Mon, 22 Jun 2020 11:53:05 +0300
Message-Id: <20200622085305.2374048-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lmsensors will build isadump and isaset only on x86 architecture.
Depending on this package breaks lmsensors on all non-x86 machines. Fix
this by enabling ${PN}-isatools dependency only on x86.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index 890db55bccfd..9c561e9f477a 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -95,7 +95,7 @@ RDEPENDS_${PN} += " \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
     ${PN}-pwmconfig \
-    ${PN}-isatools \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'x86', '${PN}-isatools', '', d)} \
 "
 
 # libsensors packages
-- 
2.27.0


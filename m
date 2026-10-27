Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14674.1793092887932088024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=reSVxyZm;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso482117f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092886; x=1793697686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re85brAr5AlKOPqYXWbFAXLfTp4Bu0BN1/xRjmOh7eg=;
        b=reSVxyZmHmyI9zwPs5yU0BJWLf8QHlkFg71rQoVVRh93qXeDl95DTcdeSSR5t8AdMO
         SW79SwdIZR9jN2GexOv8OVsMLn3+6y843Qt73TgItMo+F1tfoRqaxl6l2cq3vF29TvIG
         sg8GDE2tOT7/FeZ4Mqr2LNquzhyzyV/nuCGig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092886; x=1793697686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Re85brAr5AlKOPqYXWbFAXLfTp4Bu0BN1/xRjmOh7eg=;
        b=c4HV/fxhKKc0wPH9EJwMbE0YDEC33UYn++EPyZTE8xt60pbJ09p3cBT34kbaxdCdt8
         omiMZxPTKGd/jesN8QmbShNCrvh9r7RU1Z7gjwKsfsTpnnN91SgzNTI4LODm1R1ipCxe
         GF9zhC7VNtnjzD+U5FBtjcEBGvlb44T4P9lhxz9ngdrqMLpzLMWzvXIB0KopgFqHSQWl
         35wzfgZqpPY2Kwrl6mF9ickYQMSBRkq30IirVLiHXN4ZSi4wxJV/HQ3xuMwPLtJcAL3e
         JOUiCEpUuonDqnpB/2GcMkA/Nb87WByA1qm31+5UIItyiQk0Q8Eiu95KgpZxiu0gPH+W
         Wk3w==
X-Gm-Message-State: AFq9FYIA2ToSH86ml8nj+RypEzdSUrYvhXTUyC3o5gXCsaQ6Kkps+Ppc
	FcHuqj0XKYC7+taJoxRBUvT1AJmGX+y62HcHkL8Y0H5NMqkhxR13VXvtqEtdIIP/ulh1Jy2ZkER
	av8Ga
X-Gm-Gg: AYBFou0zbSQPQzkkr+dkqUa9h7tpK2p6HPEhqfykIf0BI0WWYzU7fXQpfNatBsGNbKl
	pFMRHs5T7na9DAwplC6N2/7Epnb+J/efmdppaOJUkOglK56/SYjvHO8THzwfB8uNGopfUBeEkm9
	lFdVfeNzXApZP7D914oOg4tkAfy4pmnC74jo/De+4ZlqESGLSJCPL7aXqCcreCHrPKlJWP+NFAT
	rys9dXLDFxWYZwaHV3cA00gmF0+fYa8V4GKFUZROApS5cT+WE/zeZRo7AsEGa7RL8XTd5rMVt0t
	j2UAkcmawSyt+GsD/rPZPnpNUwca8AmBO4qZvJdNjbaOJGsj+iCFAx9A2iaDuOgLWw/EmtU659D
	OsDTj9zNwjoxu8nPn8zWjl9yeyIflZWDf2Hi/kWk1qHLD7kZt3bmHYs4vd9Foz+Og18+EoISS69
	9HVOMdPTCo6TYpiLG0M/j0qPUrNok60JDC285a1K2J5rFcCWoSWDJPl6hQlwYqlb6ASItuvwasy
	EjXpxJNfKhHV3dSW5eM55teaPTi0I9xZuT4g9aJ15k7FQ98e7ZV4BAHbpxLebzZeVDHEIf6pn24
	X4FJTBvaXHlkmBfc2U0AWBkO8r+5s6s9T5ht4lCWTGvG/1STcao1wBHFp6F62R7NSbNTj7dOpgB
	z4UiE
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr46298715e9.10.1793092886250;
        Tue, 27 Oct 2026 02:21:26 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 46/61] python3-tomli: Upgrade 2.4.1 -> 2.5.0
Date: Tue, 27 Oct 2026 11:20:13 +0200
Message-ID: <20261027092028.782979-46-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131510
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.5.0:

- Binary wheels for Python 3.15
- Set nested inline array/table limit to 400 to fix mypyc generated
  binaries crashing unrecoverably in constrained environments (e.g.
  worker thread in a python:3.13-alpine image)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tomli_2.4.1.bb => python3-tomli_2.5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.4.1.bb => python3-tomli_2.5.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb b/meta-python/recipes-devtools/python/python3-tomli_2.5.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.5.0.bb
index b95d208a82..73248ca434 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.5.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "7c7e1a961a0b2f2472c1ac5b69affa0ae1132c39adcb67aba98568702b9cc23f"
+SRC_URI[sha256sum] = "264507556cd8b8c8e7c6ee037cdf443a463f03f4c958e57195e3d369711b8ff6"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.47.3


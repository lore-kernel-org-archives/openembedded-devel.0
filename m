Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E4DC46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:45:00 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.54219.1703173494838220083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b7d65d4eecso35909139f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173493; x=1703778293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSVxfgzOYbD2QOBYwurqInPCrx7JjT3KYxwzv4inAVk=;
        b=g8fZ5rzvmDnKscu6p7PQIhu66L41973kUCU4HzT48LsAtkvl9A138SW11eNbAo+eBJ
         deXgX0rgkLKDGPk8igp+82kebA8iwU6cmQQUWBWlyZ0QCuoGVoJQ2GxFw1FGzH77i79P
         oVrafA7TS5aMXRKjxFoI/3B9PcRxpNlZlOWAkhw7UPH9JbNTGx/6vuxKY/6/Ha7K4Ekg
         f+NuPAbXkjIWGzdxk9Vw9/13H7AHAmD/OWnFe0ue0bbau+jutXZGrEDhNfQgtn+/pX7M
         0ylj05e8cMCNA615rmsPm6s5P+P2h30mlA1nKna6AZ1ioQsJEjQ+U1Yh2IgkT33kWWV8
         clTw==
X-Gm-Message-State: AOJu0YzGzvfgvaCjzbjXGb9JR9lgNzYH2jMu9Ldl2EquTLkU7otcUBsw
	1WXxaDu8X8cZwdb1nsXnJRLLyR8BErRTwA==
X-Google-Smtp-Source: AGHT+IGhuwe2FN5y/9oU8a58y5z/kaXJo04HQ58C5/E1TGVA2Y5dOyN+Ozh7Yf2iI7h+iYCfRvqOXw==
X-Received: by 2002:a05:6602:73b:b0:7ba:95fc:5dd0 with SMTP id g27-20020a056602073b00b007ba95fc5dd0mr321197iox.18.1703173493290;
        Thu, 21 Dec 2023 07:44:53 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k28-20020a02ccdc000000b00469328386c8sm530578jaq.162.2023.12.21.07.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:44:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 5/5] python3-flask-wtf: update to version 1.2.1
Date: Thu, 21 Dec 2023 15:44:35 +0000
Message-Id: <20231221154435.3874910-5-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221154435.3874910-1-derek@asterius.io>
References: <20231221154435.3874910-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107719

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-flask-wtf_1.1.1.bb => python3-flask-wtf_1.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_1.1.1.bb => python3-flask-wtf_1.2.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
index ec47fcac2..54d7bd637 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.1.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "41c4244e9ae626d63bed42ae4785b90667b885b1535d5a4095e1f63060d12aa9"
+SRC_URI[sha256sum] = "8bb269eb9bb46b87e7c8233d7e7debdf1f8b74bf90cc1789988c29b37a97b695"
 
-PYPI_PACKAGE = "Flask-WTF"
+PYPI_PACKAGE = "flask_wtf"
 
-inherit pypi setuptools3
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-flask \
-- 
2.34.1



Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAEBC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 21:36:47 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.25742.1669844197886494292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 13:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GAG4qQp9;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f9so17272145pgf.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 13:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UinabkSfLSZE9IO40/abJA9cUwMQlI/KaB9brw25L8E=;
        b=GAG4qQp9cXyDxfunCJLAwbunoVnkaN2s6U2+0Maz7wY2HpoDptdds9xSUEFGxv5err
         YFtKp2vMLUCIAo7PoxJRLgHd7vPu56tdikXbYSNQWvOKjWUAqJxnyaqYtIOoQXUK1viW
         8mBgwJOBbX4/APksTmBj7rec3KeglMvzV57VxSHdUkSKcwAZPy9MQeBhy2PFtyh24BLp
         Tkd34mxDYGFIQ2AL2MvXEQTQZ81IUoF/O4VKwkbjq1TNKBTswnPKa38fA3saD/dpiaHl
         2mirdJ80xEL4Ehh7m6mk17sHMAY9a6DydiAZeRJl52kgZgziCUQ8W5DBj7z9vy/h5l6X
         I+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UinabkSfLSZE9IO40/abJA9cUwMQlI/KaB9brw25L8E=;
        b=pW09Xtzc0KpIPcrnyUgULtZBuH151UJ/CLSGpdgOmDGZDHBbK+eSm6Nq1Vvqn2UlHI
         RZfpMi26uChBPEkffzaDb7QzMje/CpI+5JoGzIpzJqo+20dpYQkk9TDth5HwwBmR+J2P
         wK58mOe725FucUqbaLAmBtRiGk5pEwLPBlRXvsDv76Trl/7hqIQhbAKJYtRq4IdGtyda
         qUbqqz/d45P414334I+hhJktqKHEQ8XEoY4YEBFhFJGA5boLgouFNqirqcjpvrTC/8/c
         srjogKaMtUgT/FNWEFSVLY+bgFF8s3kTi41ZGl2VmbDoK6CSbZE6nX4U0sTIo+SrcmcF
         wMAg==
X-Gm-Message-State: ANoB5pmM3sG63GKoyMMQnXvmIn3d6XA6LBBjUhcEWZTBawZLQ9MRptXV
	h7/lkBwAOalVsf7nNeiXYnlYtC4tgno=
X-Google-Smtp-Source: AA0mqf59JUyNnARidkHSPzKRm6Hz/XxwAqWOIX9jmsCohMUL607aWtPJIPZC+OtyvxOoHtpQ0WSMSw==
X-Received: by 2002:a63:c65:0:b0:476:db6f:d436 with SMTP id 37-20020a630c65000000b00476db6fd436mr57130281pgm.394.1669844196940;
        Wed, 30 Nov 2022 13:36:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id w15-20020aa7954f000000b0056283e2bdbdsm1826060pfq.138.2022.11.30.13.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 13:36:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] waf-samba.bbclass: point PYTHON_CONFIG to target python3-config
Date: Wed, 30 Nov 2022 13:36:35 -0800
Message-Id: <20221130213635.1996347-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 21:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99879

Ensures that waf detects and uses it correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 9c32952f6a..41909788f7 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -95,6 +95,7 @@ do_configure() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+    export PYTHON_CONFIG=${STAGING_EXECPREFIXDIR}/python-target-config/python3-config
 
     CONFIG_CMD="./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile"
     if [ "${CROSS_METHOD}" = "answer" ]; then
-- 
2.38.1



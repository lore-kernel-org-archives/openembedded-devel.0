Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A59C54EED
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 15:34:53 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.20189.1674401685164832832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Jan 2023 07:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jHQo8S2D;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-15bb8ec196aso11559762fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cQzhqJyFdur9kF6DDjmLMsbTmHKev8koocvFd4a9hzI=;
        b=jHQo8S2DfJhe70jgsY8XTkpISU00cYTC/0ngGLX+3kuIRwoCLZRiOjtht/uJTLWVB5
         APMtJY63YPyz+paW+Cna/O5+hfD64q1z66u198ZOOHpN4PSW1VW5LAWRAKWzCISoN4rx
         +5L3PRYL/vwitm6G3YTLwTWCU3Uan6z9DrNTuCTaRNNnxDcvCDBgmMjZTNWG9CxUShPf
         IiRlLtoXvkNuLTCF5i3AwTN2PqMQfETLLtZpayACbE5cpE8l59GjZZNgNiyUJCjFUa9t
         oIDtNGeDXJeyoZHfunVYA/MGebXe+b5RLhd8YGWtDD2K4G9Vdnz4t0IT+5u3wCXD4DKZ
         eAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQzhqJyFdur9kF6DDjmLMsbTmHKev8koocvFd4a9hzI=;
        b=Tkdt1H0CPet6E68HkcfWJndOSHXFE/WB8bwygo+dbN3CVOx9P4dAg6vidEoML3MF8m
         os6zVtFQ+WUr948aJl0Txq3lQu9esoEHIiXF68JNi7zGzeHsJ3i1wEAP9v7B5aodvJaH
         7+z868LgTZWKOxCwPca1ZlJ6ax3mtMD0njT5b3U564Ea/oQmO0ffTZsIemVlCe6rdxTD
         Czikqlv3yboZEULZvcKXsuVfEHSil1tDM+KEuYFt6aDNt5isZzHXpwDl1lbI4xwCux4Z
         2m647GiJ5HGyoQziSe2bsGEG/UeEsn+1NS8vyHvm/6zwsuFkijHSd4ypTTAM7m+1NwFU
         iTCQ==
X-Gm-Message-State: AFqh2kqmsd79IShgWT+r/vMH0qptmvuSCvtuLmAiOp6Ghj4JJT+2vz99
	WQ5KW7q4xP+VM0bWRLLzAcYJukzOM7Y=
X-Google-Smtp-Source: AMrXdXtSpKSrQ1Ar0DmBa/I+1AcIj35xuLG1ri0LxDmLCkHkhIHa55OtZ8npwNYqePwAg0CUd+FblA==
X-Received: by 2002:a05:6871:a7:b0:150:22c6:fd76 with SMTP id u39-20020a05687100a700b0015022c6fd76mr26318199oaa.51.1674401684164;
        Sun, 22 Jan 2023 07:34:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:97e4:131:65d9:88d9])
        by smtp.gmail.com with ESMTPSA id fo42-20020a0568709a2a00b0014f9cc82421sm9228112oab.33.2023.01.22.07.34.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 07:34:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][langdale][PATCH 1/6] Revert "waf-samba.bbclass: point PYTHON_CONFIG to target python3-config"
Date: Sun, 22 Jan 2023 10:34:37 -0500
Message-Id: <20230122153442.213094-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 15:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100702

This reverts commit 4b063f93a731cd6cc486dfcbc2c2f403fd29e7f3.

This is breaking builds.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/classes/waf-samba.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 41909788f7..9c32952f6a 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -95,7 +95,6 @@ do_configure() {
     export STAGING_LIBDIR=${STAGING_LIBDIR}
     export STAGING_INCDIR=${STAGING_INCDIR}
     export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-    export PYTHON_CONFIG=${STAGING_EXECPREFIXDIR}/python-target-config/python3-config
 
     CONFIG_CMD="./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile"
     if [ "${CROSS_METHOD}" = "answer" ]; then
-- 
2.25.1



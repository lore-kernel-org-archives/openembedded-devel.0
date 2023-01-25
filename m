Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61D9C61DA7
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.44860.1674653505939803256
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eefTD5cn;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id h3-20020a4ac443000000b004fb2954e7c3so3133173ooq.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQzhqJyFdur9kF6DDjmLMsbTmHKev8koocvFd4a9hzI=;
        b=eefTD5cnTFjg5d1JvszNpBt+bpSMY7xSmo/VHbKC20+ClmT0fLxx6KbkWhElNsDHwH
         gSxoaIp+GGwBzuXWTbQl6nLfd+eu6rqHhowUWS5YrEGSmD6doplKiwrsVpWZ9vzyoXpA
         9MxhB0kPGSCqSwq25T0LknpbB3TxJacTXuVSEHm+70mewjbeDVTZ/QyayIJlf5xVuAtg
         6EX+1jDfBqVnlpgw5rAH7FDxyAlVxreCzUzvU7cbOiRF3WI9ycrP57TOJI7o1VTVxMW5
         W4XyRgRrK+jARTZaqzP8qY+e8MT1blLXoVyYvtFzffut5fiL7BwIJQdg2og274SfN2PL
         7kew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQzhqJyFdur9kF6DDjmLMsbTmHKev8koocvFd4a9hzI=;
        b=6zy83ksXFLl1ozgxiu6zQblJGOI0gIH3UqQddGXZTHeUuh2gsq0r3Irh5I4BbU5r5y
         IbETx/9BNc1yc+6zs8zgEcrPnaIbDU6is6TL+n9uFfoDsp7QP5wd/QukXNECNZFL5FjQ
         S7dPsWAT+rlyn83+X+wNKaXwA5yepoZOByItGfwssXaG/T+aBGHQG/FyBcfcwy+7Y9JF
         gxGXTVhh1TErmsS9XhVQDyOiI62tcmpkKy+ZCHnWKLw4Lt6Fr+Uqby6zGdW9qM1oUYUy
         l+Ek5S9eoP8IRm1nH3+ByRSIRi5OlE+o5Jv5W6ydRUIgyXOkeMQBZL/m7qX44UXViHrL
         0bOA==
X-Gm-Message-State: AFqh2koZ4mFaxHjFWqVkWKx4r4c4XhqQZ3ZJP8UnWqTNGykCrIrWyHlP
	BuwIy9kk0lVZK1qSo4sT+Vps3xjoXLA=
X-Google-Smtp-Source: AMrXdXs4d62DTTb0HXNVsk6PLLDaXMiMW4HrpnGRhuZmOXEVOZIXFA9tCTVSQbQ2i3tBX0NYzwcNTg==
X-Received: by 2002:a4a:c284:0:b0:4f9:1696:a47 with SMTP id b4-20020a4ac284000000b004f916960a47mr13215694ooq.5.1674653520486;
        Wed, 25 Jan 2023 05:32:00 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 34/41] Revert "waf-samba.bbclass: point PYTHON_CONFIG to target python3-config"
Date: Wed, 25 Jan 2023 08:31:16 -0500
Message-Id: <1d2e7a6b3d36e58ed28bafbb5bdf4536c54b419b.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100769

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



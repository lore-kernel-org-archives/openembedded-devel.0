Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF11CEF166
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 12:48:51 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.8269.1728391728476920127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 05:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QvvZXIW4;
 spf=pass (domain: konsulko.com, ip: 209.85.208.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c89e66012aso7372187a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728391726; x=1728996526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY11rZwR0qV63Ydd2w5xps781ROL06dSTdjPsw0mSCE=;
        b=QvvZXIW4YH8OeCpglZQbhlcBOO/GPZutVjL6oWZmozj7OzzCGUGnHhC0dsiVuPHp4r
         NZsoBNNSUIEH7TG4Wq7cz6ygJpydSJnC3GLJQJXKLCob4IgV6YeGPTfkU2E33xpZXP+8
         9Pu/18d90CgBbiBvXQSIVvB1nJPwA3b4zBQHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391726; x=1728996526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY11rZwR0qV63Ydd2w5xps781ROL06dSTdjPsw0mSCE=;
        b=Sx1bPqIV4kkULpOvGymTfOt7kZPxXzrgnLgpbuT4v8Rb+s4HMC+REWRS65HvW1olXo
         +lyRMPUW3HJHVz5oFepgvR0MFvynXLXnLJ9Mm8smuBcaVd483NuqyYyEqKP7O36hkln5
         969naZceBSfivbHM1OuMNynQKRr6So0rh44SFrsJeaWPhfkqKXVlzv3VePQBoitaaO4g
         0oG5jCQWyM39Z0FTJOzgltPxC77GZRbIJCTCFHVCpAVdV2qqpNth55gwmKkjnadWX3/0
         Ygh+ShFUi9wS5e6cTLIQs0gnEHR3LMvMsH/dDpt/JB7MKZ8kODCp9y8BiWPLmsOYTSVx
         jjKw==
X-Gm-Message-State: AOJu0YwDccfSP/O18tPaBPwtUB2pvHFp5oYndv0Jhky1ta1RzhX9xVfS
	jRl9ut98J8UbOkExPFOdNq5huDYEbqDKrjhRSGeyL9zBdLI7B72C7ZvbfAk4sdAAaawQWs8zRT6
	5
X-Google-Smtp-Source: AGHT+IHjghCjOzRAK/D+fMISQ7ATMeGKlgJwgkybIQmzjnMCX3fy22mdDnrC6xhFaFdH1NdkZUHt5A==
X-Received: by 2002:a05:6402:5108:b0:5c7:1922:d770 with SMTP id 4fb4d7f45d1cf-5c8d2d015cfmr11421583a12.6.1728391725934;
        Tue, 08 Oct 2024 05:48:45 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05940a6sm4313704a12.1.2024.10.08.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:48:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-humanize: Upgrade 4.10.0 -> 4.11.0
Date: Tue,  8 Oct 2024 15:48:37 +0300
Message-Id: <20241008124837.675442-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241008124837.675442-1-leon.anavi@konsulko.com>
References: <20241008124837.675442-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 12:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112713

Upgrade to version 4.11.0:

- Add natural_list
- filesize: support the ronna and quetta prefixes
- Update French translations for numbers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_4.10.0.bb => python3-humanize_4.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.10.0.bb => python3-humanize_4.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb
index a8668e148..ede3dc417 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.11.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "06b6eb0293e4b85e8d385397c5868926820db32b9b654b932f57fa41c23c9978"
+SRC_URI[sha256sum] = "e66f36020a2d5a974c504bd2555cf770621dbdbb6d82f94a6857c0b1ea2608be"
 
 inherit pypi python_hatchling
 
-- 
2.39.5



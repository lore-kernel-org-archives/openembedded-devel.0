Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B418EA4FD6
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 15:19:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37441.1771859985235883348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 07:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NGG2Uuwg;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso42620975e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 07:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771859983; x=1772464783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASMkaUQE14M51phhF1XILyg/npuI1AEhjv6TpGntQ1s=;
        b=NGG2Uuwg0608kDcB7KIzfwISgUsyvCjCJr5OgZGof+IdF27RCpICW3Mq3EP2/bgKj6
         rKprOul2pye9pD2eNRj/zQhBccWNVDN0g1J8Fzqow214VMYrUO0EMjSbatePdaK55Fuv
         yGw1/HLYmt8VMOKX0i4kuroUiJDr5yjfO6qdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859983; x=1772464783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASMkaUQE14M51phhF1XILyg/npuI1AEhjv6TpGntQ1s=;
        b=SZjjKGSSNWV/kjuxREEZ3TDh3K4IyPMC2HrW1uOnSK7tS5XEzz1B3BjwyjjYFOS+uX
         5AnWWKk7lJm23XBx+TM17FYdfckOx5RmRaIMxqKOJM5wjXMqjs5HAhSmfXy3wJtLNh/Z
         TNQ2H81wifS6XHDyGCBqhs6+9hehIUhmHBq0p7nEGVHE/U5Oih8S99a2X9cMLVeZAuW5
         SDF+y/BP1GcmDcGfaudo6xjjlXvu5jJBcdzF5uHjfiUZakLFxLa6f6OHJEPVyNzljou9
         5nsWG6rM89bnsO0lWoR5GhZc0hVhgkrP5cQmT2dboOzKkKhov8P9hjesqE92po8KrYKV
         KVCg==
X-Gm-Message-State: AOJu0YzGKovV2SKVAgod3VMppCf/2acrJlzgK3+ajSIQz9n4LJOVDCiH
	rIYGB+iCwEu7ZJJlbPLjcOtvkQ20ppdHZIGQtND7ODWaNZRSCU9yUEOCDeuAh3MxuOSGbrkB8N0
	bOWxD
X-Gm-Gg: AZuq6aLzdnScmITHNqUp8n3R2zcpb3RzQRe8TJLmEpsjtKJT2WRE1zh6WLH9tjmhkeX
	v1wLl2JSSIglvudkyW4je9F1VwtG0kKuENc+CiPLkwN7G3JTqUK1WOtzS8R8AhoN8kfynApQ3Bp
	PKNuze7biwVqsELW4FAbIvF5oEIF6wzAw0ln26NhVLMKYFG2+gyhigGH1ySRHHWWJVE1aV4zNYG
	rRNK55MTMHo1ELGnxKs3j55o7ToI0rWlfVNKlX3UaWlQWUr0u6FQG0+dlK6oGxrnXT5RoyKd0Gq
	MQaCGNVruwdwA8p5GfpW2dxj0R4LpTY78S1+o5eEUBqiSJp4jHgabumpZzXSeTrvql43za+P4l3
	YkoJufDcBI7TFOHSAR5BCFf0AV/q9gxRPvupdbgLKW05imczez25M70oXKwqXPQqAJROd0ozB2B
	NQnWM1ZX9FSIMs9eK+MDBBQJ3rZsKLh4PEezos
X-Received: by 2002:a05:600c:45cc:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-483a95f554amr149014855e9.23.1771859983048;
        Mon, 23 Feb 2026 07:19:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb4bb3sm195184285e9.14.2026.02.23.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:19:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-isort: Upgrade 7.0.0 -> 8.0.0
Date: Mon, 23 Feb 2026 17:19:38 +0200
Message-ID: <20260223151939.1352991-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223151939.1352991-1-leon.anavi@konsulko.com>
References: <20260223151939.1352991-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 15:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124550

Upgrade to release 8.0.0:

- Update CHANGELOG for version 8.0.0
- Fix edge case of __future__ import
- Fix the Plone profile to be compatible with black
- Remove the setuptools plugin
- Turn some warnings into errors in test suite
- chore: replace black with ruff in clean.sh
- feat!: remove old finders flag and legacy finder logic
- Fix whitespace insensitive check triggering on tabs
- Fix line separator detection not considering form feed as white space

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_7.0.0.bb => python3-isort_8.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_7.0.0.bb => python3-isort_8.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb b/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
index 86ad769b1d..36cf91ba6e 100644
--- a/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_8.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "5513527951aadb3ac4292a41a16cbc50dd1642432f5e8c20057d414bdafb4187"
+SRC_URI[sha256sum] = "fddea59202f231e170e52e71e3510b99c373b6e571b55d9c7b31b679c0fed47c"
 
 inherit pypi python_hatchling
 
-- 
2.47.3



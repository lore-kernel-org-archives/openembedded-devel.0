Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743FFCCD186
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.7553.1759409980481448138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQUF1nHX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b48d8deaef9so98508666b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409979; x=1760014779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYsTiZ/cUb+1Vw+WI8dc++FiaDU9jZ1LpPg/tPpUdqs=;
        b=TQUF1nHXWgJA/uMzScPO+tBDVqi5GBKQ2VeZaWYu+DS+upt4jgOTvyOV9e/1mACli+
         q1QC5B5OPeo7eQTvjf5scLd7oISsSfXxCj4LF61XkdeUhHhWh9ohKyIZ/hm25o/eJP/H
         h/VgnHvLT/cS0fhDw7lUcQVcB+tiENQlEGB+sK5aPNZVLplImqmPi87gFGmWT4zBhey1
         eFTaTpGv1HqawUY4a3NoCJt+h/U4rG5oEAIuIPRcVk6U3mEssnL7K92EELaGC6EZNCVC
         LVcobLxcsnUKINJQQx3SkC8q+UgdojMgbxjrc0bBEbq2Qp3GiKeS1R1RbMja8738q1Av
         2EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409979; x=1760014779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYsTiZ/cUb+1Vw+WI8dc++FiaDU9jZ1LpPg/tPpUdqs=;
        b=lEC96gF1W4/X2f4Se8NIP3g94h9g4r0iFoZY8YDcJ4kbp+9pB64mswdNQRzG42SYGa
         Ch/wl+FuVRThNBwWJsUpANZyDMUf6vvaPpI9krJvsTryaPcBrYiceIcoixBtUXb517Zz
         Mgg8IHXoGFA2NOh2yW5F7d8KcmRFuZFMHykBvFIYNmcCUJsm+uAmP1vsDDy8I7xRm/52
         6f3GZXnWh0Z1Tun9HR32BM8B5z7He3MviCf5E6HxZzgh2SrPHT9MqIcjpXJb6LJjxYbS
         RSGLs0h4S/Q4znyAhmEfvwLZ322vtT4PERuY/6JhxqheVjiE5wJFtt7rk7e/9t5dPmA1
         O2hw==
X-Gm-Message-State: AOJu0YxH3NMM/d26EzUTQSMDr3mJ72kOIB4hxjKuyV5xUmqPOfAYXvH0
	LFidKQLypIOGJGIp2TDuXG9YohqKEWUJ3mIVjhfTgrxr45oKt2csY784K/sYag==
X-Gm-Gg: ASbGncss7MdfmQSaRJR4B0BTEZz06JqFncxyoLPSakc8eyluDESJQ8yYVel+PO/4c7w
	jgp8OsDYMSqBqueEqgqgKlkAsQhWF7MlQk56CAimZnH3zZXtTgqAi3soEAdgtNyd+ET8IikrM6t
	CRMWp4wMjyN2wfBtKJI11QvN6MhqNns2javaqnmegQV/U/ErxMbEV8dcTuD/Vr/Gj4b6UYddnO5
	VMG4t2nxcxwaZxGWu0/VAH+UsUQUYh1Pnfwsnh7jJrxZv+L5xczN2JGn9Q/U53ES6cgFeANrZvo
	ckZxL2T50weZEMNHcbtg2Xf42rNTNvRmNIwJBWMmcIazGcstTa4xqFgpqp5nqF77E57ndYczzvq
	MdnmlW4AcSlgZtRrEc0FwJxUqkq6Vbt6rxdR0V0RU+NYdlKWip6IvS8q2kKoXCLIaZA==
X-Google-Smtp-Source: AGHT+IH7h0HT/bgYVz7q+UaTxrtid5ZwC/mZEYmYej5uz8kQvDgmg+VURIk2POrtt/nBf+HCw2jAYA==
X-Received: by 2002:a17:906:c107:b0:b40:8deb:9cbe with SMTP id a640c23a62f3a-b46e2434dc1mr906940866b.2.1759409978617;
        Thu, 02 Oct 2025 05:59:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/26] smarty: upgrade 4.1.0 -> 4.1.1
Date: Thu,  2 Oct 2025 14:59:15 +0200
Message-ID: <20251002125926.2624522-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120184

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Security
--------
    Prevent PHP injection through malicious block name or include file name. This addresses CVE-2022-29221

Fixed
-------
    Exclude docs and demo from export and composer #751
    PHP 8.1 deprecation notices in demo/plugins/cacheresource.pdo.php #706
    PHP 8.1 deprecation notices in truncate modifier #699
    Math equation max(x, y) didn't work anymore #721
    Fix PHP 8.1 deprecated warning when calling rtrim #743
    PHP 8.1: fix deprecation in escape modifier #727

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9374648c390aebb87540781de54b0caf85340b16)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.1.0.bb => smarty_4.1.1.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.1.0.bb b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.1.0.bb
rename to meta-oe/recipes-support/smarty/smarty_4.1.1.bb
index 18753db2b7..df441e8db2 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.1.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.1.1.bb
@@ -9,7 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-SRCREV = "9e0536de18b53ba193364291ef0303b0ab9903e1"
+SRCREV = "71036be8be02bf93735c47b0b745f722efbc729f"
 
 S = "${WORKDIR}/git"
 


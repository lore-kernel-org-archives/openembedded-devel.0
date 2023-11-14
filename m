Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA5DC4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:10:01 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.11211.1699963792173561066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:09:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZFi0fywn;
 spf=pass (domain: konsulko.com, ip: 209.85.167.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50797cf5b69so7563097e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699963790; x=1700568590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvEm173SS6BlJnvieVrQoDQLBl5Gz2XPNrKJB1wNHCI=;
        b=ZFi0fywneBhyhGEoGznOoAZF3rVkDMyaAuJxefFNaseOP899RoLu2G5cWcTs+H07Jc
         44NKUGQCkBQMzRp09PgqNJlil+gw8JgOkTHfOxcLOU9p3ccHaA7ZpwjrOoCxwODsDDMJ
         AyoTOzrS6U3sGagb6VsNTsfZH62/DrjeZAhLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963790; x=1700568590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvEm173SS6BlJnvieVrQoDQLBl5Gz2XPNrKJB1wNHCI=;
        b=dldQb4ICkeBU7pG/cn35zBX7gUEoh1VVavHVnBx+rlxWcVs0xM3xERaz4dabIsjtPz
         ZdoDZ0eEJYmxpjkurt77F3gaoEeMiscCLYbiTW7QfPrXxNKcS6/KriHbW5oUqjDc2mhj
         X8FA5EmZWLFmMsrKz4B8lqIgdQzbZQLPUVwojd4nKfoaAcj6/KoanyylT8waKFCwKwY0
         sEuI+Mmn8/Nuic6hNLxAJs8oi7HLuBbVNFs6E1mhu0f95MalETk5KOIPvKnBPux9m6CN
         7J2RBMVnWS/hdtep4QD7Z+FjoFrHXI1QoiUwYTIwdB8ALalz6K9SPVQEf/qMu/htJv+M
         Zdpw==
X-Gm-Message-State: AOJu0Yzlj6+Ceh+sEVk7W0v8eJoJ3zrmYE09r2gLnjiHMlKsTy/SlgOq
	Yn3K6YebJPYvZafuoqZYmfaTivEL84SqdxkIvFE=
X-Google-Smtp-Source: AGHT+IFuHwgGAgXPHSw56oimMNtWpEbUjeysp44YhSw0u7MEfEv9uoqvlaYOW2wCEHpTfdj6SObgfg==
X-Received: by 2002:ac2:596d:0:b0:50a:6fbb:6eb3 with SMTP id h13-20020ac2596d000000b0050a6fbb6eb3mr6690847lfp.11.1699963790193;
        Tue, 14 Nov 2023 04:09:50 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c505000000b00532eba07773sm4946958edq.25.2023.11.14.04.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:09:49 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-zeroconf: upgrade 0.120.0 -> 0.126.0
Date: Tue, 14 Nov 2023 14:09:43 +0200
Message-Id: <20231114120944.3741068-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231114120944.3741068-1-leon.anavi@konsulko.com>
References: <20231114120944.3741068-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106712

Upgrade to release 0.126.0:

- Speed up outgoing packet writer
- Speed up writing name compression for outgoing packets

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.120.0.bb => python3-zeroconf_0.126.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.120.0.bb => python3-zeroconf_0.126.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb
index 7d5077e30..91adf43b1 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.120.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.126.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "52b25a4ed92de21d10d768c92ab5a9765a88a2ed43dea1260d67bf22734dc951"
+SRC_URI[sha256sum] = "875afbebc25bab002610091ecfdccaeebc185ce69f07a3525e4b86680693ea71"
 
 inherit pypi setuptools3
 
-- 
2.39.2



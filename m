Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.1248.1616604631331533850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DgWE9tuV;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id dm8so28455244edb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Km+M2BPaaPwlTx9DM5zlxOmZHKxFCLz8BjY5nWNts/4=;
        b=DgWE9tuVcJYtgvNgTjsNd+ZxaqCFm1/0Rn8Z1GJnEmm8NOCj6PJhskSW/FtsnV/5SF
         aXbmka80YSHQKgsCzLbkvhpM4hk3px+43KEzstWrfwbenk+gHt2mIU0DcrWkIyL35M7g
         knJh6RvNhJFokogE06Qre0idZak23d5r9YW0kEcr4teBfTWr1xYnSrU09DPUULouepz5
         QEgTZucTnzkH6PzghDry0na+/jjC6PYcECw+87o5B4duvBodZQ+oZFpuxW8UBValsnyY
         2Cg6qwcU8KUCOQtMVsmorA6oupU45sfxvP/TvqekO4NBvPHZcJ8fei4BfFjrzEdJJhbj
         J7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Km+M2BPaaPwlTx9DM5zlxOmZHKxFCLz8BjY5nWNts/4=;
        b=ZOw/Bw7x8vyltA4OqgjXm86KHe5iDNMc6hSb5QcFWyy7wJhb6Q9rXkKxMf39Pizp37
         VAYIzkvRFbRlmvf23TkdGOIGuSINTrcsWUhCCn+5NhrSUmlHz8NkosRUqK9A8FJIGD4f
         QOdcLirwINJvLE+x+QWwTgDo6uxM4unzuGw4Vu+b9e9M99YNlUOotiiHhzo1M1T5ORQ/
         B3Iaje2U5u9WCpoUbOAlJte1r01WFsDN1ZCgGEIjtv5+nubWc8pJUXhyL3JBh9P8QbWD
         YAReVmFwi6tsBrSnYCtVO92NDjNvoLoIhKvT05F24Qz+5O+eMYf45bndfJV8OsNPzl/S
         DQrA==
X-Gm-Message-State: AOAM530B6nbmYOU4IaDWuC7AQwdk6Z7HfgthJ6Dds1Eq/0M5gpj40Y8O
	XX7ps73UoY9PBTn/eT3haGf68Svdv44=
X-Google-Smtp-Source: ABdhPJx/iIyZ1el57vbNW/Mu6DjF76zU7//zd0AMY3K0JMJXroxl0Ct0ntJkdeSVkdL++h4FYEmCAA==
X-Received: by 2002:a05:6402:13ca:: with SMTP id a10mr4434469edx.320.1616604629759;
        Wed, 24 Mar 2021 09:50:29 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f3sm1191397ejd.42.2021.03.24.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:50:29 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][dunfell][PATCH 3/3] python2-target-recipes-blacklist.inc: remove mysql-python, lio-utils, openlmi-tools from meta-oe-packagegroup
Date: Wed, 24 Mar 2021 17:50:26 +0100
Message-Id: <20210324165026.391335-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324165026.391335-1-Martin.Jansa@gmail.com>
References: <20210324165026.391335-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index f83b28a..abf7f19 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -314,7 +314,10 @@ PNBLACKLIST[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PY
 # from other layers:
 # meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
 PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-dbs-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'mysql-python', d)}"
 # meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
 PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-support-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
 # meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
 PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-extended-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'openlmi-tools', d)}"
-- 
2.30.2


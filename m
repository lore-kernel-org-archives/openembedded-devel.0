Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF52C433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 20:04:10 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web09.25986.1639253049427179217
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=FqslA0bQ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id bn20so18330952ljb.8
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 12:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XptjOffw96xD0ljkqbIinRW6jB45mPvcppqpkgJzRfk=;
        b=FqslA0bQUqmVAWBkkgH6zRhhyQM9jXbla0st090BsUui0CzrM8YlRWnphkKmCWtzVj
         ACyXsPQIbh9VRggRvGrXoC0uCzj7JIt6aM3zfvQSoPIqZkG7P62C5UIbv/mETa9CaHes
         rRDbT2d5ASGD2dq4H9siPTr8zNGIB/Tf6pVoQNkAAW1T7IsZfgZPnI2UBsEi714Vo4wd
         m/5qLj1qgYTLF/0mXMqfcTKUFqgHL7oO9Zd8hUV3F9+dOYktXxu4mz5ddaxQMfs8saMl
         KWRG3JIqdKXNgM0hkWcEUIgORCLZ6DN1sixXJlykHLErQcQKAXP8CJoH6XhkLVxGjYhn
         2roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XptjOffw96xD0ljkqbIinRW6jB45mPvcppqpkgJzRfk=;
        b=V0FuZfp/oU3DJs7onQess2uTPHRppskzsgg0Emf8Ei4xjGTd2jzWyzQdAjjubl1AGL
         71Tq1HC8i+Bnaco7oigZLTBubQyGukt/ljXBR/IMIYW94izAIGdmN2EKy0EdgGt+brNK
         TtnMryygbeWDhwD+vDsuELExjpGXHo6ZPM9nhjy6Bq4vbKMaVJGQaUI1w6b3c+oV2yAp
         GAxf90jBqnI8kv5c2oXwyb3GeH0K/cLbU1Etzaz5xH9HJ4mlS1U4XJsQe9sL+Zo0NwaL
         +s22i3ToElOPgfVlxvTS/TOdWRT261cknB7D9lZiejnBxj7YvXfpTcNVbGwYrpztRiLU
         6lAw==
X-Gm-Message-State: AOAM532noxKu/jWox7Qgz3hoeEqv/lwCA1Nh/0wRbKw/j4WWfNhBhpnz
	BSb1RxYY872KmbZjzCMonqciXvzdMDlanZYZ
X-Google-Smtp-Source: 
 ABdhPJxP5kUJAZ+n5pviZ0lxSKnYcv1Qn5Jwb52hql2Bp8HUfjm3TfoZeIcON/jna0DJWOGFVP1v+g==
X-Received: by 2002:a2e:920a:: with SMTP id
 k10mr20078344ljg.234.1639253047351;
        Sat, 11 Dec 2021 12:04:07 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 x17sm756008ljp.95.2021.12.11.12.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 12:04:07 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-astroid: update to 2.9.0
Date: Sat, 11 Dec 2021 21:04:05 +0100
Message-Id: <20211211200405.2612442-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 20:04:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94302

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-astroid_2.8.5.bb => python3-astroid_2.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.8.5.bb => python3-astroid_2.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb b/meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb
index f8f050cab..fee8acb1f 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "11f7356737b624c42e21e71fe85eea6875cb94c03c82ac76bd535a0ff10b0f25"
+SRC_URI[sha256sum] = "5939cf55de24b92bda00345d4d0659d01b3c7dafb5055165c330bc7c568ba273"
 
 inherit pypi setuptools3
 
-- 
2.25.1



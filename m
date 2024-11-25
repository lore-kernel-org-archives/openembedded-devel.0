Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D59D58D4B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 13:32:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.18725.1732541534736546142
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 05:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OswecvHN;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38242abf421so2978440f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 05:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732541533; x=1733146333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9ckccq2HkOgGWYjGrQW7SAPp9nwOYtbnz2u6V1iojE=;
        b=OswecvHNIHlnrkNGwKyyKWb2YsxbB6y1i17SmDJBL+ePmIAU3+P7b0t0+w0QvLK8qW
         6Yahyk5mooLpQyqdgXq1qCjl1gr3gMjXzOiqIVrmz/rMDbSC52LteaaLYfF2hTfeHUA+
         WUPyisrLgICtuXbz8aRjE93KeGuQ+Pg8aGYjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541533; x=1733146333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9ckccq2HkOgGWYjGrQW7SAPp9nwOYtbnz2u6V1iojE=;
        b=Dzz8eDKkliBJ4FIz/oyJ0PGdH+18S2ITLm7e3kqAmQhcNwmdJoyV6e0QV4L+iOd+hd
         tP9oygq4M691FNpmFA2YytFsyUVxnMXqmkyf31MgLXnVnPwf0nWz8WT7GUwRmrCMiK7p
         3jvt49aXrExChQ+2CfCPXxCAjRlXUgYpZ96apZVH625Yv0NS2kfWhIWr54JsjvU49hSk
         6NW7tCoGDH01gch+wZLSF5tIuQW0qFvcwRrNYgk5lKmLzXVoD+WSMXqupVrJHgSVaO5d
         mqVQn+eHgdjLFd2QkutAfhYqx1pNqBMaObUjU2zcZOrRVqvufePr1mpOicm3UJ4JNIwC
         v8RQ==
X-Gm-Message-State: AOJu0Yzymk7rYSu4StHdfK4QfXjRDRH+FBgYfv2g3Bc7Py+dcEQSVWva
	snGxPLc0cqfG4HeiVNaPiexaFwsARtio6MlhqqUi9o1+y8Dh/NpYAkbR9uRti0ckw6ObVqA04H1
	h
X-Gm-Gg: ASbGncuCCQjcmXKBXtHZfU82cuJDTokgOGVaRWhb2OtNrHt8sgfL3p1ffslqiCqtliq
	8HVC0ucNJfVQ18Gz6MrmHqJmonTJgqdEmAIIO8ApWjEOWTxTlw6FIQXZGkStvV9rhTr2mkOWHOT
	yXr9tNepbKReeyMU1JaEhCZhcxbKuZo6kKpqPJYRE6Pg/cnoUrYZSL4tA/xjkN821+gOdH8+1+L
	+Zckt8gc21LVcBwiWlINAl2RPJKWCyr3rcpnMCyxZ75jHTqJ8STLq+aMexXxWtf
X-Google-Smtp-Source: AGHT+IGik4iVMh7JD9wKbZjSfj4yLieSdNvo6/6uuyKPZuuPVuK85zYPdIKx+eV9BeNkq2s/Cy7JpQ==
X-Received: by 2002:a5d:584d:0:b0:382:4f70:10d2 with SMTP id ffacd0b85a97d-38260bcb051mr8471198f8f.39.1732541532920;
        Mon, 25 Nov 2024 05:32:12 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60e5sm10741023f8f.3.2024.11.25.05.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 05:32:12 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-tornado: Upgrade 6.4.1 -> 6.4.2
Date: Mon, 25 Nov 2024 15:32:03 +0200
Message-Id: <20241125133204.31594-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125133204.31594-1-leon.anavi@konsulko.com>
References: <20241125133204.31594-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114036

Upgrade to release 6.4.2 which brings security improvements:

Parsing of the cookie header is now much more efficient. The older
algorithm sometimes had quadratic performance which allowed for a
denial-of-service attack in which the server would spend
excessive CPU time parsing cookies and block the event loop.
This change fixes CVE-2024-7592.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tornado_6.4.1.bb => python3-tornado_6.4.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.4.1.bb => python3-tornado_6.4.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
index b8f6752f28..751f32913a 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "92d3ab53183d8c50f8204a51e6f91d18a15d5ef261e84d452800d4ff6fc504e9"
+SRC_URI[sha256sum] = "92bad5b4746e9879fd7bf1eb21dce4e3fc5128d71601f80005afa39237ad620b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5



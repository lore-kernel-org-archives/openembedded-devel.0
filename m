Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15252.1795015858641692646
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:30:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hyOgDNGs;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so11983665e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795015857; x=1795620657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=silhmbxWTfSfOoWZOILmfeApvxM+czuMGqvQzwV3Zo4=;
        b=hyOgDNGspL0iYWKsUmJCPKObOuiN+54/poru6DlzLjY1COmKT+ryPGI80rI88AK/je
         sAEDgsPwvvzcD886SkKSlbkWP3MNsd7rwoE/MK1KHMPCv9vuq5pUW+DATHbkOUQn/XXP
         KcnhoAxs50zYOFB2Q7/dm8hCwvWsia9FAS7Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015857; x=1795620657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=silhmbxWTfSfOoWZOILmfeApvxM+czuMGqvQzwV3Zo4=;
        b=MXLne7YpvKjRdPqqSbIBzGWVhdDNVqTJE8ukx3ZxwNxJdIjzkpFGCDbQLQJW38TODT
         /7P4rHvt1Vw4711cDVNuQzQrulsA/G0c4XQVZv5L186yaMYDK3YsMji9lxbu2/jDgyk2
         gz28PzAH+2lKdF0NlSewhxh+rv60EKpBuehP7g93fIHBCi7goZyomHqO8lXH/RIowOvZ
         YX/nOp6k0m13pPFJsEuxUt+U0XZP6LmoekAWOWpkYqXp81ok7uXDGfm+lPP5WrfHVWa9
         BjOwjKtImKypylBqiHvGDELAz/NKvqQCC5VUivTPJMpOtVzTkkDBGXw8w/NKlNYzgXeX
         GqMA==
X-Gm-Message-State: APuU4Z8nCGGpvRDhErFMBZZVVVASGIO3F7e5OUv3A8PMBYbuAMUxUjIK
	NToUYcMlgFvu2jC25bNgN1krUolHNevJHTCLusyPPRFsegi6VvqCMbGLF8ZdiiQI80BUdHIEmvQ
	ceYD5
X-Gm-Gg: AYBFou0Cvtq/o1V/uWYxT9kSioT7UMuWCeeHb0q5wejQo08IGzJKN8Yd4n3bjMZ/qIC
	y7x3meDX8tC3VPWjVzNJ02PMngzpfJ6R3ZHNMjtfK/lycf/jRP91mGmNrINd3NYgzRTsrd/CD8E
	F7ODchpulhG2MPkVduOpl32eX/O0RL2u493Eb133CAOFE+9Ex3ThZOydwBNU0rdyZQw6rat3yD+
	MedVMCUcVTCptf/CE7pNA4Tatvn4qw6Q2vHLRAKet8yNEZp4Elxtou5XJUiSEY88vDn1ckIKiG+
	FEA3sYhXGJeFxVzZi1cyhK3V7UOWHmV+PzStvCywUsxj6AmDieCWiMx1f5lTNQUovBWcpQuVIGo
	ccjghAi5by75rDEuwbQub43Q2gK2jvupIF0dYwOxyxyi6yXMN7lqCc0bpbtzchTIBsBpCl+g0c1
	RRmT8YnAXFiR1qksjs91BE3EotY9aY5WQx421OJZY0wtLLI4wb7Wu62M8wstRI5qihQz2gBeefQ
	D5MT3xISSYjtI6/iRQZ0+SE4+u/xflRYjFVVqlVhDQZj/J/t9GY3XOZLcaoQ1HgLCuQh+U5/dNO
	76bvf6TBs/kxnL7rvQwjVhLnWijZrrvVTO7XbOIi96KTgX5SVsL6UapM47FzRPS6I9Qmt7yjMLw
	SpJEyaokak0XvsH7a3gkVyED2XbRpG6mGpyiP05gzMOQ5oo8IkyDFhazMnY3OonoPnfPaaXAVo7
	oc
X-Received: by 2002:a05:600c:840c:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb7d6cc2ffmr56360735e9.2.1795015856736;
        Wed, 18 Nov 2026 07:30:56 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm150214265e9.14.2026.11.18.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:30:56 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/6] python3-cachetools: Upgrade 8.0.0 -> 8.0.1
Date: Wed, 18 Nov 2026 17:30:49 +0200
Message-ID: <20261118153053.922769-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118153053.922769-1-leon.anavi@konsulko.com>
References: <20261118153053.922769-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 15:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132657
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.0.1

- Fix copying and deep-copying @cached wrappers of callables
  without a __qualname__, e.g. functools.partial objects (broken
  since v8.0.0).
- Fix deep-copying and pickling LFUCache instances with many
  different use counts (broken since v6.1.0).
- Properly support shallow copies of caches, including subclasses
  with additional attributes.
- Minor LRUCache performance improvements.
- Minor @cachedmethod error handling improvements.
- Minor documentation improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_8.0.0.bb => python3-cachetools_8.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_8.0.0.bb => python3-cachetools_8.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb b/meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb
index e2c9158a64..345713e4f1 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "5ed01bd676800d51f0025605e4fd8ad0891550513e7b0a4c3da478463764e5c3"
+SRC_URI[sha256sum] = "deb1d376d4d28c2f33f3e3058043b005e0af75c35c094bd54053e27d2906ad95"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


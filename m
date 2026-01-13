Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80A6D29DCC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:49 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53746.1768286148560156275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPytcs67;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-432d28870ddso2665502f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286147; x=1768890947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I75k2+S0AqK7+khywr98UO0v9rjtj12ruP0i9aFZa3s=;
        b=FPytcs67pm0sd0ogmydNFbetl9Pk/8naKXfqdpsRp51Rgg27ebiUyUJNXAcjYhHSdP
         sqilGKmGH4WkagxYuVHvO2B/RUOAjb6uQK/JMyfoBRqx+Bk2VTCG1U9hYMEWGMX+uHPj
         g9XGGAgmGMNgJ4Z9hZBlHiXyx5bhcW4x9BWV+6VwlhLdkn2o6zWlQp87+NnbwlbSs7lz
         QLxoYZFthIW7UwpUq1ciZTmLm/n6ZOT+LGNlu4U44EbQZn7PDspbq4v4EZyxj/5u+jYG
         YtAEn7Klz5W7qji1sordkyBVP8tlXYsnjp232tTcgt8CEqhY2ZgyAwMIzygUib25Zp+H
         8yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286147; x=1768890947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I75k2+S0AqK7+khywr98UO0v9rjtj12ruP0i9aFZa3s=;
        b=M67Ij4ABnO2HHUrH3uPKL9lpYOPCUUxmCjZj9cRzDWkf1oMegwFpSIkUPlA0CFe1XV
         zjZYQgEY2cv0CfOgcnNxhkL52TR5+jFcfw8bi9KLFmEmVPZv2ERaYyPnNnXASiWsnzcK
         AVK/jl95VJr9aEnRZT9Qnna1FQ885ZFscCg32SWrNEjXWHwrTObQZwkKNk8Avs/r6iH2
         J1QWHQ9O1dpOtJlqk/llCx0TdZeipF3ZY4CeWrX54pu6+8Ew4f4rJfBYc5XlzOT2+KDE
         rFIOcxQaXS9wSXBsbLTXegDN/TSRlKuDjKhcl121ByuiGOfUVXsijnZUPbBstjXO0KAf
         gkMA==
X-Gm-Message-State: AOJu0YzpOEVUvlA4/E+VYUNpggxBh4UxqQettHfLNuwh+YgEqIqoC13U
	gUvm9TYsTf+ylIhRVgwb0qQxqRjFZjGaBx2Rek5wQStmfUs/ECX+9Ivx+GU9Rg==
X-Gm-Gg: AY/fxX6qIo5+HyZ8LpjjAVpBFTQmAcNyyaUWca4Tir6FEAVgs+j6LlgovV7RPHD9X18
	p+UwziCVTlnDGVSTGW1u7l2hryt2+84O9m0QuKIlzEhGbvLE234vSjgWAcmZQeWDLBXcKsicUFi
	9h6vXWTGvFOhti45TtJTlU7xZxkoN51pFTINs8HE6GVilH6/xuFZcj2pqBsXqI72Cc84Xm4dStA
	h+GIgqbgtB0hF/yuL65HQSfVsbiZUrrxN7m0Z9oe7nNxxOOAHsDjp2YO8+4FqrXBu3gN8E+gx+e
	2eLQmWTmPkICsdlvlosYY/W6cd7BBwNAIMVYaKChPku4oVWF8/lAVOzYL9B6OQniqrstU99Z8RK
	WJ6pMdb3mB28GrnQf/ldRvYdUdj4GaV7LlCRchWZcY6cf+j4SYp44tOamFm3dULuZ/XW4dZqzq3
	92KU05gJuA
X-Google-Smtp-Source: AGHT+IEV46T8EhQN4iCCGofZVVsNLReL4ezi6mftPiKbbqh7KnSYfoo0mu2hFcNp/L7z2FPENbUkdw==
X-Received: by 2002:a05:6000:2282:b0:431:a0:7de0 with SMTP id ffacd0b85a97d-432c374fd9amr24071257f8f.35.1768286146805;
        Mon, 12 Jan 2026 22:35:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm42273385f8f.30.2026.01.12.22.35.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:35:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-eventlet: upgrade 0.33.0 -> 0.33.3
Date: Tue, 13 Jan 2026 07:35:42 +0100
Message-ID: <20260113063546.1497839-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123396

Bugfix releases.

Changelog:
0.33.3:
* dnspython 2.3.0 raised AttributeError: module 'dns.rdtypes' has no
  attribute 'ANY' https://github.com/eventlet/eventlet/issues/781

0.33.2:
* greenio: GreenPipe/fdopen() with 'a' in mode raised io.UnsupportedOperation:
  File or stream is not writable https://github.com/eventlet/eventlet/pull/758

0.33.1:
* Prevent deadlock on logging._lock https://github.com/eventlet/eventlet/issues/742

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-eventlet_0.33.0.bb => python3-eventlet_0.33.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.0.bb => python3-eventlet_0.33.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
index 6a4449cf55..c1256661b4 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "80144f489c1bb273a51b6f96ff9785a382d2866b9bab1f5bd748385019f4141f"
+SRC_URI[sha256sum] = "722803e7eadff295347539da363d68ae155b8b26ae6a634474d0a920be73cfda"
 
 inherit pypi setuptools3
 


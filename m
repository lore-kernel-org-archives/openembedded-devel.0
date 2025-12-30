Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAD7EE020A
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65069.1767104949101219804
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TVbLkFO0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477aa218f20so61804345e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104947; x=1767709747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tTRukZOPpBu1IJypcf2Q7eSS9iklsohqwcLUPYqzxY=;
        b=TVbLkFO0hImjc+YsuR+Ef1QIwShe3QQtkBN0DDkn18h7gwsNofYGNw/OlHjD6d0WdK
         OesEIkZcOgRrjP0fcqik4eoa+dKyhPJf9j/GsNrFIoRyOUZcAGIUWcycvFhYflfIJG9Z
         pdr9OlboKFkGVR579OwKVPMSi0NhItQeCAJfWSE/N9FRZTlupZdzsqws8VNhryjonxNv
         j19tHU6tGYAA3PiQSqAnxhmSNpJ80imgVNJ/1J+gg0ozBmtxoNyn94nV31hoVmYv9YVg
         2wpm9qoyhXcPg+2vV0MPS/p3gv9oRJtwUomFIh7vG0bKUMWK+EhO/FK4ZYOtH2OyiTC9
         5YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104947; x=1767709747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tTRukZOPpBu1IJypcf2Q7eSS9iklsohqwcLUPYqzxY=;
        b=L3G03M25l6xJmWtERj8lvoDNYjUG446x62znVXzI1V+V+UAsK1css3e19R3IeS4zk9
         laEG2+FvTyFTnzpxkXKK/K+XNVtElRpyi0ZN7gnY0fCUuGOMCRp/amAkXhkXPbnuXoJ5
         P+W9XWJeDR/FJ/d7VhLvsiDDDplWIDwszMTxKUiBVfM0zp2I1Aw1qYh/UwWyr4N8Tsrw
         dvqGF3zb2A4rqpbyntJm3YEBMqVA2TK5z4pvuZw9T3v5h6PxiXb4jDwcAO8tLMddwJtq
         hJ/KPRsBDdJwcctFuLXGO9V/sej5N1VWq503bHw0QhIddT8v8B/RnD2m3y1oIGirfYIf
         jaNw==
X-Gm-Message-State: AOJu0Yw+qrUg1F5ybxnfnlj0ij0GUh98Nr1PvrRkEB/LwDNw+Nsa+B2m
	KXrFftPjcYXGvgFgHPHfVeagPrJp0GbQTTxTekIREpnzYBQeHjAW7umgTW9zYg==
X-Gm-Gg: AY/fxX6UEgFkgpTqolQ9qcYIc23hwtmiy3jQ9qwKpckCzqn4B5ajpnN4Fj7d+wHN2+x
	+qWCQ6CndpSFhj5Jq/ZBxyMyZ2cwwCBAd3Wt4fujUBvFgP7Eo4yI0Cr7HbOZkdelbX5/WN5ff7s
	ACa7+rLw4zH0Srn8SrKdTU1AvFJ20BrF7s3ErTbYXVx17fCMoqjTZ8IYfJWiTC//c13unNhhV/n
	03Osac/kdGZgJNKIfRFZQ0Hd2B3hnkKbuGVcsgvRn88pvxtPCU9POKs33PEtJxZX5cYIXFx9iJf
	muETzld39U6NqE/+jIQOrij58YrAK86Mu0f0EwIs31W1tE21J3rEFfyMrT0nJsw5Nl6tD9KmVpw
	486pJLwIekNLx8M/fu1Xa8N0rQPsAf/H+75ZQQ/pv7FdLvfgqLQJ0vu8CKRiQtzvSKJx/D0OVOh
	oEJ33puODz
X-Google-Smtp-Source: AGHT+IGzV/Ca9YPSdzZnUHrPw1D5yj41d7/mzDnTnO91gglPehTY9T8EHhwfUmQEgFr6gZ/qvuIrrg==
X-Received: by 2002:a05:600c:4e8e:b0:477:9f34:17b8 with SMTP id 5b1f17b1804b1-47d195330dcmr381045945e9.1.1767104947451;
        Tue, 30 Dec 2025 06:29:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/10] python3-tqdm: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:58 +0100
Message-ID: <20251230142902.730667-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123022

The only related CVE to this recipe is tracked using tqdm_project:tqdm
CPE, so the default python:tqdm CPE doesn't match it.

See relevant CVE db query:
sqlite> select * from products where PRODUCT like 'tqdm';
CVE-2016-10075|tqdm_project|tqdm|4.4.1|=||
CVE-2016-10075|tqdm_project|tqdm|4.10|=||

Set the CVE_PRODUCT so it can match related CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
index b04cbd4b9a..b768ede830 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.67.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
 SRC_URI[sha256sum] = "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
 
+CVE_PRODUCT = "tqdm"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native"


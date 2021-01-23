Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.11360.1611429930531456993
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 11:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ikmJYymz;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id c127so7258576wmf.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 11:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ugOVUu3q4CKmOcX0sX6SWFfHcMrfDBD51rlG+12jwdI=;
        b=ikmJYymzEJ0VicG6/ikp17hgi0D9obKI2eqTRejzqg/9keKkBqBXGXB3k3Iljo5lAr
         gCa7QvsWXhYySMe/Usf3UrThPPuilzxaREpMiTLNwRjsQg7A3puH29ctx8Yu3KVx9hX5
         Ux/3L475WHUjmcZTbcrDJMVU/K1fXCXYlapmCQTWpwCreR9vabYepmq1OylX7BRaYQ9H
         0EQmE4RMQZrSS+f4JO74UMQwpYHEqM1JJ4fr05xrWbA7MCugsAlz3SKjWOyZJLhx42dp
         dXUhSv35XAZ5flmLxdLnQUVC7lAccMjOjIQyhFULid6Rq9cTLgzHgwbs0ZIRFVTW4EJv
         tfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugOVUu3q4CKmOcX0sX6SWFfHcMrfDBD51rlG+12jwdI=;
        b=YhXKTGTx9mTs3Rjsdc3M+rTe1mPGwszfUmoZUxGO9nM9W4m4Wrke53IFY6YKN3qPYs
         ftIJROqB5AzYyw72hcwIfGM0KT4YB99HgeelZeDVVSPDV+c1xNvhOIHAlcoxjuB+wKb3
         4/9jZhOZqRiQTEJo+f6942HKtNSkvdWy6TJUP6kDupkbnKtgV9XAnsIMatGau2PoxOBE
         5k0UCikMBtK46JIk2vQjNvs4ybEnYJAo51UH3SHbbk3c7ZHNFJCflRk5WaYM9Xs8FMTk
         yuyHuYzrLiyOsBMlPgeEGrCSk+IWcHXrC5yDZYinOQUjXpy0BSJ21C/rE4HNeDx7tU6N
         v+9A==
X-Gm-Message-State: AOAM533J24flSkhxUiZcF+L9NRVZq3tdIyHyWwsQerx6BngZPSaNFPl5
	6PcHhbXBpV3KBFV8PHrX5KEEyTWXhkpKLQ==
X-Google-Smtp-Source: ABdhPJyLmFxj7hnFb+K82nLQk4YTKCZqWbtNPW+DI6IwidGd+0L7QspZUQlqMG0Rk9KfUjgGtv+4Cg==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr9179608wmh.29.1611429929175;
        Sat, 23 Jan 2021 11:25:29 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5532665fa05402b8466.dip0.t-ipconnect.de. [2003:f0:7f38:e553:2665:fa05:402b:8466])
        by smtp.gmail.com with ESMTPSA id n11sm19159740wra.9.2021.01.23.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 11:25:28 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH 4/5] python3-asttokens: initial add 2.0.4
Date: Sat, 23 Jan 2021 20:25:12 +0100
Message-Id: <20210123192513.2663547-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210123192513.2663547-1-schnitzeltony@gmail.com>
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../python/python3-asttokens_2.0.4.bb           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
new file mode 100644
index 000000000..c2149336f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "The asttokens module annotates Python abstract syntax trees (ASTs)"
+HOMEPAGE = "https://github.com/gristlabs/asttokens"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+PYPI_PACKAGE = "asttokens"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15b8842b027eec5128"
+
+DEPENDS += "\
+    python3-setuptools-scm-native \
+    python3-wheel-native \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.26.2


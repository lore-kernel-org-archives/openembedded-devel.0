Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5B5C3601B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:27 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3923.1743454881756302201
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZyBmGcxX;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac34257295dso946989966b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454880; x=1744059680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFt6nVL66bq4vp7KLs6jwetO/3rw2A0umxsUclMS9tk=;
        b=ZyBmGcxX+dMfgC5SXIEKnXhlnZ+yl56nOr0F8moI/+ZdDofmC7ZuiExaIwoTe1Kuvq
         GTIskRRtU0Rieu38q+Skk1lF0oRcsMRx9bTMWpkym4/VZ3wfy2KaUMsJnyQTlyOBlHio
         gmPttfnPXnJ8asXO+AoPyomnXKOxRwroDEfuhrx4yodYrdg0sITTzp3MOFQbVyErA2zp
         8l41G3xQ7cmviyfjaW1K6rjeH7tAPe0sC+EcOBi76GMqFIHLpzEgT7fZvLbFzVgeaVgt
         HEFOZFAXVY/eTE0b9lfkA68RuJXHaH+IWN+HzPFJhfnQG6rTTwlkDbeY6P+1Tqrl1tUw
         TFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454880; x=1744059680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFt6nVL66bq4vp7KLs6jwetO/3rw2A0umxsUclMS9tk=;
        b=EVNeMhbCgyIHcd+0dsk5UX4JmLxc5niY2IZuI7H0890NPDJI5L2jxFs+HzliGlrOEp
         WbpfWb+hp6hdxvIwDg6qVZeFbq5yKkquivSyshs0x6UKWIncX1dOcgBkIYZUVkJaLjbQ
         VbpvSvzX9apRo6TX23jMxV/sp4S5gbe3naY8db5v2ehMgk8+qishYQ20/fvgZ7rkvNr6
         Ma0ZNYqVtHEk+TutLUfvRXFr7rn19hyLAuGh3UgWyrcMTlczGleJwieXsfZLBvK6LLtA
         d8Bv2sUBgwxlkb4Fva2TD6ODjZ1021OnRonLbGzsVeln8+KkpiQ1lRQSTdlwyO5UBgbc
         q17A==
X-Gm-Message-State: AOJu0Yz5ONcY61Ru4mYctMXYlthcISc3dpWAdUh4bYmS29XRJpfHYlkg
	77dUC0oe46RWSSvaEmmxnAZPxO0fToB96WBgC+/a/frG9NS114qqWgCZ8jzL
X-Gm-Gg: ASbGnctetp6q0FUjhbnBlgpRIPFBHqE+GwDsg4yeKIK1n+t7iz8iKjeaLXopPVR+FGE
	YOT7yrUMwC6HNQ3oNehU2boWv52ig1f/bxBU79vjAE9pZih6vsdFybFtakhjgJp4Shj7RYYQICt
	AplzcRDwEb2b1R/s8D88ocCAhciFSY1KIlYpy0pc2x6XvjllWUdaaR2K5HyBJd2ibqCuC+d1R4C
	4tDr96is9EeOhWT2WWJCQ0nIipk1N49SWfXZB7AMcKP9/gBMZt1BtUqi0lmfbxwl6oVQC8MTJiT
	y+i2D4+vIWLkPxHeSiFI4lioGZ36LFHeGgVH4lzIyPqhnJo=
X-Google-Smtp-Source: AGHT+IHseHfyJz/ZG+E3xj0u4QdlfgRLj0CYJVWMgNnV6oHsmWvP2gvBWdMtaveV4XzKKwUBuzvkvQ==
X-Received: by 2002:a17:906:c153:b0:ac6:f6e9:6ba0 with SMTP id a640c23a62f3a-ac738bf61f5mr854503766b.52.1743454879965;
        Mon, 31 Mar 2025 14:01:19 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71961f8acsm676928166b.98.2025.03.31.14.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:19 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 08/21] python3-kivy: Remove buildpaths from comments in generated C sources
Date: Mon, 31 Mar 2025 23:00:48 +0200
Message-ID: <20250331210101.3460858-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116444

From: Khem Raj <raj.khem@gmail.com>

Cython does not provide a direct option to disable or customize
the metadata written in the generated C files. The metadata
includes information like the Cython version and absolute paths to
the original Cython files, which can be problematic for doing
reproducible builds

Therefore edit out these comments from the cython generated C files
they are nicely tucked between two known tags at the top of file.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index 991aa0f7d8..2c66db188b 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -70,3 +70,10 @@ RDEPENDS:${PN} = " \
     python3-pillow \
     python3-pygments \
 "
+
+do_compile:append() {
+    for f in `find ${B} -name *.c`
+    do
+        sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" $f
+    done
+}


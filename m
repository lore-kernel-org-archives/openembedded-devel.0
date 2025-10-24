Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECF3CCF9ED
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 17:57:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.25.1761328672973339741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 10:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIGSWxDm;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47106fc51faso28499475e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761328671; x=1761933471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hl/oM08pCu+7e8idjbLjK/de+kglY4wg2BVd37r5+H0=;
        b=nIGSWxDmO+npf0Hl9At3cJOpyxQDnHl24UseE88xnUMEVOREF96K4dmMASdYtwUJUk
         C1e48cRs3TUYy6L81Dfz+zZJUofLCTkKvd3TseXjVq3WoGgQQZwbd9TOuUNr8I8dIc8I
         FXV9g3OJRHDjmDu6a5vS9ehcDFwAsVxMI0xa8Sx0z7Mc4d60/xTM5XmKwcubNmlXkmAo
         YS7XgRIoHQ5QXvc/9q8hDfMOFo6KaMLsC/GyuDEgctajrKpyR8zTSMwG6UlZV5oIjDiY
         AZMOXndOx+wBK/gHVmx21xIQAnodb+KgP3z5BttAnG6tg5KB+EQoYgJ6aRJ4NJpQpLya
         Tmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761328671; x=1761933471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hl/oM08pCu+7e8idjbLjK/de+kglY4wg2BVd37r5+H0=;
        b=mguh/IVqVi23jwp/tqUZGpMQPruQjchsdlGRA+No9vmOlw2hzDZDCNfdLLFApTvN19
         kggAXOX9NSjnm20SkpDjwTjT3cK7ssLfgcBoCgTlClxLemj8KCMxDGLKXnwkW5Z0B4YD
         FLyhnze0wdZDGcFLPshGyTz+6h/xZBBkUPcBbfiC1HQdho+fS9cg/nA3Hly4BymMkLcW
         74vQKVZr6XkIzfgMh8BKGyojGxlaLwXVNxl0XB6R6i0B2dM0X76934Bl3wdwA4XPOsJh
         zLAXUkX6feoWwKqQhG6lQyDDuWmztc+2ZghIUw62e+0fu3KABwqOjArx7t1cgzKA5LH7
         +SaA==
X-Gm-Message-State: AOJu0YxisvrQQIJXjjJcN9VMIEmPkg74IyFe5KCI3gorwS3GWDE4W6+V
	i17hbToKBufZeA989L8i8JifJ5aAGlLi7m448Oq6dR70jpCX0MfnqXRKkJhvQA==
X-Gm-Gg: ASbGncsMEpQNitjBeIopNVBX0ZQIMHZpKxJcADPArooo808PBYDpxJhV7H3s7TewyFj
	oZGpdlSgSe7D3nMYROPSHOwJniupRNSozOLMGbsnBrG+VwonkBH96qSBwlUABu8KNmTm+uIyVFQ
	50+L8wU3lCl0L2GhQa2rwMAkRp6UHKduof8+ICWOuspknccUfCHtmAOuD5rO1Pj6x3+ZMlBwzlF
	FPM+wYsBJJhgwWdOt6KDhhXJuRU7lVGENuyYkRyFaHyV3uBQ6Egna924g1t9cXkydOvfdXOYaZy
	CEAeqC0DXzUY2S8y80T6FjbFpR8DVtC6VwDz3rAObqIv34PCbfLvQQBPhESEygdnPosr8mEGkWT
	ia+vd9IVkNrGpG60XmE0sZ9CZfOSr3YO1rZ7fzLFh06cAshFxVZRuLSPvk/9XGpD+ZIJXvegN9A
	==
X-Google-Smtp-Source: AGHT+IE28lGb5xPZrBeXzznfJJfGdMk9+a1HTRmVF+ZtsS7g4nsaUOj06lQlEgtu6Oujn1f5E9Z+sQ==
X-Received: by 2002:a05:600c:6290:b0:471:9b5:6fd3 with SMTP id 5b1f17b1804b1-471177b1291mr220256895e9.0.1761328671251;
        Fri, 24 Oct 2025 10:57:51 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c43900e1sm192686925e9.17.2025.10.24.10.57.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 10:57:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 04/11] libdbd-sqlite-perl: fix ptests
Date: Fri, 24 Oct 2025 19:57:40 +0200
Message-ID: <20251024175747.704498-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024175747.704498-1-skandigraun@gmail.com>
References: <20251024175747.704498-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 17:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120962

Add missing dependencies and install missing files for testing.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc | 2 +-
 meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index f4f2116569..ce62e92c2b 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -14,6 +14,7 @@ PTESTS_FAST_META_PERL = "\
     libcrypt-openssl-rsa-perl \
     libcgi-perl \
     libdata-hexdump-perl \
+    libdbd-sqlite-perl \
     libdigest-hmac-perl \
     liberror-perl \
     libextutils-config-perl \
@@ -33,7 +34,6 @@ PTESTS_SLOW_META_PERL = "\
 
 PTESTS_PROBLEMS_META_PERL = "\
     libconfig-autoconf-perl \
-    libdbd-sqlite-perl \
     libdigest-sha1-perl \
     libfile-slurper-perl \
     libhtml-parser-perl \
diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
index e8bbf79b13..8d9db19a3c 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.76.bb
@@ -40,10 +40,17 @@ do_install:append() {
 do_install_ptest() {
 	cp -r ${B}/MANIFEST ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
+
+	# the t/virtual_table/11_filcontent_fulltext tests load these files directly
+	cp -r ${S}/lib ${D}${PTEST_PATH}
+	cp -r ${S}/inc ${D}${PTEST_PATH}
 }
 
 RDEPENDS:${PN}-ptest += " \
     libtest-nowarnings-perl \
+    perl-module-digest-md5 \
+    perl-module-encode-encoding \
+    perl-module-if \
     perl-module-lib \
     perl-module-encode \
     perl-module-file-spec \


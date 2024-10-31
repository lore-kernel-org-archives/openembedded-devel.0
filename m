Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7549CD767C0
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.12752.1730382096445332885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vb5W0d22;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a850270e2so148927566b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382095; x=1730986895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4APxErleeN0ec55AHXMjjGESzfOo0hm0Kr80RrnqMuY=;
        b=Vb5W0d22GqtughbUzxQ7/yO9p2V6TPHXicYtjkZaXyRJlHW8b+/7jKVsWiUDHu9SOQ
         UKSJr60qd39S8w29L+tluZg/pdfE9SDQ7h/F+QUROw9Xf1wOQsq+V0r/8dsdUVw7MhgB
         NPvhi07syxGfbPqwykOe23ylt0HtRH/AeDL4UmZZVK7y8QSkh3lzHQG1+f5ptmKIomIu
         qZFoW5sV8UbHpsHmTF1FohxtpSe7Q9NO/iYOkGM3YQgF8z/nwljqPrS6eZIuuBdA97cC
         Hhd/M6WKl7WWK1xA7NrmxPknP4rwjlJ6g4XuELNEd7aN4vHPeVji6372X0jlwZBRDXtg
         CLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382095; x=1730986895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4APxErleeN0ec55AHXMjjGESzfOo0hm0Kr80RrnqMuY=;
        b=GIta0xHqKw5vXEYfpHOHj+FunVktEdbTW5gH8+orUa1ihL8ZOQfHCOx7IQhvsVuUDc
         MxE/T+H/RV/yZrL3MgE42SXFAxqA1rwC9XMimL26EUcMsP6jjiz4KFq2+lUpBUuGWO1I
         1Z6DvtY0nYHEpZRuWzNXN3TJerlQnHxGLJGe+Mar9NjGAYInzZe+wh5djnKjI54kaN0C
         2AKNcRIrABr6TaF3PC28H5lxFzrYEMOx1lFmtIl9q8u1A1o5u7raD2eosRcGyzu16dgw
         IDx4TOfYcL5LVzNwoftKTsAs3EDG3CBQKrcPBDYwxJeJSHxqU6mzzRKoCNcNnq0Fr/NB
         pvyw==
X-Gm-Message-State: AOJu0YwSQOggrxbNQWjkjNCcCr0gckEnyWcVC7jh/BQ2DEPbQzNfA2lJ
	9THMEIRhfdqQ+Uf4uoO/qIjDxt0pSV/FOIXZmsiCOC2pGKICmKtExKY5Mw==
X-Google-Smtp-Source: AGHT+IEmsC30RjR0wgkOj31pJj3cOPvuQXQo/JPd0Csonr5KCjA3ze4QSy7nEgxu3Z74ft5fzblmFg==
X-Received: by 2002:a17:907:7ea0:b0:a9a:17fb:4c40 with SMTP id a640c23a62f3a-a9de5d6e1e7mr1846027666b.26.1730382094616;
        Thu, 31 Oct 2024 06:41:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e8e63sm70053866b.91.2024.10.31.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 11/11] python3-django: rename .inc file to BPN.inc
Date: Thu, 31 Oct 2024 14:41:14 +0100
Message-ID: <20241031134114.2791747-11-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113368

* this one has 2 versions, so the .inc file cannot be folded into .bb files
  but we can at least rename it to start with BPN for consistency

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/{python-django.inc => python3-django.inc}            | 0
 meta-python/recipes-devtools/python/python3-django_4.2.16.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-django_5.0.9.bb     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django.inc => python3-django.inc} (100%)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
similarity index 100%
rename from meta-python/recipes-devtools/python/python-django.inc
rename to meta-python/recipes-devtools/python/python3-django.inc
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.16.bb b/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
index 9254e8b009..564e8741e5 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.16.bb
@@ -1,4 +1,4 @@
-require python-django.inc
+require python3-django.inc
 inherit setuptools3
 
 SRC_URI[sha256sum] = "6f1616c2786c408ce86ab7e10f792b8f15742f7b7b7460243929cb371e7f1dad"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.9.bb b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
index b3fb301ede..2de4832163 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.9.bb
@@ -1,4 +1,4 @@
-require python-django.inc
+require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "6333870d342329b60174da3a60dbd302e533f3b0bb0971516750e974a99b5a39"
-- 
2.47.0



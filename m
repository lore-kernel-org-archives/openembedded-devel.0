Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC90C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:50:02 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11468.1784591396722037693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=msaPDFuO;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceed7018c8so48218145ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784591396; x=1785196196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGRicCQGqhOw4BI/Z+Gx/d+QsDlUjXo9eGfk4O6gFTk=;
        b=msaPDFuO4OzngShA4BrtXGeezVDUhPqb5X+Uv0oKhJ+P4iAT8ez5T/1rRlU1iHVFdR
         ChNAF6urr4ZVdx7zwkfFVrfYXktg5iim9M+4iHjVhTYyo9RDEKcv1dxsLwo3+tfgpPkO
         YuJiIPyo29zraRWFvKhdRvXOehyKK+MxFDaT7BLtyli9G9+gY8YfkvHwEFFL7noP4iJ5
         d/ZihHOxwiIu4NCNsDpD/R1HvcPoZuPhWQSWuUF0mH3jyRr8LF3OKVxdaPZ8raO2SA9o
         MBnJalnen2t2N63u0ctoDco/9qEz0wtDQKmEy2w+OXzf47wPjDNhxmruYpsHYX1QS1Cf
         JHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784591396; x=1785196196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGRicCQGqhOw4BI/Z+Gx/d+QsDlUjXo9eGfk4O6gFTk=;
        b=Vt9CMqXK6yCTgT0/A+0fMeSsyjp7uo9mtX23O1e0rKAZukc3CJ9Kc5gTzMPHcGaqaa
         Jn8/pZLcC3NoknMGKon/INZV2C7wZJU0R2l1C5Nk8LfPZGjjxHjvj8lbSLaHZgp0Bq9B
         G3L4hcwQ8JSujl7YlJqhZJ6iivk2F1iqh+/ycm5Oz7++QO8TzZjxMRldeiYPj8PrEwa6
         fFQ8Ks02eTKrwlRiP/iVbktQgwBtDI+AbaY+dCsJJcqZ5aLOCmdB68VWFBQWLEQTGqUy
         +ZY06fn/umVcqdViay5z84BGbM1xjqN6+5CiecbsYg9odoVDF+SnGZlnsLsSdPra0xOn
         3UjQ==
X-Gm-Message-State: AOJu0YwE1U2Eazfxp0pbjt3/b1xvMo0xSQ2BrbfLisjG2uNkYFZ5RaGd
	3b9pogjwTbABa7xcOHerc2KTuvBlz23jCU1N5NobxHHaAHB4BYOcreY6ohNcSw==
X-Gm-Gg: AR+sD10JwfpND9v8HdgZsjaXETETOqzD9A67VtciyC7id5kImYjg+SOq70fGNzpRG0N
	5WRVoKaNLQNy2oSCT3YWzf/5FMjhwU/QXzvFKYeFFtmPbJVH0yfNEicsi0fcfETvQ9Xr1vPsjKK
	aQ7clBvW1BESyU1ErNdnlLj3ijGor3o5CPS4uK2eC8cBsF6N1FoaD7Au8O3HwXpR5eh4FslzuKC
	X3Za9mgCKQDnRqNo83TaUfahdfPpZ4QCju1wW7PBlGF6i8IF5khu5n6ILxymwUQACTR7N1u7nYi
	INIqyYIPpWPTLWpteK320kQ92q0yKuRk6f17QN0iwVIlbsDN94XFFNM8AEutsVMHx2C8r4bPJdu
	7GDllNRHFcOz/9b+hqcF7DW+I0VZtqfv0Fk+raXkJvSVgiSgHfVGdw1PC0NgCZH0/HDL/grLmFE
	Rhf9yDDB7wtzuJDHY=
X-Received: by 2002:a17:902:f686:b0:2ca:281:27fd with SMTP id d9443c01a7336-2cf3499772bmr174196695ad.25.1784591395953;
        Mon, 20 Jul 2026 16:49:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm40076059eec.7.2026.07.20.16.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:49:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 2/2] python3-django: upgrade 5.2.15 -> 5.2.16
Date: Tue, 21 Jul 2026 11:49:44 +1200
Message-ID: <20260720234944.2410601-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720234944.2410601-1-ankur.tyagi85@gmail.com>
References: <20260720234944.2410601-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128334

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://docs.djangoproject.com/en/dev/releases/5.2.16/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.15.bb => python3-django_5.2.16.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.15.bb => python3-django_5.2.16.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.15.bb b/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_5.2.15.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.16.bb
index 557c2f1522..2629ff3714 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.15.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
@@ -2,4 +2,4 @@ require python3-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "5154a9bf84ac01dde011e367f355c07dbb329532e06810dcf3ef2af269e236e7"
+SRC_URI[sha256sum] = "59ea02020c3136fce14bef0bbece21a10a4febef5eed1c51c22ae468efa22200"


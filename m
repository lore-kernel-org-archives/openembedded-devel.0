Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F64C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:42 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11296.1784590780574096881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k5miHvl3;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb662575d3so105585a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590780; x=1785195580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGRicCQGqhOw4BI/Z+Gx/d+QsDlUjXo9eGfk4O6gFTk=;
        b=k5miHvl3hrID4S7oAl79kc386gW9VF0EngboHm1mWzQw8+/uI5z1+iB8Cfbi8rRvNP
         FnadAt4qxvf9JZLmYfS5ECwS0gA7DbEU3C7/N0hn841sxvIbgR8iYrptCnpMzTuxsMdU
         HPXONYj/yQy9n5/8R+jmhUgECTSguHct7hre41peTtu61iL3WN64g+6eoeOai/eIHI2A
         zCXGwtdhCMUIQYIjDDJW6LGZ+647ZGMtGrFaJH2YhSgOBkR8pmLokU+6SCW90V93CnyC
         fZkAGoMThdYsjra2lfepiQOniwKC3GG/UJWUVu5ND4OfwYl+qLdCpK5t5utxXuP7Ijf2
         5uSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590780; x=1785195580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGRicCQGqhOw4BI/Z+Gx/d+QsDlUjXo9eGfk4O6gFTk=;
        b=eM32YJ1EE8StW16DOEaxMKkh8/Lbchg1rkvU/c+ibxU0JYp3XftbvYNR/3bCRwJlPA
         X9frWXrK3x/GJPvYIhFtyOJLhJZ6RltlBCejp80ZRhplU2sjgFeBHOT2PI2hv5ceu1q2
         u04u6GFwVtVsQ888Y0g5XuxBeu/7a9k0jPoJiQfIEMvhvzVfVUvxV9Dg2mIf8uPDxdK5
         w7qbSO6ksEYtmCh1cSrym8/ihQY94cwTrWHhU6tkMbzWfvqwfcdHkQoi05ZQGHpjbB5G
         fwzHCnEJBmoRVyXjN1sTcVbcOjBX6wQmhWQlmHFRwmRCz6IoXIZzVlrimCgWBslqijT1
         w86g==
X-Gm-Message-State: AOJu0Yxc6eyoZTmHqKFyB2+jyOocp/zlpxsXDAldmEOv0fXRZx9T5Tap
	axqRfujUMIdpQO7bvZ8fSlqnjSObSfzdST0Cy3vT7MlV4+Xh1HjAU9Sa6dW4uA==
X-Gm-Gg: AfdE7cmC4mAzmIaFilN0ivJdBaBufiT7PFftwCRxj8nij3sqYEQ1B8WNATcfaCLU25T
	LFVBQx3IciCXv6TW5t+dqONCLbNd3I6hCZjL4ho6RKz/DkyUEMaMDt3FZ1Ey5j5BHLQ4UMb4FNy
	FwGiypbaDvuFw5ojbTw9dScxY91SuH4jTQnJhGeenIJq+xKPvHNbhoNuc7zDErWOIAB7l7p1Ajd
	zxuKoiPotMYVH/eW2DOH5ntDFoa44q0Lgzz24MQXL3tev8h9O/+1ZY8esy1MXw8RftI5IQScyc6
	b9F11bj0HBoS6eqeZJwxG8PnR9rte/elrD8XCLMcxkO15q+ezy9XEwxBqC+fNQ2vFWRlQU0QpeW
	cnUPrHXAJ3UAyiEbXwrDI2eO2EKbjx5Kh9OqTUI5QdhQBYAMxvZaOqS2vt6r8nUNSHL/xkdG4DY
	VlwZ9Y/pNqyMAb5Oc=
X-Received: by 2002:a05:6a21:6e43:b0:3c0:9c19:b275 with SMTP id adf61e73a8af0-3c3adb0e05bmr19344511637.67.1784590779904;
        Mon, 20 Jul 2026 16:39:39 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 30/30] python3-django: upgrade 5.2.15 -> 5.2.16
Date: Tue, 21 Jul 2026 11:38:11 +1200
Message-ID: <20260720233811.2324493-30-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128331

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


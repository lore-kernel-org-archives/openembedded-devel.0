Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429A5CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 00:57:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10974.1760230668120040174
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 17:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vs5GN6R7;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27c369f8986so28988135ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 17:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760230667; x=1760835467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92CIP/cFMMGVgwdPfUx5XIWzQjBK0yD+e3pabRD4w3A=;
        b=Vs5GN6R7HynzLPP6NjWe7o14kfNdt6NlZn8sHCG6PkyUPeBUSy+NGvvosWPA83OnSZ
         xCkqHoCYzuN/HKteugvF0HTMpTQHSNPnLpLQIj5SVdfLqFk7nsCriWt2+34ofbFZFmhR
         rB3n/jqxMzfYml8WVoaR9xWnrumMtL0pRr4Xr4aLJiGeTlyrrutigK15urE8GYqIsDpq
         U44DaR7dbVqRzNQwWuK9LqI7RNHb/RSIFPCSAvMqB4mCaw8FYul4tFD3TfrKvf1rpjQX
         BVykBZFDSDltGz01a7p7194IvRCV2ma9wJqKOK31SkrhMDqnZoa10AzZCZXdfu21vC8S
         BQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760230667; x=1760835467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92CIP/cFMMGVgwdPfUx5XIWzQjBK0yD+e3pabRD4w3A=;
        b=hbdfJszGGS5pI9W+DuM57vQTmEe0QKrnASUCFsMBmbg3X4iTCKGhZ7v3WB105wV0Lz
         JKVsOJty+OEtOcYBz4ZgCVViyODo/TU45AsT9V26SIcciqx2aVm9gi28Bv/5xZNahYgB
         ojOYTo5hFuLnBpRw6DwF23pyIX6q5n6IrrwJ9t8xV/pAtrZF5vk1O+0URt/Y97Das/6m
         9oejbKPIn5CLZVR9b+6C1G8tz8yooHQbvc6Ve42nN0yFyXYGa3KtC/P0cLwR0gcnSVY+
         bE0zhk7+1k/J5cDCiefsoEF5+Mq5tndJ+5gqiWUmGr7HW3KJ0XS+iN72vy7T082Jdch3
         kLyw==
X-Gm-Message-State: AOJu0YwbFwZcF2pWqXLQwa+qpPGKUT/XnUwouddulQ/8bsJg04duOUGD
	HZ0G0lWDAEF3BCvsf3M/Fjw7Cpd2jTzafENL0Z25Ugqgn7DFO27H4ga0gK8Unw==
X-Gm-Gg: ASbGncuR4jVFSbrqeR60+o0b0xFkhU/vcVQqWJchh85mLoz64nvPXOp6gytOIqu09hs
	r/PryPjhPEe1QzMJQvjudn8ggLxJ3NjyOoBW3TFBNiLYv2C2WGLJziBPs9rQPaY8gCYvXqH7rSO
	Rhr4D/TgywPmI/vyr8YrvjXg//AyAknRl27UaKgZGd4WW744PC4tALVgnKDeDsYHJ/EmlG7fEqI
	x3j066GO9GsU1l5KSj+Y6IkM8+QCbg4v6NXHw9+eLYvCLGzmFxiPtLK0VE60yJJorhQGLtiAlqE
	K9HIUa5HhxS8yBYOE908yzL9xop/JNwFoBxuYoOT8ynKP9u3UtYuiHN/G0/ek0P5vm2tl1Z2Cg+
	GDsaJ4W8IUm0PYz9/5+Mc1bgFx6ot+sozc9M0bVLR3eFrKaYqn+a7M2PgKjgTrZUtCQ==
X-Google-Smtp-Source: AGHT+IHClgZR3ljYAKos4WclBB9Po1NEfuhU8zW23eNYWnjHRKp+ncZMlejzCC1PC/htpOYJEjWhLQ==
X-Received: by 2002:a17:902:f642:b0:270:4964:ad7c with SMTP id d9443c01a7336-29027356555mr230070845ad.2.1760230667313;
        Sat, 11 Oct 2025 17:57:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b7411fcf0sm1522447a91.4.2025.10.11.17.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 17:57:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] python3-django: upgrade 4.2.24 -> 4.2.25
Date: Sun, 12 Oct 2025 13:57:36 +1300
Message-ID: <20251012005736.3294355-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251012005736.3294355-1-ankur.tyagi85@gmail.com>
References: <20251012005736.3294355-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 00:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120515

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.25/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.24.bb => python3-django_4.2.25.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.24.bb => python3-django_4.2.25.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.24.bb b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_4.2.24.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.25.bb
index 286d757733..861f7747d2 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.24.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.25.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "40cd7d3f53bc6cd1902eadce23c337e97200888df41e4a73b42d682f23e71d80"
+SRC_URI[sha256sum] = "2391ab3d78191caaae2c963c19fd70b99e9751008da22a0adcc667c5a4f8d311"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \


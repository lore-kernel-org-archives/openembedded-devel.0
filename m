Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4CDC36000
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:04:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.6236.1742418267135826136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Iu13DT4/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2239c066347so188915ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742418266; x=1743023066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4P0LCS0QEamxmVNpzN7oL40jVjTjL2GTbH2j11tcno=;
        b=Iu13DT4/Rr+u45bKFxh/eYJgn9govsq58UG4m2pfwoUN0sB6gOzfgaFQN/ENgHjWuu
         rVkQy8ys0dKTbqQJA69czWq1upfx+7QyQ3cVD5DMm3Aiw1zCrAYsuzlxz4nlJtlLzsRF
         agdit5UH2x45laiuIpfp/9KBuuLSy2HV8Y3JlyVgpPmSiGIcIh7Rr9U2XWt6YVODnADz
         MleXCdD7G8g1c6PlSsQL3YDAHpdi3pqWjce6PpL0AIdSdZomMI/IT1OBfwLbchGEoGk/
         cIVgczH2k4oQ/einSdSNFjAPKQ7tIxyYJh91uTbP18BrZ/c5ihjSc9vkrIKpJ2e15npD
         PBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742418266; x=1743023066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4P0LCS0QEamxmVNpzN7oL40jVjTjL2GTbH2j11tcno=;
        b=GU3JOJbXn+JzRyqHfE7hsHg1Uw7eo3Ik8xikJzK21abw7hucTznlUZy4ee1wXGw+1a
         K/vFdrfqgHYWwBYAKjN9sssGZDuooDHwbGJvz0EHbkruC9RPC3wZ/d3ISf2hb7wkpLf2
         xdRSkYyR7ytkjaruC7yZRe8MuOuVJgUixAlhSkfJ8FCVaHKDDYJwoYsgW5DPORUu23Pr
         Ps9/Rs/Uu3YaUQKXKtpc/hGIYHj5wXhCH0eIEetEzhaXPb2lc3TVZ8W9m8NVp6LBkSZA
         6kqibWV/BWXoxAI1wEzbxQG2Y7TgDpZiRK62zIlVCYIf40TETB2mf8WplgqkSjgTieWB
         rxMQ==
X-Gm-Message-State: AOJu0YzV1JpujrogaTxuN3O++N/aNrEWVYVcwwJHBFjPOfMVv1onrUj/
	ymiaAJwln4bRD6VGVv+KWSpKjVKp8YcUxSFGAKg/Dh8USWLYpjU1WlWD5ptm
X-Gm-Gg: ASbGncuQjq6pjnO7GDuJ2o2VS1hQR6f3OJpONgt2dyXxEFkkJpwno6YqfJlLfvkm3Q5
	+QVGj7nv3KV0XqZ3S9UhkjdPXE8dZ7VPNdULFJUz7bd14yelsLS97XAHB9yblphgyMwcUgpjBat
	tFRfQ1Gl6SWU6AuYKDJXAXRUktzLX/rV6BDQNdIgiF+C2vw4+hhhrgb4X1yYAz2UQHy07tKFx+H
	2NWN8k57p7pkCttlGJFPTN7yG0eogszYd+3XcjAAdPhNOAfRV0IXY1kISR9Z4wh2NQjCZL7X1VI
	Djhp41ZeeOdnXtK/5BDHr80SCxXTJYawI4fq
X-Google-Smtp-Source: AGHT+IFnja56w4DKAbZW7nW/h7DSQ5sqA6OSzcDpEU57cjKDHSTBrKHj2fTrg5avuFe442OYAfPVnQ==
X-Received: by 2002:a17:902:d54a:b0:216:6283:5a8c with SMTP id d9443c01a7336-22649c8ef31mr76403685ad.39.1742418266331;
        Wed, 19 Mar 2025 14:04:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152938csm12511767b3a.12.2025.03.19.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:04:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/4] pytest-codspeed: Add missing rdeps on statistics and rich modules
Date: Wed, 19 Mar 2025 14:04:21 -0700
Message-ID: <20250319210421.2454856-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319210421.2454856-1-raj.khem@gmail.com>
References: <20250319210421.2454856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116113

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
index dd08c0fbfe..0789e9f548 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
@@ -11,4 +11,4 @@ inherit pypi python_hatchling
 PYPI_PACKAGE = "pytest_codspeed"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-RDEPENDS:${PN} = "python3-cffi python3-filelock python3-pytest"
+RDEPENDS:${PN} = "python3-cffi python3-filelock python3-pytest python3-rich python3-statistics"


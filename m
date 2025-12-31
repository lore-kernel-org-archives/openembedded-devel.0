Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3309EE57FD
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81798.1767167682814801248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JCSuKXcU;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so56997605e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167681; x=1767772481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86OnqDPRW0ZfRoOjrmJT3+mIcpiSbk+KVOpXF9/Sf+0=;
        b=JCSuKXcUBdBH00GrmzbTWxUanF0ebictU32ZO1Fw19FPXcCrCq+p3ipghveo8/BeXe
         6MaYN24NQQCKRpPbBXy9dwKdzM0Dx3wiFELt6KVAP+jaLPU0y++GQXZLnlqFswY8Bw0z
         UEqENrvcsEnbtSN+QHRjZOTr6navwV74BOxEtaaE34jCglofVbd2TiCrwxbfE+nXTcs5
         HFicMfE8nvkfKX81W13qJ6vM+iQpRA2V0Q9M4iO9qKapKaN406oPg5ncCjYEj+nuPp4C
         IqKZl5HxNBa7Ru6tKI16gEwX064TfONB0g1jAWt+we2uPENckMaGgzHPezBt6nWU+VA+
         JnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167681; x=1767772481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86OnqDPRW0ZfRoOjrmJT3+mIcpiSbk+KVOpXF9/Sf+0=;
        b=WyeRdK9KR7Q31pGLAe/OyQO9IMBV/eHNq0u3ixDogMZVLIYkZF7hRSbn25JCJ0mniu
         oHtkyiJdPOgI+fOlaf/HfEkqAGondkHpMzoD4AjrK2JKyHsYU+vjjE3E28sLyOhOTT2O
         vjoUYpRYSGb7/TEcX2WrHpHX129zvTA5GUYYz7MQyry03JGaXJVUqmlDqfm+n+YrDjIC
         qL2d2OeEP+vqjffmDiNkWMiR0YasmRLQ1QqlIOqG4GLDS0WCzAJuWJlb7zv1ZuqHipy+
         2e0IpdRTT1o+1bbWhTnkAPXuTnhAsDdZKRrhvQx//2S+s9F6+DieuEy2R7CP3OZBsltB
         CYxg==
X-Gm-Message-State: AOJu0YxLN4xZLX6O0Incf1tQd5We5awYlh1YBQNzet3ytC1kLx+zLrVH
	oOI9CMnNCF+ekEb8qmKRVtlgwm7UO4++G4ZSZyyOULWCCklbghzgHF6Dn2HaOA==
X-Gm-Gg: AY/fxX4UbiUMFqtynta2tHsb3m/09k5XQvM74QVI0DWBpkYw6OofBeEEnUihKWtH6wT
	5kJHlZamGdS+MPI7I5PBoyt2S/sim5cpbhw5EsLdqdotgudiFheEwJRdnQZBXcWulUGfjTRYErM
	uyI5/2LQkMX1CZOIwJCS3APHGDiTdDQjmuJH4TiSjPmdaaHGPssjIwakxqlGd4Ud51zcmDDHxBw
	eFAc4oi0h+G8BGIg6Sn3pZ1NmZSSvj6vdZUZ9/bePN4s04Y18BTabfDsFFRajsoBilPoY9DIhmI
	EUWrMsNliW+uYxQZNNl/5fTEPymCleOwM2Gz9T2seLrMjUNd8aS40/RhJBRrZ7cifNXeeHiEeN3
	DgBWtlHTgMK/Vpf6B3O2v86FRof/lUnVYF8TX52gzxfOphH+eI3N7x25P8qFPgpLjLSHExR4nGL
	ssVc3ZNeo6
X-Google-Smtp-Source: AGHT+IHGng1K/NiVkbqGdLiLB1qOvOBgYjlmYnWczmkSlznTElQPZnPG5JU1CtHQVaBZJvKD52gc/A==
X-Received: by 2002:a05:600c:818f:b0:477:a0dd:b2af with SMTP id 5b1f17b1804b1-47d195920damr432911545e9.33.1767167681127;
        Tue, 30 Dec 2025 23:54:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/34] python3-uvicorn: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:07 +0100
Message-ID: <20251231075436.771395-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123045

The default python:uvicorn CPE is not correct, the CVEs are tracked
under encode:uvicorn.

See CVE db query (n8n vendor is not relevant):
sqlite> select * from products where product like 'uvicorn';
CVE-2020-7694|encode|uvicorn|-|||
CVE-2020-7695|encode|uvicorn|||0.11.7|<
CVE-2025-55526|n8n|uvicorn|0.35.0|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
index 56d58ded0a..3013ff50d0 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 inherit pypi python_hatchling ptest-python-pytest
 
 PYPI_PACKAGE = "uvicorn"
+CVE_PRODUCT = "encode:uvicorn"
 
 RDEPENDS:${PN} = "\
     python3-click \


Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7C0C61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 17:27:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.66121.1749490049998758011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 10:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=e1V7AJhP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a51481a598so2666348f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749490048; x=1750094848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY6jAla5DHj9tz/60QAJA2cM53FhS+kwqzmPptl3HQ0=;
        b=e1V7AJhPMbxfg9o30ExFsNuxLRLB0dodufRWxNR+CZgVpzVUlgHNZRp6z8iU2Fui4N
         Y20TdDv+ZhhTbrt6aO9S3zuhYo6dKQhZOW163OGNj0Qhohj1Dy34LHrbMgkysN/pKn4o
         uDl9Up9G6Redw2EuZF4RXYRY50Lc2MQr3laP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490048; x=1750094848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY6jAla5DHj9tz/60QAJA2cM53FhS+kwqzmPptl3HQ0=;
        b=KuON9tBN9tMrNX82mckbW6OygUqRXFlPxlwr45u7deH2InYiF0CHKplHz/lfnMNxxf
         j2ZiQtJuFhQ1D12wdqx+1HFwYPv2AdAcwtn2hVbnp/kPkwxJ6MfIQONpIufWYwHGq0zR
         pYITv+IQGKwUEIP1yFB0yHiJr7qusTl+73sBY3S0j41WEZk3PR6eyN7uz6/UoZspBxHY
         2d6G5Q6K/9X2iyPtLW6Pkr2q+r/ZJjVU6IsQkgGBoZ4X9akLU37y62tE9zUk9HumwVT/
         U5wsVTuvvEkGJDX+TUYD1m/L3TaxDCrQSM3i/Qv0pdesuJA4/uyf0EypahIbIU4toDBI
         /1pA==
X-Gm-Message-State: AOJu0YyOMmrQ0HYe8b03uH7J6DPk2cJ+8ZLg4PD+HAc1F8U/woRfWdtq
	tHefLNs3wu31kL+UDrxikW0RWSrvjfjZutOjZdkVyLyDFscECv/UQaaQPiBbR53TbDjKpMHVhgB
	WGqdv
X-Gm-Gg: ASbGnctNNUK1iV28YSiRKP9j/RPqsC1/fH7bKX+ygC1JXRjd2txeagje6EHYrEVSh4R
	1uPXuCQZ1tvU4KfzBHoby4Gqnj+cjE41X19BW6NTnoPgX8mM8BaXDSlLDQTXLyMB2/WQA/0Rw1k
	/cX2rJ6mLvzEK2qnASWQll3LCjqXbSSOZeJ/BCiMCiV5bO1trdqOJLtlvsE0xNpYo+BkMlJvDSy
	S2Gq39gNgUC4CWzaz727tTYvqh0VPXVkNFaIKdG556m4kW+fRpgdgxOkh1uOaEr3kISjLLlTkQU
	LGI4EoBIvp/w3EJc6wI2UXU7bA1nj+ynw2XPEQZmAb0ztsQqrPitv1aisJZK4Q5C3GLwUZyq8eK
	M
X-Google-Smtp-Source: AGHT+IEGdgRAERbpCKaUyi36hKaPfsKYMfkpCBSdYxcFkG8ibr6R62GrMN+VzGhX5jmpPmKQX7fnZA==
X-Received: by 2002:a05:6000:2484:b0:3a5:266f:e6fb with SMTP id ffacd0b85a97d-3a5319a791amr11323091f8f.44.1749490048130;
        Mon, 09 Jun 2025 10:27:28 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307678020sm68014835e9.15.2025.06.09.10.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:27:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-uritemplate: Upgrade 4.1.1 -> 4.2.0
Date: Mon,  9 Jun 2025 20:27:22 +0300
Message-Id: <20250609172722.2923788-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609172722.2923788-1-leon.anavi@konsulko.com>
References: <20250609172722.2923788-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 17:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117790

Upgrade to release 4.2.0:

- Drop support for Python 3.8
- Fix bug where already url-encoded values were further escaped
  and encoded
- Refactor uritemplate/variable.py to enable fixing the
  aforementioned bug

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-uritemplate_4.1.1.bb => python3-uritemplate_4.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uritemplate_4.1.1.bb => python3-uritemplate_4.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb b/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
index 77a52fa58f..43ba122407 100644
--- a/meta-python/recipes-devtools/python/python3-uritemplate_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uritemplate_4.2.0.bb
@@ -5,7 +5,7 @@ SUMMARY = "Simple python library to deal with URI Templates."
 LICENSE = "Apache-2.0 | BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f6d769bdcfacac3c1a1ffa568937fe0"
 
-SRC_URI[sha256sum] = "4346edfc5c3b79f694bccd6d6099a322bbeb628dbf2cd86eea55a456ce5124f0"
+SRC_URI[sha256sum] = "480c2ed180878955863323eea31b0ede668795de182617fef9c6ca09e6ec9d0e"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.39.5



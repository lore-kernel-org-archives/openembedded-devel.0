Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53677.1795440985356938177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 05:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=W4Cy4Plk;
 spf=pass (domain: konsulko.com, ip: 209.85.221.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2605157f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795440983; x=1796045783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8/XSajHhyWhVCMsmNLcmEmGsqq0GbRa357VSpPpR9k=;
        b=W4Cy4PlkjJPP6Ri/ffG35pyfuTKnjy/QpnKrG5rnEYsadHGqmLZ+Zr+BiqLbiwQzeG
         ENqZF51F5sRslLNY+6+pc/OJWfrnlBV0GlXALt3Ck1FISZea3e7YWE9UyBterlHPD+Bh
         9J5LlDmxc4F8jnYRACNs/ULto9wPtPPJiHtus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440983; x=1796045783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8/XSajHhyWhVCMsmNLcmEmGsqq0GbRa357VSpPpR9k=;
        b=y3wQ+t7K/0dMXAohBRLHGZunBGNHW2d3RDfU2zYAsxHEXrz6N36PIleRCPxcsQs/ue
         xmQ1EQcN2UThf8rdgBX4Nh8g1Z/LAQv94ksmvR7yO+RoSOkyUB4u8QrwTR49FsuCtJ39
         ZAYG0W6+/054QaB5htq7SzAggn3l7M52pnOAyjB6fx/qTNohztCEJzLqtjtkpT7KiOaD
         Qnx4WKXlZWlFFrvZygffE3DjtW3ZBPPOrgL6mmihPsHS7M8tfoAJPFGEYnfcrIOi2EBh
         bEQosGbt1NEL9WuJRGqGeyYY3ztPAEqYDyv5AMRbDyjLmcDI/MyhgnLOO8LsoDf61q5/
         oAew==
X-Gm-Message-State: APuU4Z/D9i5BmHEz8UQNZkpLQ7S68J8U+TvW1/WsinsS95s8YYL82ol3
	qd+F00GcwnIKj/skSHOyafUJ0U9vKossstw6QXOdR9G+0eeKIn93a4iH9MWuy2w5fFds8/ybxno
	hnbdO
X-Gm-Gg: AZFdTZcoGoS13TDeqd8tEnOPzwswvi7QWR9dKMsP9UHdzzh5ivBSDRiFoi1j+bqmkZP
	5k0nasOsTIC2pTQ0a+6jO3cwx0/FFJ1kmd8TnFzj53UuH8weftWr286GwSYsEO/FE6ZqTPAfrUm
	YkG3CT0O+vwUCdzMEX+8czDr6IxwV6sUaYpzWlvIPPYdlz56QyFVqz2J2RiTj600YgnRLaZ74wk
	N6Wg1gnqJr26yLxiKRx82dIpi22HxB/LiG+0GJ/hWgKGBRoQko9DgQknV7QCkpqL3XKpoI4Kw4b
	u108Q6F7DXSQKnj6jZxWT1qDQM+3ynXe0Dzi4GiOmUh65mnJhlt+v0J1c4snugaRK0oaj411gYQ
	l0GT4xYoVojLaC4JfyAAgJMdXXQUsftCkvmW0HfaUadOI4ap7rtC240hA1nS9RbO2tTB9EK8TK8
	8AcTeRf87k+cVeVQYqIRMOLjhdMMQg9Zypda3a09zcPKgG5jtGhgwKgOWDvfAWVs2EwQTrcm9oD
	X+5qryZiE1QFMyPx/EjvjmWACuSI8Q24P3AeZNAm+whMMlHaNpIgYHGUNeaJq7rMPMpMR4vMMDW
	3HSaBUZ8dLt+ysOqHKLkhoK12vQau2A5Q1yYiTuCaNRBrbpzZ/uHmziFdTyU2chwpDuwO0TA2eD
	qGccFa4ELJdpIZxJl8mRYUZRwG1ZNxxIKo4wQkT4bV51o8Qm33B8gFg==
X-Received: by 2002:adf:ee47:0:b0:4aa:5396:a792 with SMTP id ffacd0b85a97d-4abb514608bmr17101569f8f.23.1795440983626;
        Mon, 23 Nov 2026 05:36:23 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm25192365f8f.24.2026.11.23.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:36:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-sentry-sdk: Upgrade 2.75.0 -> 3.0.0
Date: Mon, 23 Nov 2026 15:36:16 +0200
Message-ID: <20261123133617.3614096-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123133617.3614096-1-leon.anavi@konsulko.com>
References: <20261123133617.3614096-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 13:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132893
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.0.0:

This release brings:

- Span streaming by default with streamlined API.
- Fine-grained data collection controls replace the single
  send_default_pii option.
- Many improvements to our AWS Lambda instrumentation.
- And more!

Breaking changes:

- Check out our migration guide for the most common migration
  patterns.
- Check out the full list of changes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-sentry-sdk_2.75.0.bb => python3-sentry-sdk_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.75.0.bb => python3-sentry-sdk_3.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb
index b013d02449..aa03b6cb25 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.75.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_3.0.0.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
     python3-certifi \
 "
 
-SRC_URI[sha256sum] = "c38ac2d4b2435c11da821e173bb9d9088c98f41ae92f559ce0e424170a8e1a29"
+SRC_URI[sha256sum] = "daa5f0baa931dfd8c4d6844b4992764683a1abdcbad968c76703c34f0e244f13"
 
 inherit pypi setuptools3
-- 
2.47.3


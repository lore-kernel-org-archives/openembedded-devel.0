Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14.1794324464338073964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ouai50gV;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490a0e72588so1182682f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324462; x=1794929262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z91vHIIhfJ6oN6MmVZSvaLKfKjiTCHu06LkVJXYpxq8=;
        b=Ouai50gV8hUsU6WDQUS4gFMeFRAh7TPoM4wHQUVBbP6TifafMk6G51aremF++vt0ok
         GpoM9JmTYnhFb3q2OWNZXSAQmCKXEVbPM3I9Kk/YUReFfVQ1wfdILN9NEe4er/4QPNGC
         p2NlC7L2At2LLN3gumtC3tdHOpRxOlITr/CvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324462; x=1794929262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z91vHIIhfJ6oN6MmVZSvaLKfKjiTCHu06LkVJXYpxq8=;
        b=jaqHqVT9FY0X/knmf7J4Ld8d3P56i1ABHZq99HgORGSCgi4g1vh37me15LuRCd2kSI
         ae5XNDBU5S58bEudrPImbA3AQ2eylviIrrBTHK6U8m8/MltK2ItfV+InDLRCw88g/PlH
         eAfklIH811Y8j5PGWiNflM6iNL9F0VVDyfabt7NoPVQfLd7hHC9bu3Hi6bo/M1rVPvzT
         nQOp3pUCkSv0spoSk02oMvKudtLWqCLnZ3qRAPzDKPIgf97VmPJf/IldMgTFU3MA7hf5
         ZdZJQsjXFrGTIdrEck81p5JmQ0RB0H6a5NcpAcz+NKc5aUezCApCG2UYEEjgpPwxl5HH
         HCqg==
X-Gm-Message-State: APuU4Z+Y0IXs8UypD9NlNKFk8AaBWWFrQOphAv3PhwyOx2bOzEcXkDw/
	dzS1IMc9E7o7FL5CYFrw6tJpd03jc9VpWL3AZx9Kc3RH4675TWUbTBSRYpUch1+mLjEtmHtjsrD
	NEHCm
X-Gm-Gg: AYBFou1i3bUsxEA1zmhMJ+QvzoDNQSJh0xFFy/nsgh72oWHkoMkoXkE1TAaEfVqAXca
	x5F0CulYkwd5M0ge5JlY+U8PPr5QwY/SwrKyAqVlOmWJmihaUuuguP3TbsPv95mOMmNcSeUCLpP
	aaQdGh6XxWI1WAW5XxxiRkA1M1jpMZ8BH2gQFa9Du0VEtNpdfxpd7vGZm4lEj0DpdALRVpmnts7
	puyjn263kDkDnDhPpHOn/UoN5EzavloI/hTDUOhsLUQemIXP05EpUUzBmr8FA7sYMmFMocHTOjx
	43jOkt/0GzJ0h79pB0GHfRVbDyBnm8N+rNkOjDpztsK6nNyolhKMEWedzyXEbl5ouydHE7a9sSG
	bT6ICIOWr0HlbEPq528vzOzk/dAnzBpjbtnhbHxNX8qYmVwkTFOOep7DvW45RPPBbmAOnwYVcCE
	zuQlZ+JJxRvB5Qo5mC8xx/5iVJGEdEk9gOA4rQq7WmUY08A1y9GWF/Jvv5f8SLwcVp3UPsaBkUD
	dFZReLGQKflw7aej/5b3wgiKd6dqOdLq7JCJpE1VENTlMEEWyjjpC7K9gCF9DuhrWpTrRYTCfZP
	KEmZD0GCeuczkZ54ExUj1/H00T5fns7i0wKskNbNqoSGd34axdA+7/HirCrQakfzgxlcL5IFmSE
	jNTtfwefFCXrLWG1ncKtd/Qp5eVXy3/8nMtA3Ystd3c2Id4J6BPCEFw==
X-Received: by 2002:a05:6000:18a5:b0:48d:e61d:68da with SMTP id ffacd0b85a97d-4982e737a42mr5702522f8f.20.1794324462546;
        Tue, 10 Nov 2026 07:27:42 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/19] python3-pyperf: Upgrade 2.10.0 -> 2.11.0
Date: Tue, 10 Nov 2026 17:27:21 +0200
Message-ID: <20261110152729.1065911-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132085
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.11.0:

- Tachyon hook
- Add ability to register hook from code
- Hash pin GitHub Actions and add cooldown to Dependabot
- Add zizmor security linter
- docs: fix some typos
- Move Ruff to pre-commit to pin it
- Update Python versions
- Fix typo in warning message for sample stability
- refactor: Made _T_DIST_95_CONF_LEVELS a tuple because it's a
  constant
- Allow zero-valued memory metadata
- impr: Optimized the format_number function
- impr: Optimized the _common_metadata function
- Make psutil optional in emscripten platform
- Add --in-process mode support
- Drop support for EOL Python 3.10
- metadata: add cpu_quota (Linux cgroup CPU bandwidth limit)
- Add Runner.is_worker() helper
- Update docs for --in-process option
- Use CPU affinity and set process priority when using --in-process

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_2.10.0.bb => python3-pyperf_2.11.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.10.0.bb => python3-pyperf_2.11.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.11.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.11.0.bb
index 5566f314de..1cc10b2796 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.11.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "dd93ccfda79214725293e95f1fa6e00cb4a64adcf1326039486d4e1f91caaa62"
+SRC_URI[sha256sum] = "e53813a2d97dc5a89760cf660dbd1b6a142558fcb6d32b3529c8a6b2d03dbdf8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


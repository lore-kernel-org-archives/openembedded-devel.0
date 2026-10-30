Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8947.1793358222981244631
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=S2/jWG3C;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so531574f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358221; x=1793963021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bOJHLQM3p/f6wlxnUVy1fqCMN2Y4wQAIly+4asxtTSQ=;
        b=S2/jWG3Clur7NME4hJrnDa4S2kwLW4R13vb2AFyEkvkUIpnLYcBFEN3zjVMgVd1AaM
         H/QteOat3IsT1QkLVI2W5W2KLJOfOBAxbTSruDz7C3bXJeCCeQjfM7kpqh2sHAIHaKtC
         kYO4XDbTGkKSI6U84R0awHKLIauG0q0C9zzGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358221; x=1793963021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bOJHLQM3p/f6wlxnUVy1fqCMN2Y4wQAIly+4asxtTSQ=;
        b=ccWNA0yrmB5nLTGwhdfSIHzJzawiSFhTKYDXWfLjKWoPfk651I7YzY3f0nnjhtgMxw
         vtSZFGpiOQqrDywP3m2ovD0fnNnLg94Hv6yXOF63MhiG95IllADzfxaFPuJdBaZRVEWw
         I0r/gBiRg6EAu+gTk3Q06Gs6Wdyer4uBTd/edks8+YAFxdKbvSj+Crf0ik+ckwofzJuy
         GnJL+/+sO+X2joXNr38ttLG2hD3Rizc1M7JZN3hti1NtzVT4v4vXwM27G6awQTxu52rN
         XTHHRbOwB2PFLp++iSvGFNzJnCQYrI2+nmmE43r3nWrgMl+JTk0QHSVAoT8nhOz43dZq
         /v8A==
X-Gm-Message-State: AFq9FYLvlacA8J7aacqW1NaoLa4jWd86jw3ZY6KTFvpmHNEx6HtA2ExB
	RopsPWOU6JhYBmrhgBqdxNeW76S58CY0velT3U5fjExfq3xG5+yfz8VBOB6vn7+F55PSu7y4GaG
	y8yIA
X-Gm-Gg: AYBFou0DMq019gveV1FK53TLKsRpkagFBqvDaoK25br44APybActH43Tu+QaMyomQ4w
	OpZoSh572HilRtu+Wp7l+HgXBQkraCggy43x/snKMaFUIe9MSPxaJqWg/l/D4ji4lUJVlJCTKLc
	qiK7TH1E0fVl52V30V5Kecj/FIkix+Vbt9Y1OkrY3EyWu5NrHzPcz+3o3gpDCGxGpyy3y2eWIxH
	3LzQHF4H4+UPHpel4IC52ITezQy/fR3kta2jGzdsu4RiiT9GoC6U4gCwlIy+cU9sKSkOG9fE0bG
	EOPe068fJ68A9PNXt+rS8GPnqCw2OcLiDtNqCF0+n+SL2JqwbvYCqQW194iWSUQ5BGDF85ANMYc
	cLfk3nGjGs94T9bgRgL4DUwuETYIOo4CxXhxXQVwPNC8wN5pWi8Y/Hn3Oy56VE75AZYPp/WYPu+
	Q27TvQgzsGSiAbgoXlIMoSMQksvQ8LWjtCubUyjoG+y5B5gBmsCWaMvWjX/GShND1TIph3a7vnr
	xrAPj6trBKtHXmLntkdbNMQUWbr/C9k/w+hviDLaCYS1zYzq7pNuMcFFPVgs7p9fc3GPYUmUcLK
	H2LDt50ytDQ7hhlsTgW7ILT4Cq/zfJduzu7ybIeqFosTFtXp8168rT9lcFjIeNNfFNf9bhs+vrS
	8OkiJ/hulCT8JbrAb7/pnxT6YfHxWmuuKKgdsfaVqVfCSaL6nP+0xcg==
X-Received: by 2002:a05:6000:4b08:b0:48e:7508:bc20 with SMTP id ffacd0b85a97d-48e7508be83mr96577f8f.2.1793358221075;
        Fri, 30 Oct 2026 04:03:41 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 21/25] python3-eth-account: Upgrade 0.13.7 -> 0.14.0
Date: Fri, 30 Oct 2026 13:03:05 +0200
Message-ID: <20261030110309.1124614-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131703
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.14.0:

- Fix BaseModel typing error on Pydantic >= 2.12
- Template upgrade
- Bump eth-utils to allow for CamelModel usage
- Add cell proofs for peerdas compat (Fusaka)
- Inherit from eth-utils CamelModel for pydantic types
- Breaking/add remaining breaking changes for major
- refactor: drop <3.10; add <=3.14; migrate to prek and ruff; use
  Github Actions

Fixes:

WARNING: python3-eth-account-0.14.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...h-account_0.13.7.bb => python3-eth-account_0.14.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.13.7.bb => python3-eth-account_0.14.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.14.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.14.0.bb
index 4b680659db..70c56880ec 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.13.7.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.14.0.bb
@@ -4,11 +4,16 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a26e64020156e806cf0054a6d504b301"
 
-SRC_URI[sha256sum] = "5853ecbcbb22e65411176f121f5f24b8afeeaf13492359d254b16d8b18c77a46"
+SRC_URI[sha256sum] = "2c8291b1a8fcbd29a55b07f75f0a0aaffd04704d3ec28d1396587f18a5541c6d"
 
 CVE_PRODUCT = "eth-account"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "\
+    python3-wheel-native \
+    python3-setuptools-scm-native \
+"
 
 RDEPENDS:${PN} += " \
     python3-bitarray \
-- 
2.47.3


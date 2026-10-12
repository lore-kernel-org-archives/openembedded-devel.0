Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DFFCA9EDE
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:16:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11073.1791803781791154604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RXzLwRXo;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11818955e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791803780; x=1792408580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+HKLro6Mehf2fzw6UJeEYVVC3k8JBf7NAt+mX60k88=;
        b=RXzLwRXo4g2iHqDq1fr2mMey4phwd9dPd06i016I+l7X2TFjUOm4bfUTaloMZv4b95
         dD3ITOkgv6YttZYYNKHdG2SeHRCEZ5URNiE5KoqmYe8Su5LzVJL1Ue88P7lqZiU/0ef7
         5z3Kn62DHk7S7zls5aBRhckHfJY0DXuIjQ6e7nWGQluAJyV9J0A9HRDM0C6FamTaeQmq
         qSXIMshtupTR/rpPo0n8FPRIroPfL1NG3W0iv55X7zWGTdUWZSqF0ZYzzZlM9RRE/73g
         RbHSotwvDX75YAxlaiAXy4Xbjukq7H1nzGjv6D5W2j1fXaNAxHtOcOPDIwcPsxKxOPl2
         4H+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791803780; x=1792408580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+HKLro6Mehf2fzw6UJeEYVVC3k8JBf7NAt+mX60k88=;
        b=AINbih/bjzvOrg/ekTlqeVrTLR6UkYQUTJrUGVBeuw2H75g50DvG3LPz8VH90VdQKT
         wQmQ24hUtFy8NKoU89wWPIsz7Xo3ujeeVC96l9W1vWpmjTgRnz/xKeX83XjWTcVML9C1
         TcN7I5MfJnDUp839RRT3MaiRJLe6uaIlDomqxl4WmKHt2CpbzAuhdsX4c7eeBR+OceoF
         fNhL6frAMtUTjbGnxaxHTZZqgru/Sic+uc2fhp3I5GyfRKC9U5EkTFjki8zyuzPyjegp
         6N5Z4rQhq1Azttnypvmndb8um9SJQhMkKkbSHC+IZzkMQpuepsWJqxV0P3vSYI5/Io7X
         blLg==
X-Gm-Message-State: AFq9FYL06W4mX0qve2SSwkTK4Ye3vnwodFRZkS8qlvAi+lM6WqUy9wc0
	ohlOXaMfs3pky0+xCJTFhjntJm/751ggiIdL6iB+VlxuBmj7oVybzn+KEtANwGFa
X-Gm-Gg: AYBFou0DOSYAKdzxjIjpNsGWYNohfR2cy5l4etaqH0/tSJKlQHgElGnNNYo5XyJd3dT
	nfhj5GlNoMqh5YBJNIIjCl804udSLDZ78ZyWeLLAT+IPW/xvqsX/BRWmNOSFziHpIrYfkOjGzxO
	UvOyUSFGBYljy5gfIBvoVE9FSOJXXr1VSsd9PS1SG3VCb16iuwy9U4tYGFGUg0m4H5+9Vk60W8S
	q72KCe+PrgxP16HuNrdWC5BVEn5rdne/Icr59XhsOtEc54lrxZtw8PKtM7Note04ST+gle+94Wn
	JG+6MeYVQ0uBy/1vQxVIOswn4Ihgfjftti39rxzqljmnUGn2WQWjpbwnc/nyrkJXNmQz3eKtJcx
	PA5j7vubghdddsT9c8qt0w5kRPvo0Yvenav24dqB2Ih/A6PvbiyzP7RKR04Ima//3RhtvZFtiSK
	2Usag+A+W7jLOwlKbuqycHlnXcxpUpr7ZQdAzFmUrojSKoQDYS8+olKM/U9wCxH165bwvIa4q14
	TLa8XXB4ev6NsYqk4KkPZp8jmq+hugBVhetTVkeRCJTDqWmdni34FHJ/c8RahKeEw==
X-Received: by 2002:a05:600c:c0c6:b0:4a1:96cd:2f6b with SMTP id 5b1f17b1804b1-4a196cd31fbmr84099555e9.2.1791803779581;
        Mon, 12 Oct 2026 04:16:19 -0700 (PDT)
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm18901232f8f.26.2026.10.12.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:16:18 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH] Revert "python3-google-api-core, python3-googleapis-common-protos: set PYPI_PACKAGE_SDIST"
Date: Mon, 12 Oct 2026 13:16:15 +0200
Message-ID: <20261012111615.3527-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 11:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130762

From: Martin Jansa <martin.jansa@gmail.com>

This reverts commit b9cc78ed6bb900c1c4eb856f7cd3ee9d753a2e94.

The same issue was resolved in:
https://git.openembedded.org/meta-openembedded/diff/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb?id=0a583b35021692dac485c16d85b3f9a9f5601da0
with the only difference of using PYPI_PACKAGE variable
instead of another hardcoded pypi name.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-devtools/python/python3-google-api-core_2.19.1.bb | 4 ----
 .../python/python3-googleapis-common-protos_1.63.2.bb         | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
index b433535a02..eee2278e40 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
@@ -9,10 +9,6 @@ PYPI_PACKAGE_SDIST = "google-api-core"
 
 SRC_URI[sha256sum] = "f4695f1e3650b316a795108a76a1c416e6afb036199d1c1f1f110916df479ffd"
 
-# Avoid replace("-", "_") from:
-# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
-PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
-
 RDEPENDS:${PN} += "\
     python3-asyncio \
     python3-datetime \
diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
index 6eb59f6ef2..779f3afa9d 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.2.bb
@@ -9,10 +9,6 @@ PYPI_PACKAGE_SDIST = "googleapis-common-protos"
 
 SRC_URI[sha256sum] = "27c5abdffc4911f28101e635de1533fb4cfd2c37fbaa9174587c799fac90aa87"
 
-# Avoid replace("-", "_") from:
-# https://git.openembedded.org/openembedded-core/commit/?id=98049bf86b615b10c43b3ceb9dbc73580cb76952
-PYPI_PACKAGE_SDIST = "${PYPI_PACKAGE}"
-
 RDEPENDS:${PN} += "\
     python3-grpcio \
     python3-protobuf \


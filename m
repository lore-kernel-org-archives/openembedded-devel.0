Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32581.1793879740174134786
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QjX7HXW4;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso18664355e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879738; x=1794484538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzM0GF10gT6DpwBiYhwf2cQmM5pHk1mfEh8ycWJgpko=;
        b=QjX7HXW45Jy2o4Iz+ExYnrNEEK+qPbYix+6wsVgWYy0XfQYlj3O8GC5Q7ZXa6bjIBV
         M1/tVZL0ZOc3YRxzZhenSf5eQYI2hOYTuJi0gn37pj8FEwkWRLRgnfXH5y6TO5/n9rSx
         eZqU7MhzCmkEQKKyismOS1y6Gv3JmSurel98w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879738; x=1794484538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzM0GF10gT6DpwBiYhwf2cQmM5pHk1mfEh8ycWJgpko=;
        b=sBeCahRIkuoujLNjgfMjeTy90kAbWa6nFCJKtX96KepGYwRbJcSS5cL/12KocO6yjM
         /Iwif7xRzkR0jc3uDMnJn8B+hB5YLXnEeirZGY6h0W1AYHNrF4QPHNX15hZE/XFQoTJs
         d7eRs7gmzdT3XQ8AZOk9w+2ERLqajCg8pylUwPKc9JuddA3BzyizScT3uVpM9EOKSrpx
         qhbGSAhIzDbPMpK9QWa9t591z7Ob8NZ+PgeN0FE9ZtRDsE+usSe5vHUOiCCxQTi6r5Bo
         y4alOLZNp9RXz68rDNuXSNO2uSs9mqGwnNq0BnmzPHC0y/kRfPceMW6eoi7kGko5LPIO
         8P4A==
X-Gm-Message-State: APuU4Z/PgUIVGZ7/E1u6seu5wcH7eoCvkbSb4hARLksUEC02Q6/tEuNx
	6g5zlrpSE0KhkJcLVt/Msbdg/Afkmyr8370ZbX4vCyN8FmZunigtEOjoQAI6HKnLUBBwiVDqpgD
	//vlT
X-Gm-Gg: AYBFou0ECVt4kDY7C6khf0D/5FWRxs/TffURAisZGcnWCwlklxmhZ+H9FR+eHeU3bLX
	R72xzAddA5dOAeXanqXdpEhLNaLbMWNABapQrfEXP1GIv4LyoenNreJnJCHYj4ta/Z6LeoZn/pD
	E0wVoTAx2KDMSPznPZ1OnHlXLfDjNcyx++6+4ThPKO+b2X2TORmTQSxfzJtqny9pwySuVr3Uqv2
	a01wQghxxOXtUFTH5d2/j2wPbPpUUCHfmn1u/6m9FZT9dQ6IQZ+Hfo4AcOc5WdGmZ5jW4yIINLz
	gir+x1dTv+93dI5PK4E4jGgCoM5OuKmvbR2IQb+QTPYvoaXRUKDs+IfczDkUM3zEaG6f5fa2JHl
	5qASoElsbcuhwJisjI1+JIUrnXfWKTr2jUQWQ/lzfak1wjB+SaTg1GOCWSv2j9FOR+DHt9vbE8S
	VgZ6G1xLvUCIn65RbZCxfnJU4rBJ29vW+qoCGdTW1TMImjCUZabsD7cgQwcrjVjrGeq6eJi1ND8
	0RkaW9Q2jsCtrsULBLwllZe3eQhd5kH0SS7UzeBnwgDqdlFyBhL9HCXsxXo38RNo3au15TseTx/
	Y5onOwBJzS14lGnfQmlxTCQu3CeN3ScFq4w+nQLR8WOPKuXr7Nv01eNlezANILtiEA95sW3I+XV
	88qEIWCv1WZltXr5Gc5uT8MPwAgHylqluB1VL3bC/6F2crlIavr5szTbuHpkXEXDLIPDNu+Ej6n
	g=
X-Received: by 2002:a05:600c:1387:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4ac17d16afbmr419676285e9.8.1793879738467;
        Thu, 05 Nov 2026 03:55:38 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:38 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/19] python3-jsonpatch: Upgrade 1.41 -> 1.42
Date: Thu,  5 Nov 2026 13:55:18 +0200
Message-ID: <20261105115526.634289-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131911
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.42:

- Raise JsonPatchPathNotFound for operations on missing locations
- Add opt-in atomic application of in-place patches

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.41.bb => python3-jsonpatch_1.42.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.41.bb => python3-jsonpatch_1.42.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb
index 42fb13fc94..486516dbc6 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.42.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1aca06402f94e5cd7bc133af0cb4f7b2c2f9c0bc172f9de52c9aa4c6104b0d1c"
+SRC_URI[sha256sum] = "8d553ab33cc1e5d3da60b8be5224355fb28cde863cc8935c40f011a8c0d72ad4"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3


Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA4E9B25E
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18702.1771933482919943109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J3uiJQEK;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43945763558so3350840f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933481; x=1772538281; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keDEOWepBo0kWdl1I6FC3PSo2dLZDytxOIU41GNg090=;
        b=J3uiJQEK0kdnjhn9ki+GbkFZxpx1XRm/ODGz55MdQrhFTOC2SrEuGHcFWsYW9j4x0N
         t53PCrvsG9SjnpyCuZoHfyZAn6xg+KcVKg33OpAgA2PXMoz7R3JPayidhEMB+LLGBxPD
         XgZvpkUXHYNj9DRAjwDRISnJLRQJSf3w1Jfu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933481; x=1772538281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keDEOWepBo0kWdl1I6FC3PSo2dLZDytxOIU41GNg090=;
        b=lRleWqgeI7C4B2yRmrbVQRsrWyJUNzaX9WNRabDvvaPRiLh+1Aca0+QdURA12UmFC+
         EiKs8xZh0OSe6Hf54eA1H7QwRY4Z6MDU+LqVdBGxzox3t1GhwZp6bzkDHNOszvka4tah
         7lYJsj1lvBzD+5pksIXgJqZ3PqTdDNgcttHiXUJVHHm9h10rScquwWqdquj91M55teVv
         z7K1v+zPRmGsPtxGmbcm6snOAS1UVrGgXd6+xbul5Ye80qOOc6AqCAEjYBLB/i1mrir+
         dXjpRgx5yL9yVtPML0etiF9Uw4LtnR0ImdC0FXkVJPnTrQc0rd1K95K2bjTEp23jpMvu
         H8yQ==
X-Gm-Message-State: AOJu0Yw8DMcHY7qjg/og1t3d0GnA86PU2DQKEzhNTJVYOpsWOaDiiO8r
	FYvQGzOLLT9etvv6U+WntSr/N2egKhcLWdvdC5EdDcLoUedobylZKkr+V2vvPvXcNZmSLNUhUN0
	nH447
X-Gm-Gg: ATEYQzw6gRjKmvQopJn1ndGfgr6MyWkXxQTw8H1viSz5PnFEVPNzbu2v8a+WZiaORN+
	bSH7wAW7AQFulV/GiSsI/iDDrUAnbUWRoKBfxBLUiO8VknHYvFQtGw1mqs9cnkt749Cy+docBvJ
	rKe5QhNF7XLZkJpt6RE7S+AQbw3Tl3Kjsfwx0N3INBMhTx271aUys/83De3ZB4sRkpB0z4wT3qg
	13XKxnC0HFOfyGkTwYMZgcgEkiZyB/m95Ku0FYBbC+UDDWoFHq1F4AnjwDIHsWx+uy8SSFWAHOZ
	8P+Ibw7XZhvWEMGwooGYmGh0imH93lXwcW/DQdSDd2PpCFzViz0qAwlqudToU4baKBgD5ZSp7UR
	aGq3kyM9XkZPLFOtYGecYRjIhngY31KSWgX/V+YXFYkQlDSRDGRa5krhbtBbq57iQTTrZIGcVOx
	TtlfAO84KKcLPNcnXr9khF/7P7NWeHSu+zROgH
X-Received: by 2002:a5d:518c:0:b0:439:8704:e751 with SMTP id ffacd0b85a97d-4398704e7dcmr2495090f8f.40.1771933480964;
        Tue, 24 Feb 2026 03:44:40 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:40 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 8/8] python3-flask-jwt-extended: Upgrade 4.6.0 -> 4.7.1
Date: Tue, 24 Feb 2026 13:43:48 +0200
Message-ID: <20260224114407.1760757-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124581

Upgrade to release 4.7.1:

- Add controls for verify_sub option in PyJWT

From release 4.7.0:

- Drop support for python 3.7 and 3.8, add 3.13
- Fix documentation around identity needing to be a string

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-extended_4.6.0.bb => python3-flask-jwt-extended_4.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-jwt-extended_4.6.0.bb => python3-flask-jwt-extended_4.7.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb
index e188f2b09c..b36ea81d97 100644
--- a/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-jwt-extended_4.7.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9166295d7c482b9440bbb2b5c0fa43ac"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE = "Flask-JWT-Extended"
+PYPI_PACKAGE = "flask_jwt_extended"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "9215d05a9413d3855764bcd67035e75819d23af2fafb6b55197eb5a3313fdfb2"
+SRC_URI[sha256sum] = "8085d6757505b6f3291a2638c84d207e8f0ad0de662d1f46aa2f77e658a0c976"
 
 RDEPENDS:${PN} += "\
     python3-werkzeug \
-- 
2.47.3



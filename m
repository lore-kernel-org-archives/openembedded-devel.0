Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372D8CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 21:28:29 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21076.1762378099537319613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 13:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l171CLwY;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b70bee93dc4so37234166b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762378097; x=1762982897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuKDKeBpaJP1pVVg9NZGgWlP9z7WprbWBrdFdTYZt5E=;
        b=l171CLwYwGBFZCIlRIrwGMiusc6FpQu42/QvCySMEfGRaHNEZi7RiK0fANnj+MGZjs
         l3p5hPSzOvl8F5buYpi5OA6KZxfnrG8kEkNCJyBYEJSA0mEmoP5319itsk/OzorJbR8y
         d3YXlKk3jJq/xFrnrvoh6DQitkvxKTj/ae3JCLrfaFIW9IfWp8iGXowEtkDXDB+jVHsT
         qYeLTicCopfZltsJuCmyXZ9Ep+64lDwq5vjlAccvMRKo3p/GvyuOye5Xu9yG4tpQAgfG
         Y4lQgqrerIbaUEM9nN3/LzfqPnCZhpuZ2YWedFBJd/dBJJ7f3iXCLlAEn7wHhGIgjMoi
         yi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762378097; x=1762982897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuKDKeBpaJP1pVVg9NZGgWlP9z7WprbWBrdFdTYZt5E=;
        b=onJMSEkD2ItUqNZDXNNZ9/hbXFTyqS/YyF/5K/mKk7d6gLQ9H+T2SeeX15hDEwyKZP
         PgAVLiWHAAEa3TmyFvrERuDhadLzcG48W7QPVObYD58Oe63cdHlw2t2Yiv3q3Agg1hNt
         XWUz07JMzq3H10DD9ojVURObSQvfpFPjP/XupPdrJ3edH02kaTCu3/fMrdoc5N+CMvWL
         y+A/BJyVCA9L8yPK0IqiIeKlzWTW9P+27xhhAsiWbSQ/X3WrBWgzL2T2T8I+Tkvt0mYO
         4BdWVvjvwgiO0ez7G1F5kv4ShMXo4Ihto8LdcdFV5hGmtjhoKE3kymNX7Yx+onDUiFMw
         ot1w==
X-Gm-Message-State: AOJu0YyzTCHt6mQIHSVo1nE4jDnJpmE71vHa3h1yf61R62iMH4aIOLne
	DMBn+1uLQpqtDQxzugvzrRbnWXlRPCA1zCbsHLYRiVJJ68FtA/pEciZfMCY7R7GA
X-Gm-Gg: ASbGncv1SxScoJW2XNubD0Q4ANGNjoD8i5xuNEmQpXABFkUwStn04OpV7FYkVS9s7NG
	3THjIYWaitYaH4TMTvSq0/jj9w4tHTg8Tbm10mS4m6TfE14+ni7YXQSMyptM12DUd5qgxrKKLp0
	PCd+W/HOuV1dzDoxCVV1INlLgQO9+YTVN9KGan9tkwAA3mV4hVgFXuPjnJPt03sv2/CFVf60iSd
	RO/f2Vjr5oe6wA7G8cYZZ1O8ud9HZAg0QaiihLEOrNaydkc+h1XZpGVp5eIBzPA3Q3VJQbYV0J2
	xNqMOgpOXx/PCmk9mSRh6pja8RCeEctVbVgDV0ROfokm/nhq2GWhZIuJWeXvjVsIDaGUHH+o0GS
	e+qOoZxoRzLdZZvzA9j+nzVagFUEYAxAO7yT2OgCXbMaIhr+zq5VMn2DiU9c9it9QE/pkTsMhjF
	WGjRjTen+uAIEBgtvJVNW/wrTs52HNdQSMWg2BVKnavKOhOzEknkaPgBsD58YiG3B05kKT95zqu
	jbfu2/BvasKjw==
X-Google-Smtp-Source: AGHT+IFwnTu614YHp1zL2tMbnVdNZm5ly3ee2VqPa68aiU+g5iaEy5l5yXrm+zvUt9i92oBQ2Bt4hQ==
X-Received: by 2002:a17:907:6d24:b0:b2d:830a:8c01 with SMTP id a640c23a62f3a-b72656907e7mr519347466b.61.1762378097371;
        Wed, 05 Nov 2025 13:28:17 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728933429fsm58550766b.9.2025.11.05.13.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:28:17 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 8/8] new recipe: python3-pytest-retry
Date: Wed,  5 Nov 2025 22:26:35 +0100
Message-ID: <20251105212631.386242-12-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
References: <20251105212631.386242-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 21:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121337

pytest-retry is a plugin for Pytest which adds the ability to retry flaky tests, thereby improving the consistency of the test suite results.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pytest-retry_1.7.0.bb            | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
new file mode 100644
index 0000000000..f70adca68f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-retry_1.7.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Adds the ability to retry flaky tests in CI environments"
+HOMEPAGE = "https://github.com/str0zzapreti/pytest-retry"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c25bd3d1db774af27b10acd6f80bf939"
+RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
+
+SRC_URI[sha256sum] = "f8d52339f01e949df47c11ba9ee8d5b362f5824dff580d3870ec9ae0057df80f"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "pytest_retry"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+RDEPENDS:${PN} = "python3-pytest"
-- 
2.43.0



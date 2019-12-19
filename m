Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 94B9D7FD59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 15:25:37 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id c13so2716448pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 07:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xEvr/HzLNsrKBqYLM39GjP7PgvEZxhrVsAKwaL8m0Yo=;
	b=Ov3aeKYHmJu6wSmbnJiHuMWWr1IKR7cB1WxwwipeSvh/1rs3EZAqe6HeshWXhOj5RW
	qWlXSRlES70WeTqTUWYSqkktwvzMgjwGtUph0bOjL61SImi0vuABBhCOeM2D/ubvD6J1
	HfkYCJOnzOAPnl6va1BK9ar4ISFij+FyFBX9Y27wwgfYSGv2XzReZY8TJYwrnksjpsTy
	RwPB6AKart6LZ9+L8tqxa+adSJ0fAfCy1w+0wDfPA7FuWm9QbC9iUdRffpxLuqBdhGtv
	lIkkXiYJZD/mBQqjYHjti5q4Dgd4mnmlXrVSnAhp9KchWUThBWwTLIe3aQDQ/sJKdFAJ
	EHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xEvr/HzLNsrKBqYLM39GjP7PgvEZxhrVsAKwaL8m0Yo=;
	b=FEm2nlE3pRrRE3GQxDULeooioQGi9DyU3oGlTQbgCDMuf07QDx75JyVzRdxqXYxN1x
	418zHpm82B/pIzmoQn8+6d1Of2Uk2wzOzMvxxG11ozC1bmOyDLsvtQh7sYgk5lGmVkWv
	eElouCzNQXPdslPU0jtYFFDhEZzvfkkJn7KmfnfSRNDzWbsBa9DIC4GBYa47Fkjx176Q
	EMylu+Z0hkR3U2vABuHuMjIJqQ5KQO2lxYtXuFdkO/7N+GlAcBPpcEBcKHq+rQBMyY6/
	krREMZu/bHeWf8zZdeeokowVc3u/+UBIirwwuL8is0urZQP02CFlW5eg8jYIm1ALPxtO
	roKQ==
X-Gm-Message-State: APjAAAW6TXz9DzHXWuce2NJnu6fpB7tudtGRr0aCHY4lnkicGFlgXCNm
	Mx0oTEe//NUcnU/sWfFhm6HjGfNIbDo=
X-Google-Smtp-Source: APXvYqxkJPaTV7s0GgDs8AapXAUCzZZ1BsqLQ26cjLrW2n5Svr74yyr5u/KnICsyfRL61JBL08tCcw==
X-Received: by 2002:a17:902:a516:: with SMTP id
	s22mr9583634plq.89.1576769137883; 
	Thu, 19 Dec 2019 07:25:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b])
	by smtp.gmail.com with ESMTPSA id
	s18sm8840470pfs.20.2019.12.19.07.25.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 07:25:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2019 07:25:22 -0800
Message-Id: <20191219152529.725879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/8] luajit: Add ppc/ppc64 to unsupported arch list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Dec 2019 15:25:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index c2d2180bae..08a0470b04 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -90,7 +90,9 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64/mips64 is not supported in this release
+# Aarch64/mips64/ppc/ppc64 is not supported in this release
 COMPATIBLE_HOST_aarch64 = "null"
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
+COMPATIBLE_HOST_powerpc = "null"
+COMPATIBLE_HOST_powerpc64 = "null"
-- 
2.24.1



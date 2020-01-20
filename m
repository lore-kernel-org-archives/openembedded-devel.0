Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D24E87FCED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:53:32 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i23so241737pfo.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 11:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YvOlfwSPXev9Idi4IYzKKXyM+G8a+TaEf/97XKxTnRM=;
	b=GYn+/2cCLb5Ryrb/E0YVu5tNdzuBVhsIGHrH58Hxvx6vQeHTI1LvDWdmNqaEm0pxU+
	nxiQwKji/mK1uxIz3n7ch3roByJvA4JgYeCnSSLknTs28ySF0lvA5qsLd8JTzqzft7eK
	OOrfiwfItgyqMMehFnxYN933SJtQ+XFz4yObLs0SbMUplzX2oUwHBJ6hB5crF0PJoocR
	J6tSjvtdtOXwGDO4g+CPTZfrlRuQkg9FM6/WYngNVegaEdqZaQn3sLL3aMzsikVv7MBU
	4F3oUrUwiaXqVjkQxlf9oo8ueos573OS6aAOqfnYBdkKUiDuGh3JQld9KhTlFBafDg+Z
	RElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YvOlfwSPXev9Idi4IYzKKXyM+G8a+TaEf/97XKxTnRM=;
	b=g4s+yobLE9qLuTwBLigD0JY1FaAKarnpQcDPSQFoDSADWjseEsu8m9xVWuY0bcRYJF
	Gt7KV4efEcPTwwLKcCxApCYi+G060zNNn9E0lmaazEVLAtRSxdA8WN2ML8VsIdVU2wkG
	Q/3vL/SYz2bqPBuBc5v5CVdH+ZBqefQvcxbcWVWvLwm+Ihm/3KQiuKP6kYg8qBpvkwK1
	dq2BSGvc/FREWVIWXnclIbRilooAc0i1pOCYWwgv949cXO73LtP1ljctLQFMQv5/w5LH
	+54AZqTANTENOW8qCgX0Ch3QhaLf+jBFZQgbsS2HUrXLK1yrhg8m+Yxky7UxChqWH5Ll
	DF+Q==
X-Gm-Message-State: APjAAAXB5cYaffgllbA8LlgTkxctnE+7AFfmH57PR5SNtUi0qk8Sb90y
	0XgkJb9X8YC5Y/+5HAPeCzfNq3trRZE=
X-Google-Smtp-Source: APXvYqytoZ8rZRG4FVf4fyTIVhmICEQgfZ1C0Hzz66qIb+6lNOaOr0FjT4k35qBuHGIB9upBprGFkA==
X-Received: by 2002:a63:1b49:: with SMTP id b9mr1365579pgm.258.1579550013532; 
	Mon, 20 Jan 2020 11:53:33 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	x65sm42189728pfb.171.2020.01.20.11.53.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 11:53:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:53:05 -0800
Message-Id: <20200120195306.10880-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-beautifulsoup4: fix target RDEPENDS syntax
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
X-List-Received-Date: Mon, 20 Jan 2020 19:53:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to review by André Draszik, the syntax that
was eluding me in prior patch is now corrected.

NOTE: -native,-nativesdk recipes have the full build
of python2 at their disposal, including all modules.
For target builds, we need to include the packages-split
modules that are produced by the OE python manifest.

Fixes: 417762c0 python-beautifulsoup4: fix target RDEPENDS

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-beautifulsoup4_4.8.2.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
index 821e5c2c..9f9065e2 100644
--- a/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
+++ b/recipes-devtools/python/python-beautifulsoup4_4.8.2.bb
@@ -19,14 +19,9 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-soupsieve \
 "
 
-# class override, which is not
-# inheriting from above (FIXME?)
-RDEPENDS_${PN}_class-target += "\
+RDEPENDS_${PN}_append_class-target = "\
     ${PYTHON_PN}-html \
-    ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-lxml \
-    ${PYTHON_PN}-soupsieve \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0



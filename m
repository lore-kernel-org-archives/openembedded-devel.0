Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 45F2E6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 15:31:58 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id b131so9368033qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Apr 2018 08:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i9kNG/rIWyqlx6jHbImuLc/cz80GB/U1cMEm0PCHAA8=;
	b=nbV19HYsoJU9qAaYFLxJy8CcArwLY2tgARKGNBTGgUmhwXOq/hkbFRSsXrACoTw1xA
	ft83Xw2hnaG7jFEaijdJeFRNjC0+Ar4L/9J8YaG0v8/PFVE8goRFQdGaPG6SlhJk6V2/
	h1zN+OXTIS5dRXeN2RoEorOARVYdr5ATcFqTNgod5C6FxbH3Unrr/iQnVVA8rabr4J1u
	UHQJZw8y4lzhL+3LvBnMoB/at/HaV9Umoue0ElUai9dRnO4QDyHREFrSViSZQDzYJmJo
	juA6I82qqRY1N6b5F+yfN0yxn0MAKH3bTRMgUaFkEXboo3pJ4val4XAiBZKGuLl0eMdB
	3w7A==
X-Gm-Message-State: ALQs6tCXb60fi9g4i5Qi1ndZCBkUGs/figCbRcbIgVNaJ1A8FC54XsB8
	dWZCYDPGUfhyoL7WxsQw/NeMY7BH
X-Google-Smtp-Source: AB8JxZpste9p3JouT54lT7Vs/I0XldKzSggtf336oPhglF1VwLQfZrSSxbmiR+v0fwtwKFpGf28f2Q==
X-Received: by 10.55.105.195 with SMTP id e186mr18299742qkc.322.1524411119431; 
	Sun, 22 Apr 2018 08:31:59 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s39-v6sm9552914qts.43.2018.04.22.08.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Apr 2018 08:31:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Apr 2018 11:31:52 -0400
Message-Id: <1524411112-8028-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pretend: update to version 1.0.9
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
X-List-Received-Date: Sun, 22 Apr 2018 15:31:59 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pretend.inc                | 4 ++--
 .../python/{python-pretend_1.0.8.bb => python-pretend_1.0.9.bb}       | 0
 .../python/{python3-pretend_1.0.8.bb => python3-pretend_1.0.9.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pretend_1.0.8.bb => python-pretend_1.0.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pretend_1.0.8.bb => python3-pretend_1.0.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pretend.inc b/meta-python/recipes-devtools/python/python-pretend.inc
index 78b6717..b342aef 100644
--- a/meta-python/recipes-devtools/python/python-pretend.inc
+++ b/meta-python/recipes-devtools/python/python-pretend.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/alex/pretend"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
 
-SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
-SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
+SRC_URI[md5sum] = "ad53883ede48aeac7ae584f0de0240e8"
+SRC_URI[sha256sum] = "c90eb810cde8ebb06dafcb8796f9a95228ce796531bc806e794c2f4649aa1b10"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
rename to meta-python/recipes-devtools/python/python-pretend_1.0.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pretend_1.0.8.bb
rename to meta-python/recipes-devtools/python/python3-pretend_1.0.9.bb
-- 
2.7.4



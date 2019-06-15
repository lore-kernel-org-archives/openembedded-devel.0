Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id B31A66FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:37 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id v11so3414183pgl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rToy6SWR1WeBgJNHmahxF+2jTL7UJcdPygjl82UcyVM=;
	b=BoYc1iq3/iijU7zgkHbFKx/hYpxGNbnYmXjtaTxjj9HRRrC9lHbGKfa6fWmXPg7IXZ
	JQYWInVg+jFjX1CzxCs7m9jeDKxEtyoLVrotmH/2Bh8g9VYfi3ymmcgzf3vad0e21PXA
	+4uTbmZpfdj+S4Xom/DsRENcuqXqZT0XUN1k6oVJz7ZN69xfxxt0P993gaiwbYiLAPlU
	urJiJOxqLPE7Fyf35xg+QXKVgQAulnzvZLhUqvzjxiBXl2Pp0Yu0wUMasH+00BguC5VV
	mpI0OXn+HFk5zydJZ6XAg33bD0nXOG/yTMj+KbMHqdThWqsKdYiw8ED5JAbW60pPBs8Z
	Sr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rToy6SWR1WeBgJNHmahxF+2jTL7UJcdPygjl82UcyVM=;
	b=B1ezkk0YJ9rihprbc11NAhhd0gmDGYeBOhhHiiRCBrwFgQV8+4+/z9YK0snYEOJvmS
	h4RSDdmbDTHlpmQBY4+wzeo35a9iNJWQmzxSns2M9wxL36gLufrp2wEOMPyaE5W1hpCY
	HVyP+xZaiZbbyrIJ/WiuF9BompnDkfa/AzlU9Fh/HGOALWRVdPPMxHl0aJwcie0yw/8z
	XmerTDCxw5Tos8BKnxcdrkjKIlAjuRPpyw8sl9C4vGo4ho55THJ6Yc5V7XXtY4lYUeNP
	01b6U6x4YNDYNunzFp2ZZE0eJPmlEQkL1MKdiYVnHv8ahVMXXqhOf1H8PYmWKscU8IIX
	fpYw==
X-Gm-Message-State: APjAAAXw/ybNrnVYa7u47MuZtW/qltN255jc2x0XQ7WNRL2iXjM6rOMd
	jLWyOfK9QQV/jwpQzyYYnyqpalk+
X-Google-Smtp-Source: APXvYqyXqwrfwqu4itxYLZYi1YGLSynxJAHeweaKJ6i/9o7OBJ+bqgaVjMTeIP1N+UVCvxKtw/Nlyg==
X-Received: by 2002:a65:5945:: with SMTP id g5mr9066022pgu.169.1560621458662; 
	Sat, 15 Jun 2019 10:57:38 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:11 -0700
Message-Id: <cff942d012135c7e67cee4583cfe6c7a8444e778.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 07/23] python-cassandra-driver.inc: fix DEPENDS
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:37 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* there is no such thing as DEPENDS_${PN}

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index 1cc1f4c..53ebfec 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -28,6 +28,6 @@ RDEPENDS_${PN} += "\
     libevent \
 "
 
-DEPENDS_${PN} += "\
+DEPENDS += "\
     ${PYTHON_PN}-cython \
 "
-- 
2.7.4



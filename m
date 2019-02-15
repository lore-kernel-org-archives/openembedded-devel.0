Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id CBB997C701
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 09:46:10 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id m1so9272136wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 01:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2zYA5fLhpYjYv/BBgLE5pTtBqY2VbT5oT4fQpM7puU=;
	b=Kb16TPHlfCdIP2di9hrmcdvlYSYUPP+kaPdZNfqgMk21mSYXH0uFVxBpw75k08gXOS
	kxE70AQUeg8RWPYA4OyR2+4eVnpG1eF7cetbFdBZT+xmvOjLwU/D5OH4/EEXm6b0eppG
	x1Fuh8p2rMRt3iAxBXGKACHH4mYVvU9UQuz6638Z0/vM0Jzjxq1rmJUc6UobTZ0GYiNQ
	ByzQP/D80MU/MRpWP8q1mTdevPSALeG6KQOGEHyt73fQsXQfNQezwIglJcUBqJBtMEma
	R4b9GjDNZiD6KDoB6cZEZrFcdbTmyPz9oMDlQz/iXggtiEjWBhW0YzO3Bx9VTvAbf4Ok
	uyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=s2zYA5fLhpYjYv/BBgLE5pTtBqY2VbT5oT4fQpM7puU=;
	b=T7rnNScjqpaTMj0uqreNYszBoVJZKCWRoT9NKoUJ2vJ0YiBukJBdVgNhU5ZlsNIG8E
	9qCkqOX0SbWxL6rupf9E1XGOTwZjqxnlVQReD0FU6FU5pOZaBQ7CiC8vAoiJfNXkZ1LS
	gQHbHzL1J8RKJFaigrchXf0zEz+KfDEsJ7qUpmSXMEaOHqkueW6DQuGltqxrNd5Q/CdJ
	MNALrEKhwnO/quf273M6BEnz6M8k0Tdsj2i2SW040ynIzBURERTaKhuSKaJxth656rgT
	uYh5LP9XoP6Xryk4g5cc/nJQEQ/z/QDif0Tb0iorBlZ65k+xCLKII5ZRrISCXtMxzHhE
	IFTg==
X-Gm-Message-State: AHQUAuaOr3kZIVk4g2Yuvy8MV45710+Iwynv9S4BXQztaL0A4+8xA8Ln
	AJJRdT08311wY3ArVAoHaZ7U/g==
X-Google-Smtp-Source: AHgI3IbWVTrzKdJUDlJDKgSbnHeFjjp8IwTo7AK4bHt/xouhVumk2yol1iWR8kdhugIeYVBNfAbOhA==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr5720973wme.137.1550223971330;
	Fri, 15 Feb 2019 01:46:11 -0800 (PST)
Received: from localhost.localdomain
	(aputeaux-684-1-7-43.w90-86.abo.wanadoo.fr. [90.86.124.43])
	by smtp.gmail.com with ESMTPSA id
	h17sm2846192wrq.17.2019.02.15.01.46.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 01:46:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 15 Feb 2019 10:45:44 +0100
Message-Id: <20190215094544.5195-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: bump version to v1.2.1
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
X-List-Received-Date: Fri, 15 Feb 2019 09:46:11 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is a bugfix release fixing two problems in C++ bindings.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.2.bb => libgpiod_1.2.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.2.bb => libgpiod_1.2.1.bb} (78%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
similarity index 78%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
index 93165a0c2..d7fd55d79 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
@@ -2,8 +2,8 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "34a9972f2f4e9c32fa940301301b007d"
-SRC_URI[sha256sum] = "b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba5844b5ba"
+SRC_URI[md5sum] = "e6c222512a0d1994a069ebfd2e0a56fd"
+SRC_URI[sha256sum] = "736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2d80683081ab4b31b8"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-- 
2.20.1



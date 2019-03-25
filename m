Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id DBC7F7D085
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 14:05:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id y197so9253029wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6SawKymbInW5dY9225IqZMHZ/ZnCxlBHHzKCoexVBPk=;
	b=VxgVXBzAIW03ZvCrPSPwQt++yMZ0/hBjWMiD7ozAn3UFWUzD6LHBZouYsAaslqNaxO
	YCHBSCXqo3TalYlhjC+NipY8xobTMd53joqQepXyibKtagg7CW7HZ58aiJuP5lShnDwT
	kzM+uv/waY71U+nCKafwCq7iG9JUvBkjGHQcb8zLPE/LuMRoxOTb1LT9qvHeETU0dpxy
	WpnW7u4ncXmH0wftZSa1qIo4OiPgaykhCLTIa167aOEYuS9fOIX57EQZUnf1xIDu04Eu
	oIDq8X1jjFy+bIU+j87c1XNNRaYz/dTl7pl/vRMkLorD0KU6o+IixrVpZvP6cfWcTW0O
	uhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6SawKymbInW5dY9225IqZMHZ/ZnCxlBHHzKCoexVBPk=;
	b=PlT3sQrwsJRe1f+yE3Xm1gNnyMOtTr6KLUoWTGn2nompugTFx1ruo4R/zPLVt1ne8T
	pOPeKy3bD8rSA2Fz3C0Hj1+b5UvtYr4eDZ8kOrqz+6J21NhJ8be34xi6GMfGK3efxP1P
	8a4C+Om4lHpOZgsBIq868+iOZyxQ/rXGVNHKwGtmejuIMLjqwgo++2cLvkM63t3+UEUJ
	kXIUaVoyjF25Fx551GU5jTa1LA8WGgnUG8WHQAY/1VFkq0Uc9FIVf2OWjNieJtCj9HtV
	JZaDIlCIZRnZLMS11HJekGAp5Kq/od6yMMZlUWfI8fk1fK1p8ZpSp3WEimp5zGfVR4h/
	Ddmw==
X-Gm-Message-State: APjAAAV43Aa0SsAR+ZZcdpei7ufp6ZOUUfqwBwHCSRF7lgJhuswObZfr
	OmAS5qUvdC0uwO3JEPB8lZsCpA==
X-Google-Smtp-Source: APXvYqwz820XfUGRUPuawzUrm+u+zKcDFGgFt5RqUfmWJYA1UD4B3AZUPJ6R+HmiuikRGuNaRv5yoQ==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr2896853wmh.147.1553522730561; 
	Mon, 25 Mar 2019 07:05:30 -0700 (PDT)
Received: from localhost.localdomain
	(aputeaux-684-1-20-74.w90-86.abo.wanadoo.fr. [90.86.223.74])
	by smtp.gmail.com with ESMTPSA id
	p10sm13077424wrs.5.2019.03.25.07.05.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 07:05:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2019 15:05:26 +0100
Message-Id: <20190325140526.12797-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: bump version to v1.3
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
X-List-Received-Date: Mon, 25 Mar 2019 14:05:31 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are several new features in this release. The one that impacts
the recipe is the option to install the test executable to bindir using
the new options (--enable-install-tests). This requires separate
PACKAGECONFIG entries for 0.x and 1.x series.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb           | 2 ++
 .../libgpiod/{libgpiod_1.2.1.bb => libgpiod_1.3.bb}          | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.2.1.bb => libgpiod_1.3.bb} (67%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
index 09fb65a08..96615ebf2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
@@ -1,4 +1,6 @@
 require libgpiod.inc
 
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+
 SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
 SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
similarity index 67%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
index d7fd55d79..e513a33bd 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
@@ -2,10 +2,11 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "e6c222512a0d1994a069ebfd2e0a56fd"
-SRC_URI[sha256sum] = "736d8b511ad247c2acb01b592f2bbe5e757e14e1d8347b2d80683081ab4b31b8"
+SRC_URI[md5sum] = "9f7530a5d56f070ba0af78d6ba077973"
+SRC_URI[sha256sum] = "6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
+PACKAGECONFIG[tests] = "--enable-tests --enable-install-tests,--disable-tests --disable-install-tests,kmod udev"
 
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
-- 
2.20.1



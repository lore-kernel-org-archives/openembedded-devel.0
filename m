Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B94767F7DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 10:45:25 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d73so5208787wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6aEj/sNbF5j5Xk8kGrMG4VBaNUFy9KJlR04QSlYtq58=;
	b=CXTbD+U91S/n7oZAOIYme0zN11ZzjUNicSopue0fWy0wQkl0Xu1fY77tVchM+MwtiV
	q/MI5s0FewwdycdWJc9AnU6KCHceXmAsVpsAsEwHNIAalfL8NVfX07WTt2ii3dRxQm8C
	DxBs9z073fjhaW+T/BWEHjcZoYYgDQQZ3p/hUlQ8oMkWANb088072YlB7lbT0rxAQQIQ
	bzqwS93yTIkW7trTV9BGXgHmKUzcSQSrgomPqZ2eBEcMolLkAfIr3OQrHuexNA3eMJca
	03sRJKh+k5cpa6Mvrxn0J+39H2xfa2gFzlYGntqhdcRv7Xj+ogPbc8h4v4z/ze5M9DXJ
	OEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6aEj/sNbF5j5Xk8kGrMG4VBaNUFy9KJlR04QSlYtq58=;
	b=bWQx2ASPEYOqWUuv/bzDrpWfi7RRz7dzOG81ADga/5VFMgchdgL3P4QS1ZQxZt8E9/
	EvXdz5YlWbmkklrkRS2f+b9PbjUMO8GzMI+XC804uzJ8dYfUaVWcqtrVHCMjzToshGm/
	8W9xNRPGGyNza1SmHet5QjKKjKkG3cgBcdQ7qhNfUnSDwnqFi6aPB6oQHFPs7nRJ7GLL
	eoue7RBzECl5/L4B/aX9HXwLqaaeb/KuTgSNVa3xElMw55mVQgHSQXxeyAG7DxI1wAIV
	ZhIP+RcikFkROghzIrEemxy7n6cOFqRuGDDkG2GSpNtjA0r9TDY66KBOoifiMeu+xqKz
	WIqQ==
X-Gm-Message-State: APjAAAXJPaV+7CadrnbPezM90LiYGExALrM5nl1jZ9LAkEWXaVNDBXx5
	Zrfgnqml1YKZSoBWOmnf9YcvTQ==
X-Google-Smtp-Source: APXvYqwYj4G1vXkuNOoKeP5kNDDZ0Ik61OAcDdlPakm8Dmovtg2xuCTqC/x6picZTxETWilqlhOLkg==
X-Received: by 2002:a1c:9849:: with SMTP id a70mr13084319wme.76.1577961926363; 
	Thu, 02 Jan 2020 02:45:26 -0800 (PST)
Received: from localhost.localdomain
	(lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
	by smtp.gmail.com with ESMTPSA id p7sm7970262wmp.31.2020.01.02.02.45.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 02:45:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 11:45:24 +0100
Message-Id: <20200102104524.22464-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] doxygen: upgrade v1.8.16 -> v1.8.17
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
X-List-Received-Date: Thu, 02 Jan 2020 10:45:26 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Upgrade doxygen to the most recent release. Add nativesdk to
BBCLASSEXTEND to make it buildable as part of the SDK.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../doxygen/{doxygen_1.8.16.bb => doxygen_1.8.17.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.8.16.bb => doxygen_1.8.17.bb} (70%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
similarity index 70%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
index 4df994c75..7a4eee32c 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.16.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.17.bb
@@ -9,9 +9,9 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
            file://0001-build-don-t-look-for-Iconv.patch \
 "
-SRC_URI[md5sum] = "3ec5f8bfda38a05845161fbbd5d8b439"
-SRC_URI[sha256sum] = "ff981fb6f5db4af9deb1dd0c0d9325e0f9ba807d17bd5750636595cf16da3c82"
+SRC_URI[md5sum] = "7997a15c73a8bd6d003eaba5c2ee2b47"
+SRC_URI[sha256sum] = "2cba988af2d495541cbbe5541b3bee0ee11144dcb23a81eada19f5501fd8b599"
 
 inherit cmake python3native
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1



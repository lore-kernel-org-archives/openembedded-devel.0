Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9EBD7F874
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 20:14:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 6so457641wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 13:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mhPxFta/799kYPW+TRqAHypejPVAiDLeEw6oBNIcQaw=;
	b=CiFMxey1iD1YOvGOzK0NADUK5m/WG87iAYWJNwBmCa24OB8W58ehdItTQUQW6AVb4z
	I4hyEvEqjJwLkCEEZhjN+rF2cAQ2QlmbgbK689CKKTd1uecB2vIGXVghGCAsWi9y9X/5
	tFpQ6CCaK+lHNfwyyNwRvU5FiJdtADmvw5LLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mhPxFta/799kYPW+TRqAHypejPVAiDLeEw6oBNIcQaw=;
	b=pP88Yf0J+BZqZIWzDECHKRNlhaB90UTw281/uqib3N2DRUKLp/iUqDqiXD5R1dqzi+
	ARdlyyKn6/edg2LZt5ByzlgNaw4eyXmsS+mr+ToIl41IIT4vnnZEtw1AZ2INwDFDRdDh
	saJqqiAIy88xPijtHUvekYenQuk96TmcTDYtgoAvHpmuA8lb015yxMWogr9b2BBADD0P
	C3LNgYLlUu/5rAAZelSrrLjdvWMTJiVpFH88Pjgq8RQrnp9aIc3crQw40j+KcAStyYyr
	vPu0F7/YYYzvNUHs3fKq7kFaE4DV/uzQtNAzM4tfZYJm8YUvN7CsSVQkMyDNh/mLu1jo
	6WTg==
X-Gm-Message-State: APjAAAWHsRSOlKDfyavAI02TEAtx7A4C6gO960IAKse933Htpvhh3Akc
	epsOR7pkXQ0YCNdsPtgtYxZMdM9mqI8=
X-Google-Smtp-Source: APXvYqzAkMLVPmZ7Ttk+8ukxBhIZNfGIhRrCn0uQhAXyXqpX1mbQlIYGIAhhSuJ335xsbT16/10y0g==
X-Received: by 2002:a05:600c:387:: with SMTP id
	w7mr1567321wmd.138.1571861649288; 
	Wed, 23 Oct 2019 13:14:09 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a13sm24275525wrf.73.2019.10.23.13.14.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 13:14:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 21:14:07 +0100
Message-Id: <20191023201407.14068-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libiio: Disable python support for determism
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
X-List-Received-Date: Wed, 23 Oct 2019 20:14:09 -0000
Content-Transfer-Encoding: 8bit

Recent cmake changes in OE-Core mean python is now detected from
PATH. For determism, disable the python bindings to match
previous behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index 4e57d5b77..63248b4e3 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -22,6 +22,7 @@ DEPENDS = " \
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
     -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
+    -DPYTHON_BINDINGS=OFF \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
 
-- 
2.20.1



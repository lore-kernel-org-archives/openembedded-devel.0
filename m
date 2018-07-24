Return-Path: <philip.balister@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6F378911
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:43:05 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id v72-v6so2042856vkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 06:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=jhep/BB+6++bf9AjnuXsreAKD1fZj7OYa0Ow2P8LZek=;
	b=I3HOpKd0Lt64HMfeNkZH4EYfvmWB1ojifV1A3xSIjRxksm5czlMki0ww4pgXB5Fx6f
	n5aek6Lt1+H1EvqGsFLIGBkKaoeCnb2Dqi/HH9ZaB4NKqRBSqhwVIOnozixJ4DQBpaG9
	xSYMdUXQ0iKbGNjJ0SwLKfI+LCZ2rOSFJniSlOJHx1nCK0Wc/9Zu4IjhJfIzefxr46gn
	uHupEl2Nbifn5lM+KzJyRUidZLyKuZh1qN8fjWQ/q1bJzl8eAGtd8CEYRr9q11hUMa2p
	a70pXsc2ZbruOPfWHiruG0GQhjH3Ox/qGhvRuH+DEp7+i8xiHfUDttMeDXAQ3FljYrFF
	C0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=jhep/BB+6++bf9AjnuXsreAKD1fZj7OYa0Ow2P8LZek=;
	b=SkCZngz5VCQinhvTmWefDnLa2pKsRXvT+qieeHgIF376GSZGt/yErrkB+Oqv/J7qLB
	MX5GXZEpGRPriK6FcE3odHefWwcyFBVqUSbq3hl5fsZ6i41A2FGb4oz+LBiqg43h/mMz
	9D7tATkZ6EMupnhsBcXuKdBSQ4/y4Ov4YJe5jo4CHKz9mbKk8nUgfBie65Oh09elTfxW
	FrlOma8iKXBZemkNYVbSiQUoUYdIMjGcATmDNbS5zBbxXMhK8EEdyGNd17ZbyNHeCPAQ
	qAfOvZBIfIGUmGITc2WqyXfCLumA8xVIGXY9FljvHuZGY3el+wrIBceHPoHKrdmzXD6b
	H/zg==
X-Gm-Message-State: AOUpUlHUkSts7tg1qNqd8xcFVJsgAjLR7fpRZxTnDRJonUa16MrvY6LY
	TyvKETOpbeY90Z1kFJokqtjInMHK
X-Google-Smtp-Source: AAOMgpdQNh9j7cd+HFi9msEoCPs0RUc92t1VbNBk7cqHcfaUN3FUJq4WkN4ZxOYJP1mTLA7G2e9ZeQ==
X-Received: by 2002:a1f:9945:: with SMTP id
	b66-v6mr10193087vke.100.1532439785434; 
	Tue, 24 Jul 2018 06:43:05 -0700 (PDT)
Received: from prague.hsd1.va.comcast.net
	([2601:5c0:c100:b84:c110:9e9e:8241:dfa])
	by smtp.gmail.com with ESMTPSA id
	d28-v6sm2435665uan.55.2018.07.24.06.43.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 24 Jul 2018 06:43:04 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2018 09:43:00 -0400
Message-Id: <20180724134300.31744-1-philip@balister.org>
X-Mailer: git-send-email 2.13.6
Subject: [meta-oe][PATCH] lapack: Add recipe.
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
X-List-Received-Date: Tue, 24 Jul 2018 13:43:05 -0000

 * Build tested.
 * Note: needs FORTRAN enabled in local.conf or similar.
 * Used to build scipy on pi-3. scipy passed many tests.
 * Based on work from meta-gnss https://github.com/carlesfernandez/meta-gnss-sdr
 * Hopefully this helps others playing with scipy and things.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
new file mode 100644
index 000000000..ef1abd567
--- /dev/null
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.8.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Linear Algebra PACKage"
+URL = "http://www.netlib.org/lapack"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=930f8aa500a47c7dab0f8efb5a1c9a40"
+
+# Recipe needs FORTRAN support (copied from conf/local.conf.sample.extended)
+# Enabling FORTRAN
+# Note this is not officially supported and is just illustrated here to
+# show an example of how it can be done
+# You'll also need your fortran recipe to depend on libgfortran
+#FORTRAN_forcevariable = ",fortran"
+#RUNTIMETARGET_append_pn-gcc-runtime = " libquadmath"
+
+DEPENDS = "libgfortran"
+
+SRC_URI = "http://www.netlib.org/lapack/lapack-${PV}.tar.gz"
+SRC_URI[md5sum] = "96591affdbf58c450d45c1daa540dbd2"
+SRC_URI[sha256sum] = "deb22cc4a6120bff72621155a9917f485f96ef8319ac074a7afbc68aab88bcf6"
+
+EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
+OECMAKE_GENERATOR = "Unix Makefiles"
+
+inherit cmake pkgconfig
+
-- 
2.13.6



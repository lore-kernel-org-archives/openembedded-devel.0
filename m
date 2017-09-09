Return-Path: <athoik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0B678170
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2017 21:34:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so4055550wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Sep 2017 14:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=V8nsuK3R8CkDNOjNULys7bipLQ6Mgrc7eAcf6Xjq2rE=;
	b=F5w34eWx9SpEQN13YTh2r/YykhkrSseegVVKXimSK6h/ewmtqN0yacBhbuXUN04uiH
	dYVP992NuIZTnWyl5Nzmo9yBCW3IDmWRt3XIip1cdci6JKr/YZbIrV3rEwlbKKL+Is9j
	7iJI1kkjXBodAnl+zmeRlj4Z2wpTEjzQvuXME/21Y2IB8LkWVtWsx/Jm0oA7X1uinWcu
	2qlhHFroCPH1EyuV6vrQNJCu3sNU0SzL6WoYH2z+/U9owuoaFJQbo2QqdzeG6bUCCi4D
	A8dpRbwKzGgqLS6Ni/obRT9CogIlioX9wljvjTXNur84LkukyJeYcDsZi1g6q1+SMy6H
	jopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=V8nsuK3R8CkDNOjNULys7bipLQ6Mgrc7eAcf6Xjq2rE=;
	b=Nze3mHxUxuTtb6kHf58/+o0NURQMWuqibkiX6HUqrXdnDmO3Qh3MvN+S192FZPO7jB
	aSk9Hzw1eB63wOAgai8Q8PkRZFjTaL5gMUyMqPXB2+hOFVAWhiS0NcniM/1ApVdYlEdq
	kXptv4nNklgsT/GE3FspLtWEcZ1jtcMCGEwN9Gm/viWtpYzq9dlQFcyScfgafWPZ7Fc9
	itNF+jtJT2FNTEAO5CDg73tPzK5Bzrhuko/irfexgPU5R/acboxi3kbIYtzoA03nU5bh
	05l1HOvvJZCvi08IpENmk4x8FRTUJ+6Ppoc1MjQBAkHytzMIK8u99Km2eCkefvC4jV62
	Z9bA==
X-Gm-Message-State: AHPjjUhEGtG9078G25G/qEe/1CIx17IxExkJ8TDNPPSU7DGj4xWzOzPf
	yfAYNz3cRuAH0jMM
X-Google-Smtp-Source: AOwi7QBUaVY3y4zbeXUSzgXwBhSyxd9pQZ4Aj8HZfSdksRoC4+hd95iCURGN122hBbvGsj7YmkNTHg==
X-Received: by 10.28.19.76 with SMTP id 73mr4504789wmt.122.1504992849152;
	Sat, 09 Sep 2017 14:34:09 -0700 (PDT)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id q4sm2099001wmd.3.2017.09.09.14.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Sep 2017 14:34:08 -0700 (PDT)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Sep 2017 00:38:32 +0300
Message-Id: <1504993112-9111-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Sat, 09 Sep 2017 21:34:09 -0000

Upgrading to newer v4l-utils 1.12.3 on commit f84a551f2d419df88b85987855fec866d9e84b4a
Is causing issues because libdvbv5 now require libudev in order to work
(commit db42484881bf5e6a902de51fe42444ddf286d52a on v4l-utils).

First issue is missing dvb utils dvb-fe-tool, dvb-format-convert, dvbv5-daemon, dvbv5-scan, dvbv5-zap
because libdvbv5 requires now libudev.

Another issue was the failure of building dvb-apps (currently removed from master)
because the v4l-utils-native is missing dvb-format-convert.

This commit adds the missing udev dependency only on target and brings back the missing dvb utils.

Adding udev on native build is not possible because nothing provides udev-native.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
index 42da5cc..dacc406 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
@@ -7,6 +7,7 @@ PROVIDES = "libv4l media-ctl"
 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
 DEPENDS_append_libc-musl = " argp-standalone"
+DEPENDS_append_class-target = " udev"
 
 inherit autotools gettext pkgconfig
 
-- 
2.1.4



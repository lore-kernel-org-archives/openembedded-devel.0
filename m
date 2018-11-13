Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id E589260107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 09:55:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id o15-v6so12523262wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZkHs8y6OhWo4ozt7oJnHLfa/ULqmyjanLB2Li348P9o=;
	b=QebzgkTkF5zjw1U0jUc4stirKWCmNZec3Xm6p3jXtgB35IO8M0VV/NU+QoAhKAHp5I
	w1FFCCWFNmtluH1op6ZTyCzEH4aRv7ZIaFfJQ3iOTViahX00ZFuT/CgqCUWleBaGZPad
	ZmnwtqkZh2X8n8arQiNxbBaDNTmlnaklrJwPWTFR+OW2MR18tUDVbNBmOJbpz9IhPE8o
	kCKFsFdlemO67OiazLtK2ucnHr3JI0ug8glOKJdZoU4Gwu+IbOdN6HIma9JgYPY++SCY
	guQMkDlXacPk7LVW4civds3bZ/0AJD6UMEvwe9UJRRu0gS7Qk71yYILLGNe2AhDfdlMb
	Tv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZkHs8y6OhWo4ozt7oJnHLfa/ULqmyjanLB2Li348P9o=;
	b=a62SljEfDLRZjr1mokNLILF2C/CVXPog2tKcoRsQieMdciyFSfFVw8HN7m137LyXFF
	svdKuoXsKGsQcPOufzDzx5Ln4Z+RzpGEARoRnHCzKB5aWDqTI9qJolSVL3x3J8q4+Hv3
	vKnlsu5YVBtmAhSSrmtpkzXTdk0GGTlJiGWO/xG/VR3sEyS4gSEnEF/pnyB1OKtviwdd
	902fAOjmprs70aOdZcd9LDu/gU0Bo/V+jqURLyCc5fi/w/yek9D0FNL/Owp36fxImPCP
	AfZDRT7241TeAv77D+BzGwJ1Bdm0V7GlLV+G3e61aS1LEbevArfJ43lmbx1xxibLiOSz
	cEhw==
X-Gm-Message-State: AGRZ1gJ3Dl2pwQVT9oGQvaY0h8Xx5QYTrBlHiIG4ffdQXWmj7RhPzr4W
	RchQcqn3zWUEJcIvet53fkRV+HG8
X-Google-Smtp-Source: AJdET5cqn6ZntplaEttyu0QKIwdTHDiLA7PQQCt1OMYSzelQCPMMZEAXLhIlJzPvCk/J9Z65oHAThQ==
X-Received: by 2002:adf:fb0c:: with SMTP id
	c12-v6mr822433wrr.159.1542102939336; 
	Tue, 13 Nov 2018 01:55:39 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k5-v6sm30419353wre.82.2018.11.13.01.55.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 01:55:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 09:55:36 +0000
Message-Id: <20181113095536.7256-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113095536.7256-1-Martin.Jansa@gmail.com>
References: <CA+chaQe-odXPBtfwRY3-SVJkexAa2WzyekTe-4w4z8tPPNAuEw@mail.gmail.com>
	<20181113095536.7256-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] xscreensaver: add distro_features_check for x11
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
X-List-Received-Date: Tue, 13 Nov 2018 09:55:39 -0000

---
 meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
index 0a884e98b4..6ebf3c798c 100644
--- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
+++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
@@ -17,7 +17,9 @@ DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native
 # These are only needed as part of the stopgap screensaver implementation:
 RDEPENDS_${PN} += "xserver-nodm-init liberation-fonts"
 
-inherit systemd perlnative pkgconfig gettext autotools-brokensep
+inherit systemd perlnative pkgconfig gettext autotools-brokensep distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install_append() {
     install -D ${WORKDIR}/xscreensaver.service ${D}${systemd_unitdir}/system/xscreensaver.service
-- 
2.17.1



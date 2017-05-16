Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9865777D2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:15:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y10so37375772wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=393RtdMohVvx8I3YvipLUCetbg0AN1KZXpWzPGPRUhg=;
	b=a0c5gcafKWiCQqYQZ1HN/6YldKooD/MiFoh6tHoj+5ZtvCzLVOhZUzwkH+q5l+iwz/
	xiIvfJnWH088CWIAB16pKHO4ItNeR8AXwBfXyGzuueSqRBYcqovTShleumFG0f7oSSOR
	jyURy+yEGaUk7g2GRQYKKU18N4LBdorerlK8Yju6BNFgR/1+QvHFYuvTImk1bP7nKE6x
	oP0w0D4Gv8dCSQ0NiLMU6tDs8jUPWos3TuJfWT9kjCHzHgl9V2d1B4J0EH71PBeVp6KP
	dgft4Wub+I0J1Ld2L94ylPFRrcc5rZ1A1t8QXCNMLvtDWJPIHNxv0anMoDR8M0o8/FKu
	lSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=393RtdMohVvx8I3YvipLUCetbg0AN1KZXpWzPGPRUhg=;
	b=ugB84OyES6iVCaIRRl+t4U39pvMXPnp5L1/krAzhZzA+0h/fG7Tdy7btD1TkKGMaaA
	UpFxTw97YRg1zGna9j8stdKgfb/0LYFgbl7C1oY1Ba6ySq+hjsoROnQ4LsBU/KVY1XmB
	UU4JEhKuQvyylNVE5Tb0gcad6NcmSyg+n6BDVdFEC0rk6CsiF7h+7L22owSZD5Qz7/IH
	KXirWs/L0VKeVd1qEq7L1mox7sPhm7S9Y1Lee0JK65bfrHko7bvDBPMJyq6xtaNxL0jw
	n+T6z3dj1rF9ullj7Cl8lrzX5LM9ZNCzGF+PuYQotKFR6rdMiEuUgPGUJ5kEM1A8rblg
	gp4w==
X-Gm-Message-State: AODbwcBYdJ9NB9+Dtl4iO8c6oNyJu7eRi5DnNXpuEFWJ5wNn378rwsP2
	8ONPxUdVTVDdu/8ULpQ=
X-Received: by 10.28.238.20 with SMTP id m20mr6710088wmh.121.1494933307176;
	Tue, 16 May 2017 04:15:07 -0700 (PDT)
Received: from localhost.localdomain ([37.177.79.194])
	by smtp.gmail.com with ESMTPSA id u13sm1353764wmu.3.2017.05.16.04.15.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:15:06 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:15:00 +0200
Message-Id: <1494933300-31618-2-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
References: <1494933300-31618-1-git-send-email-costamagnagianfranco@yahoo.it>
Cc: Marius Tiplea <marius.tiplea@windriver.com>
Subject: [meta-oe][PATCH] drbd-utils: fix dependency for perl under small-fs
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
X-List-Received-Date: Tue, 16 May 2017 11:15:07 -0000

From: "Yadi.hu" <yadi.hu@windriver.com>

Perl script drbd-overview fails to run due to some of
perl's lib noexists under small rootfs,fixing it through
adding explicit definitions

Signed-off-by: Marius Tiplea <marius.tiplea@windriver.com>
Signed-off-by: Yadi.hu <yadi.hu@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
index 3d6f5b2..67ed8e5 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_8.9.6.bb
@@ -30,7 +30,7 @@ EXTRA_OECONF = " \
                 --without-manual\
                "
 
-RDEPENDS_${PN} += "bash perl"
+RDEPENDS_${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module-constant perl-module-overloading perl-module-exporter-heavy"
 
 # The drbd items are explicitly put under /lib when installed.
 #
-- 
2.7.4



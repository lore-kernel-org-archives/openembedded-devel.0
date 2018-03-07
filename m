Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 07AB878A12
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:34 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id u13-v6so643138plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=lhCPwA7k2CMURx6LzWY204b/vmGiaa10WPDxGClpEfE=;
	b=C2SdDuVhy8CcGyJhbjdYjJenSKr6h0m+3ZZKsncae0p1Q3ccK5wtDmk02Ou2VIKI//
	HRWUHqniJoIjEyNh1G0gilPxoIpZg6oAHccAAkK6UR+GZRAiRCmx8koy+BkAI6OJTvZI
	vhm1f28vIBBa0GPJersCOwNSK60QUwHrKKd2ZNRvl7d8tbCvBy5ytuXkoDK7ewj737Kn
	E5piBSmikisy27ZZHPv6TZVReYc1lUZ2crnOyqNtP7lftMWfgdm8npaSea9+molBCgY5
	UgKCxVp010CqarCbH06bEzqEJxWkY/YSu8PIW6WKpx/8VQTjfD5edn5ayI2be7rew/rO
	3kvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=lhCPwA7k2CMURx6LzWY204b/vmGiaa10WPDxGClpEfE=;
	b=iKlIEHkfZj7x1XfqGnuitZX90bq/eGrV3dpSiFvhc7aMPUi/lHgxXuURnk56TdWUnE
	tRfCHZqB+gvGVsxv+EpcE/XbTNog+UkvLzmK7Gt3LUjevbQKcIpO6XM4qGeD9kvgMCvJ
	lD1/7Sc+PHxFL28/o2JxI+gvx2lS9STXBXDOYZfBeD/+MyZYFjj0RSGBEYzWErGarzob
	t1h2n1VC8peEuuT2WZZ7tU/ikaTPL6GgMya1LVog6IOtp7ttGwzLUFOMnY4rvdjsr+Kr
	GrP1T2l50v/tAGZ7Qlk4LkNbXNVM81ooCOAeBOtGc9CjnukvDY917X/I5XrZ+edVLBjo
	FiPw==
X-Gm-Message-State: APf1xPDHpAdNATd5pcR4o6Nb5U9ibOMPKvsyj+98fnhjSROosgk+o4mV
	m7zMlWe7jctw0334j2QIqhTp/w==
X-Google-Smtp-Source: AG47ELsQWC3rl0jjO3rec+bNk7JEJzqVpIQ50+W9qBnlxdHodhn7l+UGF9Di2HEojx0oizInay3OAA==
X-Received: by 2002:a17:902:bc02:: with SMTP id
	n2-v6mr19051052pls.52.1520395415713; 
	Tue, 06 Mar 2018 20:03:35 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:10 -0800
Message-Id: <1520395408-19266-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 07/25] gimp: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:34 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index cd7e27a..943986e 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -24,7 +24,9 @@ DEPENDS = " \
 "
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
-inherit gnome gtk-doc
+inherit distro_features_check gnome gtk-doc
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
            file://0001-configure-ac-do-not-check-for-freetype-config.patch \
-- 
2.7.4



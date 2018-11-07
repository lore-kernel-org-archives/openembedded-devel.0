Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7F08579D5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 19:11:43 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id w3-v6so7701303pgs.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=MOUdNRu6hnKQZxE3EEeER0ZyHAEw3bfT6XjS8CYmglE=;
	b=bWu7pPT1ZOPexlre39FaohcaIsalwoqr1Icjqx83ms4CY2HOot1TrK1R3tdkv10MLK
	GLclSQiaX91sCCCqVNAMjIKgKNcJGgxZ3Ksvdh5jqq80pKK9nXJ7I1ie5ofr434sEjlV
	+aWzqnA30U2m7dz33zxN8SXXxx9X926gRCEOCZZPbd9ei42g7+Yl/LljQDUQboc00Cep
	DIxd3YOxsj0piEAqwpPVPKPPpXcQBo6GVf+RK6X7aVZTD+0pDPShpDzNpB+jabNqGyoS
	mzbJMYnxvhx1j9SKSfF06YJE6Vrdwzu3t3QK09Z8aEIGWLRsk5WCXvdy8G4uu7u9l1VU
	gugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=MOUdNRu6hnKQZxE3EEeER0ZyHAEw3bfT6XjS8CYmglE=;
	b=kfYKaad2nKZxxU1id/kgemupjx0Ujd7QqTMCLEz3xbhAYJEKcyxx45QTVc2I7vG6+p
	XffFP04RzGr7vUzJ0PhvRw2aQpgLAt6EaKMUFGdYBI8AwhAUnmOYhqCgmADH0jdm1V1j
	3mvHPA11IzzlnH4i98SwhFhf0cL8D0WX/yckFnT7bXVOVttTYiZ5XeTwSwJuZkmHGEuU
	n1EjfshHmVLWqfLMddjGi6qD3q7J48Q1/12DBdwtPvakAD8zStqwdladq+Isc1mjZHPV
	HsDlT8F/yp0uuZRkJCUCMt4HY0EL5F1d/oSBdnx8fP5Pce+MVIbwcH1Lbeu2r4qONoGP
	8jKA==
X-Gm-Message-State: AGRZ1gJUXDXpxESXU2BiSIjF7dyjidNuWYb9m9DUuszbBsZRG5zhWu9v
	XxpJcnFB5WDBZvl/Hhh8hY4=
X-Google-Smtp-Source: AJdET5eux1MKLbeih6pazKOkYBUz8kVJtp2X6EJ0Zfsqz8ccdfa1aFt9bY9T7XcyTEW2Ae/G/kJ61A==
X-Received: by 2002:a63:24c2:: with SMTP id k185mr1182979pgk.406.1541617904376;
	Wed, 07 Nov 2018 11:11:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8dfb:8ab4:5b4a:d848])
	by smtp.gmail.com with ESMTPSA id w3sm1511134pge.8.2018.11.07.11.11.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Nov 2018 11:11:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2018 11:11:42 -0800
Message-Id: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 19:11:43 -0000

fixes
ERROR: Required build target 'blueman' has no buildable providers.
Missing or unbuildable dependency chain was: ['blueman', 'thunar']

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
index 8eb99ed..06a11b7 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
@@ -27,9 +27,10 @@ RRECOMENDS_${PN} += "adwaita-icon-theme"
 RDEPENDS_${PN} += " \
     python3-dbus \
     packagegroup-tools-bluetooth \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)} \
 "
-
-PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,thunar"
+PACKAGECONGIG ??= ""
+PACKAGECONFIG[thunar] = "--enable-thunar-sendto,--disable-thunar-sendto,,"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.7.4



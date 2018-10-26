Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DBDE676074
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w186-v6so990976wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M1UzUK2GQ988jb1kSXfFfehQCvwDnqYrfsg83AD7W1Q=;
	b=K6iEx1XYwuwtSbiIXQdrtrCq5jx4HdQPNLCEg5zYG1FW3rQB3vLRg6I+QU3O9nNl/Z
	xqUEkkwFldKIE10iStX4LI4gzrp/sRjllhUX8vWI1+oqXpor6Nn32V3CRS2o497Qb5xF
	q4ZdUpS07UmA20WllL2jBX29E6NIE11LImei9Aa0LvKb1gIIywwRrSquPPHjm7Fz+Yeg
	AnngHvgN5bjQ7l2IKKz+D3YLjqEDYlj5cBF7MVcqjLez55OiYaZTG2iq9tKqNAIFSpw3
	clIZQPPba9FwrPMrw84jOP7IYU3S7R195OlaeUpFMOCq76KkDbUSd5OcKNDsqAWG9PbB
	8XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M1UzUK2GQ988jb1kSXfFfehQCvwDnqYrfsg83AD7W1Q=;
	b=D6BefSZlehIIAcxESMK3d3xG5vJXEL6KX85P3JqLVgjaJu6E+SHjH46bSEH7CmLlNt
	xyPjRL+qbk/YAm+CB9lebKPuES1nOOhHhQ71g4p6AozGfwmaIDOT+JBDQjeW4UtOPN+9
	8V7TAiV8gzbDGyZXbjjC1MqUzWuNGGSvnQXmQ1YB2K7U94XWWLs/abBakk4JlalHBqOD
	olpA/oEthlWZT51LNhp8GwDWG0Eo4syaYb46gBksqAsUGiRJ4fCTDCgE0dt/ed59d1CR
	ztVTk+DGqi6wlcJr0c6h8PFmBlc2hjlaXfK4MBcZsOaWnZn/JPM+b6jQ8A4bFs5LqAIf
	/N2g==
X-Gm-Message-State: AGRZ1gKXYdGEU0G4lpECmlifW6Y/71rXEnxmoTyOs4IJadWEVv6dCygs
	Z5wAbdicv63xg7mpDnxJ5D9Rq9MC
X-Google-Smtp-Source: AJdET5eMon+1vIQ5zgCG+zl0meeU4B5VZsks03+kelqvI3YyJpseqvMzwiatYucvhqJK+8qChCZawQ==
X-Received: by 2002:a7b:c00a:: with SMTP id
	c10-v6mr4954167wmb.73.1540550951861; 
	Fri, 26 Oct 2018 03:49:11 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:50 +0200
Message-Id: <20181026104857.32142-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
MIME-Version: 1.0
Subject: [PATCH 1/8] xfce4-settings: upgrade 4.12.3 -> 4.12.4
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* A GTK3 version is abvailable but keep GTK2: haven't found the time yet to
  rework my additions which I would miss.
* 0002-Fix-linking-to-dbus-glib-bug-13633.patch had to be aligned slightly for
  changed sources.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index d937653fa..a4685aed3 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,13 +13,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.3 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.4 \
     file://0001-xsettings.xml-Set-default-themes.patch \
     file://0002-Fix-linking-to-dbus-glib-bug-13633.patch \
 "
-SRCREV = "b701ac8b66b83c17469dd5009da51eeb59eba442"
+SRCREV = "75d7c9b15e5ccce12b0864d3659ae9b6de96e245"
 S = "${WORKDIR}/git"
-PV = "4.12.3+git${SRCPV}"
+PV = "4.12.4+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.14.5



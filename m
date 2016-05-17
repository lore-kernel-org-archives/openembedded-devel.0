Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 85B2A7325A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r12so5943820wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P9UdoVHXHNrnahlw3G0xcXSxZpdY4etrNSKJQxa/BRg=;
	b=QH7X7HlZcU0SvP6jHQKijXLnIcRZGQeI98fF7xY8i/dkM3ZdYsw3/bGjd7o9wesk5G
	KbSjfiyNnVFISLFkQKtew6fIdTZIL43TpY9eppAFZ7dCS9v/a+ZRL6JBXVRpdGNVM981
	TODzMwf1HOVwdnXXYc+YOGwFTJatO25d3IjFNKlgRAHMH3WqeoR3tHJvpqi7AswzXy45
	xmSL0p0otVXvMh4niVOWTImtAhvDdH61TPfA2A7qS5CWabBdVy8Ye18OsPEo4gF2F9xj
	DYaYtBuTr8XTg3Fy8nvfA3/G1GoOnuUu2oLyrTEzaToedD/27uRXbZPq9daFeFnwCxHq
	tc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P9UdoVHXHNrnahlw3G0xcXSxZpdY4etrNSKJQxa/BRg=;
	b=bXFPKcaIElyaFbUGWqGqt6m9++RrsWq7PtHDLWzh+oR4kKMPlVlLogS2Ro2wHaChnb
	43sPRbL5uWjDVZzZCww/zEZfvaT3M1S9hoRptrbHVKVYNlr5y/o7m7l+Ba+LxjWRIpYw
	hpDcTUL6FpkMcsCX/i5IQSD9UlphWumm8HxT6eFEr/BhuTIgnoVGaoy880ynXTWWUuzO
	h3l5nvkm6zoBOqyxNvVBoJhmH+f4L9QrmNn/gke0YSahkU3rafVl9lw7FahtAi6W2aU/
	33abDbuwRI8Qfa6cssBDoFiuDafF8gThiOllNHq4CAc+akM7FFBOEqqUPYBlESkVWwXP
	shDg==
X-Gm-Message-State: AOPr4FW4UMHSItYNrBlImMq/rldw9sjd2lUCKCy5ztgkyyIWP4NGTt0v3tdZlDp5iTD4Cw==
X-Received: by 10.194.23.1 with SMTP id i1mr2386765wjf.142.1463501416603;
	Tue, 17 May 2016 09:10:16 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id r5sm3875400wjy.37.2016.05.17.09.10.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:07 -0700
Message-Id: <cover.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 0/6] Various fixes from meta-mentor
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
X-List-Received-Date: Tue, 17 May 2016 16:10:16 -0000

From: Christopher Larson <chris_larson@mentor.com>

Working through my upstream patch submission backlog.

The following changes since commit 37297c3222a40b916d98ccd06b757b595aebc756:

  nbd: fix LIC_FILES_CHKSUM (2016-05-12 11:53:30 -0400)

are available in the git repository at:

  git://github.com/kergoth/meta-openembedded various-mentor-fixes
  https://github.com/kergoth/meta-openembedded/tree/various-mentor-fixes

Christopher Larson (6):
  mg: stop relying on make -e
  luajit: fix build issues, obey more vars
  openlmi-networking: add missing dep on konkretcmpi-native
  networkmanager: add missing dep on intltool-native
  networkmanager: add missing dep on dbus-glib-native
  x11vnc: remove old libtool macros from acinclude.m4

 .../networkmanager/networkmanager_1.0.10.bb        |  2 +-
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb    | 53 ++++++++++++++++------
 .../openlmi/openlmi-networking_0.3.1.bb            |  2 +-
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   |  6 +++
 meta-oe/recipes-support/mg/mg_20110905.bb          | 12 ++++-
 5 files changed, 59 insertions(+), 16 deletions(-)

-- 
2.8.0



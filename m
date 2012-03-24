Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SBM1Y-0005Yi-Nt
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 09:08:32 +0100
Received: by wgbdr12 with SMTP id dr12so2353674wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BnjAi4EoH2Im9OHWH28VHZwd0RbnXDLUcMcF+pwFBEU=;
	b=KGBwk3gQkhZMzzG4QGDq795GbpB0kcUoxJ5KkB8dVIPgoqfF0o0etFrkenwR+nWwJA
	wRJtPWfYo79rgidSGuZxE969CxBBvpPrpWv1UQ7RtST3YnG+eRYV8wo47gjLqUUFBQa5
	uZ/K6/jO07LgzC+yjXkB1xC6M2PxjxGFdXPGcftMJOsxx3G07BLQ4stJt1lktO5yV/RD
	fTFZS53xQucAZvYDOGAEiEtvh/R0KU1aoBdBVntB0k324NQFQ5GAB5PteyTSaMRNybeZ
	IkSW5YfQhdT/qG1ajS7vc/PQ/DJlnYpO3xZATMiHdKExPSxs77yxKcYUFH9MjhyBHsli
	7nVA==
Received: by 10.180.78.225 with SMTP id e1mr3352890wix.0.1332575975928;
	Sat, 24 Mar 2012 00:59:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm34200048wiy.3.2012.03.24.00.59.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 00:59:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2012 08:59:29 +0100
Message-Id: <caec63e12fc6f93d292da393985032c2d407d6f8.1332575856.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1332575856.git.Martin.Jansa@gmail.com>
References: <cover.1332575856.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/3] e-base: bump EFL_SRCREV
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2012 08:08:32 -0000

Newer efl alpha was released today, so I hope that next bump will be with released tarballs.

This EFL_SRCREV is a bit older but worth upgrading as it finishes python-elementary changes
for elementary-1.0 APIs and also includes .so changes for release (so switch to tarballs should
be rather formality with bugfixes).

All elementary based apps need PR bump.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 58636ec..32f0b28 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "69323"
+EFL_SRCREV ?= "69500"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.5




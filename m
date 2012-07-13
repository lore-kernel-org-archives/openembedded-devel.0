Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSo-00085w-SI
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:03 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247692bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LNxhGzDkInH5+n4zi+wWCaWBacDzQSJafpsXV2u/fmE=;
	b=0xTovQTztXtTd/hXTU+K15em0qFO7a8ZtfOsycxfgb/XVMfILrHpzh3F9v3i+eR+I2
	4aZmXeH3bF/ZvKUYns7ubm+GrU02SlC2B5s81YkW0G5yHzsvJ+5GlAXwX4RYr7P7cfSp
	6jMoi1kupVpU1yvbnQqa9gfPmOMYYmRYG/5pW9D9fcX2dJ3Tl8mt3L/MZXL6NKwG7n0n
	wCSVRtWugSzYMS38YXoIRwt1d3YXeEHDnJG4Ng9aOTzkwkLND9BBL4MxvjkKaA5iDBlX
	1X3S62WqKrwE5QIY7pmeMNA1KQT3uIzNwuOIGhizmAdEO+297VPdl7a56PvqiUSeNAJ/
	c7kQ==
Received: by 10.204.13.82 with SMTP id b18mr114000bka.118.1342168311028;
	Fri, 13 Jul 2012 01:31:51 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:37 +0200
Message-Id: <1342168240-7760-30-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 29/32] keymaps: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
 .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps/keymaps.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps_1.0.bbappend (85%)

diff --git a/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
similarity index 100%
rename from meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
rename to meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps/keymaps.service
diff --git a/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
similarity index 85%
rename from meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
rename to meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
index cc6cb7c..7f336a1 100644
--- a/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PRINC := "${@int(PRINC) + 5}"
+PRINC := "${@int(PRINC) + 6}"
 
 SRC_URI += " file://keymaps.service"
 
-- 
1.7.6.5




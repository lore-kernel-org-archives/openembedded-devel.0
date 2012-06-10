Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3p-0001fg-Ct
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:37 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1679484wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=pFeAhixXiEKG3tWXTUwoAEmERskP5WrpKzgbcW9uzVY=;
	b=uex7FELl7iJ3wxsg2PcWIvkXWtPOGcW0Mt+E22VCXxFAUonSltEYmXI6uYiYh+DONl
	3PIRihwWgBj/8i3Vz8hY7870jVId0fD3cEx8NhZd3PoFWjViCHWlPAfDB2S5LyuMV0CF
	5oe7q0ZqaqiKib6wrWf2GLE32fEKhPG448gXuWuTo7I0pTIVpcFY2pINBHDrqU56WCun
	PPVrtMJltpDpdiqzqACZM3YXZOIFINDseYI7j1uA5RZ+Ep17CKmSCH1erq00tJaf5Dft
	WasrgosvWzuGGwGEzVUz3wLOj4dhxj9XBZ6zRMMSGhFJLcb83VpoCTws2gfjITFKvHq+
	Yh9A==
Received: by 10.216.218.138 with SMTP id k10mr5592486wep.222.1339364527087;
	Sun, 10 Jun 2012 14:42:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:57 +0200
Message-Id: <1339364820-2880-25-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 24/27] keymaps: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:38 -0000
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
1.7.4.4




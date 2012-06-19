Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sgu5b-0005eo-TU
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 10:47:07 +0200
Received: by bkcjm2 with SMTP id jm2so4642670bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 01:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3iJV0d0g0vy1kiWpBgmZUwzOrnqU9zrfiiJQ/cnV/7I=;
	b=VgQw5Y71LMu2rwASMUvDHVYgyw7CngfloQ4DPEd5/W2oKy234bBvVqxaty3FDUCM3B
	csLn9ahKsad9+et2GKl+Z0JB1OUslHIaylbdtbfZyayRFkSH41GtM9GTFAhPXuwzsuRw
	tyVkTmGijrChMK6KkBpEPUOV7Gl7l3eclIdPiTCR0eomT0uAE5vC4V/LfiWspvJAxGI7
	shDX1bs3Fmodx2BqXGdJ9cPM3TdBzwL3JqWd7BcAjvMKQlghlqlbCgdiwgQdMvYzsdeC
	EJZaTTOIkKBXiqaspidd+FeyspRvGHkDudlrX5jCYbuERUcEIAxgN2/QdG3q+EFTqsqs
	sjJg==
Received: by 10.204.156.77 with SMTP id v13mr7827989bkw.59.1340094984725;
	Tue, 19 Jun 2012 01:36:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x23sm21994233bkw.12.2012.06.19.01.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 01:36:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 10:36:19 +0200
Message-Id: <1340094979-19283-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20120619082029.GR3178@jama.jama.net>
References: <20120619082029.GR3178@jama.jama.net>
Subject: [meta-oe][PATCHv2] rfkill: use update-alternatives
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
X-List-Received-Date: Tue, 19 Jun 2012 08:47:08 -0000

From: Saul Wold <sgw@linux.intel.com>

* Since oe-core added rfkill to busybox, this recipe needs to use u-a
  also.
* MJ: added ALERNATIVE_LINK_NAME[rfkill]
* MJ: increased ALTERNATIVE_PRIORITY (busybox also have 50)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
index 561fdc7..430cf65 100644
--- a/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
+++ b/meta-oe/recipes-connectivity/rfkill/rfkill_0.4.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/rfkill"
 SECTION = "base"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c6036d0eb7edbfced28c4160e5d3fa94"
+PR = "r1"
 
 SRC_URI = "http://wireless.kernel.org/download/${PN}/${P}.tar.bz2 \
            file://0001-rfkill-makefile-don-t-use-t-the-OE-install-wrapper-d.patch"
@@ -16,3 +17,10 @@ do_compile() {
 do_install() {
         oe_runmake DESTDIR=${D} install
 }
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "rfkill"
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
+
-- 
1.7.8.6




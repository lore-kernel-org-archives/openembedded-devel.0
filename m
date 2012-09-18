Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyla-0001l8-Tu
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:11 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7DNPDHda9Cl2nugyN0fFibaG34DZw8GxJolbJhKeRT0=;
	b=ITOH6GGdGaeDmuEAYj05pu/riMG+Kf2DPl/37jfGF2Q07hjcAvqrelwe1huSDOt7Db
	2kl1eU1oXc2E3kLlVmt5aFb6YGFA7UAH8cAgtH2Mz7KCD+wjfy1hxPpBqRAAqAuLsArm
	lB5txr/fpuii+lkvv3XTw9ZBUBm3mV7EVp4OAzcIMac1jGLxSVMz2te9yipI8XQqTU34
	EBoNICYTcf4fAz/tnABVbbg0iT02Bp+4xZeCrWJI4/Qj0/WLaBOZECaYaMLTHoVifwJ3
	+NB9gLIofSDdLDvcb/acCDw3QcMalaPCsTUYlmE0b/d0rsBz3bSh9hlVLkL/b5ATPgkT
	RjuA==
Received: by 10.204.148.12 with SMTP id n12mr27724bkv.6.1347977673085;
	Tue, 18 Sep 2012 07:14:33 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:54 +0200
Message-Id: <1347977601-28665-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 13/40] packagegreoup-xfce-extended: only RDEPEND on themes shipped by xfwm4
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../packagegroups/packagegroup-xfce-extended.bb    |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index ebe2dc7..fcc716a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -21,11 +21,6 @@ RRECOMMENDS_${PN} = " \
     xfwm4-theme-daloa \
     xfwm4-theme-kokodi \
     xfwm4-theme-moheli \
-    xfwm4-theme-sassandra \
-    xfwm4-theme-stoneage \
-    xfwm4-theme-therapy \
-    xfwm4-theme-tyrex \
-    xfwm4-theme-wallis \
     \
     xfce4-cpufreq-plugin \
     xfce4-cpugraph-plugin \
-- 
1.7.6.5




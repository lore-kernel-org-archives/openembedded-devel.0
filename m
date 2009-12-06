Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsU-0000hP-QW
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:58 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866301ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=xPoEtgyFhAk9Eu9C4C+4g4fsg1DoEJbMnjkH7RjOr6Q=;
	b=gay3cW304CfD4ZUgckhH7JznYLO16b+9gomOi0l98162kJ+sLEfeUH8I2AdI0V6DdQ
	F3d+FJvBJ0z4uNVq9GPbKy7gLb+vIP+In8CKRDmaEeFtXiLAB2RGOz+/KZUoy6vK7hIx
	9HmXUutdtWqA1I0RdgalbEEN2VolHckDUmMa4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QfQyFLSLo4O9QFLJs/Dq1bcvObsRPNIr/45iBf4dpOBz6F++2bOaITc8o7eEt85JWK
	K6bdSMWpr94yx+8UJsorym/vwPriRBOwqwIEHkWyc60QlJknDlyTMHAuMkFPitn2vvsC
	pjnVGz4sAWYE8O30ElvGq0S4/Ve3QF0g8HRMM=
Received: by 10.213.23.204 with SMTP id s12mr6231831ebb.69.1260139518165;
	Sun, 06 Dec 2009 14:45:18 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:17 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:54 +0100
Message-Id: <1260139496-21442-19-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-18-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
	<1260139496-21442-16-git-send-email-leon@sidebranch.com>
	<1260139496-21442-17-git-send-email-leon@sidebranch.com>
	<1260139496-21442-18-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>,
	Walter Goossens <walter.goossens@axon.tv>
Subject: [PATCH] gnu-config-20050701: Add nios2 system support.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:47:01 -0000

From: Walter Goossens <walter.goossens@axon.tv>

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/gnu-config/gnu-config/nios2.patch |   20 ++++++++++++++++++++
 recipes/gnu-config/gnu-config_20050701.bb |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gnu-config/gnu-config/nios2.patch

diff --git a/recipes/gnu-config/gnu-config/nios2.patch b/recipes/gnu-config/gnu-config/nios2.patch
new file mode 100644
index 0000000..d790ed1
--- /dev/null
+++ b/recipes/gnu-config/gnu-config/nios2.patch
@@ -0,0 +1,20 @@
+Index: config/config.sub
+===================================================================
+--- config.orig/config.sub
++++ config/config.sub
+@@ -259,6 +259,7 @@ case $basic_machine in
+ 	| mn10200 | mn10300 \
+ 	| ms1 \
+ 	| msp430 \
++	| nios2 | nios2eb | nios2el \
+ 	| ns16k | ns32k \
+ 	| openrisc | or32 \
+ 	| pdp10 | pdp11 | pj | pjl \
+@@ -338,6 +339,7 @@ case $basic_machine in
+ 	| mmix-* \
+ 	| ms1-* \
+ 	| msp430-* \
++	| nios2-* | nios2eb-* | nios2el-* \
+ 	| none-* | np1-* | ns16k-* | ns32k-* \
+ 	| orion-* \
+ 	| pdp10-* | pdp11-* | pj-* | pjl-* | pn-* | power-* \
diff --git a/recipes/gnu-config/gnu-config_20050701.bb b/recipes/gnu-config/gnu-config_20050701.bb
index 8ee0a32..537d745 100644
--- a/recipes/gnu-config/gnu-config_20050701.bb
+++ b/recipes/gnu-config/gnu-config_20050701.bb
@@ -6,11 +6,12 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 FIXEDSRCDATE = "${@bb.data.getVar('FILE', d, 1).split('_')[-1].split('.')[0]}"
 PV = "0.1+cvs${FIXEDSRCDATE}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "cvs://anonymous@cvs.sv.gnu.org/cvsroot/config;module=config;method=pserver;date=${FIXEDSRCDATE} \
 	   file://config-guess-uclibc.patch;patch=1 \
            file://avr32.patch;patch=1 \
+           file://nios2.patch;patch=1 \
            file://gnu-configize.in"
 S = "${WORKDIR}/config"
 
-- 
1.6.0.4




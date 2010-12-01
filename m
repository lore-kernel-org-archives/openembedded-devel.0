Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PNqhc-0006ja-7D
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 18:42:48 +0100
Received: by pzk12 with SMTP id 12so1065297pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=0orB2QH7+AXyPuTMsTFK3qLcune/KJKTIBjmOvan5zY=;
	b=V/lql1H45JPD4g5ehKRcs594LfYtyAB02GIywd2H2JoFcL/baulWGwdIMtjb+CWht9
	1kWCi3Ryk7MHLMeVXlfp7wf0BEubAxHuCsJtuyRBUkGfhTbpzyQFwf4pYnpn2MMWvO6h
	rpaWDvyznomA9iaFkYEMkJh5qezrDa/T8V8Pg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YMARcpef0KBwTr3hdOHpnU9uPkrOoaeo5c2QsXewRGC3tObHUQRUU1QlM9+r1nE/KU
	R0msmKkYxgdCxBomjPXuxAc9R+LAPb2GAyVIvWBF5KyAMUCcebk8tapEaqTi5Ir3y+D8
	jDCoo9vCWYZ7y3bg8lcun1lrkDpH6DRddOcow=
Received: by 10.142.166.7 with SMTP id o7mr9125269wfe.428.1291225285441;
	Wed, 01 Dec 2010 09:41:25 -0800 (PST)
Received: from localhost.localdomain ([76.205.222.173])
	by mx.google.com with ESMTPS id p8sm258053wff.4.2010.12.01.09.41.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 09:41:24 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 09:41:09 -0800
Message-Id: <1291225269-21801-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCHv2] avrdude: update SRC_URI and fix deps
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
X-List-Received-Date: Wed, 01 Dec 2010 17:42:49 -0000

* SRC_URI updated to new location
* Makefile.am patched to fix missing dep causing parallel make issue

Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/avrdude/avrdude.inc        |    5 ++++-
 recipes/avrdude/avrdude/make.patch |   14 ++++++++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/avrdude/avrdude/make.patch

diff --git a/recipes/avrdude/avrdude.inc b/recipes/avrdude/avrdude.inc
index 679c4ba..4679c7a 100644
--- a/recipes/avrdude/avrdude.inc
+++ b/recipes/avrdude/avrdude.inc
@@ -5,7 +5,10 @@ LICENSE = "GPLv2"
 
 DEPENDS = "virtual/libusb0 ncurses"
 
-SRC_URI = "http://savannah.nongnu.org/download/avrdude/avrdude-${PV}.tar.gz"
+SRC_URI = " \
+   http://savannah.nongnu.org/releases/avrdude/avrdude-${PV}.tar.gz \
+   file://make.patch \
+   "
 
 inherit autotools
 
diff --git a/recipes/avrdude/avrdude/make.patch b/recipes/avrdude/avrdude/make.patch
new file mode 100644
index 0000000..30b3b1d
--- /dev/null
+++ b/recipes/avrdude/avrdude/make.patch
@@ -0,0 +1,14 @@
+fix missing deps causing build failure on parallel make
+Index: avrdude-5.10/Makefile.am
+===================================================================
+--- avrdude-5.10.orig/Makefile.am	2010-12-01 09:17:41.675507203 -0800
++++ avrdude-5.10/Makefile.am	2010-12-01 09:17:44.474882497 -0800
+@@ -155,6 +155,8 @@
+ 
+ sysconf_DATA = avrdude.conf
+ 
++config.c: config_gram.h
++
+ install-exec-local: backup-avrdude-conf
+ 
+ distclean-local:
-- 
1.7.0.4




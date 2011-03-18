Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q0aHu-0005Tz-1M
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 15:04:22 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so3155541bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xFtVuhkvAkNTbbZT777U33jbdvqhEmWEwlP0z8qq0pQ=;
	b=uhYwKGF8To9nEqpm9HSNMmgvnuCgR0OeAdthq7L2lmIbnKMkqDHeT9u6FV8YySCbUf
	GQ2pUxrKM72wN2RcfeLQlmdK9338g0GNOD6sMRGXzeAIGbMeY1C/GE9W7JjftrkEj/F/
	pcNHSkVNz+KK5Mpt7dTjZJOPq/NGRj84FyPD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Z7kbkY5T6hSMdTPdg8ioTunr2YNrntWQgWhQxeVlkjm2YGZbPF9eJdP7/nc2//WoUc
	LghDw2scjqxhqzEXFEOZzLRHoPI4kcp1sdlu8QNBtHovlwZBcYvZA3TQH8lw0LbMXPK/
	CCuJmnfp5ASfi0VPxJlCCKWCnPV+Dl45UdHz0=
Received: by 10.204.74.85 with SMTP id t21mr987327bkj.128.1300456958728;
	Fri, 18 Mar 2011 07:02:38 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm2165383bkb.18.2011.03.18.07.02.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 07:02:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 15:00:29 +0100
Message-Id: <1300456829-25755-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 12/12] connman: depend only on libnl(-2.0) not libnl2(-2.0)
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
X-List-Received-Date: Fri, 18 Mar 2011 14:04:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/connman/connman.inc     |    2 +-
 recipes/connman/connman_0.46.bb |    2 +-
 recipes/connman/connman_0.51.bb |    2 +-
 recipes/connman/connman_0.65.bb |    2 +-
 recipes/connman/connman_0.68.bb |    2 +-
 recipes/connman/connman_git.bb  |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/connman/connman.inc b/recipes/connman/connman.inc
index e25d64a..7306b1b 100644
--- a/recipes/connman/connman.inc
+++ b/recipes/connman/connman.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.moblin.org/projects/projects_connman.php"
 SECTION = "libs/network"
 LICENSE = "GPL"
 # we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "libnl2 wpa-supplicant dbus glib-2.0 ppp busybox dhclient resolvconf bluez4"
+DEPENDS  = "libnl wpa-supplicant dbus glib-2.0 ppp busybox dhclient resolvconf bluez4"
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
diff --git a/recipes/connman/connman_0.46.bb b/recipes/connman/connman_0.46.bb
index a7bf286..1f1df9c 100644
--- a/recipes/connman/connman_0.46.bb
+++ b/recipes/connman/connman_0.46.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r5"
+PR = "r6"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
diff --git a/recipes/connman/connman_0.51.bb b/recipes/connman/connman_0.51.bb
index f1c5003..036a710 100644
--- a/recipes/connman/connman_0.51.bb
+++ b/recipes/connman/connman_0.51.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
diff --git a/recipes/connman/connman_0.65.bb b/recipes/connman/connman_0.65.bb
index 78e4287..880d775 100644
--- a/recipes/connman/connman_0.65.bb
+++ b/recipes/connman/connman_0.65.bb
@@ -1,7 +1,7 @@
 require connman.inc
 # connman requires libXtables now
 DEPENDS += "iptables"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
diff --git a/recipes/connman/connman_0.68.bb b/recipes/connman/connman_0.68.bb
index ead215d..093a5a5 100644
--- a/recipes/connman/connman_0.68.bb
+++ b/recipes/connman/connman_0.68.bb
@@ -1,7 +1,7 @@
 require connman.inc
 # connman requires libXtables now
 DEPENDS += "iptables"
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
diff --git a/recipes/connman/connman_git.bb b/recipes/connman/connman_git.bb
index 39ffac6..283eb6b 100644
--- a/recipes/connman/connman_git.bb
+++ b/recipes/connman/connman_git.bb
@@ -27,7 +27,7 @@ require connman.inc
 SRCREV = "1a94db417ecaba20a609ff4b4431a3f67c5dcbc6" 
 
 PV = "0.42+git"
-PR = "r2"
+PR = "r3"
 PR_append = ".gitr${SRCREV}"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.4.1




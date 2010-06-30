Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OTr6F-0000DM-5p
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 08:48:49 +0200
Received: by pzk4 with SMTP id 4so80868pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 23:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=Z7YV5izKB8GGKvAYA/rjW8TCuGbcsW68tG4KpJ+HAj8=;
	b=LzDF7K55erxnwwIlV+aHF37CJiCcQ/eeF1JwZ9OpdNFbG9cR011ADxp871U7dcLEI4
	CpLHVATYAk33p4GYotcW7RaPGi0s5y10mIsNx15/lN4FUJBerPnXYrc7lmKIt5y/nRLB
	1t+KEY437jtXtHumoJLqNMJmJbpWb7VJualQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ppBrFQJoeiILXCMNxrARrGuRmP7Zy1wthuQ6TGDoLLgenWfkYgeUOzKpvmBJgYkYT0
	8EIx8gbd8uazQr2DoK+GP8QOl7DjLwbBkzXEeRct+VCA8cwgV6pYCDwRs8UP+GXQafa4
	/ZinfaJ9KgpCigCpWkVtYP/d63e2jBBhNjb7M=
Received: by 10.143.24.39 with SMTP id b39mr9433808wfj.184.1277879903532;
	Tue, 29 Jun 2010 23:38:23 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w36sm5482909wfh.2.2010.06.29.23.38.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 23:38:22 -0700 (PDT)
Message-ID: <4C2AE659.7040201@gmail.com>
Date: Wed, 30 Jun 2010 16:08:17 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2AC6F3.3090603@gmail.com>
In-Reply-To: <4C2AC6F3.3090603@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] dbus: fix building for mipsel and fix PIE segfault issue (again).
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
X-List-Received-Date: Wed, 30 Jun 2010 06:48:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Subject: [PATCH v2] dbus: fix building for mipsel and fix PIE segfault issue (again).

Previous fPIE fix no longer works.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/dbus/dbus.inc       |    9 ++++++---
 recipes/dbus/dbus_1.2.20.bb |    2 ++
 recipes/dbus/dbus_1.2.22.bb |    2 ++
 recipes/dbus/dbus_1.2.24.bb |    2 ++
 recipes/dbus/dbus_1.3.0.bb  |    4 ++--
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index ec66960..baf3139 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=dbus \
@@ -35,8 +35,11 @@ EXTRA_OECONF = "\
   ${EXTRA_OECONF_X} \
 "
 
-do_compile_prepend_mipsel() {
-	sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus/Makefile
+do_configure_prepend_mipsel() {
+	sed -i -e 's/\-fPIE//' \
+		-e 's/\-pie\ \-Wl\,\-z\,relro//' \
+		-e 's/-Wl,--gc-sections/--gc-sections/' \
+		${S}/configure.in
 }
 
 do_install_append() {
diff --git a/recipes/dbus/dbus_1.2.20.bb b/recipes/dbus/dbus_1.2.20.bb
index 43805a5..25cc5ac 100644
--- a/recipes/dbus/dbus_1.2.20.bb
+++ b/recipes/dbus/dbus_1.2.20.bb
@@ -1,5 +1,7 @@
 include dbus.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=dbus \
   file://tmpdir.patch \
diff --git a/recipes/dbus/dbus_1.2.22.bb b/recipes/dbus/dbus_1.2.22.bb
index 35a5267..74386ed 100644
--- a/recipes/dbus/dbus_1.2.22.bb
+++ b/recipes/dbus/dbus_1.2.22.bb
@@ -1,5 +1,7 @@
 include dbus.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=dbus \
   file://tmpdir.patch \
diff --git a/recipes/dbus/dbus_1.2.24.bb b/recipes/dbus/dbus_1.2.24.bb
index 4e408e7..a2b7eea 100644
--- a/recipes/dbus/dbus_1.2.24.bb
+++ b/recipes/dbus/dbus_1.2.24.bb
@@ -1,5 +1,7 @@
 include dbus.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=dbus \
   file://tmpdir.patch \
diff --git a/recipes/dbus/dbus_1.3.0.bb b/recipes/dbus/dbus_1.3.0.bb
index 830816f..a923166 100644
--- a/recipes/dbus/dbus_1.3.0.bb
+++ b/recipes/dbus/dbus_1.3.0.bb
@@ -1,5 +1,7 @@
 include dbus.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
   \
@@ -20,7 +22,5 @@ SRC_URI = "\
 # This is the development version of dbus that will lead to 1.4.x
 DEFAULT_PREFERENCE = "-1"
 
-PR = "r2"
-
 SRC_URI[md5sum] = "b3298d5ce0e4ad4731b1e4e1787d56bb"
 SRC_URI[sha256sum] = "fe32b49667894cf91b0a97503163be5c4814ecf67259e8feb26d1ba57cb03dae"
-- 
1.7.1




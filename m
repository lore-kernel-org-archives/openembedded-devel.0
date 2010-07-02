Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OUUN1-0002iw-Up
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 02:44:45 +0200
Received: by pxi12 with SMTP id 12so1174222pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 17:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=wTxzf9cC/2wXclx4rW//OF5Nt8xF/jcPo2F9EG01b2E=;
	b=eNJTnnN+0gfbNh/vlqSp+zkdkSkPxRYhbJ1c0vOJtfXz3lt9j0qTbzBdShxRBcE5Ak
	kOARqDr3oKlB5EIr7IPj+V8g60m8y4oZR9Y5B5ORE/Jt1MF2peetT4BMjsW1czEOK5ze
	bOffaRF2p1FbsxhW7qBBZgkii3YPhVhPk/1Dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Gt5KXL8PQc9LL16mEJ1MK/AxKIAJJdTIu3P/gHot8NC6nCUO5eoEhWnNR0W4/RLYk2
	GgpSRitZP/Zsz2D4UIu7QhhHm6LPHQzxrEs87D2CubV0fuWeNDEP7aG1liIi7cxG5PdB
	dZSfr+tvI2veyXHYLsGWNP5Q4+k1kyemqc8oQ=
Received: by 10.142.223.21 with SMTP id v21mr281883wfg.315.1278031197563;
	Thu, 01 Jul 2010 17:39:57 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 33sm89697wfg.9.2010.07.01.17.39.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Jul 2010 17:39:57 -0700 (PDT)
Message-ID: <4C2D3557.1040005@gmail.com>
Date: Fri, 02 Jul 2010 10:09:51 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C2AC6F3.3090603@gmail.com> <4C2AE659.7040201@gmail.com>
In-Reply-To: <4C2AE659.7040201@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] dbus: fix building on mipsel and clean up PIE/pie fix to work again.
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
X-List-Received-Date: Fri, 02 Jul 2010 00:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Subject: [PATCH v3] dbus: fix building on mipsel and clean up PIE/pie fix to work again.

D-Bus fails to link with --gc-sections on mipsel.

|   CCLD   dbus-daemon
| collect2: ld returned 1 exit status
| make[2]: *** [dbus-daemon] Error 1
| make[2]: *** Waiting for unfinished jobs....
| /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../../mipsel-oe-linux/bin/ld: can not make stub section: File format not recognized
| /home/grg/oe2/tmp/cross/mipsel/lib/gcc/mipsel-oe-linux/4.4.4/../../../../mipsel-oe-linux/bin/ld: failed to set dynamic section sizes: File format not recognized

Also, the previous fPIE/pie fix no longer works.
While here, clean up INC_PR.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/dbus/dbus.inc       |   11 ++++++++---
 recipes/dbus/dbus_1.2.20.bb |    2 ++
 recipes/dbus/dbus_1.2.22.bb |    2 ++
 recipes/dbus/dbus_1.2.24.bb |    2 ++
 recipes/dbus/dbus_1.3.0.bb  |    4 ++--
 5 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index ec66960..55a156d 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz;name=dbus \
@@ -35,8 +35,13 @@ EXTRA_OECONF = "\
   ${EXTRA_OECONF_X} \
 "
 
-do_compile_prepend_mipsel() {
-	sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus/Makefile
+# On mipsel, D-Bus fails to link with --gc-sections and segfaults before main()
+# when built with -fPIE/-pie.
+do_configure_prepend_mipsel() {
+	sed -i -e 's/\-fPIE//' \
+		-e 's/\-pie\ \-Wl\,\-z\,relro//' \
+		-e 's/-Wl,--gc-sections//' \
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





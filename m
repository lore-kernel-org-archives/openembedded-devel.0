Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MZETT-0005Yc-25
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Aug 2009 03:42:27 +0200
Received: by wf-out-1314.google.com with SMTP id 25so561069wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2009 18:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=ymrCqDioWPRNPzOVoVgAIf+sRl1DM4vJGS9WcRrLA+M=;
	b=nVwiI5iCX3U8MISaH8ENzF6gSx/JMDUF7IfSrY2aDAsrZu8Wqzm8HfNNPk9HCjGCE1
	5WH3GRC4nAugoC0tHLgh9qu/ubp2M6p4L+25gvH4S1ex2MiTlpDxZY6Vx7ho9NZCs20v
	Uu6W+YYK5G7Y4cS6/zh2Sn4DX4o8AlJ7YPfus=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=d/eGAP/OgAKsctsZIIk9fPlCRBX31YG8I+2M6ekYDz4KVq4jsdj8rJ4y/+SbnjvOfx
	Dz0Vy6UsmOIulcnnYlZbTKZphOnZBUQ6MfcMrshleRXdO7g7CpeiQJ+K9zc3X8T4EJei
	fm2xbTx1Pnwv87LSjfiF5D/i89Oj85B8JHZ+M=
Received: by 10.142.113.10 with SMTP id l10mr136342wfc.247.1249608397820;
	Thu, 06 Aug 2009 18:26:37 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 28sm1726899wfd.24.2009.08.06.18.26.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Aug 2009 18:26:36 -0700 (PDT)
Message-ID: <4A7B82BD.9030804@gmail.com>
Date: Fri, 07 Aug 2009 10:56:21 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fix dbus-daemon segfault on mipsel with recent toolchain
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
X-List-Received-Date: Fri, 07 Aug 2009 01:42:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

dbus-daemon segfaults on mipsel when built with -fPIE/-pie, as outlined in
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=532821

Removes PIE compilation from the dbus-daemon Makefile as a workaround.

-Graham

Signed-off-by: Graham Gower <graham.gower@gmail.com>

diff --git a/recipes/dbus/dbus-native_1.0.3.bb b/recipes/dbus/dbus-native_1.0.3.bb
index 8a4c6fe..6ec0fc8 100644
--- a/recipes/dbus/dbus-native_1.0.3.bb
+++ b/recipes/dbus/dbus-native_1.0.3.bb
@@ -1,6 +1,6 @@
 require dbus.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 inherit native
diff --git a/recipes/dbus/dbus-native_1.2.1.bb b/recipes/dbus/dbus-native_1.2.1.bb
index 566c7bc..2b1610e 100644
--- a/recipes/dbus/dbus-native_1.2.1.bb
+++ b/recipes/dbus/dbus-native_1.2.1.bb
@@ -1,4 +1,5 @@
 require dbus.inc
+PR = "${INC_PR}.0"
 RRECOMMENDS_${PN} = ""
 RDEPENDS_${PN} = ""
 inherit native
diff --git a/recipes/dbus/dbus.inc b/recipes/dbus/dbus.inc
index 0302cfe..b5eeb08 100644
--- a/recipes/dbus/dbus.inc
+++ b/recipes/dbus/dbus.inc
@@ -4,6 +4,8 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
 
+INC_PR = "r16"
+
 SRC_URI = "\
   http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
   file://cross.patch;patch=1 \
@@ -30,6 +32,10 @@ EXTRA_OECONF = "\
   --with-dbus-default-reply-timeout=200000 \
 "
 
+do_compile_prepend_mipsel() {
+	sed -i -e 's/\-fPIE//' -e 's/\-pie\ \-Wl\,\-z\,relro//' bus/Makefile
+}
+
 do_install_append() {
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
diff --git a/recipes/dbus/dbus_1.0.3.bb b/recipes/dbus/dbus_1.0.3.bb
index 2589cfe..7001bb9 100644
--- a/recipes/dbus/dbus_1.0.3.bb
+++ b/recipes/dbus/dbus_1.0.3.bb
@@ -1,4 +1,4 @@
 require dbus.inc
-PR = "r16"
+PR = "${INC_PR}.0"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/dbus/dbus_1.2.1.bb b/recipes/dbus/dbus_1.2.1.bb
index 9d6c4c1..72db1da 100644
--- a/recipes/dbus/dbus_1.2.1.bb
+++ b/recipes/dbus/dbus_1.2.1.bb
@@ -1,3 +1,3 @@
 include dbus.inc
 
-PR = "r12"
+PR = "${INC_PR}.0"



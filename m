Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1MVWl7-0006j1-4K
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 22:25:21 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1634229qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=rEVs7CMVMZjSBdwxGKLVUTuRH5P2JVyWijA/p0inDJI=;
	b=IRokz3SvFEGkXoFanzHj21k7Xvv/rckbnaTI6MV6v70Bb8VHFW/QUion8vs3Zez1AB
	/HFQ0y3C7lyFf6ql4V0FGwzgcg5vjovmylrz9tKu/z66djUJqyeQL52FpNUumXNVTHqj
	AJwdJXl71QBONIZ5/dl4vZ05OX2NTP2EuHKZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rJCdzK0eqeDDwdH7P5Wj0xcejivFRBuGuSq2Au8zBqv0w41h621hungR7/f3eZ8CVI
	OzikBFR1hPIZ1mBlWu6kJfj25iMhqVntIB82i5j3h6gis8IINFePcRvluf8SnHK4Si62
	9dBXM261yr/rhs+fhvVPIJiubPwExOZKdrloE=
MIME-Version: 1.0
Received: by 10.229.81.67 with SMTP id w3mr1647610qck.6.1248725437145; Mon, 27 
	Jul 2009 13:10:37 -0700 (PDT)
Date: Mon, 27 Jul 2009 13:10:37 -0700
Message-ID: <5e088bd90907271310o13787c35j5412c20fa1039912@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] policykit: install missing PolicyKit.conf
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
X-List-Received-Date: Mon, 27 Jul 2009 20:25:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Jul 2009 19:38:05 +0000 (-0700)
Subject: policykit: install missing PolicyKit.conf
X-Git-Url: http://www.sakoman.net/cgi-bin/gitweb.cgi?p=openembedded.git;a=commitdiff_plain;h=98b71f9ab5b8578b77bb45887e72681ce16a2910

policykit: install missing PolicyKit.conf
---

diff --git a/recipes/policykit/policykit/PolicyKit.conf
b/recipes/policykit/policykit/PolicyKit.conf
new file mode 100644
index 0000000..ed502ac
--- /dev/null
+++ b/recipes/policykit/policykit/PolicyKit.conf
@@ -0,0 +1,13 @@
+<?xml version="1.0" encoding="UTF-8"?> <!-- -*- XML -*- -->
+
+<!DOCTYPE pkconfig PUBLIC "-//freedesktop//DTD PolicyKit Configuration 1.0//EN"
+"http://hal.freedesktop.org/releases/PolicyKit/1.0/config.dtd">
+
+<!-- See the manual page PolicyKit.conf(5) for file format -->
+
+<config version="0.1">
+    <match user="root">
+        <return result="yes"/>
+    </match>
+    <define_admin_auth group="admin"/>
+</config>
diff --git a/recipes/policykit/policykit_0.9.bb
b/recipes/policykit/policykit_0.9.bb
index 28cbb11..2a31701 100644
--- a/recipes/policykit/policykit_0.9.bb
+++ b/recipes/policykit/policykit_0.9.bb
@@ -1,9 +1,11 @@
 HOMEPAGE = "http://www.packagekit.org/"
 DEPENDS = "libpam expat dbus-glib"

-PR = "r4"
+PR = "r5"

-SRC_URI = "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz"
+SRC_URI = "http://hal.freedesktop.org/releases/PolicyKit-${PV}.tar.gz \
+           file://PolicyKit.conf \
+          "

 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin
--disable-man-pages --disable-gtk-doc"

@@ -11,6 +13,10 @@ S = "${WORKDIR}/PolicyKit-${PV}"

 inherit autotools pkgconfig

+do_install_append () {
+	install -m 0644 ${WORKDIR}/PolicyKit.conf
${D}${sysconfdir}/PolicyKit/PolicyKit.conf
+}
+
 do_stage() {
         autotools_stage_all
 }



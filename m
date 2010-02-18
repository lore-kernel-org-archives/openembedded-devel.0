Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Ni3Y1-0008Km-2n
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 11:23:56 +0100
Received: by fg-out-1718.google.com with SMTP id 19so529736fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=aID45g8zVP74UF2k9YBkuhqZ9sJJNRcH8rIxAxE9u0Y=;
	b=NseJjiKjIBxwiu5j8gyQblYrsS7N9K2oWc/NmGsceEjI3mhujXWf67hvAhYlK1RL95
	dsE9YRuP5qJNNewTd3hP0Zw2nZeZ7uIw+4BYnXUOk3orJSLEWGhtjdT3gaOo90QbPDpA
	GIi2ALIHjEGDjakivns/SJe59VbwlZkRWDrSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dgmCYOmkcIB88XvmKoNH4rO5MdHlFeshzlS/khh1hP8Kjpualv6QxhIB/39l/GZ9GY
	A6+DXqIpIsg3r3AqTLeZzWYfRoyLkwiPNZ8U4ZH8BZJKHz+4QYI9cq0LBubaBVlFNf3u
	V3ns/9ycvMQmatF9/w8E3gybEGP0sQiB3zBXk=
Received: by 10.87.68.19 with SMTP id v19mr13466035fgk.2.1266488473763;
	Thu, 18 Feb 2010 02:21:13 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm4573523fxm.6.2010.02.18.02.21.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Feb 2010 02:21:12 -0800 (PST)
Date: Thu, 18 Feb 2010 11:20:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100218102048.GO3233@jama>
References: <E1Nhfko-0005L8-Mc@melo.openembedded.org>
	<20100217104816.GJ3233@jama> <hlgk42$774$1@ger.gmane.org>
	<201002172046.30607.holger+oe@freyther.de>
	<hlhhfs$ik1$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hlhhfs$ik1$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Koen Kooi : qt4: add 4.6.2
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
X-List-Received-Date: Thu, 18 Feb 2010 10:23:56 -0000
X-Groupsio-MsgNum: 16896
Content-Type: multipart/mixed; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline

--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 17, 2010 at 08:53:34PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 17-02-10 20:46, Holger Hans Peter Freyther wrote:
> > On Wednesday 17 February 2010 12:32:20 Koen Kooi wrote:
> > for me.. but if it's right way, then it should be
> >>> integrated to .inc files instead.
> >>
> >> Your patch looks good to me, but I'd like zecke to comment on it. Holger?
> > 
> > Can't hurt..
> > 
> > Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>
> 
> Acked-by: Koen Kooi <koen@openembedded.org>

Does both ACKs still hold for this integrated patch?

Tested only on 4.6.2, only change for 4.3 and 4.5 should be added -I -L
options as I didn't want to copy EXTRA_OECONF to those recipes just to
remove them there (if they are not supported I guess only warning about
unrecognized option will be emited).

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         

--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-qt4-tools-native-set-libdir-and-incdir-in-.inc-file.patch"

From a40d03fbd8b7ffb8eb4731ddc0885c18535b9d60 Mon Sep 17 00:00:00 2001
From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Feb 2010 10:42:17 +0100
Subject: [PATCH] qt4-tools-native: set libdir and incdir in .inc file

* move SRC_URI and EXTRA_OECONF for new versions to .inc and changed to
  old version
* remove LFLAGS setting from 4.6.* versions (replaced with -L param)
---
 recipes/qt4/qt4-tools-native.inc      |   14 +++++++-------
 recipes/qt4/qt4-tools-native_4.4.3.bb |   16 ++++++++++++++++
 recipes/qt4/qt4-tools-native_4.5.2.bb |   16 ++++++++++++++++
 recipes/qt4/qt4-tools-native_4.6.0.bb |    8 +-------
 recipes/qt4/qt4-tools-native_4.6.2.bb |   21 +--------------------
 5 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index 8f52092..bd0d2e1 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -5,18 +5,19 @@ HOMEPAGE = "http://www.trolltech.com"
 PRIORITY = "optional"
 LICENSE = "GPL"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 inherit native
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
-           file://configure-lflags.patch;patch=1 \
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
            file://qt-config.patch;patch=1 \
            file://g++.conf \
            file://linux.conf"
-S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 EXTRA_OECONF = "-prefix ${prefix} \
+                -L ${STAGING_LIBDIR_NATIVE} \
+                -I ${STAGING_INCDIR_NATIVE} \
                 -qt-libjpeg -qt-gif -system-zlib \
                 -no-libjpeg -no-libpng \
                 -no-accessibility \
@@ -24,7 +25,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -no-exceptions  \
                 -no-nas-sound \
                 -no-nis \
-                -verbose -release -fast -static \
+                -verbose -release -static \
                 -qt3support"
 
 # yank default -e, otherwise we get the following error:
@@ -32,7 +33,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
 EXTRA_OEMAKE = " "
 
 do_configure() {
-   (echo o; echo yes) | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
 
 TOBUILD = "\
@@ -72,4 +73,3 @@ do_stage() {
 
     install -m 0644 tools/porting/src/q3porting.xml ${STAGING_DATADIR_NATIVE}/qt4/
 }
-
diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
index a734b6b..3ad402f 100644
--- a/recipes/qt4/qt4-tools-native_4.4.3.bb
+++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
@@ -1,2 +1,18 @@
 require qt4-tools-native.inc
+
+# Older releases have different source archive name, than .inc
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch;patch=1 \
+           file://qt-config.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf"
+
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+EXTRA_OECONF += " -fast"
+
+do_configure() {
+   (echo o; echo yes) | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
 PR = "${INC_PR}.1"
diff --git a/recipes/qt4/qt4-tools-native_4.5.2.bb b/recipes/qt4/qt4-tools-native_4.5.2.bb
index 8eed003..77171a1 100644
--- a/recipes/qt4/qt4-tools-native_4.5.2.bb
+++ b/recipes/qt4/qt4-tools-native_4.5.2.bb
@@ -1,4 +1,20 @@
 require qt4-tools-native.inc
+
+# Older releases have different source archive name, than .inc
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+           file://configure-lflags.patch;patch=1 \
+           file://qt-config.patch;patch=1 \
+           file://g++.conf \
+           file://linux.conf"
+
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+EXTRA_OECONF += " -fast"
+
+do_configure() {
+   (echo o; echo yes) | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
 LICENSE = "LGPLv2.1 GPLv3"
 PR = "${INC_PR}.1"
 
diff --git a/recipes/qt4/qt4-tools-native_4.6.0.bb b/recipes/qt4/qt4-tools-native_4.6.0.bb
index 48310b1..44258b2 100644
--- a/recipes/qt4/qt4-tools-native_4.6.0.bb
+++ b/recipes/qt4/qt4-tools-native_4.6.0.bb
@@ -4,12 +4,6 @@ require qt4-tools-native.inc
 LICENSE = "LGPLv2.1 GPLv3"
 PR = "${INC_PR}.0"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch;patch=1 \
-           file://qt-config.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
+EXTRA_OECONF += " -fast"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
diff --git a/recipes/qt4/qt4-tools-native_4.6.2.bb b/recipes/qt4/qt4-tools-native_4.6.2.bb
index c40738b..894e497 100644
--- a/recipes/qt4/qt4-tools-native_4.6.2.bb
+++ b/recipes/qt4/qt4-tools-native_4.6.2.bb
@@ -4,25 +4,6 @@ require qt4-tools-native.inc
 LICENSE = "LGPLv2.1 GPLv3"
 PR = "${INC_PR}.0"
 
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch;patch=1 \
-           file://qt-config.patch;patch=1 \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-EXTRA_OECONF = "-prefix ${prefix} \
-                -L ${STAGING_LIBDIR_NATIVE} \
-		-I ${STAGING_INCDIR_NATIVE} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis \
-                -verbose -release -no-fast -static \
-                -qt3support -silent -no-rpath"
+EXTRA_OECONF += " -no-fast -silent -no-rpath"
 
 TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-- 
1.7.0


--ZmUaFz6apKcXQszQ--

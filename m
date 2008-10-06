Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1KmukA-0003kG-Ah
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Oct 2008 20:23:42 +0200
Received: by nf-out-0910.google.com with SMTP id d21so1452380nfb.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2008 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=0/PBt5463qHsb2GwxMMZSp5YyrwvinTWRL4tSUAYgSY=;
	b=sHAD7yWluEp0i2WqZAVUs4sO0BmOjVfgAWw9K6phIrsYx5V/LsjSaPY3u/bh8Gd1WP
	BFEJ3z5fPLHPoQ5AOe2PGTdOG3IRHRYLNp5CRUoLuM2dciwas5R45gF9Qfels/7Ym5FY
	2i4Honqm/wdZSM0A4oSt+7+eSreC8cwsIDcCg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=DzDl5AVk1QJ40H3MuIqjQdoJFc+gjWzfBFl4N/EKrxp8DorMxAKAXg0xnfYYgESEm7
	U3ncUDGRyKoqUTPXigZce/l9CRUiygWA6pcqpsJGc+vrOhHKW8he+18ZaUYCqGpbiDJV
	juhyOTGvEhmuQTKs9Wp1tgzicK5iC4LQtmIqE=
Received: by 10.210.52.9 with SMTP id z9mr3806980ebz.70.1223317151786;
	Mon, 06 Oct 2008 11:19:11 -0700 (PDT)
Received: by 10.210.138.17 with HTTP; Mon, 6 Oct 2008 11:19:11 -0700 (PDT)
Message-ID: <359c5480810061119o3504d462s3ad14e06e9129128@mail.gmail.com>
Date: Mon, 6 Oct 2008 20:19:11 +0200
From: "Nicola Mfb" <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810060859.31045.zecke@selfish.org>
MIME-Version: 1.0
References: <359c5480810050806t6e368b2fta20d1edecd165757@mail.gmail.com>
	<200810051937.40377.zecke@selfish.org>
	<359c5480810051326k2e921048r17f6b93e00aa619c@mail.gmail.com>
	<200810060859.31045.zecke@selfish.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Qt 4.4.1 and sqlite
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
X-List-Received-Date: Mon, 06 Oct 2008 18:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/10/6 Holger Freyther <zecke@selfish.org>

> On Sunday 05 October 2008 22:26:31 Nicola Mfb wrote:
>
> >
> > I hope tomorrow I will be able to test a qt rebuild, and reports some
> > feedback here.
>
> cool
>

Hi Zeche,
I did some test and rebitbaked qt 4.4.1 in both modes, the first linking qt
sqlite statically, the second building it as a plugin, in both cases I was
able to use sqlite driver in my application that created a database and did
some insert/select/delete encapsulated in transactions without problems.

I think the better is to build sqlite as a plugin to preserve memory usage
and space on device, this produces the extra package
qt4-plugin-sqldriver-sqlite that is not installed by opkg install
qt4-x11-free, that's fine as it has to be a dependency only for applications
needing it! (as this policy does not waste resources, it my be interesting
to consider to support other plugins too)

I have the following configuration:

DISTRO = "openmoko"
MACHINE = "om-gta02"
IMAGE_TARGET = "fso-image"
DISTRO_TARGET = "openmoko-feed"
INHERIT += "rm_work"
BBFILES += "/iscsi/local_recipies/*.bb"
include conf/topdir.conf
TMPDIR := "${TOPDIR}/tmp"
CACHE := "${TMPDIR}/cache"
DL_DIR := "${TOPDIR}/downloads"
PKGDIR := "${TOPDIR}/openembedded"
BBFILES := "${PKGDIR}/packages/*/*.bb"
TOPDIR='/iscsi/qt-test/fso-unstable'

and git diff produces:

diff --git a/conf/distro/include/preferred-om-2008-versions.inc
b/conf/distro/include/preferred-om-2008-versions.inc
index f420097..7767c5c 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -1621,7 +1621,7 @@ PREFERRED_VERSION_qpobox ?= "0.5.4"
 PREFERRED_VERSION_qpphoto ?= "1.0.2"
 PREFERRED_VERSION_qscintilla ?= "1.65-gpl-1.6"
 PREFERRED_VERSION_qsvn ?= "0.3.0"
-PREFERRED_VERSION_qt4-x11-free ?= "4.3.3"
+#PREFERRED_VERSION_qt4-x11-free ?= "4.3.3"
 PREFERRED_VERSION_qtplot ?= "0.2"
 PREFERRED_VERSION_qt-x11-free ?= "3.3.7"
 PREFERRED_VERSION_qt-x11-free-native ?= "3.3.5"
diff --git a/packages/qt4/qt_configuration.inc
b/packages/qt4/qt_configuration.inc
index 252a80a..9444e87 100644
--- a/packages/qt4/qt_configuration.inc
+++ b/packages/qt4/qt_configuration.inc
@@ -5,7 +5,7 @@ QT_ENDIAN = "${@qt_endian(d)}"
 QT_CONFIG_FLAGS += "-release -no-cups -no-accessibility -reduce-relocations
\
                     -shared -no-nas-sound -no-sm -no-nis \
                     -qt-gif -system-libjpeg -system-libpng -system-zlib \
-                     -no-sql-ibase -no-sql-mysql -no-sql-odbc -no-sql-psql
-no-sql-sqlite -no-sql-sqlite2 \
+                     -no-sql-ibase -no-sql-mysql -no-sql-odbc -no-sql-psql
-plugin-sql-sqlite -no-sql-sqlite2 \
                     -no-pch -qdbus -stl -glib"

 EXTRA_OEMAKE = "-e"

As you can note i commented preferred qt4 version to have 4.4.1

Regards

    Nicola


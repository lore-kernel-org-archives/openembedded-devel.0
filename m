Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5Rie-0003fg-R1 for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 01:23:53 +0200
Received: from f053041204.adsl.alicedsl.de ([78.53.41.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5RiF-00025w-0k for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 23:23:23 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 01:23:21 +0200
Message-ID: <1286839401.3900.59.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] gedit: add `gnome-doc-utils-native` to `DEPENDS`
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
X-List-Received-Date: Mon, 11 Oct 2010 23:23:53 -0000
X-Groupsio-MsgNum: 24710
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-LhocjryxoPpDOvksApz/"

--=-LhocjryxoPpDOvksApz/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Andreas Mueller <schnitzeltony@gmx.de>
Date: Mon, 11 Oct 2010 22:01:58 +0200

Otherwise task `do_compile` fails with the following error. `xml2po` is pro=
vided by `gnome-doc-utils-native`.

        | xsltproc -o gedit-C.omf --stringparam db2omf.basename gedit --str=
ingparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DTD Do=
cBook XML V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.omf_=
dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/help" =
--stringparam db2omf.omf_in "/oe/build-minimal-eglibc/minimal-dev/work/armv=
7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2.30.0/help/gedit.omf.in"  `/oe/b=
uild-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/pkg-config --va=
riable db2omf gnome-doc-utils` C/gedit.xml || { rm -f "gedit-C.omf"; exit 1=
; }
        | if ! test -d ar/; then mkdir ar/; fi
        | if ! test -d bg/; then mkdir bg/; fi
        | if ! test -d ca/; then mkdir ca/; fi
        | if [ -f "C/gedit.xml" ]; then d=3D"../"; else d=3D"/oe/build-mini=
mal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2=
.30.0/help/"; fi; \
        |       mo=3D"ar/ar.mo"; \
        |       if [ -f "${mo}" ]; then mo=3D"../${mo}"; else mo=3D"/oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/=
gedit-2.30.0/help/${mo}"; fi; \
        |       (cd ar/ && \
        |         `which xml2po` -m docbook -e -t "${mo}" \
        |           "${d}C/gedit.xml" > gedit.xml.tmp && \
        |           cp gedit.xml.tmp gedit.xml && rm -f gedit.xml.tmp)
        | if [ -f "C/gedit.xml" ]; then d=3D"../"; else d=3D"/oe/build-mini=
mal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2=
.30.0/help/"; fi; \
        |       mo=3D"ca/ca.mo"; \
        |       if [ -f "${mo}" ]; then mo=3D"../${mo}"; else mo=3D"/oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/=
gedit-2.30.0/help/${mo}"; fi; \
        |       (cd ca/ && \
        |         `which xml2po` -m docbook -e -t "${mo}" \
        |           "${d}C/gedit.xml" > gedit.xml.tmp && \
        |           cp gedit.xml.tmp gedit.xml && rm -f gedit.xml.tmp)
        | if [ -f "C/gedit.xml" ]; then d=3D"../"; else d=3D"/oe/build-mini=
mal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2=
.30.0/help/"; fi; \
        |       mo=3D"bg/bg.mo"; \
        |       if [ -f "${mo}" ]; then mo=3D"../${mo}"; else mo=3D"/oe/bui=
ld-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/=
gedit-2.30.0/help/${mo}"; fi; \
        |       (cd bg/ && \
        |         `which xml2po` -m docbook -e -t "${mo}" \
        |           "${d}C/gedit.xml" > gedit.xml.tmp && \
        |           cp gedit.xml.tmp gedit.xml && rm -f gedit.xml.tmp)
        | /bin/sh: line 4: -m: command not found
        | /bin/sh: line 4: -m: command not found
        | make[2]: *** [ar/gedit.xml] Error 127
        | make[2]: *** Waiting for unfinished jobs....
        | make[2]: *** [ca/gedit.xml] Error 127
        | /bin/sh: line 4: -m: command not found
        | make[2]: *** [bg/gedit.xml] Error 127
        | compilation error: file C/gedit.xml line 19 element article
        | xsltParseStylesheetProcess : document is not a stylesheet
        | make[2]: *** [gedit-C.omf] Error 1
        | make[2]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/=
work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2.30.0/help'
        | make[1]: *** [all-recursive] Error 1
        | make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/=
work/armv7a-oe-linux-gnueabi/gedit-2.30.0-r2/gedit-2.30.0'
        | make: *** [all] Error 2
        | FATAL: oe_runmake failed
        | ERROR: Function do_compile failed
        NOTE: package gedit-2.30.0-r2: task do_compile: Failed
        ERROR: TaskFailed event exception, aborting
        ERROR: Build of /oe/openembedded/recipes/gnome/gedit_2.30.0.bb do_c=
ompile failed
        ERROR: Task 12 (/oe/openembedded/recipes/gnome/gedit_2.30.0.bb, do_=
compile) failed with 256
        ERROR: '/oe/openembedded/recipes/gnome/gedit_2.30.0.bb' failed
        ERROR: '/oe/openembedded/recipes/gnome/gedit_2.30.0.bb' failed

Build tested with `minimal-eglibc` for `MACHINE =3D "beagleboard"`.

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 recipes/gnome/gedit_2.30.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/gedit_2.30.0.bb b/recipes/gnome/gedit_2.30.0.bb
index c00a05f..1d0ce78 100644
--- a/recipes/gnome/gedit_2.30.0.bb
+++ b/recipes/gnome/gedit_2.30.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "GNOME editor"
 SECTION =3D "x11/gnome"
 LICENSE =3D "GPLv2"
=20
-DEPENDS =3D "enchant gconf gnome-common glib-2.0 gtk+ gtksourceview2 iso-c=
odes"
+DEPENDS =3D "enchant gconf gnome-common gnome-doc-utils-native glib-2.0 gt=
k+ gtksourceview2 iso-codes"
 RDEPENDS_${PN} +=3D " gtksourceview2"
 PR =3D "r2"
=20
--=20
1.7.1


--=-LhocjryxoPpDOvksApz/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyznGkACgkQPX1aK2wOHVjLqQCfRa8LwIv8Z3yuqFp/ISkAlYDx
ShEAn3zMHwpwZTeDprgd/0hc9yeFouHD
=Xkp0
-----END PGP SIGNATURE-----

--=-LhocjryxoPpDOvksApz/--

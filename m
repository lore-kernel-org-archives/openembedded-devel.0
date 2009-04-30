Received: from [147.162.13.20] (helo=pcimg12.dei.unipd.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bott@pcimg12.dei.unipd.it>) id 1LzYep-0007Zc-4X
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 17:58:43 +0200
Received: by pcimg12.dei.unipd.it (Postfix, from userid 1000)
	id 903F8806F87A; Thu, 30 Apr 2009 17:53:20 +0200 (CEST)
Date: Thu, 30 Apr 2009 17:53:20 +0200
From: Ottavio Campana <ottavio@campana.vi.it>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090430155320.GA7550@pcimg12.dei.unipd.it>
References: <20090430140436.GA7335@pcimg12.dei.unipd.it>
	<49F9B426.5020602@xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <49F9B426.5020602@xora.org.uk>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: receipe for libmicrohttpd
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
X-List-Received-Date: Thu, 30 Apr 2009 15:58:43 -0000
X-Groupsio-MsgNum: 9958
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2009 at 03:22:30PM +0100, Graeme Gregory wrote:
> Ottavio Campana wrote:
> > I wrote the receipe for libmicrohttpd, a LPGL library used to embedde=
d a
> > web server in programs.
> >
> > It works for me, but I'd like to have some feedback from you, if it i=
s
> > good or not and if you'd like to add it to OE.
> >
> > Ottavio
> >
> > PR =3D "r1"
> > PN =3D "libmicrohttpd"
> > DESCRIPTION =3D "GNU libmicrohttpd is a small C library that is suppo=
sed to make it easy to run an HTTP server as part of another application"
> > HOMEPAGE =3D "http://www.gnu.org/software/libmicrohttpd/"
> > SECTION =3D "libs"
> > LICENSE =3D "LGPL"
> >
> > SRC_URI =3D "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.=
tar.gz"
> >
> > inherit autotools pkgconfig
> >
> > do_stage() {
> >         oe_runmake DESTDIR=3D"${D}" install
> >         autotools_stage_all
> > }
> >
> > do_qa_staging () {
> > }
> >
> >  =20
> You need to run the recipe through oe-stylize (found in contrib directo=
ry).
>=20
> Why did you override do_qa_staging() ?
>
> Apart from this recipe looks good, cleanup and submit as a git-diff.

here it is. I hope it's good.

Ottavio

--=20
Non c'=E8 pi=F9 forza nella normalit=E0, c'=E8 solo monotonia.

--EVF5PPMfhYS0aIcm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="libmicrohttpd.patch"

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ffc84c6..395ace5 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1,3 +1,7 @@
+[ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.tar.gz]
+md5=d11d2ee8632c13a60630607a99f500be
+sha256=8c8a3081fb65c78d85063690838363e979935aca023bc5e9639bc834c7947929
+
 [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
 md5=c6a2705f6210d8ede50a947b375f1c0b
 sha256=b3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198a88
diff --git a/recipes/libmicrohttpd/libmicrohttpd_0.4.1.bb b/recipes/libmicrohttpd/libmicrohttpd_0.4.1.bb
new file mode 100644
index 0000000..39860dc
--- /dev/null
+++ b/recipes/libmicrohttpd/libmicrohttpd_0.4.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application"
+HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
+SECTION = "libs"
+LICENSE = "LGPL"
+PR = "r1"
+
+SRC_URI = "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.tar.gz"
+
+inherit autotools pkgconfig
+
+do_stage() {
+        oe_runmake DESTDIR="${D}" install
+        autotools_stage_all
+}
+
+PN = "libmicrohttpd"

--EVF5PPMfhYS0aIcm--

Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TxdDF-0003iV-FZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:44:38 +0100
Received: by mail-da0-f50.google.com with SMTP id h15so3209727dan.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KtKvOge9SFLHKJdBP/vxIozeVRS7r60HPQ8lKA3hwVM=;
	b=TznM9xhK8TIjRXp1jqt08GmM5+ECJ35VudDgRUgJQSMmYmcTfk3gvG/5XvI11OHos7
	dpakMM/QqY37ET2fVWmqINPM1aR59CyD0WEeL39R0T1IdIeu46P+CleIRat4ZeqP2tz8
	I98Bu4gqgfDiJU5nto3fffiEXvv6SPX0IfDUz2eT8jqBB2fu49hlfUKdnvK2bug/080/
	Snc6uKlfmj7EZwN6X8M1LEvQ91jazpq4jASWBW9cbXCFKATT3LeDubH/QG9qmslcBwnw
	Uqk2JzMFLymTfgXkUI78YPkMtsrxe34yKdHM9pz+kQeN/dl8ViGkX9ydD2qFC7FE+aCS
	5Q6g==
X-Received: by 10.68.209.170 with SMTP id mn10mr38938345pbc.11.1358857734836; 
	Tue, 22 Jan 2013 04:28:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id nt5sm10669524pbb.59.2013.01.22.04.28.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:28:53 -0800 (PST)
Date: Tue, 22 Jan 2013 13:28:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130122122853.GS29386@jama.palm1.palmone.com>
References: <1358445132-13498-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1358445132-13498-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Wayne Tams <wayne.tams@simpleaudio.com>
Subject: Re: [meta-multimedia][PATCH] gst-rtsp: add GStreamer RTSP server/library
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
X-List-Received-Date: Tue, 22 Jan 2013 12:44:41 -0000
X-Groupsio-MsgNum: 42798
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPT5DIEyVHz5yXBV"
Content-Disposition: inline

--GPT5DIEyVHz5yXBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 05:52:12PM +0000, Ross Burton wrote:
> From: Wayne Tams <wayne.tams@simpleaudio.com>

Merged, thanks


>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...ecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch |   34 ++++++++++++++=
++++++
>  .../gstreamer/gst-rtsp_0.10.8.bb                   |   16 +++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp=
/0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp=
_0.10.8.bb
>=20
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-c=
hange-deprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch b/meta-multimedia=
/recipes-multimedia/gstreamer/gst-rtsp/0001-change-deprecated-INCLUDES-to-A=
M_CPPFLAGS-for-automa.patch
> new file mode 100644
> index 0000000..3afca4e
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp/0001-change-d=
eprecated-INCLUDES-to-AM_CPPFLAGS-for-automa.patch
> @@ -0,0 +1,34 @@
> +index gst-rtsp_0.10.8/bindings/python/Makefile.am
> +--- gst-rtsp_0.10.8.orig/bindings/python/Makefile.am
> ++++ gst-rtsp_0.10.8/bindings/python/Makefile.am
> +@@ -14,7 +14,7 @@ defs_DATA =3D $(DEFS)
> + defsdir =3D $(pkgdatadir)/$(GST_MAJORMINOR)/defs
> + OVERRIDES =3D rtspserver.override
> +
> +-INCLUDES =3D -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
> ++AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir) $(PYTHON_INCLUDES)
> +
> + rtspserver_la_CFLAGS =3D -I$(top_srcdir)/src \
> +         $(PYGOBJECT_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> +index gst-rtsp_0.10.8/examples/Makefile.am
> +--- gst-rtsp_0.10.8.orig/examples/Makefile.am
> ++++ gst-rtsp_0.10.8/examples/Makefile.am
> +@@ -1,6 +1,6 @@
> + noinst_PROGRAMS =3D test-video test-ogg test-mp4 test-readme test-launc=
h test-sdp test-uri test-auth
> +
> +-INCLUDES =3D -I$(top_srcdir) -I$(srcdir)
> ++AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir)
> +
> + AM_CFLAGS =3D $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> + AM_LDFLAGS =3D \
> +index gst-rtsp_0.10.8/tests/Makefile.am
> +--- gst-rtsp_0.10.8.orig/tests/Makefile.am
> ++++ gst-rtsp_0.10.8/tests/Makefile.am
> +@@ -1,6 +1,6 @@
> + noinst_PROGRAMS =3D test-cleanup
> +
> +-INCLUDES =3D -I$(top_srcdir) -I$(srcdir)
> ++AM_CPPFLAGS =3D -I$(top_srcdir) -I$(srcdir)
> +
> + AM_CFLAGS =3D $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
> + AM_LDFLAGS =3D \
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8=
=2Ebb b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
> new file mode 100644
> index 0000000..40872f5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer/gst-rtsp_0.10.8.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "GStreamer RTSP server"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +SRC_URI =3D "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.ta=
r.bz2 \
> +           file://0001-change-deprecated-INCLUDES-to-AM_CPPFLAGS-for-aut=
oma.patch"
> +SRC_URI[md5sum] =3D "b511af07000595f63c3a705946221643"
> +SRC_URI[sha256sum] =3D "9915887cf8515bda87462c69738646afb715b597613edc73=
40477ccab63a6617"
> +
> +DEPENDS =3D "gst-plugins-base gstreamer"
> +
> +# Configure always checks for Python so inherit pythonnative. Better sol=
ution
> +# would be to disable the checks entirely.
> +inherit autotools pythonnative gettext
> +
> +FILES_${PN}-dev +=3D "${datadir}/vala/vapi/"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPT5DIEyVHz5yXBV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD+hgUACgkQN1Ujt2V2gBzBPACfbbGZwjHVYceynncpUyEzj7Gc
K+sAoIYXLbD72Z70WS0BpRJl8H6DbV3Y
=03ug
-----END PGP SIGNATURE-----

--GPT5DIEyVHz5yXBV--

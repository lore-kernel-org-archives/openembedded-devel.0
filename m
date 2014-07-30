Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 56791707BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:25:31 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so6919593wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TV0+4HgBcFq+CFHrZ4sqd+ex2QekT90GPayVEQ19Nz4=;
	b=FzmSsqoleQQB9+84+3h5u8xOFfvxg+UqnwXOgfsZ/M39i8wIXK+zMX11CAYKlby9WB
	tg0YbmMS2fHHkdS5Dd2ry5guP3dFk3HkmV8OdgACc3WacTNWpMmYm5lXvpfmblrVZFid
	XdZNZMoxPdEqW46kQsJzeO28epBFk5FE3KTdF/8MT6Q5b/sbv+STinc4Gl2BGSL/IBkf
	Haj1aMHGpLlsEJdZGYFZ9pTH3Y9P1k9Cm6QYsZqfROZshv2jsaBflDySgLYiIuAVYXrw
	InBVGTW1hYiL3dgQLLYJIiMpIE8RukfY5PYlRItgOP+2VchjOAk26dL8v2FVnD+uZe6J
	Edaw==
X-Received: by 10.180.8.10 with SMTP id n10mr4157674wia.41.1406705132886;
	Wed, 30 Jul 2014 00:25:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm52329373wib.1.2014.07.30.00.25.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 00:25:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 09:25:55 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730072555.GF16445@jama>
References: <1406686961-21142-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1406686961-21142-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2][meta-networking] tcpslice: add recipe under tcpdump
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 07:25:38 -0000
X-Groupsio-MsgNum: 51311
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OWHXb1mYLuhj1Ox"
Content-Disposition: inline

--0OWHXb1mYLuhj1Ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 10:22:41AM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> tcpslice is a tool for extracting parts of a tcpdump packet trace,
> so put it under tcpdump dir
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../tcpdump/tcpslice/tcpslice-1.2a3-time.patch     |   75 ++++++++++++++=
++++++
>  .../tcpslice/tcpslice-CVS.20010207-bpf.patch       |   15 ++++
>  .../recipes-support/tcpdump/tcpslice_1.2a3.bb      |   35 +++++++++
>  3 files changed, 125 insertions(+)
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcps=
lice-1.2a3-time.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice/tcps=
lice-CVS.20010207-bpf.patch
>  create mode 100644 meta-networking/recipes-support/tcpdump/tcpslice_1.2a=
3.bb
>=20
> diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.=
2a3-time.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-=
1.2a3-time.patch
> new file mode 100644
> index 0000000..a86f6d2
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-1.2a3-tim=
e.patch
> @@ -0,0 +1,75 @@
> +Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +
> +--- tcpslice-1.2a3.orig/search.c	2000-09-10 10:52:40.000000000 +0200
> ++++ tcpslice-1.2a3/search.c	2006-07-28 14:56:55.000000000 +0200
> +@@ -53,7 +53,7 @@
> + /* Size of a packet header in bytes; easier than typing the sizeof() all
> +  * the time ...
> +  */
> +-#define PACKET_HDR_LEN (sizeof( struct pcap_pkthdr ))
> ++#define PACKET_HDR_LEN (sizeof( struct pcap_sf_pkthdr ))
> +=20
> + extern int snaplen;
> +=20
> +@@ -111,16 +111,24 @@
> + static void
> + extract_header( pcap_t *p, u_char *buf, struct pcap_pkthdr *hdr )
> + 	{
> +-	memcpy((char *) hdr, (char *) buf, sizeof(struct pcap_pkthdr));
> ++	struct pcap_sf_pkthdr hdri;
> ++
> ++	memcpy((char *) &hdri, (char *) buf, sizeof(struct pcap_sf_pkthdr));
> +=20
> + 	if ( pcap_is_swapped( p ) )
> + 		{
> +-		hdr->ts.tv_sec =3D SWAPLONG(hdr->ts.tv_sec);
> +-		hdr->ts.tv_usec =3D SWAPLONG(hdr->ts.tv_usec);
> +-		hdr->len =3D SWAPLONG(hdr->len);
> +-		hdr->caplen =3D SWAPLONG(hdr->caplen);
> ++		hdr->ts.tv_sec =3D SWAPLONG(hdri.ts.tv_sec);
> ++		hdr->ts.tv_usec =3D SWAPLONG(hdri.ts.tv_usec);
> ++		hdr->len =3D SWAPLONG(hdri.len);
> ++		hdr->caplen =3D SWAPLONG(hdri.caplen);
> ++		}
> ++	else
> ++		{
> ++		hdr->ts.tv_sec =3D hdri.ts.tv_sec;
> ++		hdr->ts.tv_usec =3D hdri.ts.tv_usec;
> ++		hdr->len =3D hdri.len;
> ++		hdr->caplen =3D hdri.caplen;
> + 		}
> +-
> + 	/*
> + 	 * From bpf/libpcap/savefile.c:
> + 	 *
> +--- tcpslice-1.2a3.orig/tcpslice.h	1995-11-02 00:40:53.000000000 +0100
> ++++ tcpslice-1.2a3/tcpslice.h	2006-07-28 14:56:55.000000000 +0200
> +@@ -20,6 +20,26 @@
> +  */
> +=20
> +=20
> ++#include <time.h>
> ++/* #include <net/bpf.h> */
> ++
> ++/*
> ++ * This is a timeval as stored in disk in a dumpfile.
> ++ * It has to use the same types everywhere, independent of the actual
> ++ * `struct timeval'
> ++ */
> ++                                                                       =
        =20
> ++struct pcap_timeval {
> ++    bpf_int32 tv_sec;           /* seconds */
> ++    bpf_int32 tv_usec;          /* microseconds */
> ++};
> ++
> ++struct pcap_sf_pkthdr {
> ++    struct pcap_timeval ts;     /* time stamp */
> ++    bpf_u_int32 caplen;         /* length of portion present */
> ++    bpf_u_int32 len;            /* length this packet (off wire) */
> ++};
> ++
> + time_t	gwtm2secs( struct tm *tm );
> +=20
> + int	sf_find_end( struct pcap *p, struct timeval *first_timestamp,
> diff --git a/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CV=
S.20010207-bpf.patch b/meta-networking/recipes-support/tcpdump/tcpslice/tcp=
slice-CVS.20010207-bpf.patch
> new file mode 100644
> index 0000000..0a73593
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice/tcpslice-CVS.20010=
207-bpf.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Pending [from tcpdump-4.1.1-1.fc14.src.rpm]
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +diff -ur tcpdump-3.8.1/tcpslice/tcpslice.c tcpdump-3.8.1.new/tcpslice/tc=
pslice.c
> +--- tcpslice/tcpslice.c	2004-01-15 17:35:53.000000000 +0100
> ++++ tcpslice/tcpslice.c	2004-01-15 16:12:57.000000000 +0100
> +@@ -35,7 +35,7 @@
> + #include <sys/file.h>
> + #include <sys/stat.h>
> +=20
> +-#include <net/bpf.h>
> ++/* #include <net/bpf.h> */
> +=20
> + #include <ctype.h>
> + #ifdef HAVE_FCNTL_H
> diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb b/=
meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> new file mode 100644
> index 0000000..d0bf7a2
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "tcpslice"
> +DESCRIPTION =3D "A tool for extracting parts of a tcpdump packet trace."
> +HOMEPAGE =3D "http://www.tcpdump.org/related.html"
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://tcpslice.c;endline=3D20;md5=3D99519e2e5234d=
1662a4ce16baa62c64e"=20

I've removed trailing space

> +
> +SRC_URI =3D "ftp://ftp.ee.lbl.gov/${BPN}-${PV}.tar.gz \

and replaced ${BPN}-${PV} with ${BP}

when cherry-picking this to master-next

> +           file://tcpslice-1.2a3-time.patch \
> +           file://tcpslice-CVS.20010207-bpf.patch \
> +           "
> +SRC_URI[md5sum] =3D "e329cbeb7e589f132d92c3447c477190"
> +SRC_URI[sha256sum] =3D "4096e8debc898cfaa16b5306f1c42f8d18b19e30e60da8d4=
deb781c8f684c840"
> +
> +inherit autotools-brokensep
> +
> +DEPENDS +=3D "libpcap"
> +
> +# We do not want to autoreconf.  We must specify srcdir as ".".
> +# We have to set the ac_cv_* cache variables as well as pass the normal
> +# cross-compilation options to configure!
> +#
> +do_configure () {
> +	oe_runconf \
> +            --srcdir=3D"." \
> +            ac_cv_build=3D${BUILD_SYS} \
> +            ac_cv_host=3D${HOST_SYS} \
> +            ac_cv_target=3D${HOST_SYS}
> +}
> +
> +do_install_prepend () {
> +	mkdir -p ${D}/usr/sbin
> +}
> +
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OWHXb1mYLuhj1Ox
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPYngMACgkQN1Ujt2V2gByUvwCfcMahxoscEI9cLV4h0F1Iicy0
H0cAoLX5PKEWFedmy+zlnSv9fQgJy0hg
=5oE5
-----END PGP SIGNATURE-----

--0OWHXb1mYLuhj1Ox--

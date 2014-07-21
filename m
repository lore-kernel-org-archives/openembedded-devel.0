Return-Path: <joe@deserted.net>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9316170247
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:56:02 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so6427773iec.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=SVpOoz+dzMEjaEoGLSlPmwOklvGWF+m/0VSNbxdiTY0=;
	b=iQqgSpQAPLxyY5qbOlvlhZ1lxN2+VGwkicUejh7nNvaS/9afNU2Qy5KW34WU2o7AtM
	nrtH1S4D3Ria7D3u/OaXzpLVUe5WtT/YzdSgchZHve8h3MxCCboypu/t59MymYNrI7mZ
	RILGvIvi4dCUv/qkD0tuZF45q7sxAro6hFTmbC9wmW/pm7x5AcmPuQ9PvVC3UkRPtnY2
	Od8KekX7nzOmaL+uaEIsVXbcMx+4Fx0X082iPwUuaeOea0N7Cui2JjT63s1y/lvI10sr
	SeuV8rKhCvnXYg5mAAE7r9IO8/xL6AaQnwQKlwQpxYHRt5QS4zNiaaTJoJz19rZvqZQR
	/pDw==
X-Gm-Message-State: ALoCoQmL7M2jEaHUI8fPVQy7bKzcXIUd+uC2LpX3v7DG1UMIL3T5Cv05JDYDwxSdbmFkCC4waT1l
X-Received: by 10.50.79.169 with SMTP id k9mr439915igx.0.1405914963484;
	Sun, 20 Jul 2014 20:56:03 -0700 (PDT)
Received: from skynet (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id v8sm34754735igh.19.2014.07.20.20.56.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 20:56:02 -0700 (PDT)
Received: by skynet (Postfix, from userid 1000)
	id BF8121685E3; Sun, 20 Jul 2014 23:56:01 -0400 (EDT)
Date: Sun, 20 Jul 2014 23:56:01 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721035559.GC11616@deserted.net>
References: <1404978317-2680-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1404978317-2680-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] tcpslice: add recipe under tcpdump
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
X-List-Received-Date: Mon, 21 Jul 2014 03:56:04 -0000
X-Groupsio-MsgNum: 51136
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Roy,

I'm not taking this one right now, I can't tell quite what the state of
it is.  I wasn't able to find a place on $HOMEPAGE to download the
source (though I only spent a couple of minutes looking, since obviously
the download link is live) but the license is a bit hairy.  You can't
point at ${COMMON_LICENSE_DIR} as the file to use for your checksum
since that's not part of the source.  I had a quick look at a few of the
source files and it looks like a 3 Clause BSD license for everything,
but since there's not an obvious top-level LICENSE file, you probably
need to confirm that all of the source is covered by the same license
before we go anywhere with it.  That it doesn't appear to have been
touched in close to a decade, source-wise, suggests to me it's either
perfectly clean or below everyone's radar (more likely the latter).

Also, can you update the recipe to use variables where appropriate -- I
guess just in SRC_URI, since it's so simple -- when you sort out the
redistribution status?

-J.

[[oe] [meta-networking][PATCH] tcpslice: add recipe under tcpdump] On 14.07=
=2E10 (Thu 15:45) rongqing.li@windriver.com wrote:

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
> index 0000000..0b47da6
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "tcpslice"
> +DESCRIPTION =3D "A tool for extracting parts of a tcpdump packet trace."
> +HOMEPAGE =3D "http://ee.lbl.gov"
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/BSD;md5=3D3775480a712=
fc46a69647678acb234cb"=20
> +
> +SRC_URI =3D "ftp://ftp.ee.lbl.gov/tcpslice-1.2a3.tar.gz \
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
--=20
-Joe MacDonald.
:wq

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlPMj08ACgkQwFvcllog0XxHlACgtj32p+8khKCZqdQ4f9WJXwWQ
038An2U1nAlIhwFDpnieaDseWKEvrmb3
=1KpS
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--

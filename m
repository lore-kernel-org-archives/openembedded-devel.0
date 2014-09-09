Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 10A1D713BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 14:34:29 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XRMV4-0002D4-M2 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Sep 2014 07:34:30 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 9 Sep 2014 07:34:30 -0700
Received: by burninator (Postfix, from userid 1000)	id B7CB85814C3; Tue,  9
	Sep 2014 10:34:29 -0400 (EDT)
Date: Tue, 9 Sep 2014 10:34:29 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140909143429.GJ2125@mentor.com>
References: <1410222085-31153-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1410222085-31153-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-networking][v4] tcpslice: add recipe under tcpdump
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
X-List-Received-Date: Tue, 09 Sep 2014 14:34:30 -0000
X-Groupsio-MsgNum: 52048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline

--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

And merged.  Thanks for all of the updates and for squishing this into
one commit, Roy.

-J.

[[oe] [PATCH][meta-networking][v4] tcpslice: add recipe under tcpdump] On 1=
4.09.09 (Tue 08:21) rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> tcpslice is a tool for extracting parts of a tcpdump packet trace,
> so put it under tcpdump dir
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> Fix the license
>=20
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
> index 0000000..386b7f8
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
> ++
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
> index 0000000..203d143
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.2a3.bb
> @@ -0,0 +1,35 @@
> +SUMMARY =3D "tcpslice"
> +DESCRIPTION =3D "A tool for extracting parts of a tcpdump packet trace."
> +HOMEPAGE =3D "http://www.tcpdump.org/related.html"
> +SECTION =3D "console/network"
> +
> +LICENSE =3D "BSD-4-Clause"
> +LIC_FILES_CHKSUM =3D "file://tcpslice.c;endline=3D20;md5=3D99519e2e5234d=
1662a4ce16baa62c64e"
> +
> +SRC_URI =3D "ftp://ftp.ee.lbl.gov/${BP}.tar.gz \
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

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUDw/1AAoJEEn8ffcsOfaW7BoH/A4JBaf36iEZRq8C8L7tjPso
jSAOLvOXO3idlXGh0aEAB36awAj+CfU1dHAxdgLE/tEbkJDGBKYplv4okEIIRHod
+X9SFPlmCDKuUN2VeV1kVE1AG5eoNNw8T0KGoi3vsMrc9k+J9Qf4hsg6ht9elG//
sON1dKXxOfi1++e1+E+YL3rf3b/T6vS8vY7NpwyOvVob8splK+0ZeXNT1EcjJlUm
egCsPYBhT9u0+jhpiOnRDhG9GseVLIWCUf89erEb5vN5YYrYPznJkTbAKh0Y2OEa
ftme/Vvg0BCU3F6EGvV/ctrYTM6TdYGs4kgJxDyB62T8hofqCNZTGciryWriHgE=
=roy9
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--

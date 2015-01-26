Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DF47960670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 14:43:17 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YFksn-0003V0-RQ from Joe_MacDonald@mentor.com ;
	Mon, 26 Jan 2015 06:43:17 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 26 Jan 2015 06:43:17 -0800
Received: by burninator (Postfix, from userid 1000)	id E821D58068C; Mon, 26
	Jan 2015 09:43:13 -0500 (EST)
Date: Mon, 26 Jan 2015 09:43:13 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <jianchuan.wang@windriver.com>
Message-ID: <20150126144313.GG4791@mentor.com>
References: <1421919356-3982-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421919356-3982-1-git-send-email-jianchuan.wang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3] ipvsadm: Add version 1.26 (initial recipe)
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
X-List-Received-Date: Mon, 26 Jan 2015 14:43:26 -0000
X-Groupsio-MsgNum: 53978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e5bfZ/T2xnjpUIbw"
Content-Disposition: inline

--e5bfZ/T2xnjpUIbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jianchuan,

Two things on this one.  First, v3 produces this:

WARNING: QA Issue: ipvsadm requires /bin/bash, but no providers in its RDEP=
ENDS [file-rdeps]

Second, I don't think that it's necessarily the case that your first
patch is inappropriate for up-stream.  Cross-compilation fixes aren't
generally unwelcome by maintainers.  That's not a barrier to acceptance
to meta-networking, of course, but you may want to consider sending it
upstream anyway to see what the maintainers think.

The second patch looks very much like it's required for up-stream so if
they don't already have such a change, you should definitely submit it.

-J.

[[oe] [meta-networking][PATCH v3] ipvsadm: Add version 1.26 (initial recipe=
)] On 15.01.22 (Thu 17:35) jianchuan.wang@windriver.com wrote:

> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>=20
> * add ipvs administration tool
>=20
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  ...001-Modify-the-Makefile-for-cross-compile.patch | 97 ++++++++++++++++=
++++++
>  .../0002-Replace-nl_handle-to-nl_sock.patch        | 63 ++++++++++++++
>  .../recipes-support/ipvsadm/ipvsadm_1.26.bb        | 34 ++++++++
>  3 files changed, 194 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0001-=
Modify-the-Makefile-for-cross-compile.patch
>  create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0002-=
Replace-nl_handle-to-nl_sock.patch
>  create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.=
bb
>=20
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-=
the-Makefile-for-cross-compile.patch b/meta-networking/recipes-support/ipvs=
adm/ipvsadm/0001-Modify-the-Makefile-for-cross-compile.patch
> new file mode 100644
> index 0000000..7c3dfe4
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Modify-the-Mak=
efile-for-cross-compile.patch
> @@ -0,0 +1,97 @@
> +From 58292175115bae7a4c3600d3022e59ea57213025 Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Mon, 12 Jan 2015 15:53:23 +0800
> +Subject: [PATCH] Modify the Makefile for cross compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + Makefile         | 23 ++++++-----------------
> + libipvs/Makefile |  3 +--
> + 2 files changed, 7 insertions(+), 19 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e4e03cc..461c021 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -35,10 +35,9 @@ ARCH		=3D $(shell uname -m)
> + RPMSOURCEDIR	=3D $(shell rpm --eval '%_sourcedir')
> + RPMSPECDIR	=3D $(shell rpm --eval '%_specdir')
> +=20
> +-CC		=3D gcc
> + INCLUDE		=3D
> + SBIN		=3D $(BUILD_ROOT)/sbin
> +-MANDIR		=3D usr/man
> ++MANDIR		=3D usr/share/man
> + MAN		=3D $(BUILD_ROOT)/$(MANDIR)/man8
> + INIT		=3D $(BUILD_ROOT)/etc/rc.d/init.d
> + MKDIR		=3D mkdir
> +@@ -62,17 +61,7 @@ RPMBUILD =3D $(shell				\
> + 		echo "/bin/rpm";		\
> + 	fi )
> +=20
> +-ifeq (,$(FORCE_GETOPT))
> +-LIB_SEARCH =3D /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/lo=
cal/lib
> +-POPT_LIB =3D $(shell for i in $(LIB_SEARCH); do \
> +-  if [ -f $$i/libpopt.a ]; then \
> +-    if nm $$i/libpopt.a | fgrep -q poptGetContext; then \
> +-	echo "-lpopt"; \
> +-	break; \
> +-    fi; \
> +-  fi; \
> +-done)
> +-endif
> ++POPT_LIB =3D -lpopt
> +=20
> + ifneq (,$(POPT_LIB))
> + POPT_DEFINE =3D -DHAVE_POPT
> +@@ -81,7 +70,7 @@ endif
> + OBJS		=3D ipvsadm.o config_stream.o dynamic_array.o
> + LIBS		=3D $(POPT_LIB)
> + ifneq (0,$(HAVE_NL))
> +-LIBS		+=3D -lnl
> ++LIBS		+=3D -lnl-3 -lnl-genl-3
> + endif
> + DEFINES		=3D -DVERSION=3D\"$(VERSION)\" -DSCHEDULERS=3D\"$(SCHEDULERS)\=
" \
> + 		  -DPE_LIST=3D\"$(PE_LIST)\" $(POPT_DEFINE)
> +@@ -91,13 +80,13 @@ DEFINES		+=3D $(shell if [ ! -f ../ip_vs.h ]; then	\
> +=20
> + .PHONY	=3D all clean install dist distclean rpm rpms
> +=20
> +-all:            libs ipvsadm
> ++all: ipvsadm
> +=20
> + libs:
> + 		make -C libipvs
> +=20
> +-ipvsadm:	$(OBJS) $(STATIC_LIBS)
> +-		$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> ++ipvsadm:	$(OBJS) libs
> ++		$(CC) $(CFLAGS) -o $@ $(OBJS) $(STATIC_LIBS) $(LIBS)
> +=20
> + install:        all
> + 		if [ ! -d $(SBIN) ]; then $(MKDIR) -p $(SBIN); fi
> +diff --git a/libipvs/Makefile b/libipvs/Makefile
> +index a527a7f..b7300ec 100644
> +--- a/libipvs/Makefile
> ++++ b/libipvs/Makefile
> +@@ -1,6 +1,5 @@
> + # Makefile for libipvs
> +=20
> +-CC		=3D gcc
> + CFLAGS		=3D -Wall -Wunused -Wstrict-prototypes -g -fPIC
> + ifneq (0,$(HAVE_NL))
> + CFLAGS		+=3D -DLIBIPVS_USE_NL
> +@@ -18,7 +17,7 @@ SHARED_LIB	=3D libipvs.so
> + all:		$(STATIC_LIB) $(SHARED_LIB)
> +=20
> + $(STATIC_LIB):	libipvs.o ip_vs_nl_policy.o
> +-		ar rv $@ $^
> ++		$(AR) rv $@ $^
> +=20
> + $(SHARED_LIB):	libipvs.o ip_vs_nl_policy.o
> + 		$(CC) -shared -Wl,-soname,$@ -o $@ $^
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace=
-nl_handle-to-nl_sock.patch b/meta-networking/recipes-support/ipvsadm/ipvsa=
dm/0002-Replace-nl_handle-to-nl_sock.patch
> new file mode 100644
> index 0000000..7896d6d
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0002-Replace-nl_han=
dle-to-nl_sock.patch
> @@ -0,0 +1,63 @@
> +From 2686213259b15df9cf1d969c5a14d62f14cfbaae Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Thu, 8 Jan 2015 17:37:11 +0800
> +Subject: [PATCH 2/2] Replace nl_handle to nl_sock.
> +
> +The nl_handle was replace with nl_sock in the libnl-3.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + libipvs/libipvs.c | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/libipvs/libipvs.c b/libipvs/libipvs.c
> +index a157e18..21a9bfa 100644
> +--- a/libipvs/libipvs.c
> ++++ b/libipvs/libipvs.c
> +@@ -32,7 +32,7 @@ static void* ipvs_func =3D NULL;
> + struct ip_vs_getinfo ipvs_info;
> +=20
> + #ifdef LIBIPVS_USE_NL
> +-static struct nl_handle *sock =3D NULL;
> ++static struct nl_sock *sock =3D NULL;
> + static int family, try_nl =3D 1;
> + #endif
> +=20
> +@@ -73,7 +73,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvms=
g_msg_cb_t func, void *arg
> + {
> + 	int err =3D EINVAL;
> +=20
> +-	sock =3D nl_handle_alloc();
> ++	sock =3D nl_socket_alloc();
> + 	if (!sock) {
> + 		nlmsg_free(msg);
> + 		return -1;
> +@@ -88,7 +88,7 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_recvms=
g_msg_cb_t func, void *arg
> +=20
> + 	/* To test connections and set the family */
> + 	if (msg =3D=3D NULL) {
> +-		nl_handle_destroy(sock);
> ++		nl_socket_free(sock);
> + 		sock =3D NULL;
> + 		return 0;
> + 	}
> +@@ -104,12 +104,12 @@ int ipvs_nl_send_message(struct nl_msg *msg, nl_re=
cvmsg_msg_cb_t func, void *arg
> +=20
> + 	nlmsg_free(msg);
> +=20
> +-	nl_handle_destroy(sock);
> ++	nl_socket_free(sock);
> +=20
> + 	return 0;
> +=20
> + fail_genl:
> +-	nl_handle_destroy(sock);
> ++	nl_socket_free(sock);
> + 	sock =3D NULL;
> + 	nlmsg_free(msg);
> + 	errno =3D err;
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb b/me=
ta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> new file mode 100644
> index 0000000..ac97d47
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Linux Virtual Server administration Utility"
> +DESCRIPTION =3D "Ipvsadm  is  used  to set up, maintain or inspect the v=
irtual server \
> +table in the Linux kernel. The Linux Virtual  Server  can  be  used  to \
> +build  scalable  network  services  based  on  a cluster of two or more =
nodes. \
> +The active node of the cluster redirects service requests  to  a \
> +collection  of  server  hosts  that will actually perform the services. \
> +Supported features include two protocols (TCP and UDP),  three  packet-f=
orwarding \
> +methods (NAT, tunneling, and direct routing), and eight load balancing a=
lgorithms \
> +(round robin, weighted round robin,  least-connec-tion, weighted least-c=
onnection, \
> +locality-based  least-connection, locality-based least-connection with r=
eplication, \
> +destination-hashing, and source-hashing)."
> +SECTION =3D "console/network"
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D40;endline=3D56;md5=3Da5=
4cba37b64924aa5008881607942892"
> +
> +DEPENDS +=3D "libnl popt"
> +
> +SRC_URI =3D "http://www.linuxvirtualserver.org/software/kernel-2.6/${BP}=
=2Etar.gz \
> +        file://0001-Modify-the-Makefile-for-cross-compile.patch \
> +        file://0002-Replace-nl_handle-to-nl_sock.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "eac3ba3f62cd4dea2da353aeddd353a8"
> +SRC_URI[sha256sum] =3D "6d6c46fecb1c532a892616b4445c73b71730e8790d5630f6=
0269fd9cbee0eb2d"
> +
> +do_compile() {
> +    oe_runmake \
> +    CC=3D"${CC} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -L${STAGI=
NG_LIBDIR}" \
> +    all
> +}
> +
> +do_install() {
> +    oe_runmake 'BUILD_ROOT=3D${D}' install
> +}
> --=20
> 1.9.1
>=20
--=20
-Joe MacDonald.
:wq

--e5bfZ/T2xnjpUIbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUxlKBAAoJEEn8ffcsOfaWFrQH/0CuFYc1GER5wIrFdacRBwAU
dlCv32qyCEPJrkFhj52p/O5cAoCEg59WBLrUTUlo5mm8mUGd/7Ec3vDyAaBu7n/a
Vbx9ohA3woi5nLy7FHkPhBzHQGwuZbtJpIlWUrW+zPiCzj29KCspYgPklBSKWsNy
j59TUYtx2ZoGfG23LmN1/B4s9b0o9heAAUK5Q0JYO2HH/1EF4YxZi3igK4v19Q+0
XFRUYKg5VHCLQoIBz81qO9/osBJ26IVii931UTwZux3QDkqpbkcFtbLw2mHbbHhv
sKZjPFbzQWTbzRDvdXmo2Tg42T/THivlmCn3r++pAVB320cQ9i41ZfAkZuxSkkw=
=9V6M
-----END PGP SIGNATURE-----

--e5bfZ/T2xnjpUIbw--

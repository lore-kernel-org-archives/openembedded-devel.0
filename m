Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED6B72207
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:41:21 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so15424229wev.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rihdW+SJtnmZcZS5oIw8jKDugSon8voj1LxjqA1Jquc=;
	b=qNLIR36Xr8KC5YV9h04A+djHY3B3oXErNYcgTP2xPcoPfsdQKc5cqe9y8X8YRGLEBE
	5fu6A+s166/tX6W5UaLwBo8qkJv/qXg8Nh4pJtxZylfo6zcLMJM44cbpqWUzUCmwFK5k
	7LWaPQ0cO5sNKN/+bPnSu9oEL8yf3l9xU4asLyOE2UaB268vSfPpui3FDuhjvsBgsbG8
	iwdLwjrL1iXC4A89jE4XxrK0gdNca3GGijCswZViwla5n22V8pGXCT0d/VV1QXkkW/be
	XfBxAy0GD6FGmTR9RpLV7aEyFP1UJ4LYyUtpixwGh+/YhGBhe/SphsfJBakGFB3BzoqJ
	grJw==
X-Received: by 10.194.85.106 with SMTP id g10mr6401419wjz.39.1421336481752;
	Thu, 15 Jan 2015 07:41:21 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo12sm23210166wic.19.2015.01.15.07.41.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 07:41:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Jan 2015 16:41:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150115154126.GC2482@jama>
References: <1421117802-4702-1-git-send-email-jianchuan.wang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421117802-4702-1-git-send-email-jianchuan.wang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] ipvsadm: Add version 1.26 (initial recipe)
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
X-List-Received-Date: Thu, 15 Jan 2015 15:41:24 -0000
X-Groupsio-MsgNum: 53844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qbvjkv9qwOGw/5Fx"
Content-Disposition: inline

--Qbvjkv9qwOGw/5Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 10:56:42AM +0800, jianchuan.wang@windriver.com wrot=
e:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>=20
> * add ipvs administration tool
>=20
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>  ...001-Modify-the-Makefile-for-cross-compile.patch | 91 ++++++++++++++++=
++++++
>  .../files/0002-Replace-nl_handle-to-nl_sock.patch  | 63 +++++++++++++++
>  .../recipes-support/ipvsadm/ipvsadm_1.26.bb        | 36 +++++++++
>  3 files changed, 190 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipvsadm/files/0001-Mo=
dify-the-Makefile-for-cross-compile.patch
>  create mode 100644 meta-networking/recipes-support/ipvsadm/files/0002-Re=
place-nl_handle-to-nl_sock.patch
>  create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.=
bb
>=20
> diff --git a/meta-networking/recipes-support/ipvsadm/files/0001-Modify-th=
e-Makefile-for-cross-compile.patch b/meta-networking/recipes-support/ipvsad=
m/files/0001-Modify-the-Makefile-for-cross-compile.patch
> new file mode 100644
> index 0000000..27358b9
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/files/0001-Modify-the-Makef=
ile-for-cross-compile.patch
> @@ -0,0 +1,91 @@
> +From c2b9c96109c074851a8fd5ee249a4e68697282ce Mon Sep 17 00:00:00 2001
> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
> +Date: Mon, 12 Jan 2015 15:53:23 +0800
> +Subject: [PATCH 1/2] Modify the Makefile for cross compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> +---
> + Makefile         | 21 +++++----------------
> + libipvs/Makefile |  3 +--
> + 2 files changed, 6 insertions(+), 18 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index e4e03cc..ea44c1d 100644
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
> +@@ -96,8 +85,8 @@ all:            libs ipvsadm
> + libs:
> + 		make -C libipvs
> +=20
> +-ipvsadm:	$(OBJS) $(STATIC_LIBS)
> +-		$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> ++ipvsadm:	$(OBJS)=20
> ++		$(CC) $(CFLAGS) -o $@ $^ $(STATIC_LIBS) $(LIBS)
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
> +1.8.3.1
> +
> diff --git a/meta-networking/recipes-support/ipvsadm/files/0002-Replace-n=
l_handle-to-nl_sock.patch b/meta-networking/recipes-support/ipvsadm/files/0=
002-Replace-nl_handle-to-nl_sock.patch
> new file mode 100644
> index 0000000..7896d6d
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/files/0002-Replace-nl_handl=
e-to-nl_sock.patch
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
> index 0000000..88f619a
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.26.bb
> @@ -0,0 +1,36 @@
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
> +SRC_URI =3D "http://www.linuxvirtualserver.org/software/kernel-2.6/ipvsa=
dm-1.26.tar.gz \

ipvsadm-1.26 -> ${BP}

> +        file://0001-Modify-the-Makefile-for-cross-compile.patch \
> +        file://0002-Replace-nl_handle-to-nl_sock.patch \
> +        "

" should be first character

> +
> +SRC_URI[md5sum] =3D "eac3ba3f62cd4dea2da353aeddd353a8"
> +SRC_URI[sha256sum] =3D "6d6c46fecb1c532a892616b4445c73b71730e8790d5630f6=
0269fd9cbee0eb2d"
> +
> +S=3D"${WORKDIR}/${BPN}-${PV}"

This is default, drop it.
> +
> +do_compile() {=20
> +    oe_runmake \
> +    CC=3D"${CC} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -L${STAGI=
NG_LIBDIR}" \
> +    all =20
> +}
> +
> +do_install() {
> +    oe_runmake 'BUILD_ROOT=3D${D}' install
> +}
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qbvjkv9qwOGw/5Fx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS336YACgkQN1Ujt2V2gBxPSwCfcwRK+DTvrqJDlX1+xo6AzsdT
3DwAoIa2I5hZWN2QUZIZBA3ie2Gf9efP
=R6Nv
-----END PGP SIGNATURE-----

--Qbvjkv9qwOGw/5Fx--

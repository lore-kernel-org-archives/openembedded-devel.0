Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF1F65CBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 09:55:40 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n186so76814458wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 01:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3M7zXp8bDTp3dsKKiAADOxjKF5yyqoKiWiTmhHYYMZ0=;
	b=sNjTpL3440gisALwaShlkufvYCpJDtb4HBQrSJuY2mHQyJb7u06y/JauZedbcjbt5L
	5r3VfcZq1f6J03tFHl+5f9nKtdZNhv+rjY+rAaO0Rpmr++b9wqjWVDukU4h4N/p3xjae
	eT+jAGHNGLJ7Ht51vcwn94g9Dja8hxpxeZ98Yn8dH18zhqoau6pP4szmiEp5x2tw1xlW
	5/Ss/OY6fNBGiSigJh0RfVqejNplXVt8Zf1+LqijlbFPVkXvd7Kw1vOEWpiTprYxG0ge
	iZbMHGkRGVUq15uohIaYub6Yc5mjmg3te7ZrXvAz8+0gAJLsQCqeFTW/WLAsYE7LdCug
	xRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3M7zXp8bDTp3dsKKiAADOxjKF5yyqoKiWiTmhHYYMZ0=;
	b=SS1zjLkHRXEmHOFD/6DvUDkxQMSiws1jila2abo5nxWHZ03aqrKWrQthY6je8rQxWr
	0YuGYG0j2KLm3Yeb9mdtfwQLaXl8t7J/73SPIb0KphR0NW4Mz3F57+BkxHJ2EoKew0Z0
	popD3kG1dinAAnSX37QXhlAXb1qh2Je9ShEon1LDjjbEi2kRcsjlE3eleArKijOzFCHo
	te/GqybNXL8lemcOgl85g+/pzf++XKk8wHdK3Y0Oq06oaqY6jV01kiWsl62Tvd1sy29m
	b+0IcYSfYr96ubCJqKL3oh8FrHMtLNN7UUHZaznBHt0aMnBW6M/YDgPH7N3uidUfiEGX
	J9vw==
X-Gm-Message-State: AD7BkJJcWhEXQX2VIjH0WGX4kNO8k8SWlpnVz4+tW16IBg52FdJM2nVPZ24AvQqeAhOTEg==
X-Received: by 10.194.250.103 with SMTP id zb7mr27994799wjc.65.1456912540889; 
	Wed, 02 Mar 2016 01:55:40 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 63sm3373386wms.1.2016.03.02.01.55.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 01:55:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 10:57:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160302095738.GB2567@jama>
References: <1456821670-4331-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1456821670-4331-1-git-send-email-li.zhou@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-selinux][PATCH] net-tools: Add SCTP option support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Mar 2016 09:55:41 -0000
X-Groupsio-MsgNum: 60290
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 04:41:10PM +0800, Li Zhou wrote:
> Patch netstat-selinux-support.patch's context is changed becasue of the
> commit in oe-core which adds SCTP support for net-tools. So rebase it.

Wrong ML

>=20
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  .../net-tools/netstat-selinux-support.patch        |   61 ++++++++++----=
------
>  1 file changed, 32 insertions(+), 29 deletions(-)
>=20
> diff --git a/recipes-extended/net-tools/net-tools/netstat-selinux-support=
=2Epatch b/recipes-extended/net-tools/net-tools/netstat-selinux-support.pat=
ch
> index 2a97216..4b023d9 100644
> --- a/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch
> +++ b/recipes-extended/net-tools/net-tools/netstat-selinux-support.patch
> @@ -1,17 +1,20 @@
> -From: Xin Ouyang <Xin.Ouyang@windriver.com>
> -Date: Wed, 13 Jun 2012 13:32:01 +0800
> +From 759be4a417a6720eff482bc0a20635529d44b8a9 Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Fri, 15 Jan 2016 17:31:18 +0800
>  Subject: [PATCH] net-tools: netstat add SELinux support.
> =20
>  Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> +[Rebase the patch for  LIN6-10717's commit]
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
>  ---
> - Makefile  |    9 +++++++-
> - netstat.c |   69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++--
> + Makefile  |  9 ++++++++-
> + netstat.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++---
>   2 files changed, 74 insertions(+), 4 deletions(-)
> =20
>  diff --git a/Makefile b/Makefile
> -index 8fcc55c..dca8fbc 100644
> +index 8fcc55c..0b5c395 100644
>  --- a/Makefile
>  +++ b/Makefile
>  @@ -116,6 +116,13 @@ NET_LIB =3D $(NET_LIB_PATH)/lib$(NET_LIB_NAME).a
> @@ -38,12 +41,12 @@ index 8fcc55c..dca8fbc 100644
>   iptunnel:	$(NET_LIB) iptunnel.o
>   		$(CC) $(LDFLAGS) -o iptunnel iptunnel.o $(NLIB) $(RESLIB)
>  diff --git a/netstat.c b/netstat.c
> -index c3a7bb1..71be41f 100644
> +index 387217c..1c19672 100644
>  --- a/netstat.c
>  +++ b/netstat.c
> -@@ -86,6 +86,12 @@
> - #include <net/if.h>
> - #include <dirent.h>
> +@@ -89,6 +89,12 @@
> + #include <sys/stat.h>
> + #include <sys/types.h>
>  =20
>  +#if HAVE_SELINUX
>  +#include <selinux/selinux.h>
> @@ -54,7 +57,7 @@ index c3a7bb1..71be41f 100644
>   #include "net-support.h"
>   #include "pathnames.h"
>   #include "version.h"
> -@@ -97,6 +103,7 @@
> +@@ -100,6 +106,7 @@
>   #include "proc.h"
>  =20
>   #define PROGNAME_WIDTH 20
> @@ -62,7 +65,7 @@ index c3a7bb1..71be41f 100644
>  =20
>   #if !defined(s6_addr32) && defined(in6a_words)
>   #define s6_addr32 in6a_words	/* libinet6			*/
> -@@ -153,6 +160,7 @@ int flag_wide=3D 0;
> +@@ -179,6 +186,7 @@ int flag_wide=3D 0;
>   int flag_prg =3D 0;
>   int flag_arg =3D 0;
>   int flag_ver =3D 0;
> @@ -70,7 +73,7 @@ index c3a7bb1..71be41f 100644
>  =20
>   FILE *procinfo;
>  =20
> -@@ -216,12 +224,17 @@ FILE *procinfo;
> +@@ -242,12 +250,17 @@ FILE *procinfo;
>   #define PROGNAME_WIDTH1(s) PROGNAME_WIDTH2(s)
>   #define PROGNAME_WIDTH2(s) #s
>  =20
> @@ -88,7 +91,7 @@ index c3a7bb1..71be41f 100644
>   } *prg_hash[PRG_HASH_SIZE];
>  =20
>   static char prg_cache_loaded =3D 0;
> -@@ -229,9 +242,12 @@ static char prg_cache_loaded =3D 0;
> +@@ -255,9 +268,12 @@ static char prg_cache_loaded =3D 0;
>   #define PRG_HASHIT(x) ((x) % PRG_HASH_SIZE)
>  =20
>   #define PROGNAME_BANNER "PID/Program name"
> @@ -101,7 +104,7 @@ index c3a7bb1..71be41f 100644
>   #define PRG_LOCAL_ADDRESS "local_address"
>   #define PRG_INODE	 "inode"
>   #define PRG_SOCKET_PFX    "socket:["
> -@@ -253,7 +269,7 @@ static char prg_cache_loaded =3D 0;
> +@@ -279,7 +295,7 @@ static char prg_cache_loaded =3D 0;
>   /* NOT working as of glibc-2.0.7: */
>   #undef  DIRENT_HAVE_D_TYPE_WORKS
>  =20
> @@ -110,7 +113,7 @@ index c3a7bb1..71be41f 100644
>   {
>       unsigned hi =3D PRG_HASHIT(inode);
>       struct prg_node **pnp,*pn;
> -@@ -274,6 +290,14 @@ static void prg_cache_add(unsigned long inode, char=
 *name)
> +@@ -300,6 +316,14 @@ static void prg_cache_add(unsigned long inode, char=
 *name)
>       if (strlen(name)>sizeof(pn->name)-1)=20
>   	name[sizeof(pn->name)-1]=3D'\0';
>       strcpy(pn->name,name);
> @@ -125,7 +128,7 @@ index c3a7bb1..71be41f 100644
>   }
>  =20
>   static const char *prg_cache_get(unsigned long inode)
> -@@ -286,6 +310,16 @@ static const char *prg_cache_get(unsigned long inod=
e)
> +@@ -312,6 +336,16 @@ static const char *prg_cache_get(unsigned long inod=
e)
>       return("-");
>   }
>  =20
> @@ -142,7 +145,7 @@ index c3a7bb1..71be41f 100644
>   static void prg_cache_clear(void)
>   {
>       struct prg_node **pnp,*pn;
> -@@ -357,6 +391,7 @@ static void prg_cache_load(void)
> +@@ -383,6 +417,7 @@ static void prg_cache_load(void)
>       const char *cs,*cmdlp;
>       DIR *dirproc=3DNULL,*dirfd=3DNULL;
>       struct dirent *direproc,*direfd;
> @@ -150,7 +153,7 @@ index c3a7bb1..71be41f 100644
>  =20
>       if (prg_cache_loaded || !flag_prg) return;
>       prg_cache_loaded=3D1;
> -@@ -426,7 +461,15 @@ static void prg_cache_load(void)
> +@@ -452,7 +487,15 @@ static void prg_cache_load(void)
>   	    }
>  =20
>   	    snprintf(finbuf, sizeof(finbuf), "%s/%s", direproc->d_name, cmdlp);
> @@ -167,7 +170,7 @@ index c3a7bb1..71be41f 100644
>   	}
>   	closedir(dirfd);=20
>   	dirfd =3D NULL;
> -@@ -546,6 +589,8 @@ static void finish_this_one(int uid, unsigned long i=
node, const char *timers)
> +@@ -572,6 +615,8 @@ static void finish_this_one(int uid, unsigned long i=
node, const char *timers)
>       }
>       if (flag_prg)
>   	printf(" %-16s",prg_cache_get(inode));
> @@ -176,7 +179,7 @@ index c3a7bb1..71be41f 100644
>       if (flag_opt)
>   	printf(" %s", timers);
>       putchar('\n');
> -@@ -1238,6 +1283,8 @@ static void unix_do_one(int nr, const char *line)
> +@@ -1557,6 +1602,8 @@ static void unix_do_one(int nr, const char *line)
>   	printf("-        ");
>       if (flag_prg)
>   	printf("%-" PROGNAME_WIDTHs "s",(has & HAS_INODE?prg_cache_get(inode):=
"-"));
> @@ -185,7 +188,7 @@ index c3a7bb1..71be41f 100644
>       puts(path);
>   }
>  =20
> -@@ -1256,6 +1303,7 @@ static int unix_info(void)
> +@@ -1575,6 +1622,7 @@ static int unix_info(void)
>  =20
>       printf(_("\nProto RefCnt Flags       Type       State         I-Nod=
e  "));
>       print_progname_banner();
> @@ -193,15 +196,15 @@ index c3a7bb1..71be41f 100644
>       printf(_(" Path\n"));	/* xxx */
>  =20
>       {
> -@@ -1546,6 +1594,7 @@ static void usage(void)
> +@@ -1865,6 +1913,7 @@ static void usage(void)
>       fprintf(stderr, _("        -o, --timers             display timers\=
n"));
>       fprintf(stderr, _("        -F, --fib                display Forward=
ing Information Base (default)\n"));
>       fprintf(stderr, _("        -C, --cache              display routing=
 cache instead of FIB\n\n"));
>  +    fprintf(stderr, _("        -Z, --context            display SELinux=
 security context for sockets\n\n"));
>  =20
> -     fprintf(stderr, _("  <Socket>=3D{-t|--tcp} {-u|--udp} {-w|--raw} {-=
x|--unix} --ax25 --ipx --netrom\n"));
> +     fprintf(stderr, _("  <Socket>=3D{-t|--tcp} {-u|--udp} {-S|--sctp} {=
-w|--raw} {-x|--unix} --ax25 --ipx --netrom\n"));
>       fprintf(stderr, _("  <AF>=3DUse '-6|-4' or '-A <af>' or '--<af>'; d=
efault: %s\n"), DFLT_AF);
> -@@ -1591,6 +1640,7 @@ int main
> +@@ -1911,6 +1960,7 @@ int main
>   	{"cache", 0, 0, 'C'},
>   	{"fib", 0, 0, 'F'},
>   	{"groups", 0, 0, 'g'},
> @@ -209,16 +212,16 @@ index c3a7bb1..71be41f 100644
>   	{NULL, 0, 0, 0}
>       };
>  =20
> -@@ -1602,7 +1652,7 @@ int main
> +@@ -1922,7 +1972,7 @@ int main
>       getroute_init();		/* Set up AF routing support */
>  =20
>       afname[0] =3D '\0';
> --    while ((i =3D getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxl6=
4", longopts, &lop)) !=3D EOF)
> -+    while ((i =3D getopt_long(argc, argv, "MCFA:acdegphinNorstuWVv?wxlZ=
64", longopts, &lop)) !=3D EOF)
> +-    while ((i =3D getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxl=
64", longopts, &lop)) !=3D EOF)
> ++    while ((i =3D getopt_long(argc, argv, "MCFA:acdegphinNorstuSWVv?wxl=
Z64", longopts, &lop)) !=3D EOF)
>   	switch (i) {
>   	case -1:
>   	    break;
> -@@ -1705,6 +1755,19 @@ int main
> +@@ -2027,6 +2077,19 @@ int main
>   	    if (aftrans_opt("unix"))
>   		exit(1);
>   	    break;
> @@ -239,5 +242,5 @@ index c3a7bb1..71be41f 100644
>   	case 'h':
>   	    usage();
>  --=20
> -1.7.5.4
> +1.8.5.2.233.g932f7e4
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbWuREACgkQN1Ujt2V2gBxFqwCgu0vlXCxXF4CT22RDvswCIOjj
p4sAoKFacyLCDpbbEIjZBGMq3OnSc/QB
=QRdW
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--

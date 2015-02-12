Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAEA73341
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 03:21:36 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1YLkLS-0004TO-A5 from Joe_MacDonald@mentor.com ;
	Wed, 11 Feb 2015 19:21:38 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 19:21:37 -0800
Received: by burninator (Postfix, from userid 1000)	id 30320581332; Wed, 11
	Feb 2015 22:21:37 -0500 (EST)
Date: Wed, 11 Feb 2015 22:21:37 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Message-ID: <20150212032136.GM30457@mentor.com>
References: <20150126155022.GH4791@mentor.com>
	<1422438692-1879-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1422438692-1879-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v3] netkit-telnet: add new recipe
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
X-List-Received-Date: Thu, 12 Feb 2015 03:21:44 -0000
X-Groupsio-MsgNum: 54199
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cs5saTBZh7UZl2eX"
Content-Disposition: inline

--cs5saTBZh7UZl2eX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Xin,

I merged this but relocated it into the recipes-netkit hierarchy.

Thanks,
-J.

[[oe] [meta-networking][PATCH v3] netkit-telnet: add new recipe] On 15.01.2=
8 (Wed 17:51) Li xin wrote:

> netkit-telnet includes the telnetd and client.
> telnetd: daemon for telnet protocol.
> telnet: client for telnet protocol.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../files/To-aviod-buffer-overflow-in-telnet.patch | 1217 ++++++++++++++=
++++++
>  .../files/Warning-fix-in-the-step-of-install.patch |   41 +
>  .../netkit-telnet/files/telnet-xinetd              |   14 +
>  .../netkit-telnet/netkit-telnet_0.17.bb            |   52 +
>  4 files changed, 1324 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/netkit-telnet/files/T=
o-aviod-buffer-overflow-in-telnet.patch
>  create mode 100644 meta-networking/recipes-daemons/netkit-telnet/files/W=
arning-fix-in-the-step-of-install.patch
>  create mode 100644 meta-networking/recipes-daemons/netkit-telnet/files/t=
elnet-xinetd
>  create mode 100644 meta-networking/recipes-daemons/netkit-telnet/netkit-=
telnet_0.17.bb
>=20
> diff --git a/meta-networking/recipes-daemons/netkit-telnet/files/To-aviod=
-buffer-overflow-in-telnet.patch b/meta-networking/recipes-daemons/netkit-t=
elnet/files/To-aviod-buffer-overflow-in-telnet.patch
> new file mode 100644
> index 0000000..7fff8cf
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/netkit-telnet/files/To-aviod-buffer=
-overflow-in-telnet.patch
> @@ -0,0 +1,1217 @@
> +From f09a6460a62aacb87bb8683d16aa3ce55848bf7e Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 28 Nov 2014 07:06:24 +0900
> +Subject: [PATCH 1/2] To aviod buffer overflow in telnet
> +
> +This patch is from Fedora.
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + telnet/Makefile     |   4 +-
> + telnet/commands.cc  | 270 +++++++++++++++++++++++++++++++++++----------=
-------
> + telnet/defines.h    |   2 +
> + telnet/externs.h    |   7 +-
> + telnet/main.cc      |  65 ++++++++++---
> + telnet/netlink.cc   |  78 +++++++++------
> + telnet/netlink.h    |   7 +-
> + telnet/network.cc   |   1 +
> + telnet/proto.h      |   2 +-
> + telnet/ring.cc      |   2 +-
> + telnet/ring.h       |   2 +-
> + telnet/sys_bsd.cc   |  11 +++
> + telnet/telnet.1     |  37 +++++--
> + telnet/telnet.cc    |  45 +++++----
> + telnet/terminal.cc  |  17 +++-
> + telnet/utilities.cc |   2 +
> + 16 files changed, 380 insertions(+), 172 deletions(-)
> +
> +diff --git a/telnet/Makefile b/telnet/Makefile
> +index cef866f..39249e1 100644
> +--- a/telnet/Makefile
> ++++ b/telnet/Makefile
> +@@ -7,7 +7,7 @@ include ../MRULES
> +=20
> + # -DAUTHENTICATE
> + CXXFLAGS +=3D -DUSE_TERMIO -DKLUDGELINEMODE
> +-LIBS +=3D $(LIBTERMCAP)
> ++LIBS =3D $(LIBTERMCAP)
> +=20
> + SRCS =3D commands.cc main.cc network.cc ring.cc sys_bsd.cc telnet.cc \
> + 	terminal.cc tn3270.cc utilities.cc genget.cc environ.cc netlink.cc
> +@@ -22,7 +22,7 @@ depend:
> + 	$(CXX) $(CXXFLAGS) -MM $(SRCS) >depend.mk
> +=20
> + install: telnet
> +-	install -s -m$(BINMODE) telnet $(INSTALLROOT)$(BINDIR)
> ++	install -m$(BINMODE) telnet $(INSTALLROOT)$(BINDIR)
> + 	install -m$(MANMODE) telnet.1 $(INSTALLROOT)$(MANDIR)/man1
> +=20
> + clean:
> +diff --git a/telnet/commands.cc b/telnet/commands.cc
> +index d92bccd..02c593e 100644
> +--- a/telnet/commands.cc
> ++++ b/telnet/commands.cc
> +@@ -86,10 +86,6 @@ char cmd_rcsid[] =3D
> +=20
> + #define HELPINDENT ((int) sizeof ("connect"))
> +=20
> +-#ifndef       MAXHOSTNAMELEN
> +-#define       MAXHOSTNAMELEN 64
> +-#endif        MAXHOSTNAMELEN
> +-
> + #if	defined(HAS_IPPROTO_IP) && defined(IP_TOS)
> + int tos =3D -1;
> + #endif	/* defined(HAS_IPPROTO_IP) && defined(IP_TOS) */
> +@@ -98,7 +94,7 @@ static unsigned long sourceroute(char *arg, char **cpp=
, int *lenp);
> +=20
> +=20
> + char	*hostname;
> +-static char _hostname[MAXHOSTNAMELEN];
> ++static char *_hostname;
> +=20
> + //typedef int (*intrtn_t)(int argc, const char *argv[]);
> +=20
> +@@ -161,7 +157,7 @@ class command_entry {
> + 	assert(argc>=3D1);
> + 	if (nargs>=3D0 && argc!=3Dnargs+1) {
> + 	    fprintf(stderr, "Wrong number of arguments for command.\n");
> +-	    fprintf(stderr, "Try %s ? for help\n", argv[0]);
> ++	    fprintf(stderr, "Try ? %s for help\n", argv[0]);
> + 	    return 0;    /* is this right? */
> + 	}
> + 	if (nargs=3D=3D-2) {
> +@@ -480,6 +476,7 @@ static int send_wontcmd(const char *name, const char=
 *) {
> + int send_tncmd(int (*func)(int, int), const char *cmd, const char *name=
) {
> +     char **cpp;
> +     extern char *telopts[];
> ++    long opt;
> +=20
> +     if (isprefix(name, "help") || isprefix(name, "?")) {
> + 	register int col, len;
> +@@ -506,16 +503,23 @@ int send_tncmd(int (*func)(int, int), const char *=
cmd, const char *name) {
> + 					name, cmd);
> + 	return 0;
> +     }
> ++
> ++    opt =3D cpp - telopts;
> +     if (cpp =3D=3D 0) {
> +-	fprintf(stderr, "'%s': unknown argument ('send %s ?' for help).\n",
> ++	char *end;
> ++
> ++	opt =3D strtol(name, &end, 10);
> ++	if (*end || opt < 0 || opt > 255) {
> ++	    fprintf(stderr, "'%s': unknown argument ('send %s ?' for help).\n",
> + 					name, cmd);
> +-	return 0;
> ++	    return 0;
> ++	}
> +     }
> +     if (!connected) {
> + 	printf("?Need to be connected first.\n");
> + 	return 0;
> +     }
> +-    (*func)(cpp - telopts, 1);
> ++    (*func)(opt, 1);
> +     return 1;
> + }
> +=20
> +@@ -689,9 +693,9 @@ static struct togglelist Togglelist[] =3D {
> +       "print encryption debugging information" },
> + #endif
> +=20
> +-    { "skiprc", "don't read ~/.telnetrc file",
> ++    { "skiprc", "don't read the telnetrc files",
> +       NULL, &skiprc,
> +-      "read ~/.telnetrc file" },
> ++      "read the telnetrc files" },
> +     { "binary",
> +       "sending and receiving of binary data",
> +       togbinary, NULL,
> +@@ -1615,15 +1619,20 @@ void ayt_status(int) {
> + #endif
> +=20
> + int tn(int argc, const char *argv[]) {
> +-    register struct hostent *host =3D 0;
> +     struct sockaddr_in sn;
> +-    struct servent *sp =3D 0;
> +     char *srp =3D NULL;
> +     int srlen;
> +-
> +-    const char *cmd, *volatile user =3D 0;
> ++    int family =3D 0;
> ++    const char *cmd, *volatile user =3D 0, *srchostp =3D 0;
> +     const char *portp =3D NULL;
> +     char *hostp =3D NULL;
> ++    char *resolv_hostp;
> ++    struct addrinfo hints;
> ++    struct addrinfo *hostaddr =3D 0;
> ++    int res;
> ++    char name[NI_MAXHOST];
> ++    char service[NI_MAXSERV];
> ++    struct addrinfo *tmpaddr;
> +=20
> +     /* clear the socket address prior to use */
> +     memset(&sn, 0, sizeof(sn));
> +@@ -1632,6 +1641,10 @@ int tn(int argc, const char *argv[]) {
> + 	printf("?Already connected to %s\n", hostname);
> + 	return 0;
> +     }
> ++    if (_hostname) {
> ++	delete[] _hostname;
> ++	_hostname =3D 0;
> ++    }
> +     if (argc < 2) {
> + 	(void) strcpy(line, "open ");
> + 	printf("(to) ");
> +@@ -1657,11 +1670,33 @@ int tn(int argc, const char *argv[]) {
> + 	    --argc;
> + 	    continue;
> + 	}
> ++	if (strcmp(*argv, "-b") =3D=3D 0) {
> ++	    --argc; ++argv;
> ++	    if (argc =3D=3D 0)
> ++		goto usage;
> ++	    srchostp =3D *argv++;
> ++	    --argc;
> ++	    continue;
> ++	}
> + 	if (strcmp(*argv, "-a") =3D=3D 0) {
> + 	    --argc; ++argv;
> + 	    autologin =3D 1;
> + 	    continue;
> + 	}
> ++	if (strcmp(*argv, "-6") =3D=3D 0) {
> ++	    --argc; ++argv;
> ++#ifdef AF_INET6
> ++	    family =3D AF_INET6;
> ++#else
> ++	    puts("IPv6 unsupported");
> ++#endif
> ++	    continue;
> ++	}
> ++	if (strcmp(*argv, "-4") =3D=3D 0) {
> ++	    --argc; ++argv;
> ++	    family =3D AF_INET;
> ++	    continue;
> ++	}
> + 	if (hostp =3D=3D 0) {
> + 	    /* this leaks memory - FIXME */
> + 	    hostp =3D strdup(*argv++);
> +@@ -1680,6 +1715,8 @@ int tn(int argc, const char *argv[]) {
> +     if (hostp =3D=3D 0)
> + 	goto usage;
> +=20
> ++    resolv_hostp =3D hostp;
> ++
> + #if defined(IP_OPTIONS) && defined(HAS_IPPROTO_IP)
> +     if (hostp[0] =3D=3D '@' || hostp[0] =3D=3D '!') {
> + 	if ((hostname =3D strrchr(hostp, ':')) =3D=3D NULL)
> +@@ -1696,78 +1733,122 @@ int tn(int argc, const char *argv[]) {
> + 	} else {
> + 	    sn.sin_addr.s_addr =3D temp;
> + 	    sn.sin_family =3D AF_INET;
> ++	    /*
> ++	     * For source route we just make sure to get the IP given
> ++	     * on the command line when looking up the port.
> ++	     */
> ++	    resolv_hostp =3D inet_ntoa(sn.sin_addr);
> + 	}
> +     }=20
> +-    else {
> +-#endif
> +-	if (inet_aton(hostp, &sn.sin_addr)) {
> +-	    sn.sin_family =3D AF_INET;
> +-	    strcpy(_hostname, hostp);
> +-	    hostname =3D _hostname;
> +-	}=20
> +-	else {
> +-	    host =3D gethostbyname(hostp);
> +-	    if (host) {
> +-		sn.sin_family =3D host->h_addrtype;
> +-		if (host->h_length > (int)sizeof(sn.sin_addr)) {
> +-		    host->h_length =3D sizeof(sn.sin_addr);
> +-		}
> +-#if	defined(h_addr)		/* In 4.3, this is a #define */
> +-		memcpy((caddr_t)&sn.sin_addr,
> +-				host->h_addr_list[0], host->h_length);
> +-#else	/* defined(h_addr) */
> +-		memcpy((caddr_t)&sn.sin_addr, host->h_addr, host->h_length);
> +-#endif	/* defined(h_addr) */
> +-		strncpy(_hostname, host->h_name, sizeof(_hostname));
> +-		_hostname[sizeof(_hostname)-1] =3D '\0';
> +-		hostname =3D _hostname;
> +-	    } else {
> +-		herror(hostp);
> +-		return 0;
> +-	    }
> +-	}
> +-#if defined(IP_OPTIONS) && defined(HAS_IPPROTO_IP)
> +-    }
> + #endif
> ++
> ++    /* User port or the default name of telnet. */
> +     if (portp) {
> + 	if (*portp =3D=3D '-') {
> + 	    portp++;
> + 	    telnetport =3D 1;
> +-	} else
> ++	} else {
> + 	    telnetport =3D 0;
> +-	sn.sin_port =3D atoi(portp);
> +-	if (sn.sin_port =3D=3D 0) {
> +-	    sp =3D getservbyname(portp, "tcp");
> +-	    if (sp)
> +-		sn.sin_port =3D sp->s_port;
> +-	    else {
> +-		printf("%s: bad port number\n", portp);
> +-		return 0;
> ++	    if (*portp >=3D'0' && *portp<=3D'9') {
> ++	       char *end;
> ++	       long int p;
> ++
> ++	       p=3Dstrtol(portp, &end, 10);
> ++	       if (ERANGE=3D=3Derrno && (LONG_MIN=3D=3Dp || LONG_MAX=3D=3Dp)) {
> ++	          fprintf(stderr, "telnet: port %s overflows\n", portp);
> ++		  return 0;
> ++	       } else if (p<=3D0 || p>=3D65536) {
> ++	          fprintf(stderr, "telnet: port %s out of range\n", portp);
> ++		  return 0;
> ++	       }
> + 	    }
> +-	}=20
> +-	else {
> +-	    sn.sin_port =3D htons(sn.sin_port);
> + 	}
> +-    }=20
> ++    }
> +     else {
> +-	if (sp =3D=3D 0) {
> +-	    sp =3D getservbyname("telnet", "tcp");
> +-	    if (sp =3D=3D 0) {
> +-		fprintf(stderr, "telnet: tcp/telnet: unknown service\n");
> +-		return 0;
> +-	    }
> +-	    sn.sin_port =3D sp->s_port;
> +-	}
> ++	portp =3D "telnet";
> + 	telnetport =3D 1;
> +     }
> +-    printf("Trying %s...\n", inet_ntoa(sn.sin_addr));
> ++
> ++    /* We only understand SOCK_STREAM sockets. */
> ++    memset(&hints, 0, sizeof(hints));
> ++    hints.ai_socktype =3D SOCK_STREAM;
> ++    hints.ai_flags =3D AI_NUMERICHOST;
> ++    hints.ai_family =3D family;
> ++
> ++    if (srchostp) {
> ++	res =3D getaddrinfo(srchostp, "0", &hints, &hostaddr);
> ++	if (res) {
> ++	    fprintf(stderr, "telnet: could not resolve %s: %s\n", srchostp,
> ++		    gai_strerror(res));
> ++	    return 0;
> ++	}
> ++	hints.ai_family =3D hostaddr->ai_family;
> ++	res =3D nlink.bind(hostaddr);
> ++	freeaddrinfo(hostaddr);
> ++	if (res < 0)
> ++	    return 0;
> ++    }
> ++       =20
> ++    /* Resolve both the host and service simultaneously. */
> ++    res =3D getaddrinfo(resolv_hostp, portp, &hints, &hostaddr);
> ++    if (res =3D=3D EAI_NONAME) {
> ++	hints.ai_flags =3D AI_CANONNAME;
> ++	res =3D getaddrinfo(resolv_hostp, portp, &hints, &hostaddr);
> ++    } else if (hostaddr) {
> ++	hostaddr->ai_canonname =3D 0;
> ++    }
> ++    if (res || !hostaddr) {
> ++	fprintf(stderr, "telnet: could not resolve %s/%s: %s\n", resolv_hostp,=
 portp, gai_strerror(res));
> ++	return 0;
> ++    }
> ++    =20
> ++    /* Try to connect to every listed round robin IP. */
> ++    tmpaddr =3D hostaddr;
> ++    errno =3D 0;
> +     do {
> +-	int x =3D nlink.connect(debug, host, &sn, srp, srlen, tos);
> +-	if (!x) return 0;
> +-	else if (x=3D=3D1) continue;
> ++	int x;
> ++
> ++	if (!tmpaddr) {
> ++	    if (errno)
> ++		perror("telnet: Unable to connect to remote host");
> ++	    else
> ++		fputs("telnet: Unable to connect to remote host: "
> ++		      "Bad port number\n", stderr);
> ++err:
> ++	    freeaddrinfo(hostaddr);
> ++	    return 0;
> ++	}
> ++
> ++	if (tmpaddr->ai_family =3D=3D AF_UNIX) {
> ++nextaddr:
> ++	    tmpaddr =3D tmpaddr->ai_next;
> ++	    continue;
> ++	}
> ++
> ++	getnameinfo(tmpaddr->ai_addr, tmpaddr->ai_addrlen,
> ++		    name, sizeof(name), service, sizeof(service),
> ++		    NI_NUMERICHOST | NI_NUMERICSERV);
> ++
> ++	printf("Trying %s...\n", name);
> ++	x =3D nlink.connect(debug, tmpaddr, srp, srlen, tos);
> ++	if (!x)
> ++	    goto err;
> ++	else if (x=3D=3D1)
> ++	    goto nextaddr;
> ++
> + 	connected++;
> +     } while (connected =3D=3D 0);
> +-    cmdrc(hostp, hostname);
> ++    if (tmpaddr->ai_canonname =3D=3D 0) {
> ++	hostname =3D new char[strlen(hostp)+1];
> ++	strcpy(hostname, hostp);
> ++    }
> ++    else {
> ++	hostname =3D new char[strlen(tmpaddr->ai_canonname)+1];
> ++	strcpy(hostname, tmpaddr->ai_canonname);
> ++    }
> ++
> ++    cmdrc(hostp, hostname, portp);
> ++    freeaddrinfo(hostaddr);
> +     if (autologin && user =3D=3D NULL) {
> + 	struct passwd *pw;
> +=20
> +@@ -2013,30 +2094,21 @@ static int help(command_table *tab, int argc, co=
nst char *argv[]) {
> +     return 0;
> + }
> +=20
> +-static char *rcname =3D 0;
> +-static char rcbuf[128];
> +-
> +-void cmdrc(const char *m1, const char *m2) {
> ++static void readrc(const char *m1, const char *m2, const char *port,
> ++		   const char *rcname)
> ++{
> +     FILE *rcfile;
> +     int gotmachine =3D 0;
> +     int l1 =3D strlen(m1);
> +     int l2 =3D strlen(m2);
> +-    char m1save[64];
> +-
> +-    if (skiprc) return;
> ++    int lport =3D strlen(port);
> ++    char m1save[l1 + 1];
> ++    char portsave[lport + 1];
> +=20
> +     strcpy(m1save, m1);
> +     m1 =3D m1save;
> +-
> +-    if (rcname =3D=3D 0) {
> +-	rcname =3D getenv("HOME");
> +-	if (rcname)
> +-	    strcpy(rcbuf, rcname);
> +-	else
> +-	    rcbuf[0] =3D '\0';
> +-	strcat(rcbuf, "/.telnetrc");
> +-	rcname =3D rcbuf;
> +-    }
> ++    strcpy(portsave, port);
> ++    port =3D portsave;
> +=20
> +     rcfile =3D fopen(rcname, "r");
> +     if (!rcfile) return;
> +@@ -2061,6 +2133,13 @@ void cmdrc(const char *m1, const char *m2) {
> + 		strncpy(line, &line[7], sizeof(line) - 7);
> + 	    else
> + 		continue;
> ++
> ++	    if (line[0] =3D=3D ':') {
> ++		if (!strncasecmp(&line[1], port, lport))
> ++		    continue;
> ++		strncpy(line, &line[lport + 1], sizeof(line) - lport - 1);
> ++	    }
> ++
> + 	    if (line[0] !=3D ' ' && line[0] !=3D '\t' && line[0] !=3D '\n')
> + 		continue;
> + 	    gotmachine =3D 1;
> +@@ -2073,6 +2152,21 @@ void cmdrc(const char *m1, const char *m2) {
> +     fclose(rcfile);
> + }
> +=20
> ++void cmdrc(const char *m1, const char *m2, const char *port) {
> ++    char *rcname =3D NULL;
> ++
> ++    if (skiprc) return;
> ++
> ++    readrc(m1, m2, port, "/etc/telnetrc");
> ++    if (asprintf (&rcname, "%s/.telnetrc", getenv ("HOME")) =3D=3D -1)
> ++      {
> ++        perror ("asprintf");
> ++        return;
> ++      }
> ++    readrc(m1, m2, port, rcname);
> ++    free (rcname);
> ++}
> ++
> + #if defined(IP_OPTIONS) && defined(HAS_IPPROTO_IP)
> +=20
> + /*
> +diff --git a/telnet/defines.h b/telnet/defines.h
> +index 2784400..d5edc46 100644
> +--- a/telnet/defines.h
> ++++ b/telnet/defines.h
> +@@ -50,3 +50,5 @@
> + #define	MODE_COMMAND_LINE(m)	((m)=3D=3D-1)
> +=20
> + #define	CONTROL(x)	((x)&0x1f)		/* CTRL(x) is not portable */
> ++
> ++#define MODE_OUT8	0x8000			/* binary mode sans -opost */
> +diff --git a/telnet/externs.h b/telnet/externs.h
> +index 955df79..0730e8a 100644
> +--- a/telnet/externs.h
> ++++ b/telnet/externs.h
> +@@ -48,9 +48,7 @@
> + typedef unsigned char cc_t;
> + #endif
> +=20
> +-#ifdef __linux__
> + #include <unistd.h>   /* get _POSIX_VDISABLE */
> +-#endif
> +=20
> + #ifndef	_POSIX_VDISABLE
> + #error "Please fix externs.h to define _POSIX_VDISABLE"
> +@@ -60,7 +58,8 @@ typedef unsigned char cc_t;
> +=20
> + extern int autologin;		/* Autologin enabled */
> + extern int skiprc;		/* Don't process the ~/.telnetrc file */
> +-extern int eight;		/* use eight bit mode (binary in and/or out */
> ++extern int eight;		/* use eight bit mode (binary in and/or out) */
> ++extern int binary;		/* use binary option (in and/or out) */
> + extern int flushout;		/* flush output */
> + extern int connected;		/* Are we connected to the other side? */
> + extern int globalmode;		/* Mode tty should be in */
> +@@ -225,6 +224,8 @@ cc_t *tcval(int);
> +=20
> + //#if 0
> + extern struct termios new_tc;
> ++extern struct termios old_tc;
> ++
> +=20
> + #define termEofChar		new_tc.c_cc[VEOF]
> + #define termEraseChar		new_tc.c_cc[VERASE]
> +diff --git a/telnet/main.cc b/telnet/main.cc
> +index b67f2ce..b626e54 100644
> +--- a/telnet/main.cc
> ++++ b/telnet/main.cc
> +@@ -45,7 +45,10 @@ char main_rcsid[] =3D
> +=20
> + #include <sys/types.h>
> + #include <getopt.h>
> ++#include <stdlib.h>
> + #include <string.h>
> ++#include <netdb.h>
> ++#include <errno.h>
> +=20
> + #include "ring.h"
> + #include "externs.h"
> +@@ -80,12 +83,13 @@ tninit(void)
> + void usage(void) {
> +     fprintf(stderr, "Usage: %s %s%s%s%s\n",
> + 	    prompt,
> +-	    " [-8] [-E] [-L] [-a] [-d] [-e char] [-l user] [-n tracefile]",
> +-	    "\n\t",
> ++	    "[-4] [-6] [-8] [-E] [-L] [-a] [-d] [-e char] [-l user]",
> ++	    "\n\t[-n tracefile] [ -b addr ]",
> + #ifdef TN3270
> ++	    "\n\t"
> + 	    "[-noasynch] [-noasynctty] [-noasyncnet] [-r] [-t transcom]\n\t",
> + #else
> +-	    "[-r] ",
> ++	    " [-r] ",
> + #endif
> + 	    "[host-name [port]]"
> + 	);
> +@@ -102,7 +106,8 @@ main(int argc, char *argv[])
> + 	extern char *optarg;
> + 	extern int optind;
> + 	int ch;
> +-	char *user;
> ++	char *user, *srcaddr;
> ++	int family;
> +=20
> + 	tninit();		/* Clear out things */
> + #if	defined(CRAY) && !defined(__STDC__)
> +@@ -110,21 +115,38 @@ main(int argc, char *argv[])
> + #endif
> +=20
> + 	TerminalSaveState();
> ++	if ((old_tc.c_cflag & (CSIZE|PARENB)) !=3D CS8)
> ++		eight =3D 0;
> +=20
> + 	if ((prompt =3D strrchr(argv[0], '/'))!=3DNULL)
> + 		++prompt;
> + 	else
> + 		prompt =3D argv[0];
> +=20
> +-	user =3D NULL;
> ++	user =3D srcaddr =3D NULL;
> ++	family =3D 0;
> +=20
> + 	rlogin =3D (strncmp(prompt, "rlog", 4) =3D=3D 0) ? '~' : _POSIX_VDISAB=
LE;
> + 	autologin =3D -1;
> +=20
> +-	while ((ch =3D getopt(argc, argv, "8EKLS:X:ade:k:l:n:rt:x")) !=3D EOF)=
 {
> ++	while ((ch =3D getopt(argc, argv,
> ++			    "4678EKLS:X:ab:de:k:l:n:rt:x")) !=3D EOF) {
> + 		switch(ch) {
> ++		case '4':
> ++			family =3D AF_INET;
> ++			break;
> ++		case '6':
> ++#ifdef AF_INET6
> ++			family =3D AF_INET6;
> ++#else
> ++			fputs("IPv6 unsupported\n", stderr);
> ++#endif
> ++			break;
> ++		case '7':
> ++			eight =3D 0;	/* 7-bit ouput and input */
> ++			break;
> + 		case '8':
> +-			eight =3D 3;	/* binary output and input */
> ++			binary =3D 3;	/* binary output and input */
> + 			break;
> + 		case 'E':
> + 			rlogin =3D escapechar =3D _POSIX_VDISABLE;
> +@@ -133,23 +155,26 @@ main(int argc, char *argv[])
> + 		        //autologin =3D 0;
> + 			break;
> + 		case 'L':
> +-			eight |=3D 2;	/* binary output only */
> ++			binary |=3D 2;	/* binary output only */
> + 			break;
> + 		case 'S':
> + 		    {
> +-#ifdef	HAS_GETTOS
> + 			extern int tos;
> ++			int num;
> +=20
> +-			if ((tos =3D parsetos(optarg, "tcp")) < 0)
> ++#ifdef	HAS_GETTOS
> ++			if ((num =3D parsetos(optarg, "tcp")) < 0) {
> ++#else
> ++			errno =3D 0;
> ++			num =3D strtol(optarg, 0, 0);
> ++			if (errno) {
> ++#endif
> + 				fprintf(stderr, "%s%s%s%s\n",
> + 					prompt, ": Bad TOS argument '",
> + 					optarg,
> + 					"; will try to use default TOS");
> +-#else
> +-			fprintf(stderr,
> +-			   "%s: Warning: -S ignored, no parsetos() support.\n",
> +-								prompt);
> +-#endif
> ++			} else
> ++				tos =3D num;
> + 		    }
> + 			break;
> + 		case 'X':
> +@@ -210,6 +235,9 @@ main(int argc, char *argv[])
> + 				"%s: -x ignored, no encryption support.\n",
> + 				prompt);
> + 			break;
> ++		case 'b':
> ++			srcaddr =3D optarg;
> ++			break;
> + 		case '?':
> + 		default:
> + 			usage();
> +@@ -233,6 +261,13 @@ main(int argc, char *argv[])
> + 			*argp++ =3D "-l";
> + 			*argp++ =3D user;
> + 		}
> ++		if (srcaddr) {
> ++			*argp++ =3D "-b";
> ++			*argp++ =3D srcaddr;
> ++		}
> ++		if (family) {
> ++			*argp++ =3D family =3D=3D AF_INET ? "-4" : "-6";
> ++		}
> + 		*argp++ =3D argv[0];		/* host */
> + 		if (argc > 1)
> + 			*argp++ =3D argv[1];	/* port */
> +diff --git a/telnet/netlink.cc b/telnet/netlink.cc
> +index f439cff..f839747 100644
> +--- a/telnet/netlink.cc
> ++++ b/telnet/netlink.cc
> +@@ -79,22 +79,61 @@ void netlink::close(int doshutdown) {
> + 	shutdown(net, 2);
> +     }
> +     ::close(net);
> ++    net =3D -1;
> + }
> +=20
> +-int netlink::connect(int debug, struct hostent *host,=20
> +-		     struct sockaddr_in *sn,=20
> +-		     char *srcroute, int srlen, int tos)=20
> ++int netlink::bind(struct addrinfo *addr)
> + {
> +-    int on=3D1;
> ++    int res;
> ++
> ++    res =3D socket(addr->ai_family);
> ++    if (res < 2) {
> ++	if (res =3D=3D 1)
> ++	    perror("telnet: socket");
> ++	return -1;
> ++    }
> ++
> ++    if (::bind(net, addr->ai_addr, addr->ai_addrlen) < 0) {
> ++	perror("telnet: bind");
> ++	return -1;
> ++    }
> ++
> ++    return 0;
> ++}
> ++
> ++int netlink::socket(int family)
> ++{
> ++    if (this->family !=3D family)
> ++	close(0);
> +=20
> +-    net =3D socket(AF_INET, SOCK_STREAM, 0);
> +     if (net < 0) {
> +-	perror("telnet: socket");
> +-	return 0;
> ++	this->family =3D family;
> ++	net =3D ::socket(family, SOCK_STREAM, 0);
> ++	if (net < 0) {
> ++	    if (errno =3D=3D EAFNOSUPPORT)
> ++		return 1;
> ++	    perror("telnet: socket");
> ++	    return 0;
> ++	}
> +     }
> +=20
> ++    return 2;
> ++}
> ++
> ++int netlink::connect(int debug, struct addrinfo *addr,=20
> ++		     char *srcroute, int srlen, int tos)=20
> ++{
> ++    int on=3D1;
> ++    int res;
> ++
> ++    res =3D socket(addr->ai_family);
> ++    if (res < 2)
> ++	return res;
> ++
> + #if defined(IP_OPTIONS) && defined(HAS_IPPROTO_IP)
> +     if (srcroute) {
> ++	if (addr->ai_family !=3D AF_INET)
> ++	    fputs("Source route is only supported for IPv4\n", stderr);
> + 	if (setsockopt(net, IPPROTO_IP, IP_OPTIONS, srcroute, srlen) < 0)
> + 	    perror("setsockopt (IP_OPTIONS)");
> +     }
> +@@ -108,7 +147,7 @@ int netlink::connect(int debug, struct hostent *host,
> + #endif
> +     if (tos < 0) tos =3D 020;	/* Low Delay bit */
> +     if (tos && (setsockopt(net, IPPROTO_IP, IP_TOS, &tos, sizeof(int)) =
< 0)
> +-	&& (errno !=3D ENOPROTOOPT))
> ++	&& (errno !=3D ENOPROTOOPT) && (errno !=3D EOPNOTSUPP))
> + 	perror("telnet: setsockopt (IP_TOS) (ignored)");
> + #endif	/* defined(IPPROTO_IP) && defined(IP_TOS) */
> +=20
> +@@ -116,27 +155,8 @@ int netlink::connect(int debug, struct hostent *hos=
t,
> + 	perror("setsockopt (SO_DEBUG)");
> +     }
> +    =20
> +-    if (::connect(net, (struct sockaddr *)sn, sizeof(*sn)) < 0) {
> +-#if defined(h_addr)		/* In 4.3, this is a #define */
> +-	if (host && host->h_addr_list[1]) {
> +-	    int oerrno =3D errno;
> +-	   =20
> +-	    fprintf(stderr, "telnet: connect to address %s: ",
> +-		    inet_ntoa(sn->sin_addr));
> +-	    errno =3D oerrno;
> +-	    perror(NULL);
> +-	    host->h_addr_list++;
> +-	    if (host->h_length > (int)sizeof(sn->sin_addr)) {
> +-		host->h_length =3D sizeof(sn->sin_addr);
> +-	    }
> +-	    memcpy(&sn->sin_addr, host->h_addr_list[0], host->h_length);
> +-	    close(net);
> +-	    return 1;
> +-	}
> +-#endif	/* defined(h_addr) */
> +-
> +-	perror("telnet: Unable to connect to remote host");
> +-	return 0;
> ++    if (::connect(net, addr->ai_addr, addr->ai_addrlen) < 0) {
> ++	return 1;
> +     }
> +     return 2;
> + }
> +diff --git a/telnet/netlink.h b/telnet/netlink.h
> +index 9852b30..0ac8a08 100644
> +--- a/telnet/netlink.h
> ++++ b/telnet/netlink.h
> +@@ -1,13 +1,16 @@
> +=20
> + class netlink {
> ++ private:
> ++    int family;
> +  protected:
> +     int net;
> +  public:
> +     netlink();
> +     ~netlink();
> +=20
> +-    int connect(int debug, struct hostent *host,=20
> +-		struct sockaddr_in *sin,=20
> ++    int bind(struct addrinfo *hostaddr);
> ++    int socket(int family);
> ++    int connect(int debug, struct addrinfo *hostaddr,=20
> + 		char *srcroute, int srlen,
> + 		int tos);
> +     void close(int doshutdown);
> +diff --git a/telnet/network.cc b/telnet/network.cc
> +index 6a2c374..0dcf3e2 100644
> +--- a/telnet/network.cc
> ++++ b/telnet/network.cc
> +@@ -40,6 +40,7 @@ char net_rcsid[] =3D
> + #include <sys/types.h>
> + #include <sys/socket.h>
> + #include <sys/time.h>
> ++#include <stdlib.h>
> + #include <errno.h>
> + #include <arpa/telnet.h>
> +=20
> +diff --git a/telnet/proto.h b/telnet/proto.h
> +index 8be4a39..92f2419 100644
> +--- a/telnet/proto.h
> ++++ b/telnet/proto.h
> +@@ -13,7 +13,7 @@ int TerminalWindowSize(long *rows, long *cols);
> + void auth_encrypt_user(char *);
> + void auth_name(unsigned char *, int);
> + void auth_printsub(unsigned char *, int, unsigned char *, int);
> +-void cmdrc(const char *m1, const char *m2);
> ++void cmdrc(const char *, const char *, const char *);
> + void env_init(void);
> + int getconnmode(void);
> + void init_network(void);
> +diff --git a/telnet/ring.cc b/telnet/ring.cc
> +index be57396..772c6c5 100644
> +--- a/telnet/ring.cc
> ++++ b/telnet/ring.cc
> +@@ -165,7 +165,7 @@ int ringbuf::flush() {
> +=20
> + /////////////////////////////////////////////////// supply ////////////=
//
> +=20
> +-void ringbuf::printf(const char *format, ...) {
> ++void ringbuf::xprintf(const char *format, ...) {
> +     char xbuf[256];
> +     va_list ap;
> +     va_start(ap, format);
> +diff --git a/telnet/ring.h b/telnet/ring.h
> +index 15d3f3f..049377e 100644
> +--- a/telnet/ring.h
> ++++ b/telnet/ring.h
> +@@ -83,7 +83,7 @@ class ringbuf {
> +     // manual supply
> +     void putch(char c) { write(&c, 1); }
> +     void write(const char *buffer, int ct);
> +-    void printf(const char *format, ...);
> ++    void xprintf(const char *format, ...);
> +     int empty_count() { return size - count; }
> +=20
> +     // automatic supply
> +diff --git a/telnet/sys_bsd.cc b/telnet/sys_bsd.cc
> +index 93fba7e..a8c9aab 100644
> +--- a/telnet/sys_bsd.cc
> ++++ b/telnet/sys_bsd.cc
> +@@ -189,18 +189,25 @@ void NetSetPgrp(int fd) {
> +  * Various signal handling routines.
> +  */
> +=20
> ++#if 0
> + static void deadpeer(int /*sig*/) {
> +     setcommandmode();
> +     siglongjmp(peerdied, -1);
> + }
> ++#endif
> +=20
> + static void intr(int /*sig*/) {
> +     if (localchars) {
> + 	intp();
> +     }
> +     else {
> ++#if 0
> +         setcommandmode();
> + 	siglongjmp(toplevel, -1);
> ++#else
> ++	signal(SIGINT, SIG_DFL);
> ++	raise(SIGINT);
> ++#endif
> +     }
> + }
> +=20
> +@@ -214,6 +221,8 @@ static void intr2(int /*sig*/) {
> + 	    sendabort();
> + 	return;
> +     }
> ++    signal(SIGQUIT, SIG_DFL);
> ++    raise(SIGQUIT);
> + }
> +=20
> + #ifdef	SIGWINCH
> +@@ -238,7 +247,9 @@ void ayt(int sig) {
> + void sys_telnet_init(void) {
> +     signal(SIGINT, intr);
> +     signal(SIGQUIT, intr2);
> ++#if 0
> +     signal(SIGPIPE, deadpeer);
> ++#endif
> + #ifdef	SIGWINCH
> +     signal(SIGWINCH, sendwin);
> + #endif
> +diff --git a/telnet/telnet.1 b/telnet/telnet.1
> +index 54a47fb..8365e42 100644
> +--- a/telnet/telnet.1
> ++++ b/telnet/telnet.1
> +@@ -42,8 +42,9 @@
> + protocol
> + .Sh SYNOPSIS
> + .Nm telnet
> +-.Op Fl 8ELadr
> ++.Op Fl 468ELadr
> + .Op Fl S Ar tos
> ++.Op Fl b Ar address
> + .Op Fl e Ar escapechar
> + .Op Fl l Ar user
> + .Op Fl n Ar tracefile
> +@@ -68,6 +69,10 @@ command implicitly; see the description below.
> + .Pp
> + Options:
> + .Bl -tag -width indent
> ++.It Fl 4
> ++Force IPv4 address resolution.
> ++.It Fl 6
> ++Force IPv6 address resolution.
> + .It Fl 8
> + Request 8-bit operation. This causes an attempt to negotiate the
> + .Dv TELNET BINARY
> +@@ -89,6 +94,8 @@ of the
> + option if supported by the remote system. The username is retrieved
> + via
> + .Xr getlogin 3 .
> ++.It Fl b Ar address
> ++Use bind(2) on the local socket to bind it to a specific local address.
> + .It Fl d
> + Sets the initial value of the
> + .Ic debug
> +@@ -474,17 +481,29 @@ protocol without making a mess. Protocol negotiati=
on can be forced by
> + placing a dash before the port number.
> + .Pp
> + After establishing a connection, any commands associated with the
> +-remote host in the user's
> ++remote host in
> ++.Pa /etc/telnetrc
> ++and the user's
> + .Pa .telnetrc
> +-file are executed.
> ++file are executed, in that order.
> + .Pp
> +-The format of the .telnetrc file is as follows: Lines beginning with a
> ++The format of the telnetrc files is as follows: Lines beginning with a
> + #, and blank lines, are ignored.  The rest of the file should consist
> + of hostnames and sequences of
> + .Nm telnet
> + commands to use with that host. Commands should be one per line,
> + indented by whitespace; lines beginning without whitespace are
> +-interpreted as hostnames. Upon connecting to a particular host, the
> ++interpreted as hostnames.  Lines beginning with the special hostname
> ++.Ql DEFAULT
> ++will apply to all hosts.  Hostnames including
> ++.Ql DEFAULT
> ++may be followed immediately by a colon and a port number or string.
> ++If a port is specified it must match exactly with what is specified
> ++on the command line.  If no port was specified on the command line,
> ++then the value
> ++.Ql telnet
> ++is used.
> ++Upon connecting to a particular host, the
> + commands associated with that host are executed.
> + .It Ic quit
> + Close any open session and exit
> +@@ -1184,9 +1203,7 @@ escape sequences are preceded by a '*' to aid in l=
ocating them.
> + When the skiprc toggle is
> + .Dv TRUE ,
> + .Tn telnet
> +-does not read the=20
> +-.Pa \&.telnetrc
> +-file.  The initial value for this toggle is
> ++does not read the telnetrc files.  The initial value for this toggle is
> + .Dv FALSE.
> + .It Ic termdata
> + Toggles the display of all terminal data (in hexadecimal format).
> +@@ -1239,7 +1256,9 @@ to the other side via the
> + .Dv TELNET ENVIRON
> + option.
> + .Sh FILES
> +-.Bl -tag -width ~/.telnetrc -compact
> ++.Bl -tag -width /etc/telnetrc -compact
> ++.It Pa /etc/telnetrc
> ++global telnet startup values
> + .It Pa ~/.telnetrc
> + user customized telnet startup values
> + .El
> +diff --git a/telnet/telnet.cc b/telnet/telnet.cc
> +index 4fc3b1f..7eca811 100644
> +--- a/telnet/telnet.cc
> ++++ b/telnet/telnet.cc
> +@@ -88,7 +88,8 @@ char	do_dont_resp[256];
> + char	will_wont_resp[256];
> +=20
> + int
> +-eight =3D 0,
> ++  eight =3D 3,
> ++  binary =3D 0,
> +   autologin =3D 0,	/* Autologin anyone? */
> +   skiprc =3D 0,
> +   connected,
> +@@ -639,14 +640,14 @@ static const char *gettermname(void) {
> +   if (resettermname) {
> +     resettermname =3D 0;
> +     tname =3D env_getvalue("TERM", 0);
> +-    if (!tname || my_setupterm(tname, 1, &err)) {
> ++    if (!tname /* || my_setupterm(tname, 1, &err) */) {
> +       termbuf[0] =3D 0;
> +       tname =3D "UNKNOWN";
> +     }
> +     mklist(termbuf, tname, termtypes);
> +     next =3D 0;
> +   }
> +-  if (next=3D=3Dtermtypes.num()) next =3D 0;
> ++  if (next=3D=3Dtermtypes.num()-1) next =3D 0;
> +   return termtypes[next++];
> + }
> + /*
> +@@ -681,7 +682,7 @@ static void suboption(void) {
> +       }
> + #endif /* TN3270 */
> +       name =3D gettermname();
> +-      netoring.printf("%c%c%c%c%s%c%c", IAC, SB, TELOPT_TTYPE,
> ++      netoring.xprintf("%c%c%c%c%s%c%c", IAC, SB, TELOPT_TTYPE,
> + 		      TELQUAL_IS, name, IAC, SE);
> +     }
> +     break;
> +@@ -693,7 +694,7 @@ static void suboption(void) {
> +     if (SB_GET() =3D=3D TELQUAL_SEND) {
> +       long oospeed, iispeed;
> +       TerminalSpeeds(&iispeed, &oospeed);
> +-      netoring.printf("%c%c%c%c%ld,%ld%c%c", IAC, SB, TELOPT_TSPEED,=20
> ++      netoring.xprintf("%c%c%c%c%ld,%ld%c%c", IAC, SB, TELOPT_TSPEED,=
=20
> + 		      TELQUAL_IS, oospeed, iispeed, IAC, SE);
> +     }
> +     break;
> +@@ -780,7 +781,7 @@ static void suboption(void) {
> + 	send_wont(TELOPT_XDISPLOC, 1);
> + 	break;
> +       }
> +-      netoring.printf("%c%c%c%c%s%c%c", IAC, SB, TELOPT_XDISPLOC,
> ++      netoring.xprintf("%c%c%c%c%s%c%c", IAC, SB, TELOPT_XDISPLOC,
> + 		      TELQUAL_IS, dp, IAC, SE);
> +     }
> +     break;
> +@@ -798,7 +799,7 @@ void lm_will(unsigned char *cmd, int len) {
> +     return;
> +   }
> +  =20
> +-  netoring.printf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,=20
> ++  netoring.xprintf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,=20
> + 		  DONT, cmd[0], IAC, SE);
> + }
> +=20
> +@@ -815,7 +816,7 @@ void lm_do(unsigned char *cmd, int len) {
> +     /*@*/	printf("lm_do: no command!!!\n");	/* Should not happen... */
> +     return;
> +   }
> +-  netoring.printf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,=20
> ++  netoring.xprintf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,=20
> + 		  WONT, cmd[0], IAC, SE);
> + }
> +=20
> +@@ -838,7 +839,7 @@ void lm_mode(unsigned char *cmd, int len, int init) {
> +     k |=3D MODE_ACK;
> +   }
> +  =20
> +-  netoring.printf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE, LM_MODE,
> ++  netoring.xprintf("%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE, LM_MODE,
> + 		  k, IAC, SE);
> +  =20
> +   setconnmode(0);	/* set changed mode */
> +@@ -933,11 +934,11 @@ void slc_mode_import(int def) {
> +=20
> + void slc_import(int def) {
> +   if (def) {
> +-    netoring.printf("%c%c%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,
> ++    netoring.xprintf("%c%c%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,
> + 		    LM_SLC, 0, SLC_DEFAULT, 0, IAC, SE);
> +   }
> +   else {
> +-    netoring.printf("%c%c%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,
> ++    netoring.xprintf("%c%c%c%c%c%c%c%c%c", IAC, SB, TELOPT_LINEMODE,
> + 		    LM_SLC, 0, SLC_VARIABLE, 0, IAC, SE);
> +   }
> + }
> +@@ -1050,6 +1051,7 @@ void slc_check(void) {
> +=20
> +=20
> + unsigned char slc_reply[128];
> ++unsigned char const * const slc_reply_eom =3D &slc_reply[sizeof(slc_rep=
ly)];
> + unsigned char *slc_replyp;
> +=20
> + void slc_start_reply(void) {
> +@@ -1061,6 +1063,14 @@ void slc_start_reply(void) {
> + }
> +=20
> + void slc_add_reply(int func, int flags, int value) {
> ++  /* A sequence of up to 6 bytes my be written for this member of the S=
LC
> ++   * suboption list by this function.  The end of negotiation command,
> ++   * which is written by slc_end_reply(), will require 2 additional
> ++   * bytes.  Do not proceed unless there is sufficient space for these
> ++   * items.
> ++   */
> ++  if (&slc_replyp[6+2] > slc_reply_eom)
> ++    return;
> +   if ((*slc_replyp++ =3D func) =3D=3D IAC)
> +     *slc_replyp++ =3D IAC;
> +   if ((*slc_replyp++ =3D flags) =3D=3D IAC)
> +@@ -1142,6 +1152,7 @@ void env_opt(unsigned char *buf, int len) {
> +   }
> + }
> +=20
> ++/* OPT_REPLY_SIZE must be a multiple of 2. */
> + #define	OPT_REPLY_SIZE	256
> + unsigned char *opt_reply;
> + unsigned char *opt_replyp;
> +@@ -1173,6 +1184,7 @@ void env_opt_start_info(void) {
> +=20
> + void env_opt_add(const char *ep) {
> +   const char *vp;
> ++  const unsigned char *tp;
> +   unsigned char c;
> +  =20
> +   if (opt_reply =3D=3D NULL)		/*XXX*/
> +@@ -1185,11 +1197,12 @@ void env_opt_add(const char *ep) {
> +     return;
> +   }
> +   vp =3D env_getvalue(ep, 1);
> +-  if (opt_replyp + (vp ? strlen(vp) : 0) + strlen(ep) + 6 > opt_replyen=
d)
> ++  tp =3D opt_replyp + (vp ? strlen(vp) * 2 : 0) + strlen(ep) * 2 + 6;
> ++  if (tp > opt_replyend)
> +     {
> +       register int len;
> +-      opt_replyend +=3D OPT_REPLY_SIZE;
> +-      len =3D opt_replyend - opt_reply;
> ++      len =3D ((tp - opt_reply) + OPT_REPLY_SIZE - 1) & ~(OPT_REPLY_SIZ=
E - 1);
> ++      opt_replyend =3D opt_reply + len;
> +       opt_reply =3D (unsigned char *)realloc(opt_reply, len);
> +       if (opt_reply =3D=3D NULL) {
> + 	/*@*/			printf("env_opt_add: realloc() failed!!!\n");
> +@@ -1740,8 +1753,8 @@ void telnet(const char * /*user*/) {
> +     send_do(TELOPT_STATUS, 1);
> +     if (env_getvalue("DISPLAY", 0))
> +       send_will(TELOPT_XDISPLOC, 1);
> +-    if (eight)
> +-      tel_enter_binary(eight);
> ++    if (binary)
> ++      tel_enter_binary(binary);
> +   }
> + #endif /* !defined(TN3270) */
> +  =20
> +diff --git a/telnet/terminal.cc b/telnet/terminal.cc
> +index 9eb47ae..764f18f 100644
> +--- a/telnet/terminal.cc
> ++++ b/telnet/terminal.cc
> +@@ -45,6 +45,8 @@ char terminal_rcsid[] =3D
> + #include <signal.h>
> + #include <errno.h>
> + #include <stdio.h>
> ++#include <string.h>
> ++#include <stdlib.h>
> +=20
> + #include "ring.h"
> + #include "defines.h"
> +@@ -155,9 +157,11 @@ int getconnmode(void) {
> +     if (localflow)
> + 	mode |=3D MODE_FLOW;
> +=20
> +-    if (my_want_state_is_will(TELOPT_BINARY))
> ++    if ((eight & 1) || my_want_state_is_will(TELOPT_BINARY))
> + 	mode |=3D MODE_INBIN;
> +=20
> ++    if (eight & 2)
> ++	mode |=3D MODE_OUT8;
> +     if (his_want_state_is_will(TELOPT_BINARY))
> + 	mode |=3D MODE_OUTBIN;
> +=20
> +@@ -449,10 +453,13 @@ void TerminalNewMode(int f)
> + 		// breaks SunOS.
> + 	 	tmp_tc.c_iflag |=3D ISTRIP;
> + 	}
> +-	if (f & MODE_OUTBIN) {
> ++	if (f & (MODE_OUTBIN|MODE_OUT8)) {
> + 		tmp_tc.c_cflag &=3D ~(CSIZE|PARENB);
> + 		tmp_tc.c_cflag |=3D CS8;
> +-		tmp_tc.c_oflag &=3D ~OPOST;
> ++		if (f & MODE_OUTBIN)
> ++			tmp_tc.c_oflag &=3D ~OPOST;
> ++		else
> ++			tmp_tc.c_oflag |=3D OPOST;
> + 	} else {
> + 		tmp_tc.c_cflag &=3D ~(CSIZE|PARENB);
> + 		tmp_tc.c_cflag |=3D old_tc.c_cflag & (CSIZE|PARENB);
> +@@ -468,7 +475,7 @@ void TerminalNewMode(int f)
> +=20
> + #ifdef	SIGINFO
> + 	signal(SIGINFO, ayt);
> +-#endif	SIGINFO
> ++#endif	/* SIGINFO */
> +=20
> + #if defined(NOKERNINFO)
> + 	tmp_tc.c_lflag |=3D NOKERNINFO;
> +@@ -504,7 +511,7 @@ void TerminalNewMode(int f)
> +=20
> + #ifdef	SIGINFO
> + 	signal(SIGINFO, ayt_status);
> +-#endif	SIGINFO
> ++#endif	/* SIGINFO */
> +=20
> + #ifdef	SIGTSTP
> + 	signal(SIGTSTP, SIG_DFL);
> +diff --git a/telnet/utilities.cc b/telnet/utilities.cc
> +index 0448f0a..66839ab 100644
> +--- a/telnet/utilities.cc
> ++++ b/telnet/utilities.cc
> +@@ -47,6 +47,8 @@ char util_rcsid[] =3D
> + #include <sys/socket.h>
> + #include <unistd.h>
> + #include <ctype.h>
> ++#include <string.h>
> ++#include <stdlib.h>
> +=20
> + #include "ring.h"
> + #include "defines.h"
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/netkit-telnet/files/Warning-=
fix-in-the-step-of-install.patch b/meta-networking/recipes-daemons/netkit-t=
elnet/files/Warning-fix-in-the-step-of-install.patch
> new file mode 100644
> index 0000000..b9a98f1
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/netkit-telnet/files/Warning-fix-in-=
the-step-of-install.patch
> @@ -0,0 +1,41 @@
> +From 31362e4c0d02b4a2b952ad0dd32acfb573c442f3 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Fri, 28 Nov 2014 07:17:40 +0900
> +Subject: [PATCH 2/2] WARNING Fix and modify "CFLAGS"
> +
> +WARNING: QA Issue: File '/usr/sbin/in.telnetd' from netkit-telnet was=20
> +already stripped, this will prevent future debugging! [already-stripped]
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + telnetd/Makefile | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/telnetd/Makefile b/telnetd/Makefile
> +index 72650b4..a4cf9fa 100644
> +--- a/telnetd/Makefile
> ++++ b/telnetd/Makefile
> +@@ -9,7 +9,8 @@ include ../MRULES
> + # take out -DPARANOID_TTYS.
> +=20
> + CFLAGS +=3D '-DISSUE_FILE=3D"/etc/issue.net"' -DPARANOID_TTYS \
> +-	   -DNO_REVOKE -DKLUDGELINEMODE -DDIAGNOSTICS
> ++	   -DNO_REVOKE -DKLUDGELINEMODE -DDIAGNOSTICS \
> ++	   -DLOGIN_WRAPPER=3D\"/${libdir}/telnetlogin\"
> + # LIBS +=3D $(LIBTERMCAP)
> +=20
> + OBJS =3D telnetd.o state.o termstat.o slc.o sys_term.o utility.o \
> +@@ -27,7 +28,7 @@ $(OBJS): defs.h ext.h pathnames.h telnetd.h logwtmp.h =
logout.h setproctitle.h
> + telnetd.o: ../version.h
> +=20
> + install: telnetd
> +-	install -s -m$(DAEMONMODE) telnetd $(INSTALLROOT)$(SBINDIR)/in.telnetd
> ++	install -m$(DAEMONMODE) telnetd $(INSTALLROOT)$(SBINDIR)/in.telnetd
> + 	install -m$(MANMODE) issue.net.5 $(INSTALLROOT)$(MANDIR)/man5/
> + 	install -m$(MANMODE) telnetd.8 $(INSTALLROOT)$(MANDIR)/man8/in.telnetd=
=2E8
> + 	ln -sf in.telnetd.8 $(INSTALLROOT)$(MANDIR)/man8/telnetd.8
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-networking/recipes-daemons/netkit-telnet/files/telnet-x=
inetd b/meta-networking/recipes-daemons/netkit-telnet/files/telnet-xinetd
> new file mode 100644
> index 0000000..12204c7
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/netkit-telnet/files/telnet-xinetd
> @@ -0,0 +1,14 @@
> +# default: on
> +# description: The telnet server serves telnet sessions; it uses \
> +#	unencrypted username/password pairs for authentication.
> +service telnet
> +{
> +	flags		=3D REUSE
> +	socket_type	=3D stream
> +	wait		=3D no
> +	user		=3D root
> +	server		=3D /usr/sbin/in.telnetd
> +	log_on_failure	+=3D USERID
> +	disable		=3D yes
> +}
> +
> diff --git a/meta-networking/recipes-daemons/netkit-telnet/netkit-telnet_=
0.17.bb b/meta-networking/recipes-daemons/netkit-telnet/netkit-telnet_0.17.=
bb
> new file mode 100644
> index 0000000..a2dc1c2
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/netkit-telnet/netkit-telnet_0.17.bb
> @@ -0,0 +1,52 @@
> +DESCRIPTION =3D "netkit-telnet includes the telnet daemon and client."
> +SECTION =3D "base"
> +DEPENDS =3D "ncurses"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://telnet/telnet.cc;beginline=3D2;endline=3D3;=
md5=3D780868e7b566313e70cb701560ca95ef"
> +
> +SRC_URI =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.ta=
r.gz \
> +    file://To-aviod-buffer-overflow-in-telnet.patch \
> +    file://Warning-fix-in-the-step-of-install.patch \
> +    file://telnet-xinetd \
> +"
> +
> +EXTRA_OEMAKE =3D "INSTALLROOT=3D${D} SBINDIR=3D${sbindir} DAEMONMODE=3D7=
55 \
> +    MANMODE=3D644 MANDIR=3D${mandir}"
> +
> +do_configure () {
> +    ./configure --prefix=3D${prefix}
> +    echo "LDFLAGS=3D${LDFLAGS}" > MCONFIG
> +}
> +
> +do_compile () {
> +    oe_runmake 'CC=3D${CC}' 'LD=3D${LD}' 'LDFLAGS=3D${LDFLAGS}' SUB=3Dte=
lnet
> +    oe_runmake 'CC=3D${CC}' 'LD=3D${LD}' 'LDFLAGS=3D${LDFLAGS}' LIBS=3D-=
lutil SUB=3Dtelnetd
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 0755 telnet/telnet ${D}${bindir}/telnet.${PN}
> +    install -d ${D}${sbindir}
> +    install -d ${D}${mandir}/man1
> +    install -d ${D}${mandir}/man5
> +    install -d ${D}${mandir}/man8
> +    oe_runmake SUB=3Dtelnetd install
> +    rm -rf ${D}${mandir}/man1
> +    # fix up hardcoded paths
> +    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/telnet-xinetd
> +    install -d  ${D}/etc/xinetd.d/
> +    install -p -m644 ${WORKDIR}/telnet-xinetd ${D}/etc/xinetd.d/telnet
> +}
> +
> +pkg_postinst_${PN} () {
> +#!/bin/sh
> +    update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 1=
00
> +}
> +
> +pkg_prerm_${PN} () {
> +#!/bin/sh
> +    update-alternatives --remove telnet telnet.${PN} 100
> +}
> +
> +SRC_URI[md5sum] =3D "d6beabaaf53fe6e382c42ce3faa05a36"
> +SRC_URI[sha256sum] =3D "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3=
b08ff71a2bb88e00"
> --=20
> 1.8.4.2
>=20
--=20
-Joe MacDonald.
:wq

--cs5saTBZh7UZl2eX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU3BxAAAoJEEn8ffcsOfaWucoH+QFJOLjvZ2n123Vd02iRsUVr
MIXEjFbw2YUt8Dl0mKIyvWTLsR2d06+7B8KOLcjVFW2X5c3yrdQB3k5D3Uh44zTQ
esq0hw8Hj+OJlRo4L2TVkl1by9D8HUYPcPrH/kazvD/rrTxUM+5Llj9wpG5ChwPt
KoVZVBmGDAACuMudy/ufgt7awB5m5L/X/00ReZ8kSa6jx2da5vmYPBNKnK/NvcoF
wGBidl1GIWT/GIUPtx2pCKm7SjaXZTpmk1m5xTAHIu/81QcBw9x/Z/d9EJfFMZMw
AbYBFBy/V+oFOSaK1q5j4S3J+F+Wi5kbh9gZeFnqIKcJiVGeqNigYnMgyaIBh88=
=tL5c
-----END PGP SIGNATURE-----

--cs5saTBZh7UZl2eX--

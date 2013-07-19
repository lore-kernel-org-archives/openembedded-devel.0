Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B24316B260
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 15:21:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6JFLnJn019002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2013 08:21:49 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 19 Jul 2013 08:21:49 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 632747FE3;
	Fri, 19 Jul 2013 11:21:46 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 757CE404D8; Fri,
	19 Jul 2013 11:21:48 -0400 (EDT)
Date: Fri, 19 Jul 2013 11:21:48 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130719152148.GB25061@windriver.com>
References: <1374227769-18100-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1374227769-18100-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] bridge-utils: BackPort three patches
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
X-List-Received-Date: Fri, 19 Jul 2013 15:21:48 -0000
X-Groupsio-MsgNum: 45423
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline

--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also merged, thanks.
-J.

[[meta-networking][PATCH] bridge-utils: BackPort three patches] On 13.07.19=
 (Fri 17:56) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../recipes-support/bridge-utils/bridge-utils.inc  |    6 +-
>  ...5-check-error-returns-from-write-to-sysfs.patch |   87 ++++++++++++++=
++++++
>  ...5-fix-error-message-for-incorrect-command.patch |   33 ++++++++
>  ...utils-1.5-fix-incorrect-command-in-manual.patch |   33 ++++++++
>  4 files changed, 158 insertions(+), 1 deletion(-)
>  create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-u=
tils/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch
>  create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-u=
tils/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch
>  create mode 100644 meta-networking/recipes-support/bridge-utils/bridge-u=
tils/bridge-utils-1.5-fix-incorrect-command-in-manual.patch
>=20
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils.in=
c b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> index 271fc82..bd96c6a 100644
> --- a/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
> @@ -5,7 +5,11 @@ LICENSE =3D "GPLv2"
> =20
>  DEPENDS =3D "sysfsutils"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz \
> +          file://bridge-utils-1.5-check-error-returns-from-write-to-sysf=
s.patch \
> +          file://bridge-utils-1.5-fix-error-message-for-incorrect-comman=
d.patch \
> +          file://bridge-utils-1.5-fix-incorrect-command-in-manual.patch \
> +"
> =20
>  inherit autotools
> =20
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/br=
idge-utils-1.5-check-error-returns-from-write-to-sysfs.patch b/meta-network=
ing/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-check-error-=
returns-from-write-to-sysfs.patch
> new file mode 100644
> index 0000000..d00af9c
> --- /dev/null
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-ut=
ils-1.5-check-error-returns-from-write-to-sysfs.patch
> @@ -0,0 +1,87 @@
> +Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-uti=
ls.git/diff/bridge-utils-1.5-check-error-returns-from-write-to-sysfs.patch?=
id=3Db0d10717fd7cebf5d85eed3f941b409fa0384f08]
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +
> +From bb9970a9df95837e39d680021b1f73d231e85406 Mon Sep 17 00:00:00 2001
> +From: Stephen Hemminger <shemminger@vyatta.com>
> +Date: Tue, 3 May 2011 09:52:43 -0700
> +Subject: [PATCH 3/3] Check error returns from write to sysfs
> +
> +Add helper function to check write to sysfs files.
> +
> +Signed-off-by: Petr Sabata <contyk@redhat.com>
> +---
> + libbridge/libbridge_devif.c |   37 +++++++++++++++++++++++--------------
> + 1 files changed, 23 insertions(+), 14 deletions(-)
> +
> +diff --git a/libbridge/libbridge_devif.c b/libbridge/libbridge_devif.c
> +index aa8bc36..1e83925 100644
> +--- a/libbridge/libbridge_devif.c
> ++++ b/libbridge/libbridge_devif.c
> +@@ -280,25 +280,38 @@ fallback:
> + 	return old_get_port_info(brname, port, info);
> + }
> +=20
> ++static int set_sysfs(const char *path, unsigned long value)
> ++{
> ++	int fd, ret =3D 0, cc;
> ++	char buf[32];
> ++
> ++	fd =3D open(path, O_WRONLY);
> ++	if (fd < 0)
> ++		return -1;
> ++
> ++	cc =3D snprintf(buf, sizeof(buf), "%lu\n", value);
> ++	if (write(fd, buf, cc) < 0)
> ++		ret =3D -1;
> ++	close(fd);
> ++
> ++	return ret;
> ++}
> ++
> +=20
> + static int br_set(const char *bridge, const char *name,
> + 		  unsigned long value, unsigned long oldcode)
> + {
> + 	int ret;
> + 	char path[SYSFS_PATH_MAX];
> +-	FILE *f;
> +=20
> +-	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/%s", bridge, name);
> ++	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/bridge/%s",
> ++		 bridge, name);
> +=20
> +-	f =3D fopen(path, "w");
> +-	if (f) {
> +-		ret =3D fprintf(f, "%ld\n", value);
> +-		fclose(f);
> +-	} else {
> ++	if ((ret =3D set_sysfs(path, value)) < 0) {
> + 		/* fallback to old ioctl */
> + 		struct ifreq ifr;
> + 		unsigned long args[4] =3D { oldcode, value, 0, 0 };
> +-	=09
> ++
> + 		strncpy(ifr.ifr_name, bridge, IFNAMSIZ);
> + 		ifr.ifr_data =3D (char *) &args;
> + 		ret =3D ioctl(br_socket_fd, SIOCDEVPRIVATE, &ifr);
> +@@ -348,14 +361,10 @@ static int port_set(const char *bridge, const char=
 *ifname,
> + {
> + 	int ret;
> + 	char path[SYSFS_PATH_MAX];
> +-	FILE *f;
> +=20
> + 	snprintf(path, SYSFS_PATH_MAX, SYSFS_CLASS_NET "%s/brport/%s", ifname,=
 name);
> +-	f =3D fopen(path, "w");
> +-	if (f) {
> +-		ret =3D fprintf(f, "%ld\n", value);
> +-		fclose(f);
> +-	} else {
> ++
> ++	if ((ret =3D set_sysfs(path, value)) < 0) {
> + 		int index =3D get_portno(bridge, ifname);
> +=20
> + 		if (index < 0)
> +--=20
> +1.7.5.2
> +
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/br=
idge-utils-1.5-fix-error-message-for-incorrect-command.patch b/meta-network=
ing/recipes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-error-me=
ssage-for-incorrect-command.patch
> new file mode 100644
> index 0000000..2d0494e
> --- /dev/null
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-ut=
ils-1.5-fix-error-message-for-incorrect-command.patch
> @@ -0,0 +1,33 @@
> +Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-uti=
ls.git/diff/bridge-utils-1.5-fix-error-message-for-incorrect-command.patch?=
id=3Db0d10717fd7cebf5d85eed3f941b409fa0384f08]
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +
> +From c7ed0996ef58b497d3d30be802ab5ae6c37099b5 Mon Sep 17 00:00:00 2001
> +From: Stephen Hemminger <shemminger@vyatta.com>
> +Date: Tue, 3 May 2011 09:49:57 -0700
> +Subject: [PATCH 2/3] Fix error message for incorrect command
> +
> +Debian bug 406907
> +Error message was refering to incorrect command argument.
> +
> +Signed-off-by: Petr Sabata <contyk@redhat.com>
> +---
> + brctl/brctl.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/brctl/brctl.c b/brctl/brctl.c
> +index 454b8dd..46ca352 100644
> +--- a/brctl/brctl.c
> ++++ b/brctl/brctl.c
> +@@ -69,7 +69,7 @@ int main(int argc, char *const* argv)
> + 	argc -=3D optind;
> + 	argv +=3D optind;
> + 	if ((cmd =3D command_lookup(*argv)) =3D=3D NULL) {
> +-		fprintf(stderr, "never heard of command [%s]\n", argv[1]);
> ++		fprintf(stderr, "never heard of command [%s]\n", *argv);
> + 		goto help;
> + 	}
> + =09
> +--=20
> +1.7.5.2
> +
> diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils/br=
idge-utils-1.5-fix-incorrect-command-in-manual.patch b/meta-networking/reci=
pes-support/bridge-utils/bridge-utils/bridge-utils-1.5-fix-incorrect-comman=
d-in-manual.patch
> new file mode 100644
> index 0000000..6f6d6d4
> --- /dev/null
> +++ b/meta-networking/recipes-support/bridge-utils/bridge-utils/bridge-ut=
ils-1.5-fix-incorrect-command-in-manual.patch
> @@ -0,0 +1,33 @@
> +Upstream-status: BackPort [http://pkgs.fedoraproject.org/cgit/bridge-uti=
ls.git/diff/bridge-utils-1.5-fix-incorrect-command-in-manual.patch?id=3Db0d=
10717fd7cebf5d85eed3f941b409fa0384f08]
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +
> +From 8ef7b77562b636efcbd8b759eb324d6c069200f2 Mon Sep 17 00:00:00 2001
> +From: Stephen Hemminger <shemminger@vyatta.com>
> +Date: Tue, 3 May 2011 09:48:40 -0700
> +Subject: [PATCH 1/3] Fix incorrect command in manual
> +
> +Command is "setageing" not "setageingtime"; fix man page.
> +Debian bug report.
> +
> +Signed-off-by: Petr Sabata <contyk@redhat.com>
> +---
> + doc/brctl.8 |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/doc/brctl.8 b/doc/brctl.8
> +index d904047..771f323 100644
> +--- a/doc/brctl.8
> ++++ b/doc/brctl.8
> +@@ -89,7 +89,7 @@ data. Machines can move to other ports, network cards =
can be replaced
> + .B brctl showmacs <brname>
> + shows a list of learned MAC addresses for this bridge.
> +=20
> +-.B brctl setageingtime <brname> <time>
> ++.B brctl setageing <brname> <time>
> + sets the ethernet (MAC) address ageing time, in seconds. After <time>
> + seconds of not having seen a frame coming from a certain address, the
> + bridge will time out (delete) that address from the Forwarding
> +--=20
> +1.7.5.2
> +
--=20
-Joe MacDonald.
:wq

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHpWYwACgkQPN8S4W6ZZne5SQCfTkFf2eYusPfFveHIjM+jfQa4
+GwAn0YjU6FAZNJS7oBLvyOLjlX9+90z
=lTT5
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--

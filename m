Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ry0yH-0004vV-Ht
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 14:02:01 +0100
Received: by eaal10 with SMTP id l10so607691eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 04:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6l5y4QhVEEWve8Xx/tSHLNz+gN3+iqwNOQ2zf7osznI=;
	b=ECplMKo+0dXGyJ2JuuwXfv7IwBhkeqEOjhb6UV8PZ+sIBplGeBw1b42/8FgvKNemp7
	mjxwn48mzh6+Yf+RR5Nj6m5pwkBvh0e5kPqOWY0fN3MExp0NUZ0J4HH1dBneITRACqvi
	CUtCUyRWDvuoIaLjC8tzRK+sxwYcG9CLgaNqg=
Received: by 10.14.120.201 with SMTP id p49mr1473433eeh.74.1329396822709;
	Thu, 16 Feb 2012 04:53:42 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm23034604eeb.8.2012.02.16.04.53.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Feb 2012 04:53:41 -0800 (PST)
Date: Thu, 16 Feb 2012 13:53:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120216125339.GC5822@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Thu, 16 Feb 2012 13:02:01 -0000
X-Groupsio-MsgNum: 37196
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> V1 -> V2:
> [2]  do not check configuration variables for cross and nativesdk
> [3]  rename systemd_package to systemd_generate_package_scripts
> [6]  parse unit files to determine the files to pack
> [7]  create warning if *-systemd package already rdepends
>      it's base package
> added in V2:
> [8]-[20] remove obsolet systemd code from recipes (these were used as
>      test cases)
> [21] dhcp-(relay) test case for multiple systemd packages
> [22] modified to start service

Whole series looks good to me sofar.

I'm not sure what's meant by this warning:
WARNING:
/OE/shr-core/meta-openembedded/meta-oe/recipes-connectivity/gateone/gateone=
_git.bb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
WARNING:
/OE/shr-core/meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1=
=2Ebb:
it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd    =
   =20

I guess we should
-SYSTEMD_PACKAGES =3D "${PN}"
+SYSTEMD_PACKAGES =3D "${PN}-systemd"
with this patchset too and add ${PN}-systemd to task which pulls gateone/cl=
oud9.

And I'm not sure if this change is intentional:
http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D3d2=
7d7267406bd0fb2ea2a48b108dbb8bc7c128f#patch18

as xserver-nodm-init-systemd doesn't really need xserver-nodm-init, but
probably won't harm if xserver-nodm-init is used only to pull
xinit+xserver-common dependency.

Cheers,

>=20
> The following tests were performed:
> * build from scratch with [1]-[7] / run test
> * build from scratch / apply patches / build -> check buildhistory diff
> * build from scratch w/o patches / build from scratch with patches -> che=
ck
>   buildhistory diff
>=20
> Additional patches were prepared for other recipes inheriting systemd. Th=
ese are
> not yet send because they move systemd support from ${PN} to ${PN}-system=
d which
> currently needs modifications on tasks/images. I'd be happy if a common a=
ccepted
> solution would be suggested/implemented (image-feature?).
>=20
> This patch series can be pulled from:
> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git b=
ranch systemd2
>=20
> Andreas M=FCller (22):
>   systemd-systemctl-native: add multiple services support
>   systemd.bbclass: enhance checks for SYSTEMD_PACKAGES and
>     SYSTEMD_SERVICE
>   systemd.bbclass: cosmetics
>   systemd.bbclass: automatically create packages set in
>     SYSTEMD_PACKAGES
>   automatically install all *.service and *.socket supplied in recipe's
>     SRC_URI
>   systemd.bbclass: automatically extend FILES_* for systemd packages
>   systemd.bbclass: automatically extend RDEPENDS for *-systemd packages
>   connman: remove unneeded systemd code
>   dropbear: remove unneeded systemd code
>   openssh: remove unneeded systemd code
>   elsa: remove unneeded systemd code
>   cronie: remove unneeded systemd code
>   xserver-nodm-init: remove unneeded systemd code
>   atftp: remove unneeded systemd code
>   udisks: remove unneeded systemd code
>   rsyslog: remove unneeded systemd code
>   syslog-ng: remove unneeded systemd code
>   dhcp: remove unneeded systemd code
>   gpsd: remove unneeded systemd code
>   busybox: remove unneeded systemd code
>   dhcp: add native systemd support for dhcp-relay
>   gpsd: use ${PN}.service instead ${PN}.socket in SYSTEMD_SERVICE to
>     enable service
>=20
>  meta-efl/recipes-efl/efl/elsa_svn.bb               |   11 +--
>  meta-oe/classes/systemd.bbclass                    |  165 ++++++++++++++=
++++--
>  .../connman/connman_0.78.bbappend                  |    7 +-
>  .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   18 +--
>  .../dhcp/files/dhcrelay.service                    |   10 ++
>  .../openssh/openssh_5.9p1.bbappend                 |   14 +--
>  .../recipes-core/busybox/busybox_1.19.3.bbappend   |    8 +-
>  .../dropbear/dropbear_2011.54.bbappend             |   11 +--
>  .../systemd/systemd-systemctl-native/systemctl     |   75 +++++----
>  meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 +-
>  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +--
>  meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    7 +-
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 +-
>  meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb       |   14 +--
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    7 +-
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |    9 +-
>  16 files changed, 222 insertions(+), 166 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/dhcp/files/dhcrelay.serv=
ice
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk88/FMACgkQN1Ujt2V2gBzyOwCeKdLv3Q98n41iTYYbleUfQAi5
NkwAn17OQzNplahKGYxIB4mk/cjrp4Xg
=IAHL
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--

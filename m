Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RzSfS-0006wf-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 13:48:34 +0100
Received: by eekd41 with SMTP id d41so1892238eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 04:40:17 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.45.72 as permitted sender) client-ip=10.14.45.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.45.72 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.45.72])
	by 10.14.45.72 with SMTP id o48mr4734739eeb.110.1329741617234 (num_hops
	= 1); Mon, 20 Feb 2012 04:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=itWFnCVcbPJFjsBBuXmjL26w8/8GokxiWDghxkT9QhM=;
	b=j+7JR8ZWD9/3KTUZNHTyTgkiPxCeqQ541VxnjdzOpsWm8JE6ex4zLzMqiOjcVy61Fp
	b+mgYdtlGahKYdyeYy/7FWnyac4KNASwbiFkLTrOpMd1pkuVydU1nIS5ofKxmWxpXcxH
	acP1d6RIA+2rMaVyySa27Z3lrPwFudhCPmdvQ=
Received: by 10.14.45.72 with SMTP id o48mr3709298eeb.110.1329741617136;
	Mon, 20 Feb 2012 04:40:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n56sm77238709eeh.6.2012.02.20.04.40.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 04:40:16 -0800 (PST)
Date: Mon, 20 Feb 2012 13:40:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120220124013.GG3953@jama.jama.net>
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
X-List-Received-Date: Mon, 20 Feb 2012 12:48:35 -0000
X-Groupsio-MsgNum: 37252
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline

--ulDeV4rPMk/y39in
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

Today I've noticed one more issue (not sure if it's caused by this
patchset or not).

Some images are failing for me with:
For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-nodm.se=
rvice does not exist
=66rom systemd.bbclass:populate_packages_prepend

I guess it's because sstate package:
sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202f54b99c=
2e32c6312_package.tgz

has only=20
package/lib/systemd/system/xserver-nodm.service

but systemd.bbclass:populate_packages_prepend is looking only in ${D}
(image directory).

Cheers,

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

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9CPy0ACgkQN1Ujt2V2gBzvpwCfTlFUrVh1TZcxnMXIJWtrgA9f
EjsAn3212AzXeIBCNY+MTslQEe5wbRyh
=8C28
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--

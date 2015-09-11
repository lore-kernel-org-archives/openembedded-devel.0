Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CCF29736B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 18:58:52 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1ZaTX9-0006H0-VJ from Joe_MacDonald@mentor.com ;
	Fri, 11 Sep 2015 11:58:52 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Sep 2015 11:58:51 -0700
Received: by burninator (Postfix, from userid 1000)	id 177BE58287F; Fri, 11
	Sep 2015 14:57:45 -0400 (EDT)
Date: Fri, 11 Sep 2015 14:57:45 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20150911185744.GF4184@mentor.com>
References: <1441301956-12792-1-git-send-email-koen@dominion.thruhere.net>
	<20150911174559.GD4184@mentor.com>
	<B5525705-0CB7-4007-96F0-10C365483F7B@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <B5525705-0CB7-4007-96F0-10C365483F7B@dominion.thruhere.net>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] sshguard 1.6.1+git: add recipe
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
X-List-Received-Date: Fri, 11 Sep 2015 18:58:54 -0000
X-Groupsio-MsgNum: 57315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aZoGpuMECXJckB41"
Content-Disposition: inline

--aZoGpuMECXJckB41
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] sshguard 1.6.1+git: add recipe] On 15.09=
=2E11 (Fri 20:20) Koen Kooi wrote:

>=20
> > Op 11 sep. 2015, om 19:46 heeft Joe MacDonald <Joe_MacDonald@mentor.com=
> het volgende geschreven:
> >=20
> > I had the following build failure when I merged this:
> >=20
> >   sshguard_whitelist.c:350:87: error: dereferencing pointer to incomple=
te type 'struct addrinfo'
> >        for (numaddresses =3D 0, addriter =3D hostaddrs; addriter !=3D N=
ULL; addriter =3D addriter->ai_next, ++numaddresses) {
> >=20
> >=20
> > I put the contents of the logfile here:
> >=20
> >   http://pastebin.com/g1dCJcGY
> >=20
> > Can you take a look at this?
>=20
> Certainly, thanks for the report! I=E2=80=99ll be away for the next 2 wee=
ks, so don=E2=80=99t hold your breath :)

No problem, thanks for the quick follow-up!

Thanks,
-J.

>=20
> >=20
> > Thanks,
> > -J.
> >=20
> > [[oe] [meta-networking][PATCH] sshguard 1.6.1+git: add recipe] On 15.09=
=2E03 (Thu 19:39) Koen Kooi wrote:
> >=20
> >> SSHguard protects hosts from brute-force attacks against SSH and other
> >> services.
> >>=20
> >> This recipe uses iptables as blocker backend and journald as log backe=
nd.
> >>=20
> >> When it's working it will look like this in syslog:
> >>=20
> >> Sep 03 19:35:29 soekris sshguard[27044]: Started with danger threshold=
=3D40 ; minimum block=3D420 seconds
> >> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 24.234.171.90:4 for =
>630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over =
0s).
> >> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 61.182.15.194:4 for =
>630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over =
0s).
> >> Sep 03 19:35:29 soekris sshguard[27044]: Blocking 115.58.38.53:4 for >=
630secs: 40 danger in 4 attacks over 0 seconds (all: 40d in 1 abuses over 0=
s).
> >>=20
> >> And the iptable rules:
> >>=20
> >> root@soekris:~# iptables -L sshguard --line-numbers
> >> Chain sshguard (1 references)
> >> num  target     prot opt source               destination
> >> 1    DROP       all  --  hn.kd.ny.adsl        anywhere
> >> 2    DROP       all  --  61.182.15.194        anywhere
> >> 3    DROP       all  --  wsip-24-234-171-90.lv.lv.cox.net  anywhere
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> .../recipes-support/sshguard/sshguard/firewall     | 48 ++++++++++++++=
++++++++
> >> .../sshguard/sshguard/sshguard-journalctl          |  2 +
> >> .../sshguard/sshguard/sshguard.service             | 12 ++++++
> >> .../recipes-support/sshguard/sshguard_git.bb       | 38 ++++++++++++++=
+++
> >> 4 files changed, 100 insertions(+)
> >> create mode 100644 meta-networking/recipes-support/sshguard/sshguard/f=
irewall
> >> create mode 100644 meta-networking/recipes-support/sshguard/sshguard/s=
shguard-journalctl
> >> create mode 100644 meta-networking/recipes-support/sshguard/sshguard/s=
shguard.service
> >> create mode 100644 meta-networking/recipes-support/sshguard/sshguard_g=
it.bb
> >>=20
> >> diff --git a/meta-networking/recipes-support/sshguard/sshguard/firewal=
l b/meta-networking/recipes-support/sshguard/sshguard/firewall
> >> new file mode 100644
> >> index 0000000..b683368
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/sshguard/sshguard/firewall
> >> @@ -0,0 +1,48 @@
> >> +#!/bin/sh
> >> +
> >> +#
> >> +# Function that enables firewall
> >> +#
> >> +do_enable_firewall()
> >> +{
> >> +	# creating sshguard chain
> >> +	iptables -N sshguard 2> /dev/null
> >> +	ip6tables -N sshguard 2> /dev/null
> >> +	# block traffic from abusers
> >> +	iptables -I INPUT -j sshguard 2> /dev/null
> >> +	ip6tables -I INPUT -j sshguard 2> /dev/null
> >> +}
> >> +#
> >> +# Function that disables firewall
> >> +#
> >> +do_disable_firewall()
> >> +{
> >> +	# flushes list of abusers
> >> +	iptables -F sshguard 2> /dev/null
> >> +	ip6tables -F sshguard 2> /dev/null
> >> +	# removes sshguard firewall rules
> >> +	iptables -D INPUT -j sshguard 2> /dev/null
> >> +	ip6tables -D INPUT -j sshguard 2> /dev/null
> >> +	# removing sshguard chain
> >> +	iptables -X sshguard 2> /dev/null
> >> +	ip6tables -X sshguard 2> /dev/null
> >> +}
> >> +
> >> +case "$1" in
> >> +    enable)
> >> +	do_enable_firewall
> >> +	;;
> >> +    disable)
> >> +	do_disable_firewall
> >> +	;;
> >> +    restart)
> >> +	do_disable_firewall
> >> +	do_enable_firewall
> >> +	;;
> >> +    *)
> >> +	exit 1
> >> +	;;
> >> +esac
> >> +=09
> >> +exit 0
> >> +
> >> diff --git a/meta-networking/recipes-support/sshguard/sshguard/sshguar=
d-journalctl b/meta-networking/recipes-support/sshguard/sshguard/sshguard-j=
ournalctl
> >> new file mode 100644
> >> index 0000000..e7c615b
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/sshguard/sshguard/sshguard-journ=
alctl
> >> @@ -0,0 +1,2 @@
> >> +#!/bin/sh
> >> +/bin/journalctl -fb -t sshd -n100 | /usr/sbin/sshguard -l- "$@"
> >> diff --git a/meta-networking/recipes-support/sshguard/sshguard/sshguar=
d.service b/meta-networking/recipes-support/sshguard/sshguard/sshguard.serv=
ice
> >> new file mode 100644
> >> index 0000000..e2590fa
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/sshguard/sshguard/sshguard.servi=
ce
> >> @@ -0,0 +1,12 @@
> >> +[Unit]
> >> +Description=3DSSHGuard
> >> +After=3Dnetwork.service
> >> +
> >> +[Service]
> >> +PIDFile=3D/run/sshguard.pid
> >> +ExecStartPre=3D/usr/lib/sshguard/firewall enable
> >> +ExecStopPost=3D/usr/lib/sshguard/firewall disable
> >> +ExecStart=3D/usr/lib/sshguard/sshguard-journalctl -i /run/sshguard.pid
> >> +
> >> +[Install]
> >> +WantedBy=3Dmulti-user.target
> >> diff --git a/meta-networking/recipes-support/sshguard/sshguard_git.bb =
b/meta-networking/recipes-support/sshguard/sshguard_git.bb
> >> new file mode 100644
> >> index 0000000..04435e8
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/sshguard/sshguard_git.bb
> >> @@ -0,0 +1,38 @@
> >> +SUMMARY =3D "SSHguard protects hosts from brute-force attacks against=
 SSH and other services."
> >> +
> >> +LICENSE =3D "ISC"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D47a33fc98cd20713882c4d822a=
57bf4d"
> >> +
> >> +PV =3D "1.6.1+git${SRCPV}"
> >> +
> >> +SRCREV =3D "019a0406811a536faf3f90cdd7a0a538ee24d789"
> >> +SRC_URI =3D "git://bitbucket.org/sshguard/sshguard.git;protocol=3Dhtt=
ps;branch=3D1.6 \
> >> +           file://firewall \
> >> +           file://sshguard.service \
> >> +           file://sshguard-journalctl \
> >> +          "
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +DEPENDS =3D "flex-native"
> >> +
> >> +inherit autotools-brokensep systemd
> >> +
> >> +EXTRA_OECONF +=3D " --with-firewall=3Diptables \
> >> +                  --with-iptables=3D${sbindir}/iptables \
> >> +                "
> >> +
> >> +do_install_append() {
> >> +    install -d ${D}${libdir}/sshguard
> >> +    install -m 0755 ${WORKDIR}/firewall ${D}${libdir}/sshguard
> >> +    install -m 0755 ${WORKDIR}/sshguard-journalctl ${D}${libdir}/sshg=
uard
> >> +
> >> +    sed -i -e s:/bin:${base_bindir}:g -e s:/usr/sbin:${sbindir}:g ${D=
}${libdir}/sshguard/sshguard-journalctl
> >> +
> >> +    install -d ${D}${systemd_unitdir}/system
> >> +    install -m 0644 ${WORKDIR}/sshguard.service ${D}${systemd_unitdir=
}/system
> >> +    sed -i -e s:/usr/lib:${libdir}:g ${D}${systemd_unitdir}/system/ss=
hguard.service=20
> >> +}
> >> +
> >> +FILES_${PN} +=3D "${systemd_unitdir}"
> >> +RDEPENDS_${PN} +=3D "iptables"
> >> --=20
> >> 2.0.1
> >>=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20

--=20
-Joe MacDonald.
:wq

--aZoGpuMECXJckB41
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV8yQoAAoJEEn8ffcsOfaW1kcH/AznBod0DPo4sWf/Vzas7wvT
N8gA2CjMFwJ0poR5OyYo07EpaoOwpZgeMuYvzBAkojUvzEAbPwtSzTxOwXYOVK0s
dq4B3eXoRIzu6s4V1GsV//ct5PTVGTo74RLMXU6RpG+Yt3yzoWojKP3e65HGaAqb
GGgCPnO+T1/K+XK2D15G37YKUXr49R7M1GNh94R4nSlz/FoFGaIj9nLi6V55U2HL
Jq0gZapJQg0yiuTx9fgia1MFLFOoTNgb4twPacDl/HzYqbd2dPkUrqlC7D4Nd9sd
uPk+K3MQ+ueCKUmQXSt/njnsDPDXZiDPO72o18veRib/Dz+ktAvNmAxwYC9Sr6U=
=jyrC
-----END PGP SIGNATURE-----

--aZoGpuMECXJckB41--

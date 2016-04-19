Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C3F076E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:21:02 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1asWWU-0007B7-NC from Joe_MacDonald@mentor.com ;
	Tue, 19 Apr 2016 07:21:02 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 Apr 2016 07:21:02 -0700
Received: by burninator (Postfix, from userid 1000)	id 1D0E8580580; Tue, 19
	Apr 2016 10:21:01 -0400 (EDT)
Date: Tue, 19 Apr 2016 10:21:01 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <mark.asselstine@windriver.com>, <rehsack@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20160419142059.GB5970@mentor.com>
References: <1461036607-24650-1-git-send-email-joe_macdonald@mentor.com>
	<20160419074100.GA9350@ad.chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <20160419074100.GA9350@ad.chargestorm.se>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] dnsmasq: get systemd only working again
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
X-List-Received-Date: Tue, 19 Apr 2016 14:21:03 -0000
X-Groupsio-MsgNum: 61053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [meta-networking][PATCH] dnsmasq: get systemd only working again] On 1=
6.04.19 (Tue 09:41) Anders Darander wrote:

> * Joe MacDonald <joe_macdonald@mentor.com> [160419 05:29]:
>=20
> > From: Mark Asselstine <mark.asselstine@windriver.com>
>=20
> > The changes made in commit 2497cf2960537152427c99629b2af412787eb6c2
> > [dnsmasq: steal resolvconf support from Ubuntu] broke systemd only
> > dnsmasq runtime. No sysvinit scripts are included in systemd only
> > builds (and should not be) and the dnsmasq executable has not moved to
> > /usr/sbin.
>=20
> > Reverting to the previous version of the systemd service file. If
> > folks want the local dnsmasq instance to be queried before going to
> > an external DNS they should add 'nameserver 127.0.0.1' to
> > /etc/resolv.conf. Or submit a change which will work with systemd.
>=20
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> > ---
>=20
> > Mark,
>=20
> > Thanks for the patch.  In the interests of not causing any more hassle
> > than I already have, I'm proposing this as an alternative to what you s=
ent
> > earlier today.  This hopefully preserves the resolvconf/start-stop
> > functionality while not relying on any sysvinit-ness.  What do you think
> > about this as a middle-ground?
>=20
> > Anders,
>=20
> > I trust that nothing Mark and I are discussing here changes the issue y=
ou
> > noted about dnsmasq just falling over after a few minutes.  I propose we
> > dig into that separately, since it looks like a different problem proba=
bly
> > related to the uprev.  If it turns out that once we merge something to
> > support systemd-only builds that resolves the 'dnsmasq vandalizes itsel=
f'
> > issue, even better.
>=20
> Well, I've tried this patch, but dnsmasq isn't running. Was it run-time
> tested?

Yes, it worked on my setup last night, but the testing I did was a bit
of a fake due to trying it out on a live system rather than waiting for
the filesystem generation to happen and copying it over to the target.
Thus the error you noted below.

> Isn't MAINPID the PID of the main process started by systemd?

In the case of Type=3Dforking, $MAINPID is the value out of PIDFile unless
PIDFile is unset, then systemd needs to guess at the value (unless
you've also set GuessMainPID=3D'no', in which case I have no idea what
happens, but the default is 'yes', so it shouldn't matter in this case).
At least that's my reading of the docs at
https://www.freedesktop.org/software/systemd/man/systemd.service.html,
I'm no expert when it comes to systemd service files, though, so please
correct me if I'm wrong.

> And -x should specify a path to the pid-file?

Yes, it absolutely should.

-J.

> Logs below.
>=20
> Cheers,
> Anders
>=20
> [FAILED] Failed to start DNS forwarder and DHCP server.
> See 'systemctl status dnsmasq.service' for details.
>=20
> Running `systemctl status dnsmasq.service` gives:
>=20
> [[0;1;31m=E2=97=8F[[0m dnsmasq.service - DNS forwarder and DHCP server   =
 Loaded: loaded (/lib/systemd/system/dnsmasq.service; enabled; vendor prese=
t: enabled)
>    Active: [[0;1;31mfailed[[0m (Result: exit-code) since Fri 2016-04-08 1=
1:07:27 CEST; 8min ago
>   Process: 384 ExecStart=3D/usr/bin/dnsmasq -x $MAINPID [[0;1;31m(code=3D=
exited, status=3D1/FAILURE)[[0m
>   Process: 381 ExecStartPre=3D/usr/bin/dnsmasq --test (code=3Dexited, sta=
tus=3D0/SUCCESS)
>=20
> Apr 08 11:07:27 ccu systemd[1]: Starting DNS forwarder and DHCP server...
> Apr 08 11:07:27 ccu dnsmasq[381]: dnsmasq: syntax check OK.
> Apr 08 11:07:27 ccu dnsmasq[384]: dnsmasq: bad command line options: try =
--help
> Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;31mbad command line options: try =
--help[[0m
> Apr 08 11:07:27 ccu dnsmasq[384]: [[0;1;31mFAILED to start up[[0m=20
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Control process=
 exited, code=3Dexited status=3D1[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;31mFailed to start DNS forwarder an=
d DHCP server.[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Unit entered fa=
iled state.[[0m
> Apr 08 11:07:27 ccu systemd[1]: [[0;1;39mdnsmasq.service: Failed with res=
ult 'exit-code'.[[0m
>=20
--=20
-Joe MacDonald.
:wq

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJXFj7LAAoJEEn8ffcsOfaWleIH/1KYUFtDQRpp8mebrm/j3oUH
OHFER90PcRsOc4AOUUd4pHT/wvsXR3+/Oqsu9GyiZrKFGDkrCqEMxGB1IRCxPS98
OlK4WjQFiglJRzSMPrUdrGpSo2R7WpgdW3LIAuaDMlLxsx/neWUchdK0Uh+pKex+
URRRIyG0EM/kZVLJpui9Krw37P05GhrprL6ory195h1b+vkWy2yWEPOaFmm0SSaa
DRT3KzydLiZmbEw7GPfY9sKcB4J+wtQraG8brHuhdbUj7OUZVEqcIEn+JWhsqOkF
zB/4WS/sBw8NtwBgVrrujSey+OJWwH/aaVN5Hq2HtsA+ThT+AZ0wt4EafYAbUOM=
=FFWy
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--

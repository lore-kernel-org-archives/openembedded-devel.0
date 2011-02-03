Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PkwBp-0002fS-GT
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 11:13:25 +0100
Received: by bwz10 with SMTP id 10so1380299bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Feb 2011 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=TJMZhW4BDH7lAgVg1ZPapLVCho4Zs0nAUg5431TZCp4=;
	b=yCqOP+kHdMCrBL/5HjfVHCc+/BS7qsPrteXqHqHDM0053D2rRL9WlMB0U+qF22y4tt
	hOnhiCsviEylgEADgw3jerrtLjTFYe9YFrZS1kDQPDvXH82OB/T+IaZ2oHDaY3yZ/OvK
	UJgk5KKy+n9Vl8gEwAbr/XpGK2Xu8zeQML1ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=coIgophIqQY3vGbRbRWoyPSFpXcnM58Mc/B9EIbN8qwwZASaRVzKoarM8gipJmAZhN
	zF1LDlen1254a6Kuzo8rb9qxL7l+kRPdXTWdswLB6LnM7RfniQmu9jVofWw17aLYvyfh
	lPSKloYXkgyD2So/KOEHoiA8Z9Bcw+yA4Tb30=
Received: by 10.204.4.212 with SMTP id 20mr9513141bks.172.1296727949072;
	Thu, 03 Feb 2011 02:12:29 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u23sm315534bkw.9.2011.02.03.02.12.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 03 Feb 2011 02:12:27 -0800 (PST)
Date: Thu, 3 Feb 2011 11:12:42 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110203101242.GF3265@jama>
References: <20110203093253.GG4580@excalibur.local>
	<201102031054.08764.ml@vdm-design.de>
MIME-Version: 1.0
In-Reply-To: <201102031054.08764.ml@vdm-design.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Thu, 03 Feb 2011 10:13:25 -0000
X-Groupsio-MsgNum: 28775
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xkXJwpr35CY/Lc3I"
Content-Disposition: inline

--xkXJwpr35CY/Lc3I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2011 at 10:54:08AM +0100, Thomas Zimmermann wrote:
> On Thursday 03 February 2011 10:32:53 Stefan Schmidt wrote:
> > Hello.
> >
> > The last hours I was trying to compile wpa_supplicant with nl80211 supp=
ort.
> > That needs netlink support through libnl or libnl2.
> >
> > Enabling the option to use libnl2, not that easy to find, still breaks =
with
> > missing header files. Checking the libnl2 source shows that they are
> > provided. After some head on the table banging I found:
> >
> > commit 880e00d3b7ccf66d9421a06bc28e553e07842b59
> > Author: Michael 'Mickey' Lauer <mickey@vanille-media.de>
> > Date:   Tue Nov 24 16:33:06 2009 +0000
> >
> >     libnl2: change includedir to not step over libnl1; also convert to =
new
> > staging
>=20
> At that time there was just one recipe depending on libnl2 and that was F=
SO2.
> I think one month ago JaMa has build the first SHR image without libnl(1)=
,=20

yes after couple of changes
http://git.openembedded.org/cgit.cgi/openembedded/log/?h=3Dorg.openembedded=
=2Edev&qt=3Dgrep&q=3Dlibnl

> until then it was impossible because of some important parts. I'm not sur=
e but=20
> i think the main blocker was bluez4 (Can't check now).

Yes older bluez4 with nl plugin (which was removed later).

and:
http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/70b13d30b3=
35b8fd67116d3bc0834382a77bc319
81      ANGSTROM_BLACKLIST_pn-bmon =3D "bmon depends on libnl we want libnl=
2"
82	ANGSTROM_BLACKLIST_pn-crda =3D "crda depends on libnl we want libnl2"
83	ANGSTROM_BLACKLIST_pn-hostap-daemon =3D "hostap-daemon depends on libnl =
we want libnl2"
84	ANGSTROM_BLACKLIST_pn-ibrdtn =3D "ibrdtn depends on libnl we want libnl2"
85	ANGSTROM_BLACKLIST_pn-iw =3D "iw depends on libnl we want libnl2"
86	ANGSTROM_BLACKLIST_pn-lowpan-tools =3D "lowpan-tools depends on libnl we=
 want libnl2"
87	ANGSTROM_BLACKLIST_pn-networkmanager =3D "networkmanager depends on libn=
l we want libnl2"
88	ANGSTROM_BLACKLIST_pn-networkmanager-openvpn =3D "networkmanager-openvpn=
 depends on libnl we want libnl2"
89	ANGSTROM_BLACKLIST_pn-pstree =3D "pstree depends on libnl we want libnl2"
90	ANGSTROM_BLACKLIST_pn-rfkill =3D "rfkill depends on libnl we want libnl2"

I didn't check if those can be built with libnl2 or if they work properly w=
ith libnl2.

But be aware that we had enough issues in runtime (build passes ok) caused =
by libnl1 built in same sysroot=20
as libnl2 (that's why I had to blacklist libnl2 in SHR).

=46rom GNUtoo's report about issues with libnl1 in runtime..(when both libn=
l are built in same sysroot and libnl1 was rebuilt later)
<snip>
root@htcdream ~ # phoneuid
BUG: route/class_api.c:42
phoneuid: route/class_api.c:42: rtnl_class_register: Assertion `0' failed.
Aborted
</snip>

And also be aware that after blacklisting it, doing just bitbake -c clean l=
ibnl libnl2 wasn't=20
enough to rebuild all apps properly against libnl2, I had to manually remov=
e all traces of=20
libnl1 like shlibs etc (not sure why).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xkXJwpr35CY/Lc3I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1Kf5oACgkQN1Ujt2V2gBwIpACeIdflM2nZ2/1Zxz9jmptqYWc7
cZgAnjo1wPXrNfSDrFJP8z+EPOeQl/O7
=atri
-----END PGP SIGNATURE-----

--xkXJwpr35CY/Lc3I--

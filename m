Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvRff-0004TQ-U7
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 10:51:39 +0100
Received: by fxm8 with SMTP id 8so1969244fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 01:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=BidWcIFTwiKouazV8Z866H7j6A52hebcvcuIDBZWdvk=;
	b=Wrf0q7xSkVkpfj6ZYJZi+x8dEO2EVB5r3m4ISZaxT2CR/Iyjq6OjQ1zhgPJclsRW5p
	EXE5ypgfok5sgk/raIXqNORZBAUqPoafvt0yUZ5jJVYVebFAeURp3kNEJ7u7Crlkv9yv
	QhmSKYq2Opt3KZQQGFrrNkAHF3QU16uUjwuUY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B0iHbdlub+LSW4H6LuYBOnIq6C2uPufv/M8vqU2Oc2wh1u4gbNMH1jzGi3D9XBfjRa
	cDo74Dt4HcMr568cRkPAR+eS+pQHj3xqqOXyhV/TRMbFvnrth4Jg0UEnr52k0SrzLZvJ
	OC57YaFCpsNK0jjBdCHf5So0AGG2ad1Vm4CGc=
Received: by 10.223.127.210 with SMTP id h18mr537197fas.79.1299232210236;
	Fri, 04 Mar 2011 01:50:10 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm1046410fam.16.2011.03.04.01.50.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 01:50:09 -0800 (PST)
Date: Fri, 4 Mar 2011 10:50:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110304095003.GD3312@jama.jama.net>
References: <1299225769-12329-1-git-send-email-Martin.Jansa@gmail.com>
	<AANLkTikgA=b5DcrfzHpians8edKrdC9AjvRqqQam5_RV@mail.gmail.com>
	<AANLkTimf2qBUA2rnewktwNquCZUuQN44rCX0UKbKc2DK@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimf2qBUA2rnewktwNquCZUuQN44rCX0UKbKc2DK@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] linux-kexecboot: remove extra quotes arround INITRAMFS_COMPRESSION RD_COMPRESSION, which made 'make oldconfig' to ignore them
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
X-List-Received-Date: Fri, 04 Mar 2011 09:51:40 -0000
X-Groupsio-MsgNum: 29916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2011 at 10:13:43AM +0100, Andrea Adami wrote:
> On Fri, Mar 4, 2011 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Mar 4, 2011 at 12:02 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > Acked-by: Khem Raj <raj.khem@gmail.com>
>=20
> Acked-by: Andrea Adami <andrea.adami@gmail.com>
>=20
> Thanks for keeping an eye on!
>=20
> Andrea
>=20
> P.S. this file is still WIP, probably some mangling could be made arch-sp=
ecific.

Hi Andrea,

you could be also interested in last 3 patches in
http://gitorious.org/~jama/angstrom/jama-shr-experimental

but I did only build tests as my spitz is away and I cannot properly
test reboot remotely..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1wtcoACgkQN1Ujt2V2gBxw+wCfXtfrgd6CkaiXHMbLNLajfRh2
+owAn2lDg6PADn3h6h/M8hZuCbgj3VEs
=NxQH
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--

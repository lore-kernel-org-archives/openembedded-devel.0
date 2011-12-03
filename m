Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWu23-0002Rl-SS
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 19:09:51 +0100
Received: by eaad13 with SMTP id d13so3536719eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Dec 2011 10:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AO54hOWQ1Qjr3NI8crxCTLlBh1kveU5HWeZq3Wj8Eu8=;
	b=BNa6d4Z9kSoHnAjdOy1sXBhfDp2DGdpQgQQn+JokYG1T/P45XOvauqTE8nZLz82U0P
	gQXWeGCSLgdzLen2/uv29EXHq/0DO0m+bwH2dwrBQQ3ZO27TRHw8KOI372i2Yj5wXEFf
	PUrPqyzq2YH5r+IgDa8vHKeYCxf5M2krILXTk=
Received: by 10.213.22.140 with SMTP id n12mr105042ebb.53.1322935386554;
	Sat, 03 Dec 2011 10:03:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm39325240eeb.4.2011.12.03.10.03.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Dec 2011 10:03:05 -0800 (PST)
Date: Sat, 3 Dec 2011 19:03:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111203180303.GD3797@jama.jama.net>
References: <4ED8307F.2060306@googlemail.com> <4ED960AB.5040502@googlemail.com>
	<4ED96455.8060008@googlemail.com>
	<201112031046.44018.GNUtoo@no-log.org>
	<4EDA504E.7070304@googlemail.com>
	<20111203165213.GB3797@jama.jama.net>
	<4EDA6095.5030203@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4EDA6095.5030203@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Sat, 03 Dec 2011 18:09:52 -0000
X-Groupsio-MsgNum: 35845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Content-Disposition: inline

--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 03, 2011 at 05:47:01PM +0000, Mr Dash Four wrote:
>=20
> > then you will like:
> > bitbake -c menuconfig virtual/kernel=20
> >  =20
> Indeed!
>=20
> > and to save defconfig you can use -c savedefconfig (not 100% sure it's
> > available in linux-leviathan in OE-classic).
> >  =20
> Nope, this doesn't seem available - it tells me "Nothing to do" and to=20
> run "bitbake world" if I want something done (I like that attitude :-)=20
> ), so I had to copy the new file myself.

You haven't specify target I guess..
bitbake -c savedefconfig virtual/kernel
=20
> > You need to add right keymap to keymaps recipe and check that it's in
> > /etc/keymap-2.6.map and then /etc/init.d/keymap.sh should load it for
> > you during boot.
> >  =20
> Hmm, in my rootfs I do have /etc/init.d/keymap and I just looked at that=
=20
> script - it looks for either /etc/keymap-*something* or=20
> /etc/keymap-extension-*something*. I have neither!
>=20
> In the recipe directory (keymaps/files) there is a directory called=20
> "htcuniversal" which has a single file called keymap-2.6.map:
> #altgr keycode 18 =3D euro
> altgr keycode 15 =3D tilde
> altgr keycode 24 =3D slash
> altgr keycode 25 =3D backslash
> altgr keycode 32 =3D pound
> altgr keycode 37 =3D quotedbl
> altgr keycode 38 =3D apostrophe
> altgr keycode 50 =3D question
> altgr keycode 51 =3D semicolon
> altgr keycode 52 =3D colon
>=20
> Now, I have four questions:
> 1) how do I "activate" this keymap (provided it is the one I want);

copy htcuniversal file to match MACHINE (so htcdream) and rebuild
keymaps recipe, don't know if htcuniversal is using same layout..

> 2) it seems that in this file I could redefine *any* key I want. If so,=
=20
> is there any man/doc page I can look at to educate myself, because I am=
=20
> almost 100% certain that I would need to redefine some of the keys in=20
> the "standard" setting.

Yes there definetely are some man and doc pages as this is not really
OE or embedded specific and also there is google you know.. :).

> 3) How do I find the "keycode" numbers - is there a tool I could execute=
=20
> (probably on my phone) to find a certain keycode when I press it so that=
=20
> I could redefine it later (presumably in a similar file as the=20
> keymap-2.6.map I listed above)?

dtto

> 4) When I do all the changes, do I just do the versioning "magic" (bump=
=20
> up the keymaps PR) in order to trigger a re-make of the stuff I changed=
=20
> (great trick that!)?

yes=20
1) add file
2) bump PR,
3) rebuild
4) test it on device,
5) update it on device if it's not 100% correct and then sync keymap-2.6.ma=
p=20
with htcdream in OE
6) send patch to OE ML

> > This usually means that /dev/pts wasn't mounted during boot, I don't
> > remember if htcdream was doing something weird but for palmpre GarthPS
> > needed this:
> > http://git.openembedded.org/openembedded/commit/?id=3Dfcb43100609fcb955=
cfac6ad6b92d3b5ddf08c20
> > and I'm not sure if somebody tested htcdream since then.. so check order
> > of mountdevsubfs.sh and udev init if htcdream is using udev (not
> > devtmpfs)
> >  =20
> Hmm, I don't know what OE commit I have, but just checked my /etc/rcS.d=
=20

And I cannot run commands (git log even) in your checkout so I don't know i=
t too :).

> on the phone's rootfs - it seems that I have the (buggy)=20
> "S04mountdevsubfs.sh" instead of "S05mountdevsubfs.sh". How do I=20
> alter/change this (presumably by altering some of the recipes)?

Yes this is in initscripts-shr which are used only when you're building
SHR and shr-images, if you're still playing with fso- or default
console- iamges then IIRC normal initscript recipe is used and you have
to apply similar fix there..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7aZFcACgkQN1Ujt2V2gBzX1QCglL2dcOVe7v4+0trKPP0B61Mj
2KgAoKn8ikaAbJzmSJWVsDa4e8//7jdu
=G8z6
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--

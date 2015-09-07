Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E362D76104
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 15:08:25 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so91867675wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Sep 2015 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f5z4kLqKRIhChYtnGqEaIYlOkMNO/JpL6jp1tbBJhlk=;
	b=qNfgu3aJIL+rIH8tYa85M35DhbeULsBQ7BKuAOYumIdGTEzNkpD+i+LkNPMO0zgzLI
	9jxc2pfzWaTizZJ4Ct/pxDBvK/HYc/Qi+uwsZNkgkgJI0JgKnZCEfgNLTUhjz1FqSmNt
	ndViuJ7Yozrs0RRk6iUXEtvrI4joHUJT/uj1o3q7cRo+n6HPfKMtq5no1Zwv88vqi25o
	S5tgtokaD7curLuN2e0As9UCKjrOL+faJjqLLpBsPUB2vuw3LryFz2wv/M3H5GwWKpRm
	TvE6TPWa0XTR+wpCW28uDkRhlOxB90Yz4LQulyhA3Oss+/KfbAVh7IseBit1qJZ5y78S
	sMJg==
X-Received: by 10.180.75.176 with SMTP id d16mr35994115wiw.75.1441638505640;
	Mon, 07 Sep 2015 08:08:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	j7sm20572539wjz.11.2015.09.07.08.08.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2015 08:08:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 7 Sep 2015 17:09:06 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150907150906.GA2457@jama>
References: <55ED5556.2020904@topic.nl>
 <55ED8405.6050709@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <55ED8405.6050709@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Where is libunique?
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
X-List-Received-Date: Mon, 07 Sep 2015 15:08:26 -0000
X-Groupsio-MsgNum: 57233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2015 at 03:33:09PM +0300, Alexander Kanavin wrote:
> On 09/07/2015 12:13 PM, Mike Looijmans wrote:
> > Current meta-openembedded master fails to build with errors like this:
> >
> > ERROR: Nothing PROVIDES 'libunique' (but
> > .../meta-oe/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-util=
ity_2.32.0.bb
> > DEPENDS on or otherwise requires it).
> >
> > Searching for 'unique' in meta-openembedded and openembedded-core
> > reveiled nothing that would provide it, there's no recipe with 'unique'
> > in its name, nor any recipe that mentions the word 'unique' provides it,
> > even though I found various recipes that DEPEND on it.
> >
> > Where is libunique?
>=20
> You should check not just the current state of master branches of=20
> various layers, but also their commit history.
>=20
> libunique was just removed from oe-core and a patch was sent to add it=20
> to meta-oe. There is no way to keep the removal/addition perfectly in=20
> sync because the two layers are kept in separate repos and have=20
> different maintainers.

This case can be prevented by adding it to meta-oe before it's removed
=66rom oe-core (just like when someone is migrating recipes from meta-oe
to oe-core, they are first added to oe-core and then removed from
meta-oe).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXtqJIACgkQN1Ujt2V2gBxxngCfQUfH/vnURtZvY4irq3fHkHsh
O+YAnj3o461Uzqrcu+3e/qssYhIOXUB4
=hOYb
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

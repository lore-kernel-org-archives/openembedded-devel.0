Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 331E27FA3F
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 16:10:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so24666424wrh.5
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+64gmS97o/WCo5KZHVYdsuaYk9DGVwpF1AYEajDsG+I=;
	b=YUsmgq0Cu3VSjtcxcI1jfYpUgZQ7lCZWbSyH9GJgDOvlB4Es7+NpolqrAObvCB8d8i
	11jwEb21cPLVa/bV38Tu0XaWTsZioKq5uijRud2IyaM/9Gak62eOzTx98Q3bJFzO1+qS
	9GfLHYHsWFvK8NHPKkKNWZeMzHCpum9uyswYWON2bU9g9E4iCKoiYNnMK36lG9vl709e
	fTQarLN9FiFoY+ajObE6jlAXpolw21l8UW1jiHue6/9pYUyIg906FFglvR2C6s0FJcIC
	HVLVxqSN/5DoF4q55Wf+cKfV31OFtm7BS66PeE7uN8xmyDPMhlFZkLKg388AlHFG84iF
	cpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+64gmS97o/WCo5KZHVYdsuaYk9DGVwpF1AYEajDsG+I=;
	b=Z3pTGSm43hRPPCopkhBidKKmJ1hfusu0iyjzPo+/jc8vJ3HsIoKBKNcqOco2nJtgty
	pAGTwvfGGRDkOAEd6x1fHYXrmhEuIkBdWDAG6psFIE1qhTB8oE33JnWuyrFwZcIvrkCD
	QsaLY1jvQ2J34mjDAljg+LCKRstTSTZT8RzlfxWedFIOKyWI/Fanq0MKc7Q+9RHfrlrz
	7Qvwcs+r7El3qyXDACblEANoYApQKLn1fC5cx3NMar/eMfhhd74rQhNnH6/a8kFJR2+f
	Sn8WakDB5e/uQ6Kqfk3hiHlIVyqWKZA8vI4nM0zOwLOwId7PoZhYgjMySKIxcuXHEyW5
	LaQA==
X-Gm-Message-State: APjAAAXw7/9Ce5DpaGlDpoHLDDlQbY6mk2kItEsH3FYSdX/oKP5xB4sT
	SUTR/+d5aFnS4Hp7KDLjT0E=
X-Google-Smtp-Source: APXvYqwgPq89NvFCk+NhYCNpn/x9Pe3z0wBYjAKJau+iEICOW/vzfoqyi1hcrkgXzNrWlYfp5QiH/A==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr628654wru.318.1576080615792; 
	Wed, 11 Dec 2019 08:10:15 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id t1sm2935516wma.43.2019.12.11.08.10.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 08:10:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Dec 2019 17:10:13 +0100
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20191211161013.j7ghixp6kgu2inuq@jama>
References: <CANx9H-Am-T-LMMr+oWpR0KM70k0TYHF2v=GdqTem4Rj1ud6srA@mail.gmail.com>
	<CA+chaQeKxzeXzhzS5g3YcBcR7Tz6YYEj0bmBT=HF_2xQXu3UFg@mail.gmail.com>
	<CANx9H-C_xmQFSnt20S-SudsUovZHrnjxR+BEhKEXK_QwcK2xrQ@mail.gmail.com>
	<20191203112439.ioxlwkibvplewbnz@jama>
MIME-Version: 1.0
In-Reply-To: <20191203112439.ioxlwkibvplewbnz@jama>
User-Agent: NeoMutt/20180716
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: ANNOUNCEMENT: meta-python2 has been created
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
X-List-Received-Date: Wed, 11 Dec 2019 16:10:15 -0000
X-Groupsio-MsgNum: 81551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ud6h54tgzgtyax5x"
Content-Disposition: inline

--ud6h54tgzgtyax5x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2019 at 12:26:44PM +0100, Martin Jansa wrote:
> On Mon, Dec 02, 2019 at 08:10:17PM -0800, Tim Orling wrote:
> > On Mon, Dec 2, 2019 at 8:07 AM Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >=20
> > > Thanks
> > >
> > > It would be nice to delete all branches except master. Only master br=
anch
> > > makes sense now for meta-python2, right?
> > >
> > > " The stable branches were also kept, to make it easier to refer back=
 to
> > prior history
> > and allow developers to use meta-python2 only in their workflow."
> >=20
> > I can see use cases where a developer may want to replace meta-python w=
ith
> > meta-python2 and still be on a "stable" release. It also makes reviewing
> > what existed in which release much easier with cgit or git log --onelin=
e,
> > which I do VERY frequently. If this is contentious then the OE-TSC will
> > make the decision.
>=20
> But python2 is still in oe-core zeus and older so it should continue to
> be maintained there, right?
>=20
> Why should people add meta-python2 to zeus (or older) builds? If there
> are more security updates to python2 or any other recipes, then they
> should still land in oe-core or meta-oe/meta-python as well and
> maintaining the duplicates in meta-python2 seems unnecessary overhead.
>=20
> My understanding was that meta-python2 is just to help transition from
> oe-core/master when the python2 is dropped there.

I have to take this back (partially).

There are some python2 recipes which were already removed from zeus,
e.g. python-numpy:
http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D4e9659f=
24e2f699effadcbe378b6a746d77ccdbd
python-nose:
http://git.openembedded.org/openembedded-core/commit/?h=3Dzeus&id=3D9f07b28=
36405d86e869780f8f1ae00843eadc409

I've noticed these 2, because they are used by catkin and rospy in meta-ros

But I still don't feel well including this whole layer which duplicates
many recipes from oe-core/zeus or meta-oe/zeus just for these 2 recipes
(and making meta-python2 mandatory for every meta-ros/zeus user), so
I'll probably just import them to meta-ros.

Also neither of these is included in meta-python2, so it wouldn't help
in my use-case and before understanding what the zeus branch is for I
don't want to send patches to add them.

Or can you please explain what's the advantage of using
meta-python2/zeus? I mean including it in a build (not just for git
log).

On another topic, there is the compatibility issue caused by
python/python2 being removed from HOSTTOOLS in:
http://git.openembedded.org/openembedded-core/commit/?id=3D5f8f16b17f66966a=
e91aeabc23e97de5ecd17447

Is this something meta-python2 should help with the transition as well
or should we leave that to distro maintainers? Khem already fixed few
qt* recipes in meta-qt5 to use python3, but that's only in master branch
and people who might want to use newer oe-core with older meta-qt5 (e.g.
5.12 LTS version) will need to work-around this as well.

But I understand that changing HOSTTOOLS in meta-python2/conf/layer.conf
is quite controversial as it has bigger side-effect than just making
bunch of recipes available.

Regards,

--ud6h54tgzgtyax5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXfEU5AAKCRA3VSO3ZXaA
HEJYAJ4lrzOO6Pb7HERl9NfQ7QL3AXDPMwCePX9/y8sy6RMHNewhyBjkF8NqoBI=
=cNdW
-----END PGP SIGNATURE-----

--ud6h54tgzgtyax5x--

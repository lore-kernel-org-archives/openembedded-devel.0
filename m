Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2EA871CE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Dec 2016 11:09:04 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so3286236wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2016 03:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NxRQbdhA+7p5o540TufPIQbuTcu/aKzG2gZ6C9R7CgU=;
	b=fl6xbX+60JbjWKpo8HEyXpQt+m+sxnlow6eM9PtxM2XuX4ZLiW/J29W1MV6kJm5WKE
	MEpiVFAdDo6pelaGxg0k2KbjKq6uYIPZ6b3YnzonIgRHS2jQc5cdwXQ6E1/VFgh0YJPM
	0xrx395sU1FuPqj/VKzwKjJT/n9J1SLozZc+e9YN8/iysEYswhDCIRPJXZ83g+6uJjqs
	7e/iyy5nabplYWkm2TQr7/WI9yZ2oeZWyqkdi3So15UA+aLJZ4LXIpmFXU5oDqVi1fLl
	JmC17AxWScvRduJhb1oKj7rg3BFYh6q1ZLP73ijbnWCtbCl88tCkoDGH4H+CfJA2q2hf
	A9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NxRQbdhA+7p5o540TufPIQbuTcu/aKzG2gZ6C9R7CgU=;
	b=Q8KPFgzI5VhFcHknBpZp+j2hLQ2hI80ylMUl8AITGMuv3uqLmnVf9Mnm+1JxQXTTXI
	SdV561N5/5wcfgHMYe/vjyPLjnKRj3bLy8bVl0+fGZWoKu9MRXtvxMrPoxfAVdA5E36w
	/YiPTnWmfKEdNIBiGQ/bVn3xbW8pz9vKNFiXURBpNusPQNF2ktKJVooEBmdxFdtHDC5x
	kLU0tLvbSmejziBEfIgxTWQOrG2RQYnkCZYl99vmDKg+nsbE+n0GJwaFOcKYoBFQyUNS
	IVR/xljCkh+0I0PF+/LIPwQ2QSDfhBySgcJGEvn0naqrVOp+rgAutVYwdm53h+c3R2Yx
	qdww==
X-Gm-Message-State: AKaTC03pojvNYnPUMMjJ6DIY4BxcSDmn91NPXid3lMS9yHjqLX/GCmb58J6DD0hBFUcMgg==
X-Received: by 10.28.168.70 with SMTP id r67mr6097464wme.19.1481281745491;
	Fri, 09 Dec 2016 03:09:05 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e5sm20022340wma.12.2016.12.09.03.09.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 03:09:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 12:09:05 +0100
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <20161209110905.GA3327@jama>
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
	<53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
	<20161202083009.GB3721@jama> <20161202122923.GI2546@bill-the-cat>
	<3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <3a262190-a720-7901-5ab0-8023ecf2521f@linux.intel.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-devel@lists.openembedded.org,
	Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded patchwork git hook
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
X-List-Received-Date: Fri, 09 Dec 2016 11:09:05 -0000
X-Groupsio-MsgNum: 64272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2016 at 09:45:22AM -0600, Jose Lamego wrote:
> I'm looking into this right now. I've filed a bug for tracking:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759

This bug is already closed, but it still doesn't work, where is that
separate ticket?

It still doesn't work for meta-oe and for some reason it's also much
slower than it used to.

Took couple minutes to push just a few changes today and no patch was
updated on patchwork by the git hook, it used to take less than 1 minute.

OE @ ~/meta-openembedded $ git push origin master
Counting objects: 190, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (163/163), done.
Writing objects: 100% (190/190), 23.37 KiB | 0 bytes/s, done.
Total 190 (delta 122), reused 11 (delta 7)
remote: E: failed to find patch for rev 5f85256b46ba2d89bf27f9d3edd607c4b59=
cf389.
remote: E: failed to find patch for rev 142faee1734300a041fe16265cb63cd17fb=
742ae.
remote: E: failed to find patch for rev 3237c650e79c9046d0e1b94568a45d5c687=
6dbd2.
remote: E: failed to find patch for rev 9aace0c5667ab910078cfdd1e388e386f10=
6c074.
remote: E: failed to find patch for rev a1bdd5f40e15312bb4891cfa2e0d67d5900=
51d00.
remote: E: failed to find patch for rev 3d998f3745b90c6b4db5eaa739e4f976b5d=
5eef2.
remote: E: failed to find patch for rev 9cd05c16510cb0b6a09f72e5c7488d021a5=
5440b.
remote: E: failed to find patch for rev 4fc06fd23709e77a5ee05b1f0fde57d410f=
caba6.
remote: E: failed to find patch for rev cfde74c9dbe8eed65f430334b071aeba662=
0882d.
remote: E: failed to find patch for rev 6e0c24e9b3f9d430dec57f61f8c12c74bca=
5375d.
remote: E: failed to find patch for rev 9d40291916136ed3c4480102708e75d81cc=
77ef1.
remote: E: failed to find patch for rev 336692f24b5ac6c39b65ff3cb971d7bd353=
ea4e5.
remote: E: failed to find patch for rev 58ff22a356f8003720ca9fe13749744a2bd=
02d98.
remote: E: failed to find patch for rev f44e54116e0c1240aa3d1f1ac0ec098a342=
764f5.
remote: E: failed to find patch for rev 00f04936eb6d4eb3ae9b0102f87ca3265ce=
80bf1.
remote: E: failed to find patch for rev a838527ccfb33716ce7ff2c4b97c0beb13d=
4e654.
remote: E: failed to find patch for rev a749fbc3732f469ee0ec3e36275fb7e8fe6=
ebd19.
remote: E: failed to find patch for rev 84597e39c734032a3b84f2ab46c35ba88b0=
6cdf3.
remote: E: failed to find patch for rev a541eb88e4dabf506ff2b6c07e7ca19d34a=
316d7.
remote: E: failed to find patch for rev 4bb23bc4c444c79052ca6e79e5799d4c5db=
1e6da.
remote: E: failed to find patch for rev 6a8d57c0b7e243a22730f637295d620d08b=
975e0.
remote: E: failed to find patch for rev 39a71692eb686f6bf694969d2d068f55294=
846fa.
remote: E: failed to find patch for rev 13611ae96c9b2fab928eb794415f5bec633=
1abb2.
remote: E: failed to find patch for rev d356e03ced0873a0fe1a7a69cb05ee803e3=
63888.
remote: E: failed to find patch for rev 1b73d2c713938f10931749ece3a703ad900=
4376a.
remote: E: failed to find patch for rev f5a5a84d5c551a3b1daa2c8092279fbed9a=
be54f.
remote: E: failed to find patch for rev 8ea8fff79c91c985884859eca49769379e0=
6c313.
remote: E: failed to find patch for rev 3aac48c722fa836e04e95a495d758b8ee0d=
0cdda.
remote: E: failed to find patch for rev d83612a1e750b98b1c537fada777d615d9d=
6628a.
remote: E: failed to find patch for rev d9b5870edaddee69612dada2aa4bc2d8c3f=
70f44.
remote: I: 0 patch(es) updated to state Accepted.
remote: Sending notification emails to: openembedded-commits@lists.openembe=
dded.org.
To git.openembedded.org:meta-openembedded
   18d518a..d9b5870  master -> master


>=20
>=20
> On 12/02/2016 06:29 AM, Tom Rini wrote:
> > On Fri, Dec 02, 2016 at 09:30:09AM +0100, Martin Jansa wrote:
> >> On Wed, Nov 30, 2016 at 12:41:20PM -0600, Jose Lamego wrote:
> >>>
> >>>
> >>> On 11/29/2016 07:50 PM, Khem Raj wrote:
> >>>>
> >>>>> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.intel=
=2Ecom> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 11/29/2016 02:43 PM, Tom Rini wrote:
> >>>>>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
> >>>>>>
> >>>>>>> Hi folks,
> >>>>>>>
> >>>>>>> Martin just brought to my attention that the git hook for the=20
> >>>>>>> meta-openembedded repository that's supposed to update patchwork =
still isn't=20
> >>>>>>> working and hasn't done so for a very long time. I thought we'd f=
ixed this so=20
> >>>>>>> that merged patches get marked as "Accepted", but at least for me=
ta-
> >>>>>>> openembedded it seems like that's not the case.
> >>>>>>>
> >>>>>>> Jose / Michael - can you look into this if you haven't already? P=
lease let me=20
> >>>>>>> know if you need any help.
> >>>>>
> >>>>> The git hook was configured to update OE-core only, Michael will he=
lp us
> >>>>> to include meta-openembedded.
> >>>>>
> >>>>
> >>>> There are more repos using patchwork beyond OE-core and meta-opemebe=
dded
> >>>> please enable it for all of them  as well.
> >>>>
> >>>
> >>> Now all of the projects are enabled to receive automatic updates from
> >>> the git-hook (Thanks Michael). Please let me know if any undesired
> >>> behavior is detected.
> >>
> >> Still doesn't mark anything as accepted:
> >>
> >> OE @ ~/meta-openembedded $ git push origin master
> >> Counting objects: 293, done.
> >> Delta compression using up to 8 threads.
> >> Compressing objects: 100% (257/257), done.
> >> Writing objects: 100% (293/293), 48.83 KiB | 0 bytes/s, done.
> >> Total 293 (delta 179), reused 68 (delta 18)
> >> remote: E: failed to find patch for rev efd3696e70a6603f1a45faa4a17243=
3514f0a487.
> >> remote: E: failed to find patch for rev 8c720146b718aae3bc194621f3e095=
cf11ecb2ed.
> >> remote: E: failed to find patch for rev fc2fc9097b2fa437d4af0338e41869=
2b4dd6c989.
> >> remote: E: failed to find patch for rev 533826b7652a2cf86ca7b665c25b98=
c89afc266e.
> >> remote: E: failed to find patch for rev 6afb85d29286aaa4cdd892460f6adf=
68912917a5.
> >> remote: E: failed to find patch for rev a7f3ec87f957ff35b8a853cd0e04c6=
b18bac0ece.
> >> remote: E: failed to find patch for rev 877e52fd75c7d3b88add94691df3be=
b5e0c54529.
> >> remote: E: failed to find patch for rev 2f6e45baba961629bfe023599144be=
6cfcd45728.
> >> remote: E: failed to find patch for rev 86fed80d80bc33f0a3cdbf719c00ee=
5f05ed4d19.
> >> remote: E: failed to find patch for rev 41d7bac5d50091cab835eac0a5eaa6=
c431fb2023.
> >> remote: E: failed to find patch for rev a85e12928131fce057f777daa76a7f=
0c75cffa14.
> >> remote: E: failed to find patch for rev 45837e6c567b1b9ff9d152a7e2a752=
488d313455.
> >> remote: E: failed to find patch for rev 119e75e48dbf0539b4e44041790145=
8ffff79b38.
> >> remote: E: failed to find patch for rev a4251575f41fa5aafe5072e562497b=
05c11b6702.
> >> remote: E: failed to find patch for rev b6ea2c0bacb21b83bae3605ef4da08=
0de0cad15e.
> >> remote: E: failed to find patch for rev 4580e5ae201b320ed407eae26f5865=
5b8768b387.
> >> remote: E: failed to find patch for rev c476219e845934f767927e81fe60db=
aa157df9ee.
> >> remote: E: failed to find patch for rev 0288b204f3c12af1561218fa0cfcdf=
b9a5508b47.
> >> remote: E: failed to find patch for rev 5596b52d64c30d8e66ec6e379cf69a=
9fc9407fb1.
> >> remote: E: failed to find patch for rev 24e51a6a106bc10a8838b23e4bf9ea=
6304314bca.
> >> remote: E: failed to find patch for rev aac6bf8bf911c3f14ff9dce08f0f01=
1838f5a426.
> >> remote: I: 0 patch(es) updated to state Accepted.
> >> remote: Sending notification emails to: openembedded-commits@lists.ope=
nembedded.org.
> >> To git.openembedded.org:meta-openembedded
> >>    761639b..aac6bf8  master -> master
> >=20
> > I don't know how far apart the freedesktop.org one is from ozlabs but
> > when I was seeing that problem locally as part of what I was working on
> > it was because of some missing host deps (that are now not required).
> > FWIW you can pretty easily turn the hook into a script to run manually
> > and sh -x it to see _why_ it's not hashing out those patches.
> >=20
>=20
> --=20
> Jose Lamego | OTC Embedded Platforms & Tools | GDC
>=20




--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEqQ0AAKCRA3VSO3ZXaA
HF7CAJ9WMRxA/OhX7mMyajgQ2J3k6qUE8wCdFY8JUrZ0UUFTPb2yGYo13WGwD6c=
=w+9H
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

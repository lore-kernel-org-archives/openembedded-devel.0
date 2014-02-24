Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 66FE66E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:41:52 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so345688pbc.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:organization:user-agent
	:in-reply-to:references:mime-version:content-type;
	bh=T84TIBWU3PxAv/Jsd41ORdUtjEjMJn+QOEOmQ3uNvk0=;
	b=RaZfaH+nN6mu0zxa+qT+1C2JVBQpUsB8UrexXekB2XSGAPP6vD/H4nnpk1QXC+rd5/
	hNk1Zi4KiSznGd7NJklysM5pD3yD9YrMizwnAdGJmeRu4nzcWHL86TbICPKPOLvfgL+T
	adifTkfiUH19SD0jgqe0BfzPwtDHzVm1vKCMOdLG5EoEORFdw9lU+9bjwhLT0T8220mH
	gwKo32+Oy66lH6LvbFZAzTBsT40o1EV6ACZc1Br5Z14jSBJSxc1+N0daAlyWKxu/VqjA
	zjWWb0Uviu1DR5aAO3mMkUk5nCmDgPpvnBCZF2+BnCfSPoif2wmmUd6JudLlLHVcdcMl
	GH8A==
X-Received: by 10.68.189.100 with SMTP id gh4mr962804pbc.21.1393263713308;
	Mon, 24 Feb 2014 09:41:53 -0800 (PST)
Received: from leo.localnet (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id oz7sm1953205pbc.41.2014.02.24.09.41.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 09:41:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 24 Feb 2014 09:41:45 -0800
Message-ID: <12554563.r7d5IAgdqr@leo>
Organization: Himvis LLC
X-Face: "r2#Te[Vd[r&41P}v3a{\jUcEEz4&|KRK5|)5HC&!!$q5nGWwa.D_?oxdsx1~me-5G$n}g
	*fLiTNxg"wR4~UUl3NN~Ru/un!"UQt%M5%+(NUYxFxw(vcF.@Poe\&K9jFrC'v=A/;
	KGGF 7?b>`5Ehi,RB\-_t{J;
	bdUatO'v?{A}hIsi?tJg3rk.E"EM-VhpPxUH-'5$&/Ap*i!CCTh
	L:,oj1O_K7FFGdo/^i4IL<_ZwA]W#9hRXp&T$+SYBB~7k\#:+NnU*FQ7TjQE~mVm<P
User-Agent: KMail/4.12.2 (Linux/3.13.0-12-generic; KDE/4.12.2; x86_64; ; )
In-Reply-To: <33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<7A897146-8E97-4991-8003-2FFA5E6E866C@gmail.com>
	<33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Tobias Blom <tobias@blom.org>, openembedded-devel@lists.openembedded.org
Subject: Re: python-netifaces in oe?
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
X-List-Received-Date: Mon, 24 Feb 2014 17:41:53 -0000
X-Groupsio-MsgNum: 48313
Content-Type: multipart/signed; boundary="nextPart10557666.5yFvMrnhIZ";
	micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart10557666.5yFvMrnhIZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, February 24, 2014 12:19:07 PM Paul Eggleton wrote:
> On Sunday 23 February 2014 22:26:34 Khem Raj wrote:
> > On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> > wrote:
> > > We provide a recipe for python-netifaces in the meta-ros layer as well. In
> > > fact, a quick search on the OpenEmbedded Layer Index [1] reveals that
> > > meta-ros and meta-openstack both provide a recipe for python-netifaces.
> > > With your use case and recipe, we would have now three recipes. So, I
> > > suggest to unify all three recipes and come up with the best (complete)
> > > recipe from these three versions and add them to the meta-oe layer. We
> > > then can remove the duplicate recipes in the application layers.
> >
> > If these layers have dependency on meta-oe then please add the recipe there
> > and remove from other places.
> 
> There has been some discussion about creating a meta-python layer (within the 
> meta-openembedded repository) for these kinds of recipes. I think the time has 
> come to actually do that, before we add any further python recipes to the 
> general meta-oe layer. Could someone send a patch to create meta-python?

meta-python is good. I always worry about layer being maintained, in fact I have some python
3 extra recipes that I wanted to contribute which dont belong to core.

--nextPart10557666.5yFvMrnhIZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEABECAAYFAlMLhFkACgkQuwUzVZGdMxRwiACeO8AHymPMOxTkJR7qzxzlScNa
5iQAmgJRDQDFvgZJ9MbKZd0dfj8DjoWC
=7CER
-----END PGP SIGNATURE-----

--nextPart10557666.5yFvMrnhIZ--

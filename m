Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A6F1060167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:35:27 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so928846eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 04:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XFyo1f8woxgKQc1cckMSQd8hizat4+6YP8JtxhZm3mo=;
	b=gcpuk9+ZYe0EA5xfzG0gsrYIAdKqM6GH9+GEs1j8uRLZRw4ibK7rN3ipUqS7UuXYAN
	sQ0CFHkxfi7vYcx91s4rXS5afnTn0E3yuGn5lx2Mw8MXLftLWyK7q2pZIwKKHRetHFn7
	cfDco06XkqbzLxmaV7fA6mkiAnbn8pkShQ5EicSkMvRu8KWm4oD6wAXG0nDSLzoxHQp2
	H+qEBm/RuaV7vzOiJFOhxmrDT/UiqvSD8+EHQnvUnDKBAi7JGhu3Q92ctJPEbyKPn2jA
	h9LiuYOy//VVS57RjfXipdv6gYUHQ0puFlo5Z/2gLpufTz4K06cKOhxy8h0KjoX0ZRod
	3e+A==
X-Received: by 10.15.61.134 with SMTP id i6mr33357eex.106.1393245327530;
	Mon, 24 Feb 2014 04:35:27 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a2sm48213310eem.18.2014.02.24.04.35.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 04:35:25 -0800 (PST)
Date: Mon, 24 Feb 2014 13:35:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140224123516.GD26981@jama>
References: <94BAA6DD-BBE2-46CE-8248-E8432BE9F242@blom.org>
	<530AE55F.9090108@oss.bmw-carit.de>
	<7A897146-8E97-4991-8003-2FFA5E6E866C@gmail.com>
	<33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <33174762.dysyrZqJd4@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Mon, 24 Feb 2014 12:35:30 -0000
X-Groupsio-MsgNum: 48303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 12:19:07PM +0000, Paul Eggleton wrote:
> On Sunday 23 February 2014 22:26:34 Khem Raj wrote:
> > On Feb 23, 2014, at 10:23 PM, Lukas Bulwahn <lukas.bulwahn@oss.bmw-cari=
t.de>
> > wrote:
> > > We provide a recipe for python-netifaces in the meta-ros layer as wel=
l. In
> > > fact, a quick search on the OpenEmbedded Layer Index [1] reveals that
> > > meta-ros and meta-openstack both provide a recipe for python-netiface=
s.
> > > With your use case and recipe, we would have now three recipes. So, I
> > > suggest to unify all three recipes and come up with the best (complet=
e)
> > > recipe from these three versions and add them to the meta-oe layer. We
> > > then can remove the duplicate recipes in the application layers.
> >
> > If these layers have dependency on meta-oe then please add the recipe t=
here
> > and remove from other places.
>=20
> There has been some discussion about creating a meta-python layer (within=
 the=20
> meta-openembedded repository) for these kinds of recipes. I think the tim=
e has=20
> come to actually do that, before we add any further python recipes to the=
=20
> general meta-oe layer. Could someone send a patch to create meta-python?

I don't mind accepting patch for creating meta-python layer, but the main r=
eason
for it (python-numpy, python-nose, python-mako) were already merged into
oe-core before this question was answered :/

http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0880=
89.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLPIMACgkQN1Ujt2V2gByZqACffrq6gDdjwYrf3DUygxk2pe1f
pfkAmQH7fa89q379OQCCu5GJFkgPKF4s
=pkdP
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--

Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Prycg-0000Q7-Tg
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 21:14:15 +0100
Received: by eye27 with SMTP id 27so822406eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 12:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FYK1WGaec+y8M7H7paJ8+LUCpjU3rZHsExXxtRJhyvc=;
	b=mnoq54dX2df3Wy6IFBWctM+hO66ex86qd9eb1PbQcpFIQYt5Yf9aN8ATv4a9Sr3aBi
	kqweS4KsTv4K5D7wPV6SdGIhN6xeL1YrplfXcLZ/uKPfDQl6Wa3EPElrKVAdW7WExiR9
	umHG041xENQk88+SdUVD7E4+o5rduBk4tOHW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vHkD/deZ50ltQ2UVkQnhriWkR3w1nJVWcvVjj5KdtWcm6c/fGlEE+C/Y/lW4EzTmdm
	+t0t6qUAI35eBiw8ULFL2FUekL7q95KQv2mRi32lRxMCRd6UkmvilaBXkoYGED+JZNQg
	bYCCvq4gYno6BbXXG7NhEJxiKF7Uoa1hIKZvs=
Received: by 10.223.114.203 with SMTP id f11mr3908311faq.20.1298405477126;
	Tue, 22 Feb 2011 12:11:17 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e6sm3262922fav.8.2011.02.22.12.11.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Feb 2011 12:11:15 -0800 (PST)
Date: Tue, 22 Feb 2011 21:11:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110222201107.GB3970@localhost.jama.net>
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
	<4D63F7F9.7000804@eukrea.com> <4D63FF5C.30400@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4D63FF5C.30400@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Tue, 22 Feb 2011 20:14:15 -0000
X-Groupsio-MsgNum: 29576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xgyAXRrhYN0wYx8y"
Content-Disposition: inline

--xgyAXRrhYN0wYx8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
> Hi,
>=20
> On 02/22/2011 06:52 PM, Eric Benard wrote:
> > On 22/02/2011 18:22, Mickael Chazaux wrote:
> >> I have a hard time figuring out why bitbake seems to mix versions of
> >> ppp... Any ideas?
> >>
> > strange, which distro, git tag, bitbake version are you using ?
> >=20
> > Both bitbake ppp-2.4.5 & bitbake -b
> > openembedded/recipes/ppp/ppp_2.4.5.bb work fine here (angstrom 2008.1,
> > armv5 target, bitbake 1.12.0).
>=20
> I don't think this has anything to do with ppp. I faced the same issue
> with a local recipe, of which an older version had been built before.
> When packaging, the old version was used. A new workdir was created for
> the old version during this step and the resulting packages were empty.
> No recipe existed for this old version at that time, i.e. PR had already
> been increased to 1.0, but 0.0 was used by bitbake.
>=20
> In the end, I deleted bitbake's cache and all files matching the
> package's name to get rid of the annoying problem. I think there were
> pstage packages of the old version lying around.

This wrong behavior is quite common ie after changing PACKAGE_ARCH, see:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04=
280.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xgyAXRrhYN0wYx8y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1kGFsACgkQN1Ujt2V2gBx6bgCguo+8at7b9WsrvEUy4x2ScAs8
kF0AnR/fKqxZKvb0d/wVsoAQbFC1EEW+
=E/c9
-----END PGP SIGNATURE-----

--xgyAXRrhYN0wYx8y--

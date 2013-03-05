Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UD15I-0006Tn-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 00:15:48 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so5094825pbc.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2013 14:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RuxWKaxZUyT4mxbOGME5U+vpmkOi2+n/6OvWcD2Xh/g=;
	b=NuzYggNneoetmpYqf75Lf4QilYccvZM3oPraTn0K3GfWCRaikK7WgQ8F7jR+3P3GfG
	Lt07aul2cn0Rr+VAZmU4IqKOBdHUMBzcMUab+57O4hLqAt3vwCDAVnu54VypsKkhk6sn
	k3b4iW92KkMFoi5bQPjMjNnTZ9Egfio43paQpPR0VS0aRYY1oHQbQRKorPmQGGYMeJ2m
	OzaqSdIKKH8f6TT1uhyd+I9s2po9ulZGRT1yN0s8UHmnzY3I4LbAG7kpbJ8OMUA3XTDn
	P84CkC81dqZ7k2zg0x1mtLHIn8Lk9yJrC/N/qtrGoFPoJ4OTI4Cx50onwpaUHlnyUdJa
	Fn2g==
X-Received: by 10.68.49.167 with SMTP id v7mr40253748pbn.131.1362524357905;
	Tue, 05 Mar 2013 14:59:17 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ri1sm28510438pbc.16.2013.03.05.14.59.14
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 14:59:16 -0800 (PST)
Date: Tue, 5 Mar 2013 23:59:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130305225907.GB14869@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Tue, 05 Mar 2013 23:15:48 -0000
X-Groupsio-MsgNum: 43393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=FCller wrote:
> On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > good old meta-systemd should now parse again,
> Thanks - will come back to test HEADs soon.

But be aware that I've fixed only parsing of avahi and wpa-supplicant.

I haven't tested it properly in runtime because my upgrade path is a bit
broken (because I was building images with khem's patches for a while to
test other stuff) and even clean build with failed to boot with
qemux86-64 and I don't have time to debug it now.

> > I wont apply this 2 commits
> > until systemd discussion in oe-core is finished and future of
> > meta-systemd decided.
> >
> After systemd regression is worked around yocto 1.4 release regression
> is knocking at the door...

yes :/

If we need to maintain meta-systemd bbappends for upgrade path we can
also maintain them with PN-systemd packages and good old systemd bbclass.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE2eLsACgkQN1Ujt2V2gBxwigCdE6d8HGPq4LDfb/4jh6vff9lp
LCcAoIn4vK8bi87njd1WqHiyrAY+MrHV
=xwOA
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--

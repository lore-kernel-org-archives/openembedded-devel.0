Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PsBVF-0000EI-A5
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 10:59:25 +0100
Received: by fxm8 with SMTP id 8so3411071fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 01:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sJM7R8SYReDgqP3uw+cCEOZRocieWf1S51+ppF+Vz7A=;
	b=oE+rTamEsv3Dun2/1ynkv35X0GoEQWH5atKNzXjphPGCrDvjTVjp4lKESGmouE+crx
	fg8YgLJ3qSJ4WoRDL1ezEofvlS1xrhpY1P56i+693g1ZYr+icCF4KWo39Wi6Hp4vpyF7
	pOI5XArkJGGwB0vfyu6UH5qopPNY5oeo5LwBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=QBelIYYd6Lo5YTWvvNxIqZatcp3LRiE7c8Cw1fo7UGo5xVgMQbX6/ahtrcbiV5Nnxe
	IDr07G65xTyKof7vsYl1PPtwTimlL40q/V4J8/GZyGUGrVnLEt67ftjMLVJpSCA2DSc/
	SwNf4GAxCNR6+fl0V5q7Y/LoTQdN+5VnNMPBI=
Received: by 10.223.71.195 with SMTP id i3mr758403faj.149.1298455082973;
	Wed, 23 Feb 2011 01:58:02 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r24sm2525907fax.27.2011.02.23.01.58.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 01:58:01 -0800 (PST)
Date: Wed, 23 Feb 2011 10:57:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110223095754.GB3478@jama.jama.net>
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
	<4D63F7F9.7000804@eukrea.com> <4D63FF5C.30400@opendreambox.org>
	<20110222201107.GB3970@localhost.jama.net>
	<AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Feb 2011 09:59:25 -0000
X-Groupsio-MsgNum: 29593
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 10:19:05AM +0100, Mickael Chazaux wrote:
> Hi,
>=20
> 2011/2/22 Martin Jansa <martin.jansa@gmail.com>:
> > On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
> >> Hi,
> >>
> >> On 02/22/2011 06:52 PM, Eric Benard wrote:
> >> > On 22/02/2011 18:22, Mickael Chazaux wrote:
> >> >> I have a hard time figuring out why bitbake seems to mix versions of
> >> >> ppp... Any ideas?
> >> >>
> >> > strange, which distro, git tag, bitbake version are you using ?
> >> >
> >> > Both bitbake ppp-2.4.5 & bitbake -b
> >> > openembedded/recipes/ppp/ppp_2.4.5.bb work fine here (angstrom 2008.=
1,
> >> > armv5 target, bitbake 1.12.0).
> >>
> >> I don't think this has anything to do with ppp. I faced the same issue
> >> with a local recipe, of which an older version had been built before.
> >> When packaging, the old version was used. A new workdir was created for
> >> the old version during this step and the resulting packages were empty.
> >> No recipe existed for this old version at that time, i.e. PR had alrea=
dy
> >> been increased to 1.0, but 0.0 was used by bitbake.
> >>
> >> In the end, I deleted bitbake's cache and all files matching the
> >> package's name to get rid of the annoying problem. I think there were
> >> pstage packages of the old version lying around.
> >
> > This wrong behavior is quite common ie after changing PACKAGE_ARCH, see:
> > http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/m=
sg04280.html
> >
> As I often switch architectures (arm, x86) to work on different
> boards, should I use a different TMPDIR for each?

That should work fine (multiple machines per TMPDIR), I'm using that too
for armv[457].

What I meant are changes in recipes like
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dda43f76972fc=
01aca8e07d2f1a9a242546f8123d

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1k2iIACgkQN1Ujt2V2gBzTBACeLlZA4ThSNn9szAoTsVfcTSi4
XlUAnRAvvdwzNyUN+2QdNNxUCjfdoJCo
=2xeg
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--

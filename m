Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USmqm-0001Nn-Sv
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 13:18:03 +0200
Received: by mail-pa0-f41.google.com with SMTP id kx1so1524261pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e2upOb68FS4ZyZ+/66h7Qujp9AA8FniIv1pN7wacksE=;
	b=oWvwyVL3Zuqb1ISqEGr0GkA0uqgEFG/Fg14TpmWCsx08Q31B7181ydl3hTLvkgLSaa
	Kx0+rr7Y0yvM9B5w+s8l0U6RVgyzn2ptyOHvpdvE4iRdwQlsibx6mfMRR8iVx/vCBQno
	QqkhHA9+jel8WCcABWU96ZHm0DBJ8FZbDGxte0bZcKPQ3oOfr1mCqWjNaJJJkQUL7d8r
	2wZ5Cesl7tQ4fvS7IbbgVSEaS+VNkg64WBOeZ8x0JGKMV8JsBi5enoOkU2Kc81Ey216q
	+XWqy3UBPUbCtzRxnOOltBMLvIsAUZWNKE9Ht54k/+50AzpyG3VOLWoNe+bc5A1/y+VW
	Ztmg==
X-Received: by 10.68.254.3 with SMTP id ae3mr13009096pbd.82.1366282827266;
	Thu, 18 Apr 2013 04:00:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ts3sm9538583pbc.12.2013.04.18.04.00.24
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 04:00:26 -0700 (PDT)
Date: Thu, 18 Apr 2013 13:00:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418110026.GO26007@jama>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
	<CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
	<20130418082201.GL26007@jama>
	<CALbNGRTfQh7iBf=8XceW1mJ2mCttp4ccB77p9o9LtMkS0kMYUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTfQh7iBf=8XceW1mJ2mCttp4ccB77p9o9LtMkS0kMYUQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome 2/2] libnotify: update to 0.7.5 and drop libnotify3
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
X-List-Received-Date: Thu, 18 Apr 2013 11:18:08 -0000
X-Groupsio-MsgNum: 44314
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zipuvUKAEymKn2g"
Content-Disposition: inline

--6zipuvUKAEymKn2g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 11:53:45AM +0200, Andreas M=FCller wrote:
> On Thu, Apr 18, 2013 at 10:22 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, Apr 18, 2013 at 08:58:24AM +0200, Andreas M=FCller wrote:
> >> On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > Op 17-04-13 15:49, Andreas M=FCller schreef:
> >> >> removing tests drops dependencies on gtk
> >> >>
> >> >> Tested by:
> >> >>
> >> >> * building nautilus3 (the only recipe found depending on libnotify3=
) *
> >> >> running xfce-based image and checked notififations
> >> >
> >> > The problem with libnotify was (is?) that it removed some API that G=
NOME 2.x
> >> > depends on and later introduced API that GNOME 3.x depends on, hence=
 the 2
> >> > recipes. Do all the GNOME 2.x bits build against this new libnotify?=
 The
> >> > error was a build break, so it things build, they are likely to work=
 :)
> >> >
> >> > regards,
> >> >
> >> > Koen
> >> >
> >> Martin's world shall let us know
> >
> > My slaves are looking forward to serve..
> >
> > It's in queue, but still jenkins is 40+ hours behind, so I'll let you k=
now later..
> >
> I started and additional test. At least zenity fails for API change
> but seems not a big deal to fix. Will send follow up patches.

I guess that to test this properly I should cleansstate both libnotify
or do build from scratch, because I cannot know which one won
into-the-sysroot race during last build.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zipuvUKAEymKn2g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFv0koACgkQN1Ujt2V2gBy8qQCeLVaDpWQnSaNjRw9JTlNEG49V
KUYAnibq20AO1GvV60IFcezDZZnZXFY2
=E5gN
-----END PGP SIGNATURE-----

--6zipuvUKAEymKn2g--

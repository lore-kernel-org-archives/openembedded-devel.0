Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USkNM-0001AD-FX
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 10:39:29 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1140595eaj.37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h5XTovBLG8MOZXCbTxYISlD4dygCXOMAFIhoQ3tMgvw=;
	b=UJa2KnUhhjRpmhFcRtW59WxIyryIUYKxDYKU26YedsrEVUuNYmoInh7wMdhsu20M/0
	iSYpvUoLr5e/F2PE9oCzFGmOe2PBv2u5rsZ/oOvQVox7gAEEpYivQbH/jBkwyJbpQYVc
	Lw4xsiSZpkJYsoOWnP9o3oMi/yY8VE/XxcnCbZCQ6jfL7obOBAY8DLca4J0tdVEqIX/i
	AJzE2LT3//90DLmhhCs6WtAPx7RdTwIdbVDGNJ8noVbquF4c4kHOYhOZdY8N5Y2zc9NR
	Z0fIFI1vFdKAXeaLMbwZmD/hzgAVFYP7fTM+3TzVm/bmDk9i9hDLbeQHZBLaSnracB6t
	G/YA==
X-Received: by 10.15.22.199 with SMTP id f47mr27616144eeu.11.1366273315326;
	Thu, 18 Apr 2013 01:21:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ch6sm13917795eeb.17.2013.04.18.01.21.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 01:21:54 -0700 (PDT)
Date: Thu, 18 Apr 2013 10:22:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418082201.GL26007@jama>
References: <1366206552-14452-1-git-send-email-schnitzeltony@googlemail.com>
	<1366206552-14452-2-git-send-email-schnitzeltony@googlemail.com>
	<kkm9v0$mrc$1@ger.gmane.org>
	<CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRXN5L-TmjUW9e4MxKi-a_jgX=2p17xXPzS+-nt5Q4HUQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 Apr 2013 08:39:29 -0000
X-Groupsio-MsgNum: 44306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline

--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 08:58:24AM +0200, Andreas M=FCller wrote:
> On Wed, Apr 17, 2013 at 4:01 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 17-04-13 15:49, Andreas M=FCller schreef:
> >> removing tests drops dependencies on gtk
> >>
> >> Tested by:
> >>
> >> * building nautilus3 (the only recipe found depending on libnotify3) *
> >> running xfce-based image and checked notififations
> >
> > The problem with libnotify was (is?) that it removed some API that GNOM=
E 2.x
> > depends on and later introduced API that GNOME 3.x depends on, hence th=
e 2
> > recipes. Do all the GNOME 2.x bits build against this new libnotify? The
> > error was a build break, so it things build, they are likely to work :)
> >
> > regards,
> >
> > Koen
> >
> Martin's world shall let us know

My slaves are looking forward to serve..

It's in queue, but still jenkins is 40+ hours behind, so I'll let you know =
later..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFvrSkACgkQN1Ujt2V2gByr4ACgpTNEOqCmEzyN3JO0dqjSZiHj
M58An3cPn64JcykZCaXCdLk5oI66TWRW
=d8wT
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--

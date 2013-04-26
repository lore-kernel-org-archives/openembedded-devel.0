Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVeWa-0002LF-33
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 11:01:03 +0200
Received: by mail-pa0-f53.google.com with SMTP id bh4so2366435pad.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tir8wmDMKKKmjxehQCTzcskpS1I6RIqaiiktWQM+EvU=;
	b=tlaf6q/+H/rBrO0gUT/P5CwPYdLxCHMRkvF/nDUi6viJ+OCpmGdR7mlqHRNfCbbZ78
	yDIy4Cpm/+Y+li1pS6abcAWTmGw+jVa8GjTGmLv+lJw5/77fJS8IrGRbKU7CE/moUqRo
	Hu4wpvLeMu3u4lOV2XoD6cFxQVikHvqgDcAZyhClKtUEc9kCT2o7F8drWnKXyY0Ey1rJ
	GM3JwbRhbveo2UNAIiRLV8Gi3ouzepFz2EPcUg4wVT410YasLpmeeHklGXA128C8uKsd
	KS7GoU1D/qHdtoYvSr9djv8q1y+H2Wq/VEYAwnfcmzzjp8uTkm2RLTZBOHLpTTbKR8I/
	UU9g==
X-Received: by 10.68.110.133 with SMTP id ia5mr34789028pbb.111.1366965794745; 
	Fri, 26 Apr 2013 01:43:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wl5sm11832202pac.18.2013.04.26.01.43.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 01:43:13 -0700 (PDT)
Date: Fri, 26 Apr 2013 10:43:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130426084324.GL5538@jama.dyndns-home.com>
References: <1366816884-32023-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSGhfmbBwUo-y4nTvHjnn_FoMjNH=ps83sTKbZUkyucaw@mail.gmail.com>
	<kldcsp$uep$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <kldcsp$uep$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] lxdm: fix postinst-code
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
X-List-Received-Date: Fri, 26 Apr 2013 09:01:13 -0000
X-Groupsio-MsgNum: 44431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lR6P3/j+HGelbRkf"
Content-Disposition: inline

--lR6P3/j+HGelbRkf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2013 at 10:12:14AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 26-04-13 09:50, Andreas M=FCller schreef:
> > On Wed, Apr 24, 2013 at 5:21 PM, Andreas M=FCller=20
> > <schnitzeltony@googlemail.com> wrote:
> >> Exiting postinst code leaves systemd.bbclass offline postinst code
> >> unexecuted, causes postinst not to finish at first boot (lxdm.service
> >> is not aliased to display-manager.service -> started much too early)
> >> and is not neccesary: language preparation can be done offline.
> >>=20
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com> ---
> > This unbreaks 1st boot postinst issue - so I would like to see it also =
in
> > dylan (of course also in master :).
>=20
> \o/

Not sure what this ascii art means, but if it's something about pushing
stuff through narrow bottleneck, then I plan to push more stuff to
master after this jenkins job is finished:
NOTE: Running task 6924 of 26342

I was trying to test at least qemuarm/qemux86 before branching and there
was a lot of rebuilds... More ACKs on patches on ML helps a lot.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lR6P3/j+HGelbRkf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF6PiwACgkQN1Ujt2V2gBzkiQCfT13lCVt8aARD9WaiismOcjq6
jewAoJpxlVDGaXJm8SmYppmnarzq1g5a
=pMAv
-----END PGP SIGNATURE-----

--lR6P3/j+HGelbRkf--

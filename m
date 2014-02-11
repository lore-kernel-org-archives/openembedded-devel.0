Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B42A6E71A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 06:17:29 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so7295141pbb.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 22:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=8YTlgve6rYKrtiUtGXFrxL87AGeLCM0MNdvL/8oe+Yk=;
	b=Gd8o0JzUWFH63gmUwMyZgG/5BQfta8EUzOME09OU2er0509mKgnJDeXhusH2GsDtKm
	MKiWlJf199Xz3IP5ShHECkKmb+51c0aLtpjH3CgX/Yxc0ccFQPYiEfXS30zSMkd1AhNp
	Qg5UXLZ+CKsIgZZHme/3o4QXiEEAj0+FXpz4C3cAFE4Spk02cC2eO02ouUgmi/FPPGe1
	fvn1+gkWaV9dwjmgM0tjeJPiDk5inmPlTiLjxllY3lwMS9JOXUsM/E/5kl8FWoFXMqY5
	0Mq9Zhb0X2IZ8svYGFI1cJ2B0MqI88Ft/NbD3g1V9RrnTMa0PWifWVlvRolCAWbe4hzi
	C2Wg==
X-Received: by 10.68.130.234 with SMTP id oh10mr42071564pbb.136.1392099449754; 
	Mon, 10 Feb 2014 22:17:29 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	qw8sm49015189pbb.27.2014.02.10.22.17.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Feb 2014 22:17:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMCfZKFNHREoyX9L2xbwYAoxrcUq1R8-=74u2V1Aiw45QmkC6g@mail.gmail.com>
Date: Mon, 10 Feb 2014 22:17:27 -0800
Message-Id: <2E2B5ECF-3678-407E-A9DE-58A4F3B271B0@gmail.com>
References: <CAMCfZKFW8mb1d=Q2eJ9mRx8xprbN2dHUQJwZvG-UkUF5Q6TRXw@mail.gmail.com>
	<CAMCfZKFNHREoyX9L2xbwYAoxrcUq1R8-=74u2V1Aiw45QmkC6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1827)
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 06:17:29 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Feb 10, 2014, at 5:16 AM, Diego Sueiro <diego.sueiro@gmail.com> =
wrote:

> Folks,
>=20
> To workaround the screensaver compilation error I've added =
"--disable-rsxs"
> on EXTRA_OECONF.
>=20
> Looking at "xbmc/screensavers/rsxs-0.9/configure" It's possible to =
pass
> "--disable-euphoria" option to configure.
> How can I accomplish this from xbm_git.bb recipe?


EXTRA_OECONF +=3D =93--disable-euphoria=94 ?

>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br
>=20
> /*long live rock 'n roll*/
>=20
>=20
> On Sun, Feb 9, 2014 at 8:28 AM, Diego Sueiro <diego.sueiro@gmail.com> =
wrote:
>=20
>> Folks,
>>=20
>> I'm trying to get xbcm built for beaglebone black (dora branch), but =
it's
>> failing.
>>=20
>> I'm having the same issue as this e-mail sent 2 months ago:
>>=20
>> =
http://lists.openembedded.org/pipermail/openembedded-devel/2013-November/0=
93304.html
>>=20
>> Searching on internet I couldn't find any fix.
>>=20
>>=20
>> Regards,
>>=20
>> --
>> *dS
>> Diego Sueiro
>>=20
>> Administrador do Embarcados
>> www.embarcados.com.br
>>=20
>> /*long live rock 'n roll*/
>>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



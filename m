Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUL0l-0007uK-1b
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 18:54:11 +0200
Received: by lags15 with SMTP id s15so4332052lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 09:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Zt2WjdbfmxQFxzWOD3J16q+ZnEtmwD/IlmjpcVbUN+w=;
	b=XB9mmadk60XqZ2FxKujJo00O3YmORbX0aaZxIwYQkOxWGGPhN9z/k8RogCVc58xcCt
	z6vfhC6cDV22xt3y7aiDDPTDCgzMQzvvy456vyhpAEO7ICs0vQdgqMxQnXFcweIBib22
	3kvb8g6WNA/rMKTL3/z4I2DEnXi0XzfFqnEmyqy5ngKXmqMo0Kf7LhrgdDVT+s2l68rr
	RowzFafUeZLf/5DDjvNIjpEKeLa/T1DYoxjaJiyik+68nQ5GEcMrCYAkyIXR2Jd672LZ
	0Xasp+QSHMjbaPOTI8xuqLE4eJMMpZ6Ndokc3KAVAmhErw5xNyttpw+uBdLKZ9I5VJWg
	MOPg==
MIME-Version: 1.0
Received: by 10.152.148.199 with SMTP id tu7mr13029108lab.43.1337100250710;
	Tue, 15 May 2012 09:44:10 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Tue, 15 May 2012 09:44:10 -0700 (PDT)
In-Reply-To: <3578934.ouGGrvIU0p@helios>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<3578934.ouGGrvIU0p@helios>
Date: Tue, 15 May 2012 18:44:10 +0200
Message-ID: <CADZ6=at4UmAFwAgggrDYOs0L-rMQBNU1idmD+Eo9FGMoqnKq1g@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQneEU92Wom5Z879d5gbXjwnGg2eCmrtFimkPbGmLUOf8W2no//8LsbvkmR5zx+sjuZuWzmA
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Tue, 15 May 2012 16:54:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

>> I'm trying to remove an element from DISTRO_FEATURES (specifically
>> "ld-is-gold"), but I am unable to find the right spot to do it. The
>> distribution we're using (Angstrom, as it happens) sets this in
>> conf/distro/angstrom-v2012.x.conf. My machine configuration is the
>> wrong spot to modify DISTRO_FEATURES, since it will be processed
>> first. local.conf is not working, too.
>>
>> So could anybody please tell me where I need to put my
>>
>> DISTRO_FEATURES =3D "${@'${DISTRO_FEATURES}}'.replace('ld-is-gold', =C2=
=A0'')}"
>>
>> so it applies for the build?
>
> Unfortunately such hacks only work for variables that are not set within =
the
> distro configuration, which is applied after local.conf.

I see. Fortunately I can require conf/distro/angstrom-v2012.x.conf in
my own distro config file.

> Ultimately you shouldn't really do this. If you want to change distro pol=
icy
> then you really ought to have your own distro configuration, or try to wo=
rk
> with the existing distro to fix whatever problem exists.

It's a backwards compatibility thing: we're bound to gcc-4.5 (we have
kernel build issues with newer gcc versions; we're nailed to
linux-2.6.37 thanks to lack of support by Texas Instruments) which
fails to detect the correct version of binutils GOLD (LD would work)
and therefore misses critical features which break the build later on.
I won't, however, try to convince the Angstrom guys to further support
ancient toolchains and make gold optional again just because of TI's
laziness.

I'll try to set up a minimal config for a distribution based on
Angstrom, then, so I can fix up DISTRO_FEATURES. Thanks for your help,
Paul.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle



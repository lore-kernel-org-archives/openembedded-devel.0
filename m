Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 253816DD15
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:46:34 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so9598317eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2013 10:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=fgFzTK4U+z0HpUhZT1+ONeDmvJhkP41/ZSQmbcRgOJQ=;
	b=L4xXMr/YDc+JBrhHPpiofXcQXIZsoWC7taRuafBEWnflGergboVX8WyCr9D1NOiiq/
	MjmbpPW3MS+CrWr6UA3FS87oQRz9oTDzHN8qJF5FIpxhGNT+gNmJBss/aPWNppadzWQ/
	kMFjYRHk+KoiKpiOrp8ljDQHLXwFS1eKJA+VwNb2EOAemvbXpbOE5K5IY0WuwwwSZAoL
	5+htNVLLp5sssUIA59hyomjt50FJUaSMRK9gujHoMuoR0Ct6DMGAAMFyEvHZtnDZL9e5
	jm16gHN+cjdHDIYmhyJWGZCNYAju3MPvPIxGjX8mzU5efiiQDd50kS9DXexRdGbQpauc
	GWGA==
X-Gm-Message-State: ALoCoQmkvYhrRwYcUCQprUCHVaHNVHmRibJYqkFHc+HHDddE+0s5WhIodaXriDS/UOJT6sgnoOQO
X-Received: by 10.14.94.130 with SMTP id n2mr894396eef.99.1386009993582;
	Mon, 02 Dec 2013 10:46:33 -0800 (PST)
Received: from deepthought.fritz.box (p5091FEF2.dip0.t-ipconnect.de.
	[80.145.254.242])
	by mx.google.com with ESMTPSA id l4sm38094514een.13.2013.12.02.10.46.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Dec 2013 10:46:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Dominik Holland <dominik.holland@pelagicore.com>
In-Reply-To: <20131202155616.GA17528@denix.org>
Date: Mon, 2 Dec 2013 19:46:32 +0100
Message-Id: <2B29E0E8-3D6C-48F2-8E0E-5B8E5F8ACA83@pelagicore.com>
References: <529C78D0.8030902@pelagicore.com>
	<20131202155616.GA17528@denix.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1510)
Subject: Re: [meta-qt5][PATCH 0/2] Add nativesdk tools for Qt5 SDK
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
X-List-Received-Date: Mon, 02 Dec 2013 18:46:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 02.12.2013, at 16:56, Denys Dmytriyenko <denis@denix.org> wrote:

> Sorry for top-posting, but I wanted to reply in general and couldn't =
find the=20
> right place for inlining...
>=20
> Anyway, the below assumptions aren't exactly correct. And the main one =
being -=20
> you don't really need to source the environment-setup script. But =
you'd need a=20
> different and much simpler qt.conf, which I populate as part of the=20
> meta-toolchain recipe (still pending submission though). And you can =
use=20
> relative paths in that generated qt.conf so qmake can be used w/o =
sourcing the=20
> environment-setup script. But even with absolute paths those will be =
fixed=20
> automatically by the SDK setup script at the install time=85

ok great, if you have a much simpler qt.conf which is populated and =
works. I'm find with that ;-)

>=20
> The thing is, you cannot re-use the same qt.conf that you generate for =
the=20
> nativesdk tools, because that one is for cross-compiling for SDK. Like =
you=20
> mentioned, it cross-compiles the tools for SDK_MACHINE, which is =
different=20
> from target MACHINE as well as the build host. When the tools are =
used, you=20
> need a different qt.conf with a makespec to run on SDK_MACHINE and =
build for=20
> target MACHINE.

I know, and i didn't said anything that i wanted to do that.

>=20
> Also, I wanted the things to be as simple as possible, so I decided to =
re-use=20
> linux-oe-g++ makespec, as it is already there and we've been using it=20=

> successfully for a long time with Qt4. The only thing is, existing=20
> linux-oe-g++ relies on the OE-specific variables, because that was the =
way OE=20
> SDK always worked.

I'm also fine with that.

What i'm really up to is to fix the hardcoded paths in =
mkspecs/qdevice.pri and mkspecs/qconfig.pri

Don't get me wrong i really appreciate your work, i only want to make =
sure that the result works in every way and a qt-developer doesn't have =
to do any additional setup before he can use the SDK.

Have fun!
 Dominik

>=20
> --=20
> Denys
>=20
>=20
> On Mon, Dec 02, 2013 at 01:10:56PM +0100, Dominik Holland wrote:
>> Hi all,
>>=20
>> i'm the author of the merge-request on github.
>>=20
>> The patchset from Denys looks nice. Especially because it cross
>> compiles the host tools for the SDK_MACHINE which i forgot todo in
>> my patchset.
>>=20
>> I think the best way would be a combined version of both patchsets.
>>=20
>> Because some of you think my patchset is too complicated i want to
>> highlight why i added the complicated creation of the qt.conf and
>> the additional patching of the mkspec files etc.
>>=20
>> I didn't tested Denys version but i think it only works if you
>> source the environment scripts of the SDK before.
>>=20
>> As a Qt developer it's the defacto standard to get a SDK which works
>> out of the box for your projects by just invoking qmake and no need
>> to source a script before which changes your environment.
>>=20
>> To get this done you need to patch the mkspec folder and the qt.conf
>> to use relative paths instead the hardcoded paths which where
>> created during the yocto build.
>>=20
>> In addition i created a linux-oe-sdk-g++ which contains the real
>> values of the environment variables but without --sysroot. This will
>> be set by qt itself by using the CROSS_COMPILE prefix.
>>=20
>>=20
>> I hope you understand that this is really needed if you want to get
>> a good qt5 integration into a OE SDK.
>>=20
>> Best Reagrds
>>=20
>> Dominik
>>=20
>> P.S. If you want to use the qmake inside qtcreator you would need to
>> set all the env variable of the environment script inside qtcreator
>> which is really inconvenient
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



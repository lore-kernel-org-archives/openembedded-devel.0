Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6DC7807A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 22:38:20 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f84so322202pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 15:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MQOOGGY2HpdjEEHwTIsEci+x0mJivhPImP+oCiN/teU=;
	b=ESar3+S00EYEDXL2S/lliZwIGUW5vCiQLTDv8pE5i8VAhbWZ6attyk4PK3UkEqnwXx
	Q6coKg/jnJagCTwC+Ptm/xt2DJTtHCBF4QOVop1YN9a29eeg/M8WoByBSiQKIqyOVJB0
	KK6tlCPdk8iwXpwUve+dakRlxsoe4IQiWV8FumPOxStR4BoJeP2t0VnbVOO3DPF/8jkE
	QpYuD01ZMwekwugu683Dt94Nsvqx4Q7RuHIX15U839ZkA66089jXHI6S75MPZlHZLNBu
	VDnjQR8QqVQSyVBcRj32HF8E2tCHK6hlNj/EyMj2+GXu3fk4Qix0/RvPivW33qgyLH3Y
	dGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MQOOGGY2HpdjEEHwTIsEci+x0mJivhPImP+oCiN/teU=;
	b=LtFBDP83cCG8qVWZoEmfb/IqCD2Vv/LWePA3lQwYP4O0qMpxrJHtVGMAEQ67ZsFk9w
	HcxZ3PvPve9Af5vTIQfB8pydzM1akmHT7DWq9izIFcfC25kOaKeibmS3ZP7NDPUzYAp5
	YdslKmwlc6jZ9ESsAal4VouPDcYZ1DlkmQ2zwWfkRzPMrQox+IjkZyBVs6c+A68D14vB
	TyfLValD6l2yTsJhY7SkiMSr6gSPoP2102555L/+6z+prGP8rOMCENcoKj1t+QqhU+3m
	beQ9Bg5qBrPXZko3kQR1BNqp5/FmocyTMLcDMOcH9isODc73mopX+6IXdbqQfgqCEjKY
	Glag==
X-Gm-Message-State: AHPjjUg2eT3EgKpgAEt7f0ACsFRmLstQgTir5Gi1ESk5N2zm3wmOmiXE
	GUTWLvIlY70KhOj7HqtejbaZGC+Zi45LaaPR/Tk=
X-Google-Smtp-Source: AOwi7QD/4XyyweOEjP8PJME8+ae6J4ZXDuvXFbBnKxSLpPj9tqUVvxweJVBXl2MnQbx/eYm1h9jO5P9WuHsm6VONXxg=
X-Received: by 10.84.204.133 with SMTP id b5mr425197ple.440.1505428702510;
	Thu, 14 Sep 2017 15:38:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 14 Sep 2017 15:37:52 -0700 (PDT)
In-Reply-To: <20170914144622.GA3292@jama>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
	<bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
	<20170914144622.GA3292@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2017 15:37:52 -0700
Message-ID: <CAMKF1sqFWf+P9q2KHDs6LVAAvm9eyavozLqx3tqOgVFR63RY1w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Sep 2017 22:38:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 14, 2017 at 7:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Sep 14, 2017 at 08:01:49AM +0000, Peter Kjellerstedt wrote:
>> > -----Original Message-----
>> > From: openembedded-devel-bounces@lists.openembedded.org
>> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> > Fabien Lahoudere
>> > Sent: den 13 september 2017 22:06
>> > To: openembedded-devel@lists.openembedded.org
>> > Subject: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
>> >
>> > In order to build gerbera, we need to support libupnp >= 1.8.
>> > However mpd won't build with this version probably due to API break.
>>
>> Wouldn't it be more appropriate to copy the current libupnp 1.6 recipe
>> to libupnp16 and then update the libupnp recipe to 1.8? Presumably we
>> want to get rid of the 1.6 version whenever mpd is updated to support
>> the new API.
>
> Makes sense, I've renamed it in master-next.
>

you forgot to rename the patch directory which should now be called
libupnp1 as well.

> I've also noticed that libupnp is optionally used by vlc, that's not
> tested by my world builds, because PACKAGECONFIG for it isn't enabled by
> default, but maybe vlc is also incompatible with libupnp 1.8.
>
>> > So we add a new recipe libupnp1.8 to be able to use both version.
>> > Both version can be run in parallel.
>> >
>> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
>> > neon/libupnp_1.6.21-r0_armhf.deb
>> > drwxrwxrwx root/root         0 2017-09-13 17:26 ./
>> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
>> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
>> > -rwxr-xr-x root/root     31600 2017-09-13 17:26
>> > ./usr/lib/libixml.so.2.0.8
>> > -rwxr-xr-x root/root     17912 2017-09-13 17:26
>> > ./usr/lib/libthreadutil.so.6.0.4
>> > -rwxr-xr-x root/root    117676 2017-09-13 17:26
>> > ./usr/lib/libupnp.so.6.3.4
>> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2
>> > -> libixml.so.2.0.8
>> > lrwxrwxrwx root/root         0 2017-09-13 17:26
>> > ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
>> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6
>> > -> libupnp.so.6.3.4
>> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
>> > neon/libupnp1.8_1.8.2-r0_armhf.deb
>> > drwxrwxrwx root/root         0 2017-09-13 17:43 ./
>> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
>> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
>> > -rwxr-xr-x root/root     35696 2017-09-13 17:43
>> > ./usr/lib/libixml.so.10.0.1
>> > -rwxr-xr-x root/root    155128 2017-09-13 17:43
>> > ./usr/lib/libupnp.so.10.1.1
>> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10
>> > -> libixml.so.10.0.1
>> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10
>> > -> libupnp.so.10.1.1
>> >
>> > mpd and gerbera have been built successfully with this fix.
>> >
>> > The patch also clean a bit gerbera recipe and fix dependency issue.
>> >
>> > Changes since v3:
>> >     - Drop RDEPENDS from gerbera recipe.
>> >     - use git fetcher instead of github archive for libupnp
>> >
>> > Fabien Lahoudere (2):
>> >   libupnp: Add recipe for version 1.8.2
>> >   gerbera: clean recipe
>> >
>> >  .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20
>> > ++++++++++++++++++++
>> >  .../recipes-multimedia/gerbera/gerbera_git.bb        | 12 ++++++------
>> >  2 files changed, 26 insertions(+), 6 deletions(-)
>> >  create mode 100644 meta-multimedia/recipes-
>> > connectivity/libupnp/libupnp1.8.bb
>> >
>> > --
>> > 2.11.0
>>
>> //Peter
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


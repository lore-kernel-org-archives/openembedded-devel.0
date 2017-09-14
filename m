Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7B578217
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 22:52:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id v82so365075pgb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 15:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AEUoPtHcwl5xg9TKdZQu44prW7aqMoOylyaU7IJJH80=;
	b=Z9jFjiKfeSzhWpI/exzlAGrX3BKomb3SL3HNk7dR1usXYTs4JCiUflm9zPPmIdU6HG
	HF4Mf2N6DCcTZlbMGdv/7ibJqbWnkBqwXNEEk651niQ1mbGLVpvxEdHu667BRadMwwHQ
	63m4ngVomYmRKTU6m5DS41uKbjw7TTVuQI0K3FD6axUk3MEjueiOEeDY+kOxmJdVEw3m
	Ar57nDLveHfz9HDPy5XCwiwqiSI//2OQFcsgLmC5u1EH99hMev2FRGX/imadTHeLH/L+
	SjyL+wKcBz5vF6RjirURTas4NLn48UB51/Q9pSu6gSTsHCOdZe9wgtB/qLF83MjnqSu0
	0/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AEUoPtHcwl5xg9TKdZQu44prW7aqMoOylyaU7IJJH80=;
	b=ODDgQEBTx2EQNVDx7Dt05Zr7G7/OxkfDyLLcVnGx8QlLhuXNJHtyYivHkewx2EVCYS
	xyEij6lTpY3pIVthUDJxc3dLIlSmXzsDDRyToovaGALfnKyqf8CNnopAwdijxScl+eYi
	KMuvA81P1ZTo4oYeS47rZl0kJsiaSLj9uorfzIEeJEv0jG5JnMrNr6/LN9TLrN2OkweE
	p8+tZJoqo76tF045hPuXqyOR0/otOk6ETkVFafexr997Eu7MOdO9Xq7LOwbewda2SN+n
	ouiVCzAr+pH1S3EbPgxIgKQb83vRmixGANrX0ma/tftHFlH00oE25mQudKbhYJQ6Fx5r
	X64w==
X-Gm-Message-State: AHPjjUi29d45RmiOFBpqohMcZY24bTGezhLmZlFpVlr7vvyDjm0tR1dx
	rnXe6UzoNen1ebvCrCM46B3doUWP6YrffvTyqR4=
X-Google-Smtp-Source: AOwi7QAqmmE22RNHci+7cxmXDbou93wEj28kdowYo4T7q+rukYkkpS86Ivkm6pWdHGNrLnA4y8CzmiBN1ArPu0GTOWQ=
X-Received: by 10.99.51.15 with SMTP id z15mr9424190pgz.287.1505429553977;
	Thu, 14 Sep 2017 15:52:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Thu, 14 Sep 2017 15:52:03 -0700 (PDT)
In-Reply-To: <CAMKF1sqFWf+P9q2KHDs6LVAAvm9eyavozLqx3tqOgVFR63RY1w@mail.gmail.com>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
	<bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
	<20170914144622.GA3292@jama>
	<CAMKF1sqFWf+P9q2KHDs6LVAAvm9eyavozLqx3tqOgVFR63RY1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Sep 2017 15:52:03 -0700
Message-ID: <CAMKF1sp2n_LrgePOthOsnYsedrybAztGkSvPohNjz27nonisYQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Sep 2017 22:52:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 14, 2017 at 3:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Sep 14, 2017 at 7:46 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Thu, Sep 14, 2017 at 08:01:49AM +0000, Peter Kjellerstedt wrote:
>>> > -----Original Message-----
>>> > From: openembedded-devel-bounces@lists.openembedded.org
>>> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> > Fabien Lahoudere
>>> > Sent: den 13 september 2017 22:06
>>> > To: openembedded-devel@lists.openembedded.org
>>> > Subject: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
>>> >
>>> > In order to build gerbera, we need to support libupnp >= 1.8.
>>> > However mpd won't build with this version probably due to API break.
>>>
>>> Wouldn't it be more appropriate to copy the current libupnp 1.6 recipe
>>> to libupnp16 and then update the libupnp recipe to 1.8? Presumably we
>>> want to get rid of the 1.6 version whenever mpd is updated to support
>>> the new API.
>>
>> Makes sense, I've renamed it in master-next.
>>
>
> you forgot to rename the patch directory which should now be called
> libupnp1 as well.
>

additionally -dev package from both versions will be in conflict too,
this issue is
less prevalent now that we have rss, but we will have this issue once
you install
the dev packages into image or generate SDKs from images which have both
libupnp versions

>> I've also noticed that libupnp is optionally used by vlc, that's not
>> tested by my world builds, because PACKAGECONFIG for it isn't enabled by
>> default, but maybe vlc is also incompatible with libupnp 1.8.
>>
>>> > So we add a new recipe libupnp1.8 to be able to use both version.
>>> > Both version can be run in parallel.
>>> >
>>> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
>>> > neon/libupnp_1.6.21-r0_armhf.deb
>>> > drwxrwxrwx root/root         0 2017-09-13 17:26 ./
>>> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
>>> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
>>> > -rwxr-xr-x root/root     31600 2017-09-13 17:26
>>> > ./usr/lib/libixml.so.2.0.8
>>> > -rwxr-xr-x root/root     17912 2017-09-13 17:26
>>> > ./usr/lib/libthreadutil.so.6.0.4
>>> > -rwxr-xr-x root/root    117676 2017-09-13 17:26
>>> > ./usr/lib/libupnp.so.6.3.4
>>> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2
>>> > -> libixml.so.2.0.8
>>> > lrwxrwxrwx root/root         0 2017-09-13 17:26
>>> > ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
>>> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6
>>> > -> libupnp.so.6.3.4
>>> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
>>> > neon/libupnp1.8_1.8.2-r0_armhf.deb
>>> > drwxrwxrwx root/root         0 2017-09-13 17:43 ./
>>> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
>>> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
>>> > -rwxr-xr-x root/root     35696 2017-09-13 17:43
>>> > ./usr/lib/libixml.so.10.0.1
>>> > -rwxr-xr-x root/root    155128 2017-09-13 17:43
>>> > ./usr/lib/libupnp.so.10.1.1
>>> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10
>>> > -> libixml.so.10.0.1
>>> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10
>>> > -> libupnp.so.10.1.1
>>> >
>>> > mpd and gerbera have been built successfully with this fix.
>>> >
>>> > The patch also clean a bit gerbera recipe and fix dependency issue.
>>> >
>>> > Changes since v3:
>>> >     - Drop RDEPENDS from gerbera recipe.
>>> >     - use git fetcher instead of github archive for libupnp
>>> >
>>> > Fabien Lahoudere (2):
>>> >   libupnp: Add recipe for version 1.8.2
>>> >   gerbera: clean recipe
>>> >
>>> >  .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20
>>> > ++++++++++++++++++++
>>> >  .../recipes-multimedia/gerbera/gerbera_git.bb        | 12 ++++++------
>>> >  2 files changed, 26 insertions(+), 6 deletions(-)
>>> >  create mode 100644 meta-multimedia/recipes-
>>> > connectivity/libupnp/libupnp1.8.bb
>>> >
>>> > --
>>> > 2.11.0
>>>
>>> //Peter
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3618076B7C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:57:29 +0000 (UTC)
Received: by oiww128 with SMTP id w128so8275234oiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 14:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xmvFkuujddYo8OF+y6bsAQYHhHbLD1/Ntwoa5GS0iP0=;
	b=1BD4mxW+ul88gzKeTxsXmHELcgdPzBaUjv2MtBtL2s1BoXMvi7uzCqFQNxbEgUfQI2
	4CKkrUNfksB/2CLQ4Aaqepbc48iIDoMKPtp1y270wnIyw225IVn9eZHv6KJCg+0Sp2zk
	6e0dvU7mcI9ox8gcCbuh78S1hrhnsdFw4hdVlcp2+B5FIBhh03BSvto0J2pOaf2YpYuI
	aEdrZTI7P6TGamWgcvRhr2KvtoIxxScOlmO9HSbSSBtl5M4WLJ8Ar/jIgHh6PmFxqC/0
	qY3RsoK/WWVbs0n6SU5LVy1F0vRScEdpNrp0IMkVdTDvESBcwFAtnMQ+wkWTpFR87qcZ
	X1iw==
MIME-Version: 1.0
X-Received: by 10.202.104.222 with SMTP id o91mr3376578oik.49.1441144649944;
	Tue, 01 Sep 2015 14:57:29 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Tue, 1 Sep 2015 14:57:29 -0700 (PDT)
In-Reply-To: <20150901063653.GA29931@ad.chargestorm.se>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
	<CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
	<20150901063653.GA29931@ad.chargestorm.se>
Date: Tue, 1 Sep 2015 14:57:29 -0700
Message-ID: <CAJ86T=XmrpVAhz5nr-+KJbc+Fcn3=sS6Y5xVTAi1Dbd+NTvK4Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 01 Sep 2015 21:57:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 11:36 PM, Anders Darander <anders@chargestorm.se> w=
rote:
> * Andre McCurdy <armccurdy@gmail.com> [150831 22:03]:
>
>> On Mon, Aug 31, 2015 at 12:38 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com> w=
rote:
>> >> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>> >>> I cannot take this to meta-oe, because as soon as it's added there i=
t
>> >>> will be used by all DISTROs even those who don't mind having GPLv3
>> >>> version.
>
>> >>> Everybody would need to define PREFERRED_VERSION, because
>> >>> DEFAULT_PREFERENCE is useless across different layers :/
>> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964
>
>> >>> So this either has to be introduced in oe-core or in completely sepa=
rate
>> >>> layer which would be included only by those who cannot use GPLv3.
>
> I think that the correct way to handle those recipes (that isn't core
> enough to be kept in oe-core) is to create a new layer, maybe meta-gplv2
> or meta-nongplv3; dependig on how explicit the naming should be. This
> layer could very well be put in meta-openembedded (the meta layer, not
> meta-oe).
>
>> >> Third option would be to reduce the priority of meta-oe to be lower
>> >> than oe-core.
>
>> >> That seems logical regardless of any GPLv3 discussion - since meta-oe
>> >> "fills in the gaps" in oe-core, if something _is_ present in oe-core
>> >> then it probably should be the default version.
>
>> > This scares me: to get a recipe in with old version not supporting
>> > modern file systems you want to change meta-oe's layer priority
>> > risiking unknown issues. I wonder how far the GPLv3 avoidance hype
>> > takes us...
>
>> No, if you read the various threads, my preference is to have the
>> GPLv2 parted recipe in oe-core. That option has been shot down though
>> and the general consensus seems to be that the older version of parted
>> is too buggy to be included anywhere in OE. That topic seems to be
>> closed.
>
>> Trying to understand why meta-oe needs a higher priority than oe-core
>> is a separate topic. If the priorities were changed it would allow
>> older (and newer) versions of oe-core recipes to safely live in
>> meta-oe. That would help non-GPLv3 versions of GPLv3 packages, but it
>> might be useful in other cases too.
>
> Well, changing the priority might have effects on peoples current
> builds; most likely effects that you don't anticipate during an upgrade.
>
> And at least periodically, meta-oe has modified how recipes from oe-core
> has been built. Thus, the need for a higher priority of meta-oe as
> compared to oe-core. (I know that I've had to undo such changes in my
> own layers in older releases).

Maybe just a personal preference, but I think completely replacing a
recipe is a hackish approach best reserved for private layers. Giving
meta-oe a higher priority wouldn't be needed if the oe-core recipes
were modified via a .bbappend or by getting the meta-oe tweaks merged
into oe-core. I don't know the history though. Maybe there are reasons
why this hasn't been possible.

According to bitbake-layers, the current list of oe-core recipes which
are over-ridden by meta-oe is quite short though:

iso-codes:
  meta-oe              1.4
  meta                 3.58
libcap-ng:
  meta-oe              0.7.7
  meta                 0.7.7
nativesdk-swig:
  meta-oe              3.0.6
  meta                 3.0.6
xserver-nodm-init:
  meta-oe              2.0
  meta                 1.0

The first 3 are transient (the oe-core versions were recently added
and the meta-oe versions can be removed). Having meta-oe over-ride
oe-core isn't necessary or helpful for these recipes.

I'm not sure what's going on with xserver-nodm-init. Both versions are
being updated independently but it looks like they could be unified
with minor changes.


> Cheers,
> Anders
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 418587700B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 00:07:12 +0000 (UTC)
Received: by oibi136 with SMTP id i136so9725490oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oC3F2u4kFqjgzInjYeOhhPnKnjje6aflWq2PwHQslLc=;
	b=bnTXQKmHs+BRyOwNP+T/cNRuYhgYo2GCHMBPWQ8Gmk027gGatpZt4TzG0/b21PORZu
	jA9IfiYR0J8qeBDDAQ2nduvJojoRFNoh6UI9QYcj3WkEC1KHkXFtsGnHE3tc9LoNQl7f
	3kPqRanlvhtJIU6zcfo7C7a0GBRC9LlXyZA7urqMozvyP3GzZitYW6PrSvzeXkVrCa3y
	KzbWDU11/MaEbLP/rv84J6Mv+6zbgb5mq2J5uDgtdU10567narqgr+L/T/K8ZT6Hr8NZ
	NClInZ1R5Rmo7Aib+SAPVkT9S7fabqK+3V02ZuAzbCOkOCxSEChyCzThSVN6F6Q2vjG8
	sDkQ==
MIME-Version: 1.0
X-Received: by 10.202.198.131 with SMTP id w125mr7560056oif.10.1441152431906; 
	Tue, 01 Sep 2015 17:07:11 -0700 (PDT)
Received: by 10.202.6.72 with HTTP; Tue, 1 Sep 2015 17:07:11 -0700 (PDT)
In-Reply-To: <20150901220720.GG2458@jama>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
	<CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
	<20150901063653.GA29931@ad.chargestorm.se>
	<CAJ86T=XmrpVAhz5nr-+KJbc+Fcn3=sS6Y5xVTAi1Dbd+NTvK4Q@mail.gmail.com>
	<20150901220720.GG2458@jama>
Date: Tue, 1 Sep 2015 17:07:11 -0700
Message-ID: <CAJ86T=W4ohCWdFMiUDuR0VV-KuL28Dy-ZJ9-nMRBuCJUuVeu6g@mail.gmail.com>
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
X-List-Received-Date: Wed, 02 Sep 2015 00:07:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2015 at 3:07 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Tue, Sep 01, 2015 at 02:57:29PM -0700, Andre McCurdy wrote:
>> On Mon, Aug 31, 2015 at 11:36 PM, Anders Darander <anders@chargestorm.se=
> wrote:
>> > * Andre McCurdy <armccurdy@gmail.com> [150831 22:03]:
>> >
>> >> On Mon, Aug 31, 2015 at 12:38 PM, Andreas M=C3=BCller
>> >> <schnitzeltony@googlemail.com> wrote:
>> >> > On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com=
> wrote:
>> >> >> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail=
.com> wrote:
>> >> >>> I cannot take this to meta-oe, because as soon as it's added ther=
e it
>> >> >>> will be used by all DISTROs even those who don't mind having GPLv=
3
>> >> >>> version.
>> >
>> >> >>> Everybody would need to define PREFERRED_VERSION, because
>> >> >>> DEFAULT_PREFERENCE is useless across different layers :/
>> >> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964
>> >
>> >> >>> So this either has to be introduced in oe-core or in completely s=
eparate
>> >> >>> layer which would be included only by those who cannot use GPLv3.
>> >
>> > I think that the correct way to handle those recipes (that isn't core
>> > enough to be kept in oe-core) is to create a new layer, maybe meta-gpl=
v2
>> > or meta-nongplv3; dependig on how explicit the naming should be. This
>> > layer could very well be put in meta-openembedded (the meta layer, not
>> > meta-oe).
>> >
>> >> >> Third option would be to reduce the priority of meta-oe to be lowe=
r
>> >> >> than oe-core.
>> >
>> >> >> That seems logical regardless of any GPLv3 discussion - since meta=
-oe
>> >> >> "fills in the gaps" in oe-core, if something _is_ present in oe-co=
re
>> >> >> then it probably should be the default version.
>> >
>> >> > This scares me: to get a recipe in with old version not supporting
>> >> > modern file systems you want to change meta-oe's layer priority
>> >> > risiking unknown issues. I wonder how far the GPLv3 avoidance hype
>> >> > takes us...
>> >
>> >> No, if you read the various threads, my preference is to have the
>> >> GPLv2 parted recipe in oe-core. That option has been shot down though
>> >> and the general consensus seems to be that the older version of parte=
d
>> >> is too buggy to be included anywhere in OE. That topic seems to be
>> >> closed.
>> >
>> >> Trying to understand why meta-oe needs a higher priority than oe-core
>> >> is a separate topic. If the priorities were changed it would allow
>> >> older (and newer) versions of oe-core recipes to safely live in
>> >> meta-oe. That would help non-GPLv3 versions of GPLv3 packages, but it
>> >> might be useful in other cases too.
>> >
>> > Well, changing the priority might have effects on peoples current
>> > builds; most likely effects that you don't anticipate during an upgrad=
e.
>> >
>> > And at least periodically, meta-oe has modified how recipes from oe-co=
re
>> > has been built. Thus, the need for a higher priority of meta-oe as
>> > compared to oe-core. (I know that I've had to undo such changes in my
>> > own layers in older releases).
>>
>> Maybe just a personal preference, but I think completely replacing a
>> recipe is a hackish approach best reserved for private layers. Giving
>> meta-oe a higher priority wouldn't be needed if the oe-core recipes
>> were modified via a .bbappend or by getting the meta-oe tweaks merged
>> into oe-core. I don't know the history though. Maybe there are reasons
>> why this hasn't been possible.
>>
>> According to bitbake-layers, the current list of oe-core recipes which
>> are over-ridden by meta-oe is quite short though:
>>
>> iso-codes:
>>   meta-oe              1.4
>>   meta                 3.58
>> libcap-ng:
>>   meta-oe              0.7.7
>>   meta                 0.7.7
>> nativesdk-swig:
>>   meta-oe              3.0.6
>>   meta                 3.0.6
>> xserver-nodm-init:
>>   meta-oe              2.0
>>   meta                 1.0
>>
>> The first 3 are transient (the oe-core versions were recently added
>> and the meta-oe versions can be removed). Having meta-oe over-ride
>> oe-core isn't necessary or helpful for these recipes.
>
> Yes, that's why I'm asking people migrating recipes to oe-core to send
> removal patch to meta-oe (while verifying that what they migrated wasn't
> modified in meta-oe after they created their copy) - some people do it
> some don't.

Yes. If a recipe gets merged into oe-core and updated and the meta-oe
removal patch is slow to be sent out then, due to the layer priority,
it's the meta-oe users who suffer. That transition phase uncertainty
would go away if meta-oe were a lower priority than oe-core.

>> I'm not sure what's going on with xserver-nodm-init. Both versions are
>> being updated independently but it looks like they could be unified
>> with minor changes.
>
> Not minor changes, there is long ticket in bugzilla mostly related to
> x11-common xserver-common, which result in this xserver-nodm-init
> difference.

I found this. Is that the one you mean?

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5546

Anyway, I don't use X11 and I don't know the history here so I'm
probably over-simplifying. My comment was only based on the fact that
xserver-nodm-init is a ~70 line script and the x11-common -vs-
xserver-common differences could be handled via a conditional test in
the script. Not ideal but perhaps better than maintaining two
independent forks of xserver-nodm-init.


> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 945FF74197
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Sep 2015 06:36:58 +0000 (UTC)
Received: by lbvd4 with SMTP id d4so36799363lbv.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 23:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=402dkEYjUNj8DwzAIc8vHNCJlo0LvWwfs1nl1SR8t5w=;
	b=b0g79WuiCRGiXzF80TolqcJ1EfGyWdAz+xXL0EPhpDaOTMW5MA0WJ1TCqjVcTXz9n2
	nfCW256ABePj63LaCgYdS6eaCjVbJw0SmJxrfqA9RSLBhIipglm2AgxJluCkaoS1Nx9a
	KuVJ88KvXk9ap2qnMY2tmAwk3taC/Prl2v4s1tEdi9DLaufOfKONxhFYTTK4lLM9TF3f
	cXwBBEipHwdvMDuIgga3yELPVQisC+IMsSinuPCjQb4BaL2ydpY4HjgV2GziLaVemsLJ
	3UxKc380LiARE0MHucnMKZWYuCSpOk61LDKHQrEIWeihcweJsb/iLC4XgU4YsJLb4Am6
	iK3A==
X-Gm-Message-State: ALoCoQmwLAk08V7Mv0CTOpKj+1HV/gBvLWtzCUHMuamuR1CZIo/Cdu3Zwm4uTa1s6Dw3w/WvyVsP
X-Received: by 10.152.219.172 with SMTP id pp12mr12157608lac.17.1441089416643; 
	Mon, 31 Aug 2015 23:36:56 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by smtp.gmail.com with ESMTPSA id g1sm4533805lam.30.2015.08.31.23.36.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 23:36:55 -0700 (PDT)
Date: Tue, 1 Sep 2015 08:36:53 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150901063653.GA29931@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
	<CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 01 Sep 2015 06:37:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Andre McCurdy <armccurdy@gmail.com> [150831 22:03]:

> On Mon, Aug 31, 2015 at 12:38 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Aug 31, 2015 at 9:11 PM, Andre McCurdy <armccurdy@gmail.com> wr=
ote:
> >> On Mon, Aug 31, 2015 at 10:58 AM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >>> I cannot take this to meta-oe, because as soon as it's added there it
> >>> will be used by all DISTROs even those who don't mind having GPLv3
> >>> version.

> >>> Everybody would need to define PREFERRED_VERSION, because
> >>> DEFAULT_PREFERENCE is useless across different layers :/
> >>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964

> >>> So this either has to be introduced in oe-core or in completely separ=
ate
> >>> layer which would be included only by those who cannot use GPLv3.

I think that the correct way to handle those recipes (that isn't core
enough to be kept in oe-core) is to create a new layer, maybe meta-gplv2
or meta-nongplv3; dependig on how explicit the naming should be. This
layer could very well be put in meta-openembedded (the meta layer, not
meta-oe).

> >> Third option would be to reduce the priority of meta-oe to be lower
> >> than oe-core.

> >> That seems logical regardless of any GPLv3 discussion - since meta-oe
> >> "fills in the gaps" in oe-core, if something _is_ present in oe-core
> >> then it probably should be the default version.

> > This scares me: to get a recipe in with old version not supporting
> > modern file systems you want to change meta-oe's layer priority
> > risiking unknown issues. I wonder how far the GPLv3 avoidance hype
> > takes us...

> No, if you read the various threads, my preference is to have the
> GPLv2 parted recipe in oe-core. That option has been shot down though
> and the general consensus seems to be that the older version of parted
> is too buggy to be included anywhere in OE. That topic seems to be
> closed.

> Trying to understand why meta-oe needs a higher priority than oe-core
> is a separate topic. If the priorities were changed it would allow
> older (and newer) versions of oe-core recipes to safely live in
> meta-oe. That would help non-GPLv3 versions of GPLv3 packages, but it
> might be useful in other cases too.

Well, changing the priority might have effects on peoples current
builds; most likely effects that you don't anticipate during an upgrade.

And at least periodically, meta-oe has modified how recipes from oe-core
has been built. Thus, the need for a higher priority of meta-oe as
compared to oe-core. (I know that I've had to undo such changes in my
own layers in older releases).

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


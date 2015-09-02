Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 414757702A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 17:54:00 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so29326134ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=XJgAn/QaLPUJd64KO4KxfTyYUn2GtonPbaw/ipUoPpo=;
	b=hpwtwG41VgS97RwrqvH3aZhAyX+v/7x6Cc5YdhsaQ1zLrCVtDrIyPgInn1OY1H2Arr
	3b2bIGBGwnVbjHnhB+C2GoGcYeUH8zwTHcCAXeWJ4EXmjSLPLqbODjXOx9NFqfPGfxiU
	JEqeQ6boBtyRRsJFzV/mWOEz+MVLyytDMZkVmL8G1/iM3RuuHjkdkEP2nLO5YAtdpGcw
	i6P6pscMkG3Tg+XsXWrhd6aDS0JCwcM7Hn+qwG3SxylC/9MiNxpY+rajzqUu7y5ukrX/
	zsO5Zf31uD1TciULm83MOjgrx4yoq8E5bGwzX6kT9GAIVcSAaiL/vhho4wSWHAPaKiOA
	rN9Q==
X-Gm-Message-State: ALoCoQm4TfNYcwnFUuozimx1NyMAv4g1Lp+QV3xUCVBQDN3XPiKVCg7YZ5cHbTIy+h7DINkQWLD/
X-Received: by 10.107.167.213 with SMTP id q204mr12863705ioe.150.1441216440461;
	Wed, 02 Sep 2015 10:54:00 -0700 (PDT)
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com.
	[209.85.213.170]) by smtp.gmail.com with ESMTPSA id
	lp3sm2682653igb.12.2015.09.02.10.53.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 10:53:59 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igcrk20 with SMTP id rk20so30943042igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 10:53:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.43.131 with SMTP id w3mr5341066igl.5.1441216439143; Wed,
	02 Sep 2015 10:53:59 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 2 Sep 2015 10:53:59 -0700 (PDT)
In-Reply-To: <20150902172525.GE2470@jama>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
	<aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
	<CAP9ODKoUVXp5MuOiTTiYQfkWzWjU=wf7dKVpNnBJW2KNudZZyA@mail.gmail.com>
	<20150902172525.GE2470@jama>
Date: Wed, 2 Sep 2015 14:53:59 -0300
Message-ID: <CAP9ODKpCBfZzzFxFkRv-YSOQT4cZdpvgwQ4dDki3k03VhzkR8Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2 05/11] qt5: disable debian auto renaming
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
X-List-Received-Date: Wed, 02 Sep 2015 17:54:02 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 2, 2015 at 2:25 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Sep 02, 2015 at 02:07:15PM -0300, Otavio Salvador wrote:
>> On Tue, Aug 25, 2015 at 8:43 AM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>> > Some of the Qt modules have multiple libs, which prevents debian auto
>> > renaming to work correctly. Instead of only having some modules renamed,
>> > disable renaming for all Qt module packages, so that all they all are
>> > named as ${PN}.
>
> I don't think this explanation is good enough reason to disable debian
> renaming and that's why I didn't take it into master-next yet.
>
> The original idea was to let qt5 package with libraries coexist with qt4
> ones, I agree that not many people are using this, but on the other hand
> few people asked me to provide more granular packages for qt5, so
> instead of disabling debian rename everywhere why don't we split the
> packages with multiple libs or define LEAD_SONAME where one library is
> significantly more important than the rest and the package should be
> named after it?

I have mixed feelings about this. I do see the value of splitting it
more and I also see why people may want it in less fragmented set of
runtime packages.

Putting a second thought on this I think I agree with you. The
benefits of splitting it more are higher than having less runtime
packages.

I think we could take a look at the package split done in Debian for
inspiration and this would help to reduce many iterations to get this
right. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


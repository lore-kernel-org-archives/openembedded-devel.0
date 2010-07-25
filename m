Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Od77O-0006EP-5H
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Jul 2010 21:44:15 +0200
Received: by iwn34 with SMTP id 34so2195378iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jul 2010 12:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=+dvVPx/ampUnAF3GhYCGUECjh+eeBhgzPRAS36TNz18=;
	b=IwUsj2j6piF+p9gW0Nknf4IZUnv0+XIoxFoK8IqnPw4Vl6swmI1oT+jNh5pbn2iHW3
	d8jgNw0Q/Hr8RdDavsk1wBv5DAZWUXw/Xmkp5PKVGDmlIupzPa0MZKsE28ge4KDOxfce
	HgBscv4b6B82w2w3F79C28/qjGdRIrgNRk9vk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XzSZFwl6qXZU5vCY0RYD07vL7JcyUoJ5lg2HA/nCEsf3arLQ99fIz5fmBe7V2HeqaU
	9Vr4eKOxlv2BC8ICNudobVXRHr3yOR78Tk7uDUxey02ZwO0fjKSWqs9kskkenAzE+3c5
	gzSqG7P8vQa7Q7yCT7f40YyTvncV2gXNzoN/I=
Received: by 10.231.40.9 with SMTP id i9mr4561256ibe.5.1280087039956; Sun, 25 
	Jul 2010 12:43:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Sun, 25 Jul 2010 12:43:39 -0700 (PDT)
In-Reply-To: <1280073236.13006.125.camel@rex>
References: <1279963975-3736-1-git-send-email-raj.khem@gmail.com> 
	<i2fjoo$iiu$1@dough.gmane.org> <20100724212502.GA4218@gmail.com> 
	<i2gsqi$8sv$1@dough.gmane.org> <i2h6dv$1ni$1@dough.gmane.org> 
	<i2harj$e6t$1@dough.gmane.org>
	<AANLkTik9ZnjaXvx6vxnjzxx013ms+cDjVv1FvsK31r5u@mail.gmail.com> 
	<i2hk5h$86q$1@dough.gmane.org> <1280073236.13006.125.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jul 2010 12:43:39 -0700
Message-ID: <AANLkTim8kQzq4_BxEAU4rtOqVdieD6q5s4dnr219LRbO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Make multi-machine toolchains to co-exist.
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
X-List-Received-Date: Sun, 25 Jul 2010 19:44:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 25, 2010 at 8:53 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Sun, 2010-07-25 at 17:10 +0200, Koen Kooi wrote:
>> > And cacao:
>> >
>> > | configure: error: armv7a systems are not supported at this time
>> > | ERROR: Function do_configure failed
>> >
>> >> yes I was expecting that kind of problems. openssl also has similar issues.
>> >
>> >> another idea that struck me was that we could change the target triplet to drop
>> >> TARGET_VENDOR and replace it with TARGET_SUB_ARCH and TARGET_SUBARCH
>> >> could be anything
>> >> we could even make it same as MACHINE_ARCH which means you will build
>> >> toolchain per machine
>> >> and they will live together.
>> >
>> >> then the tool names will be something like arm-v7-linux-gnueabi-*
>> >> powerpc-e500-linux-gnu
>> >> mips-mips2-linux etc. instead of *-angstrom-*- or *-oe-*-
>> >
>> >> or arm-beagleboad-linux-gnueabi-* etc if we go with MACHINE_ARCH
>> >
>> >> that would keep all recipe configury happy as the arch detected from
>> >> config.guess will be what
>> >> we had (arm, mips, mipsel powerpc etc) so no changes needed but we
>> >> will have to drop the brand
>> >
>> >> does it sound good ? bad?
>>
>> I don't think abusing target vendor for that is a good idea. And I'm
>> quite attached to my angstrom branded toolchains, tbh.
>
> Note that you can still append your angstrom string to the vendor part
> of the triplet...

arm-v7_angstrom-linux-gnueabi-  etc. is a possibility

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



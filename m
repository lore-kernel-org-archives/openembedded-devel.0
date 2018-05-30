Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1A760401
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 19:20:44 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g13-v6so24733952qth.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 12:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j5LWXisq6RxJ8in1Lrzc2sigvC5SEO/1LL+ioWtgLik=;
	b=uPd0woG7hOSstkTLP0Vk8i2OB7CFtqNTuzjuhPldIg1EW//EIfe+lgUUY6zueBjbD5
	XO+5XpUpB+XvYuGQSTfDGZj0spEhXL2iVun4IqwizAiTzxu4gLG0F4vWd64UsgDA5pjF
	Bq3cbIYZczywdXkr6Eqw8Blm2xWVihTZI90lY7iV5CoMD+OZWibB2BCQIXDuLH79ybxV
	tlb6nUBOf8Ptzwbj/wtOfW1CezejIzak5ASH050uk59GXH3LbrXuDf+6b5yGvvwzrpC4
	mKIqw1tZMNP4C26KI5/yH7VRgx9dXp7V96AhixpDTFQUDaA3PHY+k1PNKdngZLrpnYqm
	jUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j5LWXisq6RxJ8in1Lrzc2sigvC5SEO/1LL+ioWtgLik=;
	b=E079WJlJOIdcu4E7U9te7rT+dV5W9u4wY0fJBV6K+mL3SBPv8zQ0f90urjnE8TOPmU
	jDj1vW8lpADwKXzPmdXpv2bSS9d7j6zHrV/mQqp9ctBOZvbho07Pv9KRhV0wGOWzQ16d
	Lgfxn9tfFMTndbd4ucXn6G+MF29Stx4fYWPdHx32auE0f5wtvRGfGmr/hQv2tvuKQXCp
	yPa9OUsgPmMLrNJfs3ffztfEBcpyA/FYTMos/8LRwiuHEsvpY3XWRYkAakZwKl0ieOL7
	HdJspY82MhXqwMJNkKC4QdwFv+9fU1Ansi1TVFagAVUt0LXncrt8y1DYcn2I2Ul0Ad3k
	yHQA==
X-Gm-Message-State: APt69E3oM5i2Kf0c/NMEigG+dzk3vXZv6/pL4zUmyidZuCwtSweMQ2Z/
	bidWhemUzXz2T09rACV2huTXsXYLMhWV83G6mX0=
X-Google-Smtp-Source: ADUXVKLHFP95mqTWsD/EW+RKtLjs1uylzDknnFmOYmul4RKDa16dwVtg2q8riZ3uU3484UNnWiCI48n1zVdWG4QD0p8=
X-Received: by 2002:ac8:290d:: with SMTP id
	y13-v6mr3935380qty.376.1527708045773; 
	Wed, 30 May 2018 12:20:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Wed, 30 May 2018 12:20:15
	-0700 (PDT)
In-Reply-To: <CA+chaQfQhyKdSNqbdoJtdiC91xF88Her2AmiRp6f37KYE6N=HA@mail.gmail.com>
References: <20180530134741.29397-1-george.mccollister@gmail.com>
	<CAMKF1sqgQSZE9K36c3MOAEd_HCMoQAL5in8eRXSBdbbSe-+zrg@mail.gmail.com>
	<CAFSKS=NhF86xbrGtJAbfxhGMAsNGiaLxWVj-4oAjjk2R4zsFNQ@mail.gmail.com>
	<CAMKF1srma2-E4JwpKro-u6USuh+dXi49mnH_YT=ZCOLN3VzrgQ@mail.gmail.com>
	<CA+chaQfQhyKdSNqbdoJtdiC91xF88Her2AmiRp6f37KYE6N=HA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2018 12:20:15 -0700
Message-ID: <CAMKF1spgpB=BmSnPigN5pNADU0SvN0_vYDXCUgce51-yBo-+zA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Subject: Re: [meta-oe][rocko][PATCH v2] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 19:20:45 -0000
Content-Type: text/plain; charset="UTF-8"

ok thanks for confirming

On Wed, May 30, 2018 at 9:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> FWIW: I've checked it in fresh checkout with "git branch -a --contains"
> shown before.
>
> On Wed, May 30, 2018 at 6:41 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, May 30, 2018 at 8:29 AM, George McCollister
>> <george.mccollister@gmail.com> wrote:
>> > On Wed, May 30, 2018 at 10:15 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >> Can you try this patch with
>> >>
>> >> Bitbake -cleanall recipe
>> >>
>> >> And bake it again
>> >
>> > bitbake -c cleanall protobuf
>> > bitbake protobuf
>> >
>> > Works fine for me with the patch applied. Did you run into a problem
>> > or have a concern?
>> >
>>
>> yes my concern was that your local git repo for protobuf might have some
>> commits which might not be available in upstream repo. So checking out
>> a fresh copy from upstreaming and building it is required.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


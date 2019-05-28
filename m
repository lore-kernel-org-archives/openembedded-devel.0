Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0676B07E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 09:49:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v19so1863459wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2zxtNB80kgUrU91FAd1tplDcRw/XzOaItKp6o0n5aQY=;
	b=aILmDTFdqWl9PNTCZjOidKQirWBHs/MbZgQ2y17fipGte48Nqs2F87u5LelNKAbX4/
	HTpffdGW/IbK+rjskoYLcwSolA24E2wgx7AnulXKyAOQ29vuc2KLBMT7ryiQXu/Qo3x4
	MUNrGrtvnVm2PKuu3ZMTVsZmeBQkITc2WkkmaPMjQBRLYjSbJLczaBytF9cX3xEQNPyn
	lD9rKymqPpjFKwU+A4D3tsuPxcAicBvDjt08ateSkILHO0Xeie8cadhLOjwwAi81EV6Q
	GBXp3A3EzBzTvNtwCU9AlU6l8t7qFF/734NYu4t6Fzb9CQUZQ+yunDN7htKjXY3zOpGs
	pWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2zxtNB80kgUrU91FAd1tplDcRw/XzOaItKp6o0n5aQY=;
	b=BdvQ0s9mEaYe86GUrEjm1hYq178aeiWhOib+7TKMopfHzl3HqY4UlLHg58IScth9mv
	sMuBHM5wgu/9fg+yAsRdauILc3iz2h/iX05zcwgzMSSL7APgrkL3dFlt7QXhpv6XYbwn
	PCyrJKG1WwIKfrrKhTFbNpD1v34neZkLWq++odX4XjBNV8t9YUpixWHQ6UfH/5g4qCbd
	iX6lCCmvzHyh72t2WEsTjpRmF0XHm1g+OvPm8sktxsTTnGvvtzt74vL+eR7Qsn5IVcpN
	T2auqS8gm9y0BNzSL5eAQGC1N0b0UDKDNgWs6S7uDoz5cWnrVhePwZ8I0G0LuKOOoXvh
	C9vg==
X-Gm-Message-State: APjAAAW5+l7GyXLNdXjT4kPkvwwsS4+HRFmEi8WhV/6i9+HpzXlIjcC2
	1r07nHklFO0hPeyyYw18/+H7GOJuLqGt3j9BVOk=
X-Google-Smtp-Source: APXvYqwMbByBXUMnrNi/Yn1ulxQcpbRhNCT5coiUTnkCGpCYczF66QTPzFeIvgaT9jaWO1cNHuh/7BzM0hmR+iYTeus=
X-Received: by 2002:a1c:2082:: with SMTP id g124mr2397969wmg.71.1559036978771; 
	Tue, 28 May 2019 02:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34HAOaAaO1cyiQbR8P6mQPp8p3gCT2jM=UyQDGfvV-fYw@mail.gmail.com>
	<CA+2YH7ud9TX=ohQSk8XY=GzpewzFsXo6Z2eBJ=bXacyAsojV9A@mail.gmail.com>
	<CAAfyv34jJ362tu3x_8J1+FuV3zFpchkB8Ft9w-WERrxCNPxbvg@mail.gmail.com>
	<CACKFPN1bgM_DPDRRDxkjekqZ9gQwV9S+1MkHF42z6MvczD81Jg@mail.gmail.com>
In-Reply-To: <CACKFPN1bgM_DPDRRDxkjekqZ9gQwV9S+1MkHF42z6MvczD81Jg@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 28 May 2019 11:49:26 +0200
Message-ID: <CAAfyv36-ykHu2Gfet1CeuR8tjNgernF4m01AjnQaOzcFb-BZaw@mail.gmail.com>
To: Dimitris Tassopoulos <dimtass@gmail.com>
Cc: yocto <yocto@yoctoproject.org>, Sergey Lapin <slapin@ossfans.org>,
	Enrico <ebutera@users.sourceforge.net>,
	Nicolas Aguirre <aguirre.nicolas@gmail.com>,
	OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] meta-sunxi maintained?
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
X-List-Received-Date: Tue, 28 May 2019 09:49:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Dimitris,

On Tue, May 28, 2019 at 11:01 AM Dimitris Tassopoulos <dimtass@gmail.com> wrote:
>
> Hi Belisko,
>
> you can also have a look in to this layer: http://layers.openembedded.org/layerindex/branch/master/layer/meta-allwinner-hx/
> It's for allwinner H2,H3 and H5 boards that already have support on Armbian.
> Pretty much is just a Yocto layer with all the patches and BSP support from Armbian.
> It supports 4.14 and 4.19 mainline kernels only and also the PREEMPT-RT patches.
> Warrior support was added recently, too.
OK thanks. I think I'll stick with meta-sunxi ;). What about join
forces and maintains one layer properly instead having it separated?
>
> A similar one is also this: http://layers.openembedded.org/layerindex/branch/master/layer/meta-nanopi-neo4/
>
> Dimitris
>
> On Mon, May 27, 2019 at 7:33 PM Belisko Marek <marek.belisko@gmail.com> wrote:
>>
>> Hi Enrico,
>>
>> On Mon, May 27, 2019 at 5:44 PM Enrico <ebutera@users.sourceforge.net> wrote:
>> >
>> > Hi,
>> >
>> > i try to keep it maintained, but now i just have a lime2 for testing
>> > on real hardware, and i don't have the resources to do test builds for
>> > all the supported boards.
>> > Your help would be welcome, i can't check right now if i have the
>> > rights to add you as co-maintainer, anyway i will add you.
>> Thanks I have few sunxi based boards so can do tests also on my setup.
>> Pls ping me when you will add me. Thanks.
>> >
>> > Thanks for the help!
>> >
>> > Enrico
>>
>> Marek
>> >
>> > On Mon, May 27, 2019 at 4:50 PM Belisko Marek <marek.belisko@gmail.com> wrote:
>> > >
>> > > Hello,
>> > >
>> > > I'm just curious if meta-sunxi is still maintained? I was contributed
>> > > to layer back while and when look now thud branch is un-compilable
>> > > (dri2proto not replaced) and warrior branch not created yet. There is
>> > > 14 issues + 6 pending pull requests. Added maintainers also in CC. I
>> > > think it would be good to have sunxi properly maintained as boards
>> > > with sunxi processors are popular. I can give a hand as co-maintainer
>> > > if necessary. Thanks a lot.
>> > >
>> > > BR,
>> > >
>> > > marek
>> > >
>> > > --
>> > > as simple and primitive as possible
>> > > -------------------------------------------------
>> > > Marek Belisko - OPEN-NANDRA
>> > > Freelance Developer
>> > >
>> > > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> > > Tel: +421 915 052 184
>> > > skype: marekwhite
>> > > twitter: #opennandra
>> > > web: http://open-nandra.com
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto



marek


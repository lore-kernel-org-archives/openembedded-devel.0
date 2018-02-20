Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id B46A0783F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 20:32:18 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id p5so8065348plo.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 12:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Jl+1UvYY523DWn3LXpq2hiLNCQ9N0yZOwMlJKl0Ko1k=;
	b=AHekSAabC+0egEtzDuMXhZe/C/xmhAuIcRcNa665yF/MwWqfHr5d9qlf8/rKqZGqbA
	E/x3Dkb/eVotN8nRZ/h4t8gTFEaLt/ylaSej8rWYipnWfb5ryaAPUVL4ohzlTwf11eiC
	/HsuXd7gmuW9jCZGlZcsaKdCQFJQsRPQhI9Vhh2DozSGO9hSQg6umZNlSQpNNKSGU57e
	8dBieSgMTg2tn6Qxa2dqzdfoI1KBxyWLnrodtWUteelfH1Rh64arz7qfu5o7ZzWMmGUA
	rFqAKNTV39eorfoB0beUs1EXrS2qDB/RTl9600lkVCtb21b8VPhGTUeCXPth/BDBlMGQ
	rsuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Jl+1UvYY523DWn3LXpq2hiLNCQ9N0yZOwMlJKl0Ko1k=;
	b=J1CMRLR88zyRoyHgFsSdFXk6Uh47XM7ybo/l2DjiGnAHzvknfcaFNB+ty4CAOBhFBz
	e3G+crFOLNc30fpM/H1QDXg+R305zsGhYUHohVFwLTLyFUCZ8702I0gif6SyDCVxS3iu
	zeBKcz74zXah5O3MifKpER+443uxKO5A5PHfc4pu79oGE0X63HKLxog6qchblzC6BjE8
	2r61yyOFu4UT9Kq9qMGUjihsdf5jOKui7g3OGHM5UYKWc2WxbMACPJnwVKDj6WT1t1N9
	XwCmsRc3S2QfEmqKgmUeJjWAUp0lahAV1hb7oVNuo9vZAkgNm0BFQeGg/E9H+tULRENb
	7EAw==
X-Gm-Message-State: APf1xPC+swq+95ylbFOccZS1CNc1P8/GdBY0Ps2tENHExoCzBxQjcuJw
	EgMKOUtlLYMPs9QKPgkhtUxlYw==
X-Google-Smtp-Source: AH8x224GgoyqLX168VBxjO8Z+OzvT8MH6XQBUUL0aQAPAM3lBHrhFct/ifr7dDlBBpEJEOz8zzAhDw==
X-Received: by 2002:a17:902:8c91:: with SMTP id
	t17-v6mr767456plo.233.1519158739855; 
	Tue, 20 Feb 2018 12:32:19 -0800 (PST)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	a6sm51359354pgq.56.2018.02.20.12.32.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 12:32:19 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <ticotimo@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <35805907-3378-48f8-4fe9-190661313d08@gmail.com>
Date: Tue, 20 Feb 2018 12:32:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 20:32:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/20/2018 10:40 AM, Khem Raj wrote:
> On 2/20/18 10:00 AM, Tim Orling wrote:
>> The recent improvements to the Auto Upgrade Helper have made maintenan=
ce of
>> meta-perl less effort and therefore you have seen an uptick in my upda=
tes
>> to recipes. I also plan to mass-add ptest to all perl module recipes
>> "sometime soon", which will further simplify my upgrade workflow and a=
dd to
>> the confidence of said recipes. My upgrade workflow touches all recipe=
s in
>> oe-core, meta-oe and meta-perl that fit a lib*perl regex.
>>
>> I will note, however, that we are revisiting meta-cpan and that may
>> ultimately be the preferred perl layer. If you really heavily on perl
>> modules, please comment on whether meta-cpan would fit your needs.
>>
>> Derek and others have been doing a great job keeping meta-python up to=

>> date. I mostly jump in when there are trickier failures that need more=

>> concentrated effort. I would like to see increased testing (more packa=
ges
>> with ptest), but that is trickier with python recipes as there are man=
y
>> more approaches to testing than there are in perl. I am happy with the=

>> current efforts to keep recipes up to date as a priority. I would like=
 to
>> see complete coverage of python3 for all recipes that are capable in
>> meta-python.
>>
>> I am open to discussion about what direction we go. Individual layers =
that
>> are curated and built together by YP auto builders sounds like an
>> intriguing path. If this was coupled with increased ptest or testimage=

>> usage, our confidence in layer quality would go up dramatically.
>>
> I would like to understand whats stopping YP autobuilders to build
> layers under meta-openembedded repo and contribute changes as needed.
> All changes with test improvements etc. above are a good change and
> should be adopted across layers.=20
It tends to be the same Yocto Project members carrying the brunt of the
work load for that work.=C2=A0 Its the same issue meta-openembedded suffe=
rs
from.. Resources..

- Armin
> However splitting layers is least of
> the problem as of now.
>
>> Cheers,
>>
>> --Tim
>>




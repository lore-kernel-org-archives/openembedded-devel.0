Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5397C74DA2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 04:52:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w129-v6so4669129pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 21:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=73qmAJ5jDCKTcHN7mbDgZdLfLhU0IByVl2sKDGGbPrs=;
	b=JYNnnlZdTDa9KaBhlDzgbage0IlcEq2xPZuWsAL/ZAxObObty+zHxohpmkIikFr9MY
	E9PmhtyOC4EhFz5RivDAjdWPwFH+4/0puzjzzwRoW946mNRjCqBWfm/nOY5brWoaIuUX
	4HBx79A56pvT0G27WYCmCqEAbJhUYjq65MRUpMFkFLH+bo67jmqE2mL+IojaiS0V/s2J
	OBVZXE7l77YfucoBgGBcW2yGAaQjdrOdGHJmhrWxmYjsjJhre5LIHYTORd9ROz3/5LCL
	PuEWcOILfTV+61cNuCfjZKsneY0Y6LqBIEgRUmnTyKQFZrWp3+SMq9CYL2ssFvRJagMZ
	5NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=73qmAJ5jDCKTcHN7mbDgZdLfLhU0IByVl2sKDGGbPrs=;
	b=kyeGIvnr70CGpSljBehUDzxo8aZo4t7wRDlM5n9f1UxLfMyWpwG7RwKcIJagOGrgSH
	SALshMGXI50fJMXzs8psg0Flm5vSXTwTvXMaZYclqLQ+Of3/ShY5uqr74jimSG4tV4dN
	OyAEjzfc/XlWGEwvUAffye2hkykfQAsPGy6DMr4AZpq4puaUBfbr0jkuoHfjkyoKxm3h
	rHn7H7M6KIapvWvKfwt+zWhoGLaoBBNo9poS/VTfusqAw0YRdzhpO2sWRvpDtOBIy8sx
	oEmp66L45toK+2U5Pc02qC63thjK0mfBbOukpSEeHVd/Js7pmrS3E2Dn8PYBZRYAJYcP
	ug1A==
X-Gm-Message-State: ALKqPwcZtOWYKVtSWbBDcTp8Feq2WIC5gShJ7I3sKr2q0dyWQvcvelbv
	jJp2sR/R+2jhHRFi/TUTgzAGXs5s
X-Google-Smtp-Source: AB8JxZphoPoROR+0DVVn469fo3F7umQ/DbEhkhqRsYUIqSX/Mw7VMO2D9PJJnPndVU5OMaAg64ra9w==
X-Received: by 2002:a62:e408:: with SMTP id
	r8-v6mr12096188pfh.172.1526705571588; 
	Fri, 18 May 2018 21:52:51 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:dd67:9997:496:63c6])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm12801483pgn.64.2018.05.18.21.52.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 May 2018 21:52:50 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
Date: Fri, 18 May 2018 21:52:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 19 May 2018 04:52:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/18/18 7:37 PM, Trevor Woerner wrote:
> On Fri, May 18, 2018 at 6:28 PM, Andre McCurdy <armccurdy@gmail.com 
> <mailto:armccurdy@gmail.com>> wrote:
> 
>     On Fri, May 18, 2018 at 2:01 PM, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>     > On Fri, May 18, 2018 at 12:07 PM, Andre McCurdy <armccurdy@gmail.com <mailto:armccurdy@gmail.com>> wrote:
>     >> On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>     >>> Hi Andre
>     >>>
>     >>> This series is fine, except that it has some formatting changes mixed with
>     >>> cmake related changes. It would be preferable to have them as separate
>     >>> pulls. I reckon that both types of changes are good.
>     >>
>     >> The formatting cleanups are all minor and probably not worth
>     >> submitting on their own.
>     >>
>     >
>     > OK thats fine, drop then in v2
> 
>     They are not worth reworking the patch set to create a v2 either :-)
> 
> 
> It would be wonderful if we could agree on formatting; if we could, I'd 
> certainly help by taking on some of the reformatting task.
> 
> Unfortunately, all such past attempts of which I'm aware never got 
> anywhere, and if I remember correctly, the Yocto folks and the OE folks 
> each have their own ideas of what is "correct".
> 
> In any case, if these won't get in as is, if Andre doesn't want to spin 
> a v2 without the formatting changes, and everyone is okay with it, I 
> could spin a v2 without the formatting changes.

Please do.


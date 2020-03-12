Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id CCD3361C20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 17:51:40 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c25so5969370ioi.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2020 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BzEhHnHNvY06iNWB4J6d1dtuoR/kOm1APtd4jKeOAxE=;
	b=o8tYiCqNI5Ymuxr+R7zRCfQXEkjZYaEdZRh5lzm3EWBnymVhucWTqsfXmZbzI0/RUl
	trCGP09YX8Ic7gg9ypXAXBlvTO1ZwCwMnKz1Mtt/MU+Gswkk5Et3oTPL5FCOaQoGCgCx
	Pf378Zea9B1CdGXwI49GzQ5vycjhCRbAXN+z1rXFK2vED/ZV9AA0PwS5ervfVwQA2egU
	Aq79V0Wu0NBbUm8NRE2pOAYxoziMTKFdGM0a37rl2RuHIpjfDi6Yc8vkTSKdEptF/TF1
	HXOLj11pfQajKTzBfMJetn00469YakKBJevIe3NEFUoZ/58u1nyxuwTn/NyrlbJAYwVg
	+gGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BzEhHnHNvY06iNWB4J6d1dtuoR/kOm1APtd4jKeOAxE=;
	b=p3pA1jqsGqV0wEsAmw2o5GAhqbChC7ZuCAlb7BA6hsX5O0Vb7Ot0rPAECLZwtoz8vU
	EKR0q05223XNhCukl/iUUw8rZGpNO0tAG+MPTSC43qmXgCMM9bZUpXDGS8O6KFCsBdaU
	pBqQ/HKlsNaYoZRvka/dpBq1Wl9qCHj/zJp9zHSlISgoJftJ6EY87VMIplEey5we0G3r
	lUGAM9kCy8gG4H2qk/5XHeEnmAntKtQ/kOwzsW+VVE/ZAhg8JCAIYWyOPsavmI0r64rA
	zzdIs+9Gxlc7XYHJshAQyJ+ZyYVnAXpPmT3mJ4BgvtgaKCoAtEmYSgIWD9e0OBBXVDvg
	qGjA==
X-Gm-Message-State: ANhLgQ0V846DOZt1CIE3fYV7qQVcU9/zr4mSYBrF6wH/pNqzY8mzCk6Y
	Bywkk5x8B9OrrBRCqpxmVeDA3QCDPxaOHAiMcEWsqA==
X-Google-Smtp-Source: ADFU+vv+pwg1CgC5TNcSh7FYFVA194EPNs2MzRqthtb2LLV3D5aa93gq7qQ/kocSofjar1s/i3w2mV9UquW5Uwv4tQk=
X-Received: by 2002:a05:6602:2c89:: with SMTP id
	i9mr8900457iow.131.1584035501622; 
	Thu, 12 Mar 2020 10:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200228150345.11829-1-brgl@bgdev.pl>
	<CAP9ODKqbfrnLUBzE+WkGceSo+qBimGPUFUcgRuZmS3vwJZqpwA@mail.gmail.com>
	<CAMRc=MftVskWMFZQhbFKZLwNAR9a1+4zbayWTbXFuSJgG-ZgbA@mail.gmail.com>
	<CAP9ODKpVW6qxw7+5oA7auBMW1ApLdqjicZf8Ahe3RhYG8QjmgQ@mail.gmail.com>
	<CAMRc=MeJ0R81s-ui7J78pe89JE6c-_wx3RGUZx-tzMLc3pzthQ@mail.gmail.com>
	<dd3d6ea7-2bac-6a06-823d-fd070f547784@gmail.com>
	<CAMRc=MevN3tAfBkLZuOiW0BVbOWkq_T_HiD6XTMwh5d32xrGeQ@mail.gmail.com>
	<CAMRc=MehBSu1RpPkzP=xiFqt3wpJrf4FhV889jcPxUHPnf0GLg@mail.gmail.com>
	<CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
In-Reply-To: <CAP71Wjz1n_Csm762xbsxUK-3i3OYm-rfh=9Ccf28USLgJjRiFQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Mar 2020 18:51:30 +0100
Message-ID: <CAMRc=Md1Udxq0eOUzNH=Pr3corUEa88_wdTJJFyurjMvJcfaAQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-ota][PATCH] meta-ota: add support for binary-delta images in a new layer
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
X-List-Received-Date: Thu, 12 Mar 2020 17:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 11 mar 2020 o 14:28 Nicolas Dechesne
<nicolas.dechesne@linaro.org> napisa=C5=82(a):
>
> hi Bartosz,
>
> On Wed, Mar 11, 2020 at 9:04 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>>
>> wt., 3 mar 2020 o 14:56 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
>> >
>> > If this is not something that should be part of meta-openembedded - is
>> > there any way to have it hosted at https://git.yoctoproject.org/cgit/
>> > as an official yocto layer? I'm sorry if this is a dumb question, I
>> > don't know exactly what the policy is for that.
>> >
>>
>> Hi Khem,
>>
>> gentle ping on this. What is the procedure of hosting a layer at OE?
>

Hi Nicolas,

thanks for the response.

>
> it depends what you mean here.
>
> 1. Hosting on git.yoctoproject.org is mostly for layers supported by YP m=
embership, these layers are under the responsibility of the YP TSC [1]
> 2. Hosting on git.openembedded.org is under the responsibility of the OE =
TSC [2]
>

I'm not sure what that means exactly in terms of making a layer
official. I can only guess that non-members can't make their layers
part of the project for political reasons.

> We recently started an initiative using gitlab, to host layers: https://g=
itlab.com/openembedded/community, though it's not picking up much for now. =
But that would be another option, Paul B. or myself could give you access
>

Yes, that is one way, but I just don't like githubs, gitlabs and other
bitbuckets. I prefer regular mailing list flow + cgit whenever
possible.

> You might want to host the layer on your own (github, gitlab or anywhere =
else). I understand why you think that hosting on yoctoproject.org would ma=
ke it 'more' official, however hundreds of layers are 'self hosted' and it'=
s usually not a big concern.
>

They are also scattered all over and significant part of them are not
being actively maintained. Hosting it at some official git would at
least mean that if I ever stop working on it, someone else could take
over without moving the git tree. It would also make it more visible
and make it possible for the development to happen on the official
mailing list.

Anyway: is the material I described in this thread something that
could be committed to various existing parts of meta-openembedded
without creating a new layer?

> In any case you should register your layer in the OE layer index.
>

Sure.

>
> [1] https://wiki.yoctoproject.org/wiki/TSC
> [2] https://www.openembedded.org/wiki/TSC

Thanks,
Bartosz Golaszewski


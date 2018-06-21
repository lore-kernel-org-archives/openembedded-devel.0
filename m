Return-Path: <samuli.piippo@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id D0D6078787
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 09:55:09 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id n7-v6so3818785itn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 02:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VumrutHn3XIm1US799S271RHxnXmDS/EJ7OmyL4AE7I=;
	b=QbcPwnc69EPLA+Y7izJ9AO/YJi//Gehu3GT2N1QcT8s6PxMqRvhcAjWD1mGZxMhQ6Q
	akmy6nNE8EjCP+DBNgOdU1+OWUtFNOK+O0ErQa6v184B02dBI3xumCxByW0WDw4AZIx3
	Fh8kdPEHl2fhxMS1AEy6KhdumPpROEQKpLa2tdZJHE0bgILuCZfrbFOh2UpSS38RATuy
	4aCbGBiUsvFfsTdBkTx6KGANDm7jS/PaDXSEh3eYD92QpMQXoVbqCoGFMTuqyvfKVaT/
	X+WjSIvJsgOzumtDqfMk139ezeSHyifPyp5a4dT6ojHlRMLJtxpj51H373QZpA2v4qbY
	ZT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VumrutHn3XIm1US799S271RHxnXmDS/EJ7OmyL4AE7I=;
	b=E4gR2QV5pMNO68w3SQmnQ3S6Ki37Pa/WKmWtwGfu4KezEn9svwocQVpYkCcLUL45vx
	HWIr7MwtuHu9XsXGKRXK/kZmTXEHstjbbiuxMCAY/FGzkcAdcpEQ8yaF9COHMyIOzV2H
	e5TalyH47FDC5d1GFBEL7nEH+gI4LUq2DagM0UFTvbUKi0gcLx96VbqbXHOITz50+ytz
	IogOqBFUtSbow51jSQwEJwS5C3BF9RzQw6SbkqEc903cTVFZELW2a8AHPH8kW4aGSXiZ
	w9SjCUG5aIqyn0iSCHDiXY/TVwBSMfzKo2jW9M/RtOLgjNdo1/Z5GhVJtf4f/tYiLKeW
	BJQA==
X-Gm-Message-State: APt69E1VuScnCMLW4z/jX1FuIGqYnYeiqKsOQBJDPLagua8hJKLWAoZf
	HTs0sPJrTx+ry8SLu65vrb5EZCYektokXEK+EYE=
X-Google-Smtp-Source: ADUXVKLg6msQO4+4w0EvIz4jCnZJSf52NxiKVgNoBM8bLsWAPdaRTop48vnAgVRWz2Xi3j9yUSrOr8ul2MHi50P+jJ8=
X-Received: by 2002:a24:4d8d:: with SMTP id
	l135-v6mr4283873itb.121.1529574910632; 
	Thu, 21 Jun 2018 02:55:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:88d0:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 02:55:09
	-0700 (PDT)
In-Reply-To: <CA+chaQdjza7HgT3W48Jz7kPcfzBgvn912TTmrX_LaPXpbZnURQ@mail.gmail.com>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
	<20180620121927.GB3257@jama>
	<CABXoSoWCCG9CmvyjfCk0BmS2uj3AHVymsBnNjFFk3=g0cA8+ow@mail.gmail.com>
	<CA+chaQdjza7HgT3W48Jz7kPcfzBgvn912TTmrX_LaPXpbZnURQ@mail.gmail.com>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 21 Jun 2018 12:55:09 +0300
Message-ID: <CABXoSoXZ8rvOqYycovnJcB1WwMyqbC-cqmor8_k69PUUmpG8=w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Thu, 21 Jun 2018 09:55:10 -0000
Content-Type: text/plain; charset="UTF-8"

That's not going to work with AUTOREV even if you don't have
nobranch=1 there, but it will make SHA1 builds work since the sha1 is
still accessible.

On 21 June 2018 at 12:03, Martin Jansa <martin.jansa@gmail.com> wrote:
> And how is it going to test latest revison in e.g. 5.10.1 branch which
> you've removed in upstream?
>
> On Thu, Jun 21, 2018 at 7:14 AM Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>>
>> On 20 June 2018 at 15:19, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Wed, Jun 20, 2018 at 02:57:39PM +0300, Samuli Piippo wrote:
>> >> On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> > 3) we cannot use nobranch=1, because that breaks AUTOREV
>> >>
>> >> How does it break AUTOREV?
>> >> We are using nobranch=1 when testing non-released Qt versions and
>> >> haven't seen issues with it.
>> >
>> > And are you using AUTOREV? How is it supposed to know which branch to
>> > track?
>>
>> Had to test this myself and I still don't see problem here.
>> As long as there still is "branch=${QT_MODULE_BRANCH}" in the URI,
>> nobranch=1 doesn't seem to make difference for AUTOREV.
>> It only stops the SHA1 validation, when you do have SHA1 in SRCREV.


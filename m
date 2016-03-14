Return-Path: <k4230r6@gmail.com>
Received: from mail-lb0-f195.google.com (mail-lb0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3FD601A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 15:00:50 +0000 (UTC)
Received: by mail-lb0-f195.google.com with SMTP id vk4so19317662lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=3fqun7nqspgm4p/eH25sv9vtfCywwFH5A78OXFpVOBI=;
	b=z8G2p9hZsnax8qTSDPkCNLRQomYqJ2kLxHu+WLNXRRB1p59tho58w8GfX6RYd2m/tY
	lk96NLisBDQTMXiEIyDYDjWMgBF8kZd4qTFl+GDH4xqqWlXzzLVjQCdhqmGHceyAUANL
	av8jHz2eXt+44+uiFY+X5XcMTxmNoKtyXJrqQLzSMOrxwXehzgOjfI1ZzC8t3P8urgpX
	XrLU1dbyYMExtNVrhOMip/PmijetBGp09ij0xMc4xPDUoL9duDk1tHTy5uiHzVpeqgxh
	epFIY+22BlXp+sWJsq77Y9Jg/gYMbhQloyEo+YndE+6G9MxxqBgQdHXZVoTkdb2Xq+w7
	/iJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=3fqun7nqspgm4p/eH25sv9vtfCywwFH5A78OXFpVOBI=;
	b=C1VdT+UYE7RXuHRXb17hf/y/s40fJ+6c+yXg35mKJp/SPRhBq/B4Aekkmgvsx9AY2a
	PQiZcFiISw/gSNzq0i8sCGVJLgFbSc9myygFBF9/26BWNvxsW0X0eHRpQ0dvgP9d4mkE
	uRfjMA35t8qvZVuLVo0/DlfAz+vEAKWG9hLrIsoiixP4yJH8r1f213BPS7S7g3zF9QIX
	uxZUTVCmjVYpCJW1J5H6D+rIp5tGl6oe7PRGGt2pi1OPCVXClThIGzsDSqs8+3Y9DCNd
	P1yMawlxOXlAVgQ5ILjsncWdwnvt/051BWU5oYLcWknZQ0yNJXWLOZtcoei+6JG+HjM9
	ombQ==
X-Gm-Message-State: AD7BkJLJzcDyHe4dL4oHSDSOvWAGbZ2rqdnARxjhFEzDtBn1e4a3xrYIalYsiI/pwuoi7GDtDU3tED079GjlzA==
MIME-Version: 1.0
X-Received: by 10.112.161.131 with SMTP id xs3mr8072609lbb.65.1457967650335;
	Mon, 14 Mar 2016 08:00:50 -0700 (PDT)
Received: by 10.25.205.10 with HTTP; Mon, 14 Mar 2016 08:00:50 -0700 (PDT)
In-Reply-To: <56A0F1EA.1080008@gmail.com>
References: <CAALGJZY5LQw6a+fk+4TMy+JHFo=_p7kWixh9BJT+XyQqXh6wvA@mail.gmail.com>
	<56A0F1EA.1080008@gmail.com>
Date: Mon, 14 Mar 2016 16:00:50 +0100
Message-ID: <CAALGJZZua7pofZwDmLekFJSJ9A82h+3EddzdWetheG=7p1h-Rw@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error
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
X-List-Received-Date: Mon, 14 Mar 2016 15:00:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2016-01-21 15:57 GMT+01:00 akuster808 <akuster808@gmail.com>:
> thanks,
>
> I will add this to my queue and let you know when staged for merging.
any news on this?

Best,
Christian
>
> -- armin
>
> On 01/21/2016 02:39 AM, Christian Ege wrote:
>> From 6d2c2b602185a03232635a9c5c97253930c2bc0b Mon Sep 17 00:00:00 2001
>> From: Daniel Schnell <daniel.schnell.extern@ifm.com>
>> Date: Wed, 14 Oct 2015 14:49:52 +0200
>> Subject: [meta-openembedded][FIDO PATCH 1/1] ruby: Fixed runtime error
>>
>>  Only include "enable-wide-getaddrinfo" if IVP6 is enabled in disto
>>  feature otherwise 'gem install rails' throws an error
>>  for the missing symbol 'getipnodebyname'
>>
>> This is a backport of master branch commit
>> 86835b4ac5ee593e8bd5b142504194370df71728
>> to make any gem installation possible.
>>
>> Signed-off-by: Daniel Schnell <daniel.schnell.extern@ifm.com>
>> Signed-off-by: Christian Ege <k4230r6@gmail.com>
>> ---
>>  meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> index 080d455..ccb7cbc 100644
>> --- a/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> +++ b/meta-ruby/recipes-devtools/ruby/ruby_2.2.1.bb
>> @@ -9,11 +9,12 @@ SRC_URI[sha256sum] =
>> "5a4de38068eca8919cb087d338c0c2e3d72c9382c804fb27ab746e6c78
>>  UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
>>
>>  PACKAGECONFIG ??= ""
>> +PACKAGECONFIG += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
>> 'ipv6', '', d)}"
>>  PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
>>  PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
>> +PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
>>
>>  EXTRA_OECONF = "\
>> -    --enable-wide-getaddrinfo \
>>      --disable-versioned-paths \
>>      --disable-rpath \
>>      --disable-dtrace \
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
http://ch.ege.io/


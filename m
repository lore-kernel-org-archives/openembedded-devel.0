Return-Path: <uvv.mail@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7F5A79559
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:52:25 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id c85-v6so4945619itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 10:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=vTcvEKHCGvgMsOaNYDWQDpcCRlE/igX1a/Hg0F2YLlk=;
	b=JnTbJYhzfUwtTpiif6FCpmbEOj1qqkfal6mutVZdOQHAcFV4Q3mpqlIwRWX2NyHScl
	9wuqbTMbTIrVW+eN5Gi5i1ZflGB5+rsgljQEm6Gl3usWSBClg6gE8DXAu8jT823NxrRt
	THcMmzgV2859yRf3eUN/SLNIHpd//uhzW0eGZN85F4vq4xgeGhwCsIcfVeQRrjPxpHUq
	qhNyA9yw3alecIhftPGFyk+JvGoudG4t17NRVxl1HyBtSBnQf6/Drh8lgsljaMFsXHDm
	nwae3LAEbzmU0RMy3jyRln4riaWp40yKSo03pz28FKkaCVoeMSS4joq5ownsg3vxp0A9
	QmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=vTcvEKHCGvgMsOaNYDWQDpcCRlE/igX1a/Hg0F2YLlk=;
	b=J8oZiNftj3kJODj2qSRkdliakPQ5IGMlKW01iAhsjV7LLnPfZGzGULugPrv+Ajrrnr
	3rJkY7O2UZyBw2dM4xm6hLncoE2d3As2qRNOVALp1hXHX5IYXLlBYe1u5pIU7BBFbGmG
	kPoReRhJ7+aabx4Rrd1zzRyold8Vo5SwPrjdsvNqu/kIAlJxmp67TIipFS38sdtOIx2D
	aaTU6TY5gwQO+XxoiMol+yTR9BW/8dnAmGFxp0+MMd7yF4B5AXtKegYzhS+kMVXAPejO
	1RvfDx9EQ2pR0+hvMHomkS2l8V2ZjV/7XwZr28aJsmqzDWP6B7CJaOzfDoKUvCi/V+PK
	BIQg==
X-Gm-Message-State: ABuFfogk5ZWeiTakRGobkssuf9liO4aW0IN9O+QaDYWcRht/ZGBEjSkw
	xbuHYPiQVRera/E2/ABjVOQu4CqRnJQ=
X-Google-Smtp-Source: ACcGV60Z3u0+TTsfsCfRC+0Lepvut8887WwwLadXvX0iI05pSlvaavgtF8rW1SN/jD+kCe6okTAXDA==
X-Received: by 2002:a24:aa41:: with SMTP id y1-v6mr2868102iti.91.1538502746707;
	Tue, 02 Oct 2018 10:52:26 -0700 (PDT)
Received: from Vyacheslavs-MacBook-Pro.local ([67.215.13.230])
	by smtp.gmail.com with ESMTPSA id
	185-v6sm5747556itk.28.2018.10.02.10.52.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 10:52:26 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20181002083238.74140-1-uvv.mail@gmail.com>
	<CAMKF1srWp+SANX2zBC_H4tRZS_Jk7+2ZMXBgA4z==+h7KyjTsg@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Message-ID: <575d6aa9-91d2-b4e6-2f0c-0b7a1edfad39@gmail.com>
Date: Tue, 2 Oct 2018 19:52:23 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srWp+SANX2zBC_H4tRZS_Jk7+2ZMXBgA4z==+h7KyjTsg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libeigen: allow empty packages
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
X-List-Received-Date: Tue, 02 Oct 2018 17:52:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,
It's a build time failure. libeigen is header-only library.
All headers go into dev package, therefore the main package is empty. 
Dependency on the dev package doesn't work, AFAIK, so you have to allow 
empty package for build to succeed. Otherwise I get an error that empty 
packages are not allowed. I reproduced it when I built ceres-solver 
recipe (although I don't use the latest poky). Perhaps I'm missing 
something and it has been solved in the latest poky?

Vyacheslav

On 02/10/2018 17:14, Khem Raj wrote:
> Hi Vyacheslav
>
> On Tue, Oct 2, 2018 at 1:33 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> When libeigen is used as a dependency (e.g. in ceres library),
>> the build is broken because empty packages are not constructed be default
>>
> can you explain a bit more on whats going on? it is a runtime failure
> or build time failure.
>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> index 31a42a9d6..a59320655 100644
>> --- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> +++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
>> @@ -18,3 +18,4 @@ FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Module
>>   # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
>>   RDEPENDS_${PN}-dev = ""
>>   RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>> +ALLOW_EMPTY_${PN} = "1"
>> --
>> 2.19.0
>>
>> --
>> _______________________________________________



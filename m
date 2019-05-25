Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90EDE7C786
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 00:59:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b18so4085775qkc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 18:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ReEpPh6b8txLYfdBwCR6AY0dmsJKKWaELrdikiEv5hw=;
	b=Xs/bI7irawHivq7pWwnKN3lBFQQgo0dWOJraauVYJPPp4HA9POG19uEQ5Sn/+H3Xvs
	bAUKWgdeYV1B5bIr6g7T48rl6riubm10bFrdUxyLK0Hy7wuqO2ZP4PAfWQ9HvCek8+Lj
	0w4CL4dPNWjxIykC05Y4zRUpg521AlRNXRo4oRen1k+p3G/NwTBvReqijrzjToNSpIK9
	I+5BNndPqScXGhMQs1XkXnl+sZlKJd/M/+Oc9/Tks1xSHJKj0CMiTIh+zAd3j90zOBAf
	W8YpFoBRlIr5KxukrArdKvcZU8wr9ajEE4RgtBTnFY9J3e5D9C26beOV1NCApokLn/Pq
	wXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ReEpPh6b8txLYfdBwCR6AY0dmsJKKWaELrdikiEv5hw=;
	b=juqJEiru0JlFyWwKPKOAHhqM2prwzHYEieUZZukfnsXH2mezdDQxKysm54Yz8K3LKV
	6owIZYma6REVKd54dijy6WGN9eb8vE77My/RASeRIbg0aVsFiTeMhc5AYbSsdNa/uAjp
	bb5PH4JstjbeOy0yGOnUWNL087ddNZFkeALWQwWS6MGAxRjAe+ism9ZAYJn9v8gXV0O6
	opTUHJ/iradZ5SWO6WdP460vl4DV2XuEYvE6xp20bch+A7myGO8bvWMDw5QEHLyyP4tq
	VAfTfPBmJBLyluqm6x///GRsvlwB/nrjAq//wjCsKPxh5JU1es2698qRfdgLlubrBePP
	eRqg==
X-Gm-Message-State: APjAAAVOzOhERYUkXmHjBzoQjtzzBoSWUAZwyiz2qYeAygcTXta11+rq
	T3X5ZlGjGYfeGjCTUo8jQUkMMiZEr8DYiaizskk=
X-Google-Smtp-Source: APXvYqz5sJ/BsoQWhWba4NvMticdNsrLhIJSsexJ61ziUNw/0C0ipE9BLaqPpLxxLFT8Zz0x36Uknz1koQSq5kkj0yA=
X-Received: by 2002:a0c:d251:: with SMTP id o17mr82599648qvh.181.1558746000087;
	Fri, 24 May 2019 18:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190524233948.20049-1-Martin.Jansa@gmail.com>
	<CAMKF1sr0TFOdj0=mTSQ9ixBup8K_QjsSPBTqd4kL7rS23b+NXw@mail.gmail.com>
	<CA+chaQdjacqx2W6tLZzPYL7kV9LBo24C19Y+PX5jUHTerfsW0Q@mail.gmail.com>
In-Reply-To: <CA+chaQdjacqx2W6tLZzPYL7kV9LBo24C19Y+PX5jUHTerfsW0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 May 2019 00:59:33 +0000
Message-ID: <CAMKF1spSQYjMqB-tj4-vhrkVWG5BkOU_Sc08Neu79CF7u2rOUA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libmikmod: fix SRC_URI
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
X-List-Received-Date: Sat, 25 May 2019 00:59:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 25, 2019 at 12:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> You mean like in:
> http://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/master&id=5a1a79dcdfbf4f9ba22c93ded2ad2537ece02e23
> ?
>
> Because that will be sent later when it's better tested and the upgrade probably won't be backported to warrior/thud.

OK sounds good plan

>
> BTW: All versions except last one in 3.1 and 3.3 series (both from 2017) were moved to outdated_versions.
>
> Similarly now e.g. mesa 17.* is moved to archive/older-versions/17.x/ and only 18.* is kept in archive/..
>
> Luckily all these archives are on sources.oe.org, so people using that won't see the issues.
>
> On Sat, May 25, 2019 at 2:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Fri, May 24, 2019 at 4:40 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>>>
>>> * it was moved to outdated_versions directory
>>
>>
>> Why not update to a version which is not outdated
>>>
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>>> index d53dff6a07..bbf58f9540 100644
>>> --- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>>> +++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
>>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
>>>  DEPENDS = "alsa-lib texinfo"
>>>
>>>  SRC_URI = "\
>>> -    ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
>>> +    ${SOURCEFORGE_MIRROR}/project/mikmod/outdated_versions/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
>>>  "
>>>  SRC_URI[md5sum] = "9dd9bed30c6f7607a55480234606071b"
>>>  SRC_URI[sha256sum] = "3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


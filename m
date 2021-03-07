Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.22982.1615133469291398536
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dadVegFP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id j6so3699830plx.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0IYvMzuO6XKUxD0DJ+kzDuTf6M/UfoYreqGK2VrGJC0=;
        b=dadVegFPfpBXowS2tCPA90mJ3oL90oxS+A1TGCezQ7taz2sBJJphhhxXJIQ8Unum0j
         PJcROgHHGKHs0PaaZyrXQpNRVqW0/NoqpZVDoxpNq2dVno4Jgpo2nHX4rJl1+YUPGKmr
         lLMTGdwzzl/J08rmL2X9I3akjfZ2tZdHyUbEVGMowvOdIdc4/kNI5OIIF2WW5AZd8XQL
         hXwgxfSVm4R/N4JMynaRS6kJMYWTlIBVQ26rh4rpHir/d1chFx9gHgPYo8nL0Yplcq4a
         CQkb1ylUH+0Op+YxP0oz9lJB43X8yrOuEr81IMAQ9xkt06pDbE9PthS9IPTc/fGxiLzT
         Y9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=0IYvMzuO6XKUxD0DJ+kzDuTf6M/UfoYreqGK2VrGJC0=;
        b=sCTlT3IlfP8+bv+w6eAl9gerh8HDeL1/0xDNDpeaFdq74Q8GWeItLj3duEq27DeTKC
         JtCF6R9fYUl2Ampc2zK5dNHmJfcpVxE8Ci8XriZuimEYj9BEajpYswlkGsuhg7ADBezm
         zVfBndwWMEZ9NEqqtBe4+scZqNiD9RBW/kRca3tRlsVt250XP12m1eaA+7Z1wwu5gyOZ
         IrI5gVGCSDRLIiqKg79s06RScJrP9NyeF3du6cuUZavu0Fb03Da6d1LgtZUA2YqZ5Lap
         WX3vmFjeYkPA8W/tqyiF8fsN8P8h3HMoR6Xry1JNpfZQnT93CIvEOpgYPvIORhwU/2W+
         MTgQ==
X-Gm-Message-State: AOAM530X7pQeT5Hzlpt/seeB/O/SghEiI/LdRKoLHxF6an6JLYAENztB
	4iCx6g7TbGIJbwB6qstfQwgb/P+X+os=
X-Google-Smtp-Source: ABdhPJyNtH0vYZXm2gQV+8Av0yIVRIqYqPOLQF90oj+2f92eMMgi2ZM9txhKLoy2kKO+KzJjeq0Yfw==
X-Received: by 2002:a17:90a:16d6:: with SMTP id y22mr21146520pje.55.1615133468342;
        Sun, 07 Mar 2021 08:11:08 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:4de0:7e40:32a3:ab29? ([2601:202:4180:a5c0:4de0:7e40:32a3:ab29])
        by smtp.gmail.com with ESMTPSA id f6sm8397807pfk.11.2021.03.07.08.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 08:11:07 -0800 (PST)
Subject: Re: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20210223082553.29759-1-andrej.valek@siemens.com>
 <f9cfbc7e-4faf-7d7c-0fc0-60029eb3e43f@gmail.com>
 <DB8PR10MB3977B069CAEEBB902BC04448929F9@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <70071ce7-743f-506b-70ff-3f34c2337458@gmail.com>
Date: Sun, 7 Mar 2021 08:11:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB8PR10MB3977B069CAEEBB902BC04448929F9@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Andrej,



On 2/24/21 1:03 AM, Valek, Andrej wrote:
> Hi Armin
>
> Regarding to OBJS_LIBS, it was added here https://github.com/open-sourc=
e-parsers/jsoncpp/pull/1197/ . But why to install it? Aren't the headers =
and libs enough? Previous versions don't have this "feature".
>
> Regarding to adding into dunfell/master. I wanted to ask if it's possib=
le to add it also into dunfel + master branch. If not, then I have to sea=
rch for security fixes only for dunfell branch.

The upgrade to 1.9.3 was reverted back in July 2020 do to ABI changes so
will not be taking this update. See commit:

https://git.openembedded.org/meta-openembedded/commit/meta-oe?h=3Ddunfell=
&id=3D0e0b4892f50808b87223a1e8dbcd13d4e16368cf

Master is @ 1.9.3 so this patch could apply to Master.

-armin
> Regards,
> Andrej
>
>>>  - do not install obj files
>> What kind of update is this.
>>
>> What problem is not install obj fixing?
>>
>> These changes are not in Master.
>>
>> -armin
>>> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>>> ---
>>>  .../recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb =3D> jsoncpp_1.9.4.bb=
}   | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)  rename=20
>>> meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb =3D>=20
>>> jsoncpp_1.9.4.bb} (82%)
>>>
>>> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb=20
>>> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
>>> similarity index 82%
>>> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
>>> index e41907de4..a02ff4a4d 100644
>>> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>>> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.4.bb
>>> @@ -13,13 +13,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfa2a23=
dd1dc6c139f35105379d76df2b"
>>> =20
>>>  PE =3D "1"
>>> =20
>>> -SRCREV =3D "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>>> +SRCREV =3D "9059f5cad030ba11d37818847443a53918c327b1"
>>>  SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp"
>>> =20
>>>  S =3D "${WORKDIR}/git"
>>> =20
>>>  inherit cmake
>>> =20
>>> -EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DJSONCPP_WITH_TESTS=3D=
OFF"
>>> +EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DBUILD_OBJECT_LIBS=3DO=
FF -DJSONCPP_WITH_TESTS=3DOFF"
>>> =20
>>>  BBCLASSEXTEND =3D "native"
>>>
>>>
>>>



Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC1817518E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 22:28:31 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id b25-v6so6386360uak.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KOBbEzZnCcIR7mVsr9mYJdKhAOvQf9FyrHDMZE4HvfI=;
	b=qknNcrdUIZbamNE5QDs+PJ0SA5qTMjX9Y3aWmiYldaI7AgB3HEcfyru2uDjVkUYpX5
	KvSkonBnK/doyL5SaifezxOURD00n2M+9D3XO78y9VcbkkoWmMwCyr8ojZMG7AikXt37
	2SexTASR6v9Bil8QFaCrKr7xSSdo6DbxVu16XHV4PjNtBQumiKp5zbU1ZFFr7olwBKDn
	zeX5blaSVBzIGlCGlfY/MpLVZXpA/ZsCkYUbCP4gT2QWhOvo5SRXtszC8wDT8EDC23YV
	iBWg2ytdqG602gEVBuufLkIkVzTt7+S7YG1zpkpfd+E+wpAmEGoHGk6kyKMgHCiPk7FY
	Byyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KOBbEzZnCcIR7mVsr9mYJdKhAOvQf9FyrHDMZE4HvfI=;
	b=qHabQd/vmk93DZGJxGfKVZN+ya+4pxZGQvgUxWpEY5Cl4D8TQXt2u7qPYAnlWk//+7
	AQ29UEA6/3wSVOA1Gg0j2d4rg2IFsU1cKQSQIqQnRHaR6W9Hog+AyUAUA5HEyYQ4Ann6
	h4WiZsnB98BeQA0y3UtKMUXy1fOqdRfOMnciiUbsVFy8Myp9ERanDyIvldFTyrFTaVho
	ZA1FqOXyTxtZNL0Xvka1v3kYfDuud2DOQ7Q9Wo2x/PdlFGBPEgFh0m05CgiaM1k4xCdD
	5vj9sYMU/HVa1uAaAsGi6lZgfcZko0OkT3Qohs8NBaDOlZVVxATt9LTSNJkfIwtVudrx
	WrDQ==
X-Gm-Message-State: ALKqPwdLDfmOjIm7vdjuE91soe3vpdEItrW272ZWwqsJU+5ANJ+Dk6qb
	7vopRM1YpMNg4G+sD1Bge/Ae6u5CPSfbHqbKIwM=
X-Google-Smtp-Source: AB8JxZpIr8126GY1Rqd2BiUi5DX6ARkGUvBueUDRqCHwiDSYf0VHpXvYYtrIBcyVNaY77rSg/jWv+e9U+CVDoWUwQOQ=
X-Received: by 2002:ab0:4c44:: with SMTP id
	d4-v6mr8750637uag.128.1526682512589; 
	Fri, 18 May 2018 15:28:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Fri, 18 May 2018 15:28:32
	-0700 (PDT)
In-Reply-To: <CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 May 2018 15:28:32 -0700
Message-ID: <CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 18 May 2018 22:28:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 2:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, May 18, 2018 at 12:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Hi Andre
>>>
>>> This series is fine, except that it has some formatting changes mixed with
>>> cmake related changes. It would be preferable to have them as separate
>>> pulls. I reckon that both types of changes are good.
>>
>> The formatting cleanups are all minor and probably not worth
>> submitting on their own.
>>
>
> OK thats fine, drop then in v2

They are not worth reworking the patch set to create a v2 either :-)

>>> On 5/17/18 6:30 PM, Andre McCurdy wrote:
>>>>
>>>> The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
>>>> ${datadir}/cmake end up in the dev package, so recipes no longer need
>>>> to provide custom packaging rules to handles these files.
>>>>
>>>>
>>>> http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>   meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git
>>>> a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>>> b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>>> index 9354799..6b9c545 100644
>>>> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>>> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>>> @@ -24,5 +24,4 @@ PACKAGECONFIG[testapps] =
>>>> "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
>>>>     PACKAGES =+ "${PN}-testapps"
>>>>   -FILES_${PN}-dev += "${libdir}/cmake"
>>>>   FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
>>>>
>>>


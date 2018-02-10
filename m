Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 094916AC37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 10:35:03 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id y3so10586650wrh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2018 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xNQPymwedk7JpqC4lotCHQ6HVIC1f6PFQS2t5lLdKlE=;
	b=Uvmvu6a7C4o+Ze6RwpVjs0nQTgbwWgDY3Q4NvUSJem3qgw1k08ZUxUK0GFsbNTSQwV
	nvO79FCJEIbnpLyiYDRLC322B5J2gH+qs9RGxuBP/NwnS8L8J7iGd9NDibn30ZdYvH5I
	e7r6vjQDAe9OEjLd/XPAS5+njUBhczhEBnjUubN+r7s7yZYAeFPevAQqvQU8YFWfvZYY
	Ho0zyQCzgz74pvq0/q8BaXhwEcLjzFkQipMbOjZgrrmX/YhULatXKzIZR5BL9ndPkfQa
	dwH5i5WGB5cQGRtNbl/gaz6bZz7GOtkgH6IKq9TGY3WLYmou0c3q+T8jfJZdaLLw4Yqn
	Pmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xNQPymwedk7JpqC4lotCHQ6HVIC1f6PFQS2t5lLdKlE=;
	b=pkrGUleKPY6J3NZws9/rqxzhB6OexM5t8LhzpSb/ldRJNctHwkfktcQWb1CamzHhMC
	b/hVrebutUOe5cMCmDL37ujzKG5vystatNXaqG/wQHV1JhxjiNGnaOJEA1Y7buOzICx7
	jkwbbmERVqskjm7oSx4Bs6fiMx/7tdEva/An5AtKh77pM3edQtuN2Pr0QZww5T0rGfW7
	AdRouWbjoWIe5d3Y4o/QJtWffD4sFWsa4WynbRZBZl74azUAvWtI28nXH8tsM13QnQuo
	AIiq5RDNKoKzZw2hLlKH7MbuMRcjntZM+gADBfcaY1/HjVJQAHGxjWQHWSSjZtL1mpnh
	Wz4g==
X-Gm-Message-State: APf1xPDZUUhw7s7GLIE9lZVCRt+EFgNrFp1uvpsrt8xgFaRwuyXvNjTF
	mUiin0U+Prz+Y+dsvlbfpm5f9ljfFYC2xdoZLso=
X-Google-Smtp-Source: AH8x226z4Tkobp0lPQX29RMxu7VWlz4LD0Q3e1uJKoY93RZu9LPhDjpg4WCM4o2H0xqkTvbrgLyYeq51rO+y4UFQwrQ=
X-Received: by 10.223.189.136 with SMTP id l8mr5016527wrh.58.1518258904699;
	Sat, 10 Feb 2018 02:35:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sat, 10 Feb 2018 02:35:04 -0800 (PST)
In-Reply-To: <CA+chaQdUtAC0EkTiebPUYBWybk972E89x2tTNvAnC2r0cMpVqw@mail.gmail.com>
References: <1518098282-23564-1-git-send-email-derek@asterius.io>
	<CA+chaQdUtAC0EkTiebPUYBWybk972E89x2tTNvAnC2r0cMpVqw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Feb 2018 11:35:04 +0100
Message-ID: <CA+chaQcZvX7f-yuZHxM_+urhOquTNg1iTv3ev5s9b-vfoE2VmA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-smbus: remove sed to replace i2c path
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
X-List-Received-Date: Sat, 10 Feb 2018 10:35:04 -0000
Content-Type: text/plain; charset="UTF-8"

There is small issue I've noticed in incremental builds.. when do_configure
is re-executed in the same WORKDIR where this sed was already executed it
will fail with the same error about missing i2c-dev-user.h.

It can be fixed by additional PR bump to force new WORKDIR.

On Fri, Feb 9, 2018 at 8:16 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Thanks, works for me.
>
> On Thu, Feb 8, 2018 at 2:58 PM, Derek Straka <derek@asterius.io> wrote:
>
>> The i2c-dev file is now installed in the standard location, so
>> the sed to change the path can be removed
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>  meta-python/recipes-devtools/python/python-smbus.inc | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-smbus.inc
>> b/meta-python/recipes-devtools/python/python-smbus.inc
>> index 0bca58f..57ca8ae 100644
>> --- a/meta-python/recipes-devtools/python/python-smbus.inc
>> +++ b/meta-python/recipes-devtools/python/python-smbus.inc
>> @@ -9,9 +9,3 @@ SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62
>> f2054bb39f19961d67e0c91610f07
>>  DEPENDS += "i2c-tools"
>>
>>  S = "${WORKDIR}/i2c-tools-${PV}/py-smbus/"
>> -
>> -do_configure_prepend() {
>> -    # Adjust for OE header rename
>> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: Module.mk
>> -    sed -i s:linux/i2c-dev.h:linux/i2c-dev-user.h: smbusmodule.c
>> -}
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>


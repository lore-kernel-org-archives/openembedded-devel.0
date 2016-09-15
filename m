Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0558F765DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 08:34:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so6015020wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=k7AiVc/hz0Y9lYzL/3JR7tH0qsBK5vamfBTZ7IyYkpw=;
	b=Lb4+lQUrBhIY4K0wltk8XmXXnBrqok+2cxP7C43oxruC+ww26oGW/7Sn0kB7S9UANa
	Umocb3UFt6t4fwpLlaXfu8itExQYXbsS25WEaeveXsLYv4Fu9MHWKRnXvjnxYZ+Fm06E
	gmS6P95S90Ku0XPkIvIO5UPvHm+CSyE82OBJTvkZae3o00Mo783yFnEewHItZuDgAb6E
	P0Rqvuuyu+BYhMWP0JZA7vcJP+Q3wt8I9sYtZzdDpCMJKR+gKOeTYBGav/A6ABnqimgo
	KOIHfltXGvW5ZGiuoGyqRlYLHwk4J1nQ7DnrqK/8wI0GBe8x4+G42SDP+8w5SHCXBvU0
	0sLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=k7AiVc/hz0Y9lYzL/3JR7tH0qsBK5vamfBTZ7IyYkpw=;
	b=PAigKG+84rLOaLJU36Kzrww+sqTcf4tgn42Q0s5APHKq0b7uojfQHTyq3aAcn7oR2l
	3IR6O/VkUsMl2huITOCnEqTYCRGhfMcQG78x4txoqmWAJZAc3qB0awL0JPKFMzUS580H
	upSZnzEZ3i0YHP+LlPnoQgnev7lBVNCSK9NUwK7Gu6Mi6QSOGnbTWqn3+VIed/Y8U84v
	EXz2+WhpI8GoFEJTFzKHkIFooNiRJhsioOp+gupQGeNIwn056ZTjYwDNflU8/4AiU0d1
	7ZXiHhe3PNZcAZWHRP0FzLcMu0wQjsmPOGE0WDc1lcTU11tkNMCsPDY+u+ilf2Okp+Up
	NVow==
X-Gm-Message-State: AE9vXwO5niDzRIYHBmrVIlaxiqYKHkCjcMQM5n/8xN5E8IP2DB+ZDsXwZC03AnKXrf0S7IhN6v+gKpB6ilvyCA==
X-Received: by 10.28.131.208 with SMTP id f199mr1737666wmd.116.1473928474737; 
	Thu, 15 Sep 2016 01:34:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.143 with HTTP; Thu, 15 Sep 2016 01:34:14 -0700 (PDT)
In-Reply-To: <CAJTo0LY7k+XDcwumMzfZLzOj_iOeKG_svL=QK_drDv_hHdbXhA@mail.gmail.com>
References: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
	<CAJTo0LY7k+XDcwumMzfZLzOj_iOeKG_svL=QK_drDv_hHdbXhA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 15 Sep 2016 10:34:14 +0200
Message-ID: <CAPybu_2uCKcpvtba7Yrrs3trmSQ13w6Q9o+VsEXXFHJJO-EyUQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: update_font_cache intercept: qemu: uncaught target signal 4 (Illegal instruction)
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
X-List-Received-Date: Thu, 15 Sep 2016 08:34:35 -0000
Content-Type: text/plain; charset=UTF-8

MACHINE is qt5022, which is:

x86_64 + -march=btver1 -mtune=btver1




conf/machine/include/ia32-base.inc
conf/machine/include/x86/arch-x86.inc
+
DEFAULTTUNE ?= "bobcat-64"
TUNEVALID[bobcat] = "Bobcat"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bobcat",
"-march=btver1 -mtune=btver1", "", d)}"
AVAILTUNES += "bobcat-64"
TUNE_FEATURES_tune-bobcat-64 = "bobcat m64"
BASE_LIB_tune-bobcat-64 = "lib64"
TUNE_PKGARCH_tune-bobcat-64 = "bobcat_64"
PACKAGE_EXTRA_ARCHS_tune-bobcat-64 = "${TUNE_PKGARCH_tune-bobcat-64}"

Thanks!

On Tue, Sep 13, 2016 at 6:03 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 September 2016 at 16:27, Ricardo Ribalda Delgado <
> ricardo.ribalda@gmail.com> wrote:
>
>> NOTE: Running intercept scripts:
>> NOTE: > Executing update_font_cache intercept ...
>> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>> Illegal instruction
>>
>
> What MACHINE?
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda


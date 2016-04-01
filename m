Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id DF1B2766E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:57:26 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id bc4so79612405lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MkJc4mShWVDUB/kbp9Wp7Rds8eI2yS6LhQjUJ70Is5o=;
	b=w7VUHmrQ8KDJLQHg/sAywbkxEoWwyHnsEsxsH4rLYfCuNRN5r7/ltf986Njn16guHG
	YrenjR3y95kYZxPvs5xcgJd9iAac5shLV+pu77d35n8qLV5pGTf6MRPvXWh6RtMCC9sV
	WKgvmW8NOjpXD8ifEJevuWAkVfSOxNQagEAbBDgczrj+jSwU8830iXFh2bELW+jK/VJG
	oNDtCLeZSK6CkqUmaFTj+YqRnDmI2mi6y4I6s+WI6zi1JEnZEiQHpMIVTytcvGVq6GFh
	ggFMtWnGxg1DkO24QBH14rEBW1Ahtn57yMCrmPqaoOLZ+Su3/HfjhKubf21pfa0F4s1H
	zp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MkJc4mShWVDUB/kbp9Wp7Rds8eI2yS6LhQjUJ70Is5o=;
	b=Mo/vz9bf7uCrxpSoI1zikIp+jj4XwUK9dPLcTTbFl/AU9AKmRcvv0sHen/nnFBHwVa
	RF2HkSO4nTvgENp7RVDDm5wCNwMBeYUrdX1CaMEe+WnZRRw7BEBipVMGrdRhFB/apavj
	PS3wonFrkVInsxraH4tRl5VCRUm0AMn7K2zvtkqMQEh83Fxr5+cm2KXSsIrPkVghw1lT
	6DJ42II6GYP7i4ItiL3Ol2BNtam0xo2RCdlyKyuISBGPOiQJr/f6bI6RHiEOENgkz7N6
	ErXVhOVwgm7tAEq6JdaqRuLzk3Ulq+w4xJMrvY7yllyCxi6IcqzyafpHQZiVCaWLFFX8
	TKwA==
X-Gm-Message-State: AD7BkJInPAfOMajCxPbQ8ZOD+XD9FH4jSd6j3wvBfGnb3mb5jKn89ktPKKdBKXhW9+PHITkiOYFf57r+30qFbw==
X-Received: by 10.112.143.40 with SMTP id sb8mr2704856lbb.83.1459547845900;
	Fri, 01 Apr 2016 14:57:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.11.40 with HTTP; Fri, 1 Apr 2016 14:57:06 -0700 (PDT)
In-Reply-To: <CAJ86T=Ve72OuEUAof1Tcogn5kqU=W7-_OY7TsTvJcYaVUDvrhA@mail.gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=Ve72OuEUAof1Tcogn5kqU=W7-_OY7TsTvJcYaVUDvrhA@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 1 Apr 2016 23:57:06 +0200
Message-ID: <CAPybu_3C2ryEc_heWYfH7f1KJjnZRnWxvQLF5LBAXMvhXmGJ5A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v7 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 21:57:27 -0000
Content-Type: text/plain; charset=UTF-8

Hi Andre

+= does not add the leading space?

http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending-override-style-syntax

I thought += was preferred.

I am confused. What shall I resend += " foo" or = " foo" ?

Regards

On Fri, Apr 1, 2016 at 11:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Apr 1, 2016 at 2:36 PM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>> OpenCV wrongly assumes that the X86 variable would be set on Intel 32
>> bit architectures.
>>
>> This patch adds the missing definition on those cases.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> index 63955a862d4a..b89fbbb214f6 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> @@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
>>                   ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
>>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>>  "
>> +EXTRA_OECMAKE_append_x86 = "-DX86=ON"
>
> That should be:
>
> EXTRA_OECMAKE_append_x86 = " -DX86=ON"
>
> Note the leading space. See:
>
>   http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending-override-style-syntax
>
>>
>>  PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
>>                     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
>> --
>> 2.8.0.rc3
>>



-- 
Ricardo Ribalda


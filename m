Return-Path: <armccurdy@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id EC89677038
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 22:23:54 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id v198so11989779lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 15:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=kctMwJNQVqfKsBP9xXPgr4QlSd1gynFdd73cKcdzA14=;
	b=iLe/XqHPWET3D9OiePhRxPvrhhY+nhs1akWcxKCI0JI5CVU7gZ5pstKEE+L46lO7Mp
	xg/k8Z8l2nNjP9ctQXwLa2etrGiCuBgK7ENiE8KgW5iFYQI8BPgeq9/Egfxs6H2KxMkp
	aJgBTOAMt4Mg09kB68xK699w/4u2FuDXIuTXTyNbPb/bZBeLcFpLEOws0RFczkQuQMCd
	GiCEo1ZBzoq7spOUzN8lZXRl89RfyVmbJ7V0zSLxLEu+S94UC61W/0s7KWjcS9flYBiD
	yN6exgxGxNlOOU2NAwvGbcOqcWEfaNw6Zer+YhlPWxO1Nj5p2jjIQL+9zEsqYoYv/H7h
	KX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=kctMwJNQVqfKsBP9xXPgr4QlSd1gynFdd73cKcdzA14=;
	b=MMQor6jin6ryD2UxYP2BBonv2YBHOSvdHrKePhSiILQFjg0t7icSkGi/eAPN5RYxo+
	ahTAyqUdLS09pbEYL+F7iuCjatAfG8MpWLEiDSazHm1IqY4kHdYKF6I3IYPmopqwLVrl
	ZVzkuC+1qocbuSOzHf6YfSQ+UxX/OI4FJ2jshlxpnAU0ZngRUHIzXW8PtK5OZ3C3cJ5E
	PPrBWhQawXkh5LzKbWXTy/qbA1/180UiakAcvLpANS6kyLOvUZrSIN+RI3zOuG1xQ6ro
	mycUrl0I7VM6Wh3x52E1klNKbzlFEZV+p08Vifi5aO/VhjNOBiU9DY7ng7jKP00Z6i67
	jhyA==
X-Gm-Message-State: AD7BkJIW40ihhB81L7vnYkr6QF7IKDQRLLM9/V4FEpOfp0a5VQEJ8Ss1nHWGI3hbzBXnI13ay78v10h5GRlNsw==
MIME-Version: 1.0
X-Received: by 10.194.242.202 with SMTP id ws10mr2360551wjc.3.1459549434924;
	Fri, 01 Apr 2016 15:23:54 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 1 Apr 2016 15:23:54 -0700 (PDT)
In-Reply-To: <CAPybu_3C2ryEc_heWYfH7f1KJjnZRnWxvQLF5LBAXMvhXmGJ5A@mail.gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=Ve72OuEUAof1Tcogn5kqU=W7-_OY7TsTvJcYaVUDvrhA@mail.gmail.com>
	<CAPybu_3C2ryEc_heWYfH7f1KJjnZRnWxvQLF5LBAXMvhXmGJ5A@mail.gmail.com>
Date: Fri, 1 Apr 2016 15:23:54 -0700
Message-ID: <CAJ86T=U5Oyp4x8L44Le+MFWxCd8vMbaSq1Y_byerv_=DsOwQ0A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
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
X-List-Received-Date: Fri, 01 Apr 2016 22:23:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 1, 2016 at 2:57 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Andre
>
> += does not add the leading space?

It does. But the preferred way is not to combine _append and +=.
Therefore if you use _append, you should combine it with = and add the
leading space explicitly.

> http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending-override-style-syntax
>
> I thought += was preferred.

Where does it say that?

> I am confused. What shall I resend += " foo" or = " foo" ?

Martin's comment (in reply to the v4 patch) was:

"Please don't combine _append and +=. _append and leading space in
value (as you already have) is enough."

The version you should use is:

EXTRA_OECMAKE_append_x86 = " -DX86=ON"


> Regards
>
> On Fri, Apr 1, 2016 at 11:46 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Fri, Apr 1, 2016 at 2:36 PM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>>> OpenCV wrongly assumes that the X86 variable would be set on Intel 32
>>> bit architectures.
>>>
>>> This patch adds the missing definition on those cases.
>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> ---
>>>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> index 63955a862d4a..b89fbbb214f6 100644
>>> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> @@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
>>>                   ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
>>>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>>>  "
>>> +EXTRA_OECMAKE_append_x86 = "-DX86=ON"
>>
>> That should be:
>>
>> EXTRA_OECMAKE_append_x86 = " -DX86=ON"
>>
>> Note the leading space. See:
>>
>>   http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending-override-style-syntax
>>
>>>
>>>  PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
>>>                     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
>>> --
>>> 2.8.0.rc3
>>>
>
>
>
> --
> Ricardo Ribalda


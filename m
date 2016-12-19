Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8016677155
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:24:22 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id j10so23821108wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=ZUGCM55BIptELbh3//ToTnMrtaZQzJjcPOSeDCU1+SQ=;
	b=qC7DqNKEWkHfHMOTxzgTcZzwv+L1FhDOs83fuOnzCOhV+bHRZSGS5OFW4JygpuR7AQ
	Gx0OiwFkm2uvIsu5cAOF6Mg7T5XCXln622GKlZsiU/1o4dBHoPxa73lK9qY2P/MbLqzQ
	foR6kiBc5wERDzg/RYXqTd2+jU9/WczUSMewXGCvIfgP3+u3Fw+I3Ptt9F3GYwpeigB4
	7lcSyCdiFDa+Djbs/Pd+QpYnM0X6lJaxQOArNsyyGjOgsRKOf/vFEDoCzRz8hC0p8l5q
	FJJz3KKAidFU+4Vtym1fqy6oMvoZtcMs9n6MUmcQwO215Un6LFWngIi/6wpOh3pgRSPG
	rxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=ZUGCM55BIptELbh3//ToTnMrtaZQzJjcPOSeDCU1+SQ=;
	b=J5M8cETrYSUh7I3bWPpCyOtSmJHhBbLv1HxyNuo+3uR2zKE1DTeYLGb3RrLL9xmZiD
	CPcMGwAJJ12SST5E2L9SJ0VwyzrPi/zYPYS27AMLaOS1Op9HWp56r2NXFOfs8H6bIDFp
	d2QFKruHwctkD4HwLRF7k/h/ch5Ly0O5Zwz1nvQmpIYcfNTdVWrWp95rYcQCF2nnrfVe
	WCJT+HenbLD7O0iY+Wb/ZLEh5S/Y9Qw2JgpjFg4h89e/yIKtWpJmw2yaq1MfG/wad5L9
	yDFCW6Asc5zLzK+jFY2yVEyb+UopZnhYCS5lqKtiShDywgzsbEBoiMShsLWknj/8vsxU
	/OpA==
X-Gm-Message-State: AIkVDXKwuhQR6w+iby2lzerBkEJq7EjdKWVTAaoTMGh4XfPrVJ4zZCZ9qknFQ6BUjN+LDIPsTTzPwU+ECwY6+g==
X-Received: by 10.195.30.165 with SMTP id kf5mr13968768wjd.41.1482157462972;
	Mon, 19 Dec 2016 06:24:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 06:24:22 -0800 (PST)
In-Reply-To: <CALbNGRSngHPNxuEwzqp6im8AAR6=RvmTd9qejWf=yammtcFr0w@mail.gmail.com>
References: <1482152989-3982-1-git-send-email-armccurdy@gmail.com>
	<CALbNGRT1MSt=O90M6g9GHMmqm8nYSk4mdcSm59EK2u=f4i-qKw@mail.gmail.com>
	<CAJ86T=Xq4AnvmvZ5ciNjvymN+VPMWe_f0xm95HepLq-B0ypXDA@mail.gmail.com>
	<CALbNGRSngHPNxuEwzqp6im8AAR6=RvmTd9qejWf=yammtcFr0w@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 06:24:22 -0800
Message-ID: <CAJ86T=UiSGftx9j6++S-EVn7GJMw5ETyNdrQy8bjdrAvKKpZhw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconfig: add support for libconfig-native
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
X-List-Received-Date: Mon, 19 Dec 2016 14:24:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2016 at 6:13 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Dec 19, 2016 at 3:11 PM, Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>> On Mon, Dec 19, 2016 at 5:27 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Mon, Dec 19, 2016 at 2:09 PM, Andre McCurdy <armccurdy@gmail.com> wr=
ote:
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>>  meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/met=
a-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>>> index fb6e50e..94daa88 100644
>>>> --- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>>> +++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
>>>> @@ -12,3 +12,5 @@ inherit autotools-brokensep pkgconfig
>>>>
>>>>  SRC_URI[md5sum] =3D "a939c4990d74e6fc1ee62be05716f633"
>>>>  SRC_URI[sha256sum] =3D "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305=
a02429eec61e68703f6"
>>>> +
>>>> +BBCLASSEXTEND =3D "native"
>>>> --
>>>> 1.9.1
>>>>
>>> Please tell us why libconfig needs native biuld in commit message.
>>
>> A private recipe in a private meta layer - the names of which are
>> probably not very useful or interesting in a meta-oe commit message.
>
> So why not just an append in that layer?

Because recipe enhancements which may be useful to others should be
merged upstream.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


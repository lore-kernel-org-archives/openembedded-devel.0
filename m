Return-Path: <koen.kooi@linaro.org>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 511956E666
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 09:42:59 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id bc4so19986835lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yFR4F4NcMLKAW0sqsuD52Ml3PhJzzdz0cZFkVYyjIzg=;
	b=BubfLbZZFWHD/77F08vtO5Pit99DTyOxyEQ9H9nOzqSvt2pfDKajW0+QApuVThAqVT
	LlthFN4aJIwZ0EYE7xdxrqI6L9PdH0ouvtPzElIX3MVAv6o/P+B6C3Um3MIAmk+vGZtO
	giHK/Wi+fNBARlrLucCbMnCEJhbhjse4zuJ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=yFR4F4NcMLKAW0sqsuD52Ml3PhJzzdz0cZFkVYyjIzg=;
	b=jc7W9Dh4Jjza0O2N1apLkYyhw89Rg+zLvKPMS9aTSlWiSnt3jmf2E+QQcteBetjGBN
	ay03nLWJUqm12pt19YG/4PFdFYRLRZ+aM+1kiKXY6VMqiaffe27+7EiDONGSWX2umeju
	881ic3YCuinw8Ovt0leh9rqBG0EYesN8p9fPpJg0i6ULc4EGbj6ItZnhTGQ6PKAjKIVm
	x9F1RfpeXQBQ4TZIKrsb+51KXtCSqm3UbZjbHSwZ+djrV7ftlhiQdsmTwnczPN3FupfH
	tDWNl9ucz1ohOeEyeXfM2GjTW7pqUtklR5AlF+9jnbHGGsO3ciycErjaTeHXfjvNc/EW
	+acQ==
X-Gm-Message-State: ALoCoQlUh2r8tbi2kjc2CgnFyU68z8SdIGVzItYcmIK8Pbu1lZ7DfhkJCyHTSo5Z9GTuhd/bR7xrfHEfo2CeSBKYh0kzlARWpSo6wq4vaH4Os7RWh/lqsIg=
MIME-Version: 1.0
X-Received: by 10.112.140.41 with SMTP id rd9mr15553530lbb.138.1453369378613; 
	Thu, 21 Jan 2016 01:42:58 -0800 (PST)
Received: by 10.112.204.200 with HTTP; Thu, 21 Jan 2016 01:42:58 -0800 (PST)
In-Reply-To: <CA+chaQc1diTb_YNP7MziMGdHmVm08DtK0JWMg6PyBv=TsiY9eg@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
	<CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
	<CAP0W-R=4t0Ah2ucP5gShOD8SRaO2Jk9tdJ6N7yF+8rv4K34p0g@mail.gmail.com>
	<CA+chaQc1diTb_YNP7MziMGdHmVm08DtK0JWMg6PyBv=TsiY9eg@mail.gmail.com>
Date: Thu, 21 Jan 2016 10:42:58 +0100
Message-ID: <CAP0W-Rnxg-MABr5-V03kP4Bezr39AyKeuKv=UZSLqtzvpoBm1A@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 21 Jan 2016 09:43:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 21 January 2016 at 10:31, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://git.openembedded.org/meta-openembedded/commit/?id=3D2bd11da4b50f40=
1c9c49975aeedaaafa6a59d08b
> was merged week ago

Ah, I see what happened:

[koen@thinkpad meta-openembedded]$ git show -M | diffstat
 qcanobserver/qcanobserver/0001-messagebufferinterface.cpp-add-sys-socket.h=
-as-inclu.patch
|   41 -
 qcanobserver/qcanobserver/0002-qconsole-writethread-gcc-4.5-fixes.patch
                  |   40 -
 qcanobserver/qcanobserver/candemo.xml
                    |   40 -
 qt-creator/qt-creator/fix.missing.cpuid.h.patch
                    |  384 ----------
 qt-creator/qt-creator/qbs_transformer_product.patch
                    |   93 --
 qtserialport/qtserialport.inc
                    |   48 -
 6 files changed, 646 deletions(-)

My version was rebased and only drops leftovers. I only noticed that
my patch was still there, I didn't look at the diffstat.

All is good :)

>
> On Thu, Jan 21, 2016 at 8:26 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>>
>> ping! Can one of the two patches to unbreak parsing go in before the
>> weekend?
>>
>> On 11 January 2016 at 09:51, Koen Kooi <koen.kooi@linaro.org> wrote:
>> > On 11 January 2016 at 09:08, Andreas M=C3=BCller
>> > <schnitzeltony@googlemail.com> wrote:
>> >> On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org>
>> >> wrote:
>> >>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> >>> ---
>> >> double efforts? [1]
>> >
>> > Looks like it, but [1] doesn't show up in
>> > http://patchwork.openembedded.org/project/oe/list/ :(
>> >
>> >>
>> >> [1]
>> >> http://lists.openembedded.org/pipermail/openembedded-devel/2016-Janua=
ry/105406.html
>> >>
>> >> Andreas
>> >
>> >
>> >
>> > --
>> > Koen Kooi
>> >
>> > Builds and Baselines | Release Manager
>> > Linaro.org | Open source software for ARM SoCs
>>
>>
>>
>> --
>> Koen Kooi
>>
>> Builds and Baselines | Release Manager
>> Linaro.org | Open source software for ARM SoCs
>
>



--=20
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs


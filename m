Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B294F7723E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 07:27:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x189so1452870qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=9bmG5652F5XFXayOITsfTEaOK52wL4soWPdulqSRJoc=;
	b=wx3qRCcagau4sTqRZAWSMcJZAogquVaAARG+NUsyF/YVNukXh6+1D4VoKQv0YAEoq/
	aciOl18TbImH1ZaU1W3CkWLghNZrJew4A7OHPsqlJt7Ch9l33jpsReB05sZBxM2Z4d0c
	eyd2ix23/vIdAiXRcVRzau/nHKUnsvCJySvtUaipkY1NZTeDQoHCv2fS94M9DkhEQqE6
	PpKkomavn472o8B1PqM9xYodRkWEoYN1ZtMi2mr+GnIAmdTNzydyxloV/c02+AfzJww1
	kRZmST+8VbFHTXep61A561wPLJ63swxsD0lMwNdKMffhUJGt9geXgamdo+/726ZiUXQq
	7v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=9bmG5652F5XFXayOITsfTEaOK52wL4soWPdulqSRJoc=;
	b=ETePwpBmpzKcGFlJe+2Y+u7i7FsdCcwjpdesZ5O2kb7pQDN2XTjfnRAJTM7LD7+wsI
	kp4GsSS9hzBO958shzyqkI4f6s2SKKL9RocDqSjhqA/EpYNItigSlzi4lmtplKvC6WIY
	4lXVz52bVOkG5n96tVqeQ4Vrz51s6uLj3E27KRsGQG1339QihRhX/dyr/vjRV66ghUPQ
	kFBzQYPTHw+JZT+0e4OAXWsoKl0770LtNRbKBQIAPVMP3k9d/3/zXj93GNW1Mb9VQwAj
	l7Rnb9qwXU7+iKF9+FnATOh9Dluc5sUMOmCMMu7vxzmQS0QLPCk8/VJs7F7V5CPdSbyV
	LY6w==
X-Gm-Message-State: AEkooutQonLICr0bKO3QXnN3XZ1SS0zDdtrQ9/XuVXQ0BIhpbgisfSxAGmL4OCUwD0u8bDCcnxAJ+o/0KhBMRw==
X-Received: by 10.55.170.1 with SMTP id t1mr16007454qke.42.1470986827877; Fri,
	12 Aug 2016 00:27:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Fri, 12 Aug 2016 00:26:37 -0700 (PDT)
In-Reply-To: <CAPybu_35+Ug0CpasvpVg=WfC2N3F_6hmcSbN7CJ7tquhGr7C8A@mail.gmail.com>
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
	<D01FFBA5-7B48-4F0F-B1E0-3D96FE48044F@gmail.com>
	<CAPybu_35+Ug0CpasvpVg=WfC2N3F_6hmcSbN7CJ7tquhGr7C8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Aug 2016 00:26:37 -0700
Message-ID: <CAMKF1sqhKAKN8EJVHTm50F6N0Ons3hqJrkc3ERujrwj90m94JA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
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
X-List-Received-Date: Fri, 12 Aug 2016 07:27:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 11:37 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Hi Khem
>
> On Fri, Aug 12, 2016 at 7:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>> +DESCRIPTION =3D "The gflags package contains a C++ library that implem=
ents commandline flags processing. It includes built-in support for standar=
d types such as string and the ability to define flags in the source file i=
n which they are used"
>>> +HOMEPAGE =3D "https://github.com/gflags/gflags"
>>> +LICENSE =3D =E2=80=9CBSD"
>>
>> which Clause ?
>
> I have no idea,
> I has the same License file as glog:
>
> https://github.com/gflags/gflags/blob/master/COPYING.txt
> https://github.com/google/glog/blob/master/COPYING
>
> That is why I choose BSD.

So it seems its BSD-3-Clause

>
> Regards!
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


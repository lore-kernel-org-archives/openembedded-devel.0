Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id E00927893C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 00:06:19 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 93-v6so4252947plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 16:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RyrvHoYRt/g3GW1XHGH0Qfu0gBt+5AByZ1eaH7fCKsw=;
	b=r8Qf00CuRvLCxBiIhU2Pojbci916RFv/qkAJ8OI1Gu3GMtEquHQ0CgHrKiD/djRyyl
	2DSyzqsKthiToKh34d3xW8q2pZWnb+m77ZScnCYq4ctX9ZBgpxwYc/+9wRS4Vjb8tCZM
	MMl7+C8UQ5dlD7AJxytEZmUl2EXwLFMCA52oBb2Hwvqb3YyI7XqgVYTN03gVcI+U9VzT
	rCRnV8aVqeCeedRk3KxhuyFQjKj+jC5xi4djM1mp2/gb5XRidvuNz29BZwX5Tq6iRrIH
	HBCJo5R7L3I0vhNwwsYc1c7wtcQGZjFScMznC3llCTYEDdQ2R2HmpbwQTnkN9LZpqAFC
	Hvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RyrvHoYRt/g3GW1XHGH0Qfu0gBt+5AByZ1eaH7fCKsw=;
	b=JevMnHvbC//JPwzkNEXzwzMYK6folv2pOct7EpEtxIfgYiloI7K0FUarD0Q6L5nhIh
	P6OGY79J3SxlC2tdvJhg7pgFEUWHXJc4bcMQhCWhUxvGIhO5DLykWmhUbRJiQ8mS3SRn
	dzCArIUgUYbkXl53e03LJ8aWgaXECF8Z1HkR3pImBGa+yMSsqdng9wMwGV+Y5oG2Ujn6
	BpqjCM2Vi3mFxXblpnFUVXLIOJhTWB7uBzDqxiLlqSdsxkx2cr8eYL+7hy1mNMrPO2ga
	hy4uPKIoMwiY8PodRz9dUcFDP6qi9pjP+PqYq0otqkoQPOMgn40Nva2FLVA1vHCb1+9e
	ErTw==
X-Gm-Message-State: APf1xPCP6pFbWtS9NmkTnf3oRrRvYK0owsTc6TpiAb8Dv8FuS0YSZnfv
	iBG7liR2t+T4DMf7XJt3qdOKjzO+Jq0bWFTN2J8=
X-Google-Smtp-Source: AG47ELsYZ6pkQhK0aNShg4SNGtvXpzL+HawGcnyWv5ec/K5/oB0cvs8G71/XSGbNBROGj6ocbd1oqBkv0tZyCzd0esA=
X-Received: by 2002:a17:902:6b48:: with SMTP id
	g8-v6mr25561113plt.151.1520553980880; 
	Thu, 08 Mar 2018 16:06:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Thu, 8 Mar 2018 16:06:20 -0800 (PST)
In-Reply-To: <CAJ86T=X8QpVvOTmUG2XEgYm75V3YvYa8ENN7Njc2S1meT2Uxew@mail.gmail.com>
References: <20180308174316.36662-1-raj.khem@gmail.com>
	<CAJ86T=WNtG1GCk4AkR5Ysd6jTZYWeUKabbR724fouKueOjoXcQ@mail.gmail.com>
	<CAMKF1srssLFbR5RzJjpg2R7xPAjLa8B7i50eyp+pbFujKtJ_OA@mail.gmail.com>
	<CAJ86T=X8QpVvOTmUG2XEgYm75V3YvYa8ENN7Njc2S1meT2Uxew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Mar 2018 16:06:20 -0800
Message-ID: <CAMKF1speUuk4sE4eJSciWb2giYyv5t=6L+mGKGt5kBL84PgaRw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Pass -DMESA_EGL_NO_X11_HEADERS=1 when x is disabled
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
X-List-Received-Date: Fri, 09 Mar 2018 00:06:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, March 8, 2018, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Mar 8, 2018 at 3:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Mar 8, 2018 at 2:07 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>
> >> On Thu, Mar 8, 2018 at 9:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > Some graphics drives e.g. mali/mesa depend on this define
> >> > to use proper guards in eglplatform.h
> >>
> >> Would it be better to patch the header directly rather than try to
> >> arrange that every application which uses it defines the correct
> >> CFLAGS?
> >
> > It would mean to change all of driver sdk for Mali variants and also Me=
sa
>
> So there are more recipes providing eglplatform.h than using it?
>
>
It=E2=80=99s not about what=E2=80=99s more or less

Actually egl implentations have provided an interface already via this
define and apps should be using these defines to configure themselves

It will be wrong to change the api headers



> OK...
>


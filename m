Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id DF84C7888A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 17:33:29 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id 79so2945808oth.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZTsxDDVfZqi3WaKEe3o2z4DHjQ1pH32j9+fNqCwWKAU=;
	b=LFYZrLYGO8U96GyRzLVTjtHEiZuU6D6ucNfRLcx4EEt+7AtofNUz1aq+oT2xxEn3KP
	EvEQWnRbT5g29ktemDp9rLYoBFnC3AMR0HXBM69RHl5e4aS/p3/f8Z+47Z9LWpLau7Dq
	G+YGYmxCr6hgBI8uM2T9u5IgEWkc5szN2yMFojt59Ml646aB7j4g9Zm9jXhZLHR0oC+8
	ty2rr7dDycrvoW1EXjFEoe3+xPHKamrQrNhX9h5oDy+XnPb2+/ruci1l9qiGRuT7lFwL
	SPjGXUwmGdjMXFMME6acEZgY21hhAeh4lW7NfeByP+NG96IR7wf3CTPho9QW4ggHfP6n
	Kvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZTsxDDVfZqi3WaKEe3o2z4DHjQ1pH32j9+fNqCwWKAU=;
	b=dFx8WrFGN+mTTCo2mgCB5i8z7WSFce/JrS+k3b7fq0BG/soMxNTaybllLUjrrqMaSE
	OgFmG6xUOnu7yKaxYdfmHKwhRIhqC8ksTzRNvwJHAEB8O3h94yQQ3LvbE+ZST9pNboJJ
	oymLw/+/813FOAK9PNKuMHLZ2p/xhVMNUbpnUZD1Kih86CK3j8oMh83hYVctyOCo19+c
	3zfm4FKIRWMBhEbNI10/Kxw5nTTAvYqhFcsF5cb3AX6d22GoLM8kV0dMZl5+RtMFcd3x
	znswYYZE4KkAyaO8TaaZf8snHUAVIdBZOM4Co+0GnTZ1IhHOFG6b+eG0w81L7+QM+6HG
	HVfQ==
X-Gm-Message-State: APf1xPDNhILTXVWMHxYyLMJ9QNiPyZd4mDntFdbkaT+Xh3TWfzJyxzQy
	4xNr3DYEnPGMAR5JRTKIlAtRI1u2U0RsgE+0gAk=
X-Google-Smtp-Source: AG47ELtvrk6RQcml7jDNCfSWtQc4x/46m8B1aQLWFYxWq8UXJdXDfEJxsmuMwQK/EyH8Hu4MnJ/oTslf/nSzz6izZvM=
X-Received: by 10.157.68.133 with SMTP id v5mr14261651ote.342.1519839210739;
	Wed, 28 Feb 2018 09:33:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.110.68 with HTTP; Wed, 28 Feb 2018 09:33:29 -0800 (PST)
Received: by 10.74.110.68 with HTTP; Wed, 28 Feb 2018 09:33:29 -0800 (PST)
In-Reply-To: <2bb3d54e-cbee-a3f9-6608-9650c7fbe87a@linux.intel.com>
References: <CAEhQi8kZmV0Ar0gfW-JWufQM6c0Fg+rp5E5bCzAKDj6YvsLugw@mail.gmail.com>
	<CAEhQi8=ugNDV7HtziAGdEikhkuSH88JjUaYnx8W50TrMPJNVDw@mail.gmail.com>
	<CAEhQi8kt8eOUDvP9UpZ5vYCW9fSxbhkZ3x6hcbnLRqV=K=7HGQ@mail.gmail.com>
	<CAEhQi8kYxwU+o-MTDcGafFMvYt=fU0CFR6mb5On05Gk_ryvJyw@mail.gmail.com>
	<CAEhQi8kJsaGWaHSTB9mwWSCJ+wCSGEpDXb3V6SWeCLmT56zCwA@mail.gmail.com>
	<2bb3d54e-cbee-a3f9-6608-9650c7fbe87a@linux.intel.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Wed, 28 Feb 2018 18:33:29 +0100
Message-ID: <CAEhQi8=c9=mHHBGi4AM_KEVeFToOA7JGMGmexUk3BJMPELgMDg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt4] Cmake Could NOT find Qt4, missing: QT_MOC_EXECUTABLE
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
X-List-Received-Date: Wed, 28 Feb 2018 17:33:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is some legacy the plane is to remove it shortly. Regarding patches, I
am still not sure what the problem is since this occured when moving to
rocko. If any ideas that can point me in the right direction I can supply
patches.

Br
Mans Zigher

On Feb 28, 2018 17:23, "Alexander Kanavin" <
alexander.kanavin@linux.intel.com> wrote:

> On 02/22/2018 01:04 PM, M=C3=A5ns Zigher wrote:
>
>> This solved my problem I still couldn't figure out if the qt4-native is
>> actually broken or if this is the way it should work now that each recip=
e
>> have it's own sysroot.
>>
>
> Do you have a Qt5 transition plan? meta-qt4 is not maintained or tested
> regularly anymore, as there is no upstream support. If it breaks, patches
> welcome.
>
> Alex
>


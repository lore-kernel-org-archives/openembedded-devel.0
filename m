Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7669E749D7;
	Mon,  9 Apr 2018 22:45:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x4so19598509wmh.5;
	Mon, 09 Apr 2018 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LE95HGUtukl7NRsZSUQ73eIzNxeDqeR4Zfc0Br3KwqU=;
	b=Ag8tDgN6+aD/6prA2thBVKm9CUWcy01Vhh8ubOrr7MgkvM+TUbV533QwxSF/BLbONB
	LZYNXoBIVYi2Ei3WIbbYFVzc3cgvBe+3uXXl0YrA5COC5MVhnLklRkLChBnJ1QQ8/K5o
	YgyXur6BCgO3E4xt4g7YOkbBK9nMWgq973IdAb4h/DvmvejRJCM+MB7+9vd6LjGETBSW
	vqq/IchKcZTBZ6UzE2jB4YckLEEwnhKAiYyH5R2HZPEpofVMckUZyyAn77O78+gxhjeF
	mpYH6CWpGrF5+HC3RrQiNxdOzafFXfVhLz7itvJMcnHFbRc4GOk/YOJepMHLJM2gvNaJ
	nJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LE95HGUtukl7NRsZSUQ73eIzNxeDqeR4Zfc0Br3KwqU=;
	b=X7hYUqMgGcR9/4poDsOz8Nud0mFLRtHTSBVaS+Pnj10XKlRGIq1p7woMiDbpodoiPJ
	6bh4ErVVLl5YAUJDIljQY1T2CGGhgmjoFmZuS707E2hhb/RPun5tV/x5mule6WyzMFlw
	zcwljQpJzQivzVvANS9KzENM8IskiL+dQMSOTHYYrIzm0SNPpSif7bbkhSYgtdicy06G
	j5SO3ZaPaYiAVT1etajDxAL/8/wkWCPUENarr5nZFjmgjlOMSJd4f3UTAvJtuDmvf2hI
	t/34vcC81YEMgtGEK+fd7IFvAnjs/mheLXjMY6JTgdU+nJ2rLIypFSc1uyXQBaXQeh5H
	6WMg==
X-Gm-Message-State: ALQs6tDkFvWlADj6rAppIbpdbylSjiEuFlfH7+lbzGrMCqQ97fmoNHoY
	MHlnf9qz24nl6k4HCUZvTZKbha2ZzT8a17J1hbI=
X-Google-Smtp-Source: AIpwx4/yKjqsQC3t0DS6eUU8ZorC3iIZtTarjYAX6tJyyPnsI7qGuoTKWhJE7CIbUEDxVV1aVH3ZM2JnExsjjAWdIsc=
X-Received: by 10.28.63.148 with SMTP id m142mr37223wma.153.1523313918953;
	Mon, 09 Apr 2018 15:45:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 9 Apr 2018 15:45:18 -0700 (PDT)
In-Reply-To: <f36e699e-2d1e-821d-5641-4d9552c66d7e@gmail.com>
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
	<CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
	<CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
	<f36e699e-2d1e-821d-5641-4d9552c66d7e@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Apr 2018 15:45:18 -0700
Message-ID: <CAJ86T=UOqT=F5OJr_GXVpkTdeVCjZiG6NjzA8b0D-2hc9QbsTQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/02: nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Mon, 09 Apr 2018 22:45:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 9, 2018 at 3:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 4/9/18 3:23 PM, Andre McCurdy wrote:
>> On Sun, Apr 8, 2018 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Apr 8, 2018 at 10:00 AM Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>>
>>>> On Ubuntu 14.04 this fails with:
>>>>
>>>> ../git/gen-des-tables.c: In function =E2=80=98write_table_u8=E2=80=99:
>>>> ../git/gen-des-tables.c:307:3: error: =E2=80=98for=E2=80=99 loop initi=
al declarations are
>>>> only allowed in C99 mode
>>>>    for (size_t i =3D 0; i < m; i++)
>>>>    ^
>>>
>>> You can patch this to move declaration just above loop if that helps we
>>> should apply such a patch for compatibility sake but I wonder if there =
are
>>> more c99 assumptions at work here
>>
>> It looks like the upstream intention is to be buildable with c99 + GNU
>> extensions, so explicitly setting -std=3Dgnu99 seems reasonable.
>
> see this statement worries me from same document you quote below.
>
> A few C2011 features are used; the intention is not to use any of them
> without a fallback, but we do not currently test this.

If you don't trust the untested fallbacks, then how about explicitly
setting -std=3Dgnu11 ?


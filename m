Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA9765C8F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Oct 2017 00:37:32 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r25so7831763pgn.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2017 17:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rbQZsOIIVnCbmGWRT0NvTI0CLQW5YLNMUrh8iSbd1Ys=;
	b=jeRRQbel3Kd7iCN74yT4Fm5VHoAekyI9a1WS1QlvlskFZaHbZwfT44ImMMn6fMiM2S
	XvXl2v3ih30WONYoPXKSB26+IOhXzpiIoKBWcj+u4imnY5ljBmKwnrTESFejoac4ml16
	2kvy/cggmeSsk+XwzAR0XKNFbHjJDDFAzd9MuFXQFRwDMW2rEA+EvQ/FBZBhVqtE8HT2
	4cYUS1qaQvEzn7201YDypMQGfM0iK5PO4cm2ZwQKbWljKxHP6YopXr4C7xiZPyPgI6Ok
	5EfGAjXwdAatGoTaOykcI59Azu0HoScMfK6RvUzHxpMICYstllJ0JRs1CZKDGau/anHI
	mMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rbQZsOIIVnCbmGWRT0NvTI0CLQW5YLNMUrh8iSbd1Ys=;
	b=oHQAKag1n0STpsULSR5uTvNJrNTuAwz/bhI184jBllLwSPzZ8nvNU35nBDEMbDbEJ7
	Q5CK8jtlUeDiOCvZyDeY6M9gteLH869Ky+zfiGveXGZHRNJ/cucFxaTUC1eV+kEUTfX/
	UxRFXWY4wLLZ9ANxW170aRJLDKqU6TEkmTRBXSXxFSK0nFTO9LMyiVEPUQVTURtuy38I
	t7rqHyuNDYGCAYTVpM9L0/UWVz/QWCr6nJTU0YPTspa9vmr15pzxvwBRmXQeyqK/TM/o
	8ZWwTwf9I992eik4x50ptiZfvCf7FOFSHirLUENixh2gaQoXXbWV8P5dxB4G3OVEY+Ra
	LIsw==
X-Gm-Message-State: AMCzsaWWisBCKkzoryxkOjdiucCKkrgaMe9A1ssKzYKmnH4yst7s04QA
	GtuVznenXAydrbmLbecUEjwQCAWSzjfkJjcx47E=
X-Google-Smtp-Source: ABhQp+QPZ08zJ0017WbtX6u6DZwr0Iqmg8jTyVhSHZtQEm2LtYL1/z3z20/9t8g/xp2S5yOu1AWEoci+P4MMmXJJyis=
X-Received: by 10.84.151.70 with SMTP id i64mr5351508pli.114.1508546253571;
	Fri, 20 Oct 2017 17:37:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Fri, 20 Oct 2017 17:37:03 -0700 (PDT)
In-Reply-To: <CAJ86T=UPOCnjPbeR3Kg_Tn-bYKy=Zoze=x9eaANdv_qFZbhwcQ@mail.gmail.com>
References: <1508538555-12051-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sqAdkRhgMhuh0JsYcFyGMmbz42WUEDwM8coowqW8qQynQ@mail.gmail.com>
	<CAJ86T=UPOCnjPbeR3Kg_Tn-bYKy=Zoze=x9eaANdv_qFZbhwcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Oct 2017 17:37:03 -0700
Message-ID: <CAMKF1sqoy9b3cdLYcRFFzaLs62tCG-bcqkWL03TMSs1deJhmjw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] ssmtp: misc recipe updates + add Debian "partial loss of message body" fix
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
X-List-Received-Date: Sat, 21 Oct 2017 00:37:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 20, 2017 at 5:27 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Oct 20, 2017 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Oct 20, 2017 at 3:29 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>  - Backport Debian fix for "partial loss of message body, sending
>>>    message to wrong recipicients" issue:
>>>
>>>      https://sources.debian.net/patches/ssmtp/2.64-8/ssmtp-bug584162-fix.patch/
>>>
>>>  - Control ipv6 support based on ipv6 DISTRO feature.
>>>  - Enable ssl support by default (and add PACKAGECONFIG option to
>>>    control it).
>>>  - Drop inetutils dependency (inetutils provides only applications,
>>>    not libraries or header files, so a build dependency on it doesn't
>>>    make sense).
>>>  - Drop pkgconfig class (the ssmtp configure script etc doesn't make
>>>    any use of pkg-config).
>>>
>>> ...
>>>
>>> -inherit autotools pkgconfig
>>> +inherit autotools
>>
>> Is this intentional to drop pkgconfig ?
>
> Yes, see commit message.

Yeah thanks. I need a mobile phone with bigger screen.


Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0485A600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:01:33 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e127so107448135pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=7Vh4K5KOF7RnGxfI7UtcKBTCixAQOqFOXaJ4zAb2Tt0=;
	b=OtQlnoBfQECQ2O4gUF2B2AWQjrTHIZB2Z8sTT/yTMpdem6YXNmN1lrFv27KEulAXbg
	LTB58TrBz6foIHr1pSNqEQt/ybnB/XL6jGZeLW1Iz/i+ICBNpk3Jx61W/TsvY3djTN0I
	cgT2zH56h0PPZrdd7mymUaN41vzmmqJwGw1wL4neGkLi2lMMdmUIarhXqhdGFNSdtpqx
	Pq919JKYIn98rY9bT81GkmIottv9y+cR81F3EkPOq6w1wQtcIHZ8/1ziou5HRHZWCuNE
	ingvxmJ0uZ9wnbih9jedix/vzF67GLya7hb9anMYCWhZ/eUuxLwgZ8anuOTL3o0fDYw6
	zLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=7Vh4K5KOF7RnGxfI7UtcKBTCixAQOqFOXaJ4zAb2Tt0=;
	b=Z95fMreVFBiGq+k9x6psWj438nRZszuj+9CtxloH6fHIR6TqogLcIQ4PqikqRLdsfT
	npeNwbUmQKzeJUSEcEPkJGs0IMFozw8tFLfhjRRWn377qdbTl9E8AEHdDiMwuyBHksnB
	xdt8ak9+NyiWAO9/UpdaAV/abclxWLsP4v7IkVrN0zInwUfq2mgf96w44LwiKyNjoCvD
	ilH38nllYOF8cEg1A/TjmVKsuD8/GxempkvO/GOcvZ9r3b1b5Y/n09q1S40MzFtmC3e+
	075sXt/vdLzAHHFwIiMV2OU8OYJ4iWHrBU4pn0nJoutwr+IhWtxXCWIObmtFbGZTtGZs
	Ygwg==
X-Gm-Message-State: AG10YOSN6au+pi9XDgK/m74HGMhbAyVGrXbGCbWUAIqIdqjNc/B6G/Fdr/uR1QAi0UPOjg==
X-Received: by 10.98.69.155 with SMTP id n27mr32168491pfi.68.1455638494501;
	Tue, 16 Feb 2016 08:01:34 -0800 (PST)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	l14sm46793525pfi.23.2016.02.16.08.01.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 08:01:33 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id q63so107270451pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:01:33 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.144 with SMTP id c16mr31754732pfj.129.1455638492661;
	Tue, 16 Feb 2016 08:01:32 -0800 (PST)
Received: by 10.66.121.136 with HTTP; Tue, 16 Feb 2016 08:01:32 -0800 (PST)
In-Reply-To: <56C32EA7.20501@gmail.com>
References: <1455467128-4533-1-git-send-email-samuli.piippo@theqtcompany.com>
	<CAP9ODKrU=fgJ_ooz4_oOpMWRxw+e_UHLc9VrNy3ne=wWdS3Msw@mail.gmail.com>
	<56C2E83A.6080908@theqtcompany.com>
	<CAP9ODKqw8CKiXfdkbpXXonKO52ap8Cw9u2zsd_+x=57s0_CAWg@mail.gmail.com>
	<56C32EA7.20501@gmail.com>
Date: Tue, 16 Feb 2016 14:01:32 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoZAxpVw2kePos5FD-vw+4Xd6cfTM9PHXmm51MXKq-u8w@mail.gmail.com>
Message-ID: <CAP9ODKoZAxpVw2kePos5FD-vw+4Xd6cfTM9PHXmm51MXKq-u8w@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] nativesdk-qtbase: use runtime linked dbus
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
X-List-Received-Date: Tue, 16 Feb 2016 16:01:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2016 at 12:13 PM, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> On 16.02.2016 13:38, Otavio Salvador wrote:
>>
>> On Tue, Feb 16, 2016 at 7:13 AM, Samuli Piippo
>> <samuli.piippo@theqtcompany.com> wrote:
>>>
>>> On 16.02.2016 00:34, Otavio Salvador wrote:
>>>>
>>>>
>>>> On Sun, Feb 14, 2016 at 2:25 PM, Samuli Piippo
>>>> <samuli.piippo@theqtcompany.com> wrote:
>>>>>
>>>>>
>>>>> Remove direct dependency to nativesdk-dbus. Instead configure
>>>>> qtbase to use runtime linked dbus library, if that is found.
>>>>>
>>>>> Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
>>>>
>>>>
>>>>
>>>> Why? This puts a dependency on the host operating system version.
>>>>
>>>> Am I missing something?
>>>>
>>>
>>> Currently nativesdk-qtbase does not package libQt5DBus.so, so there
>>> nothing
>>> in the SDK that actual uses dbus, but it's still built as a dependency.
>>> If "qt5: add Qml support to lupdate" patch is merged, then nativesdk-dbus
>>> would be pulled into SDK as well, although I think it's still unlikely
>>> that
>>> anyone would need it. If there is really need for it, then you can always
>>> add nativesdk-dbus to your toolchain.
>>
>>
>> So why not remove libQt5Dbus.so at all, from the nativesdk?
>>
>
> Point I'm trying make is, let's not depend on and build nativesdk-dbus if we
> don't need it.
> On nativesdk-qtbase, we want to enable dbus, because that gives us also Qt
> dbus tools (which don't need libdbus).

What will happen if the host version of the libdbus does not match the
one used during the build?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


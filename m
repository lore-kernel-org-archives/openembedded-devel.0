Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59CBE786DD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 14:53:55 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id i6so5018265plt.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Feb 2018 06:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xl7xE+X48LPFUq0PefaqdFKsIkTKUniIJtFX3T3jrbI=;
	b=LPQfuG25hTfsEkNDF3LNwbymiYSNqI+N0B/ts33s/t3DZttC1RrmI5ptmYY/PONkWk
	BBwbM21bBHZm932jxXPVynVC81CleGh7VJoGOKM7WJ6Q5NnsMXNLI1u5GAR4FRz/xtHp
	jiQ47QH9eZ/OtEFuFrzn/MKAlasNltMFSPJonrfzuwJ7UCk4Lo33v6zCSUXj6JvqpRfb
	vYyk15+j30SILATRvnhcbqBNxqnfsnW3gN2KQA6vJYxYP8ffPz3Yv0NRvPxDXZAbxZq5
	u3j0G9eNuVLJ7CjUSYNWY8cKOAi0/lW+GQuM60IIvCEnUygz48TJeZdv2hmV56NPNKmz
	WUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xl7xE+X48LPFUq0PefaqdFKsIkTKUniIJtFX3T3jrbI=;
	b=ZTXdT/pCr4qO9/JoSUVf2b2dh6pDK6bC+eu0swCwfx1dyw9Opco2O6Qsv5TUVx50PL
	wSu5wfy+QgtqEqOBiECHQHaqhZqa1/U9NHMO3gbHpOVvlA9jA5ZBDU11cSeIIrYoj3O/
	5QjFhSHwiIxvG5fZduoAdCsZ5OhSjyXJtmfysBkODP7vkPg/Iu0qU38vb5wbXv0cHN7r
	Qh71XmsevK/GbN6BJaghFLDn9aWHjSeXpe0/37iBXxgw9LvkjJRl5EttFFIlUIxxYK7U
	RQ9g9HAj/3SxH0CUvzxBeSHjyNSsuZcCBXHTEVZpfigLpKdNsJGW3aX7IYpproExPG4/
	OXHQ==
X-Gm-Message-State: APf1xPAiC43Tn6nYX8t0/8iKbCo2O4LvFVlHbJOnofWcltHCvUhdb2Fa
	GAElx+o9qs05/txJ1Xfc3CRYtpXsKUvARaPJiNo=
X-Google-Smtp-Source: AH8x225cr/bO6S+59OcLNje8VPs/r0k0iDzsq0MHr1aOpIPQWhAuziie1wxkYlNt5GexRqLAcsm799isQ6otNbRKlII=
X-Received: by 2002:a17:902:328:: with SMTP id
	37-v6mr2012213pld.398.1519397636998; 
	Fri, 23 Feb 2018 06:53:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Fri, 23 Feb 2018 06:53:26 -0800 (PST)
In-Reply-To: <CABXoSoUtZuS+u_YjAPQYUKwoMPtxUXP6ABNDBq-Ww03O7_9Gaw@mail.gmail.com>
References: <20180222042940.3770-1-raj.khem@gmail.com>
	<20180222042940.3770-2-raj.khem@gmail.com>
	<20180223012757.GA1413@jama>
	<CAMKF1soxS4aUMzd5d+uiHvnEjFEh5vyUvZcGQ_9CUdNugb7LvQ@mail.gmail.com>
	<CABXoSoUtZuS+u_YjAPQYUKwoMPtxUXP6ABNDBq-Ww03O7_9Gaw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Feb 2018 06:53:26 -0800
Message-ID: <CAMKF1sq7PX0hH6m_5UR8=4Yv19SLX32qe2OT2D2VegFWPcYbxg@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] qtbase: Add packageconfigs for renameat2 and getentropy use
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
X-List-Received-Date: Fri, 23 Feb 2018 14:53:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 23, 2018 at 12:00 AM, Samuli Piippo <samuli.piippo@gmail.com> wrote:
> renameat2 is a system call without a libc wrapper, so the configure
> test will always fail. The system call will still be used if that is
> defined, so PACKAGECONFIG doesn't make sense for it.
>

thats what I was thinking that testing kernel headers for the syscall
may not be sufficient. We might have to pass minimum supported kernel
version to make this decision to enable/disable these calls.

> On 23 February 2018 at 04:17, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Feb 22, 2018 at 5:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Wed, Feb 21, 2018 at 08:29:40PM -0800, Khem Raj wrote:
>>>> These features depend on underlying syscall support in kernel
>>>> and if older kernels are in use, then we can have a knob to
>>>> turn them off.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  recipes-qt/qt5/qtbase_git.bb | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>>>> index e495b8c..843648f 100644
>>>> --- a/recipes-qt/qt5/qtbase_git.bb
>>>> +++ b/recipes-qt/qt5/qtbase_git.bb
>>>> @@ -71,7 +71,7 @@ PACKAGECONFIG_DISTRO ?= ""
>>>>  PACKAGECONFIG_RELEASE ?= "release"
>>>>  # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
>>>>  # PACKAGECONFIG_OPENSSL ?= "openssl"
>>>> -PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests"
>>>> +PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype tests renameat2 getentropy"
>>>
>>> Should renameat2 be enabled by default?
>>>
>>> Either the test for it is broken in 5.11 or it's not available in
>>> default setup.
>>>
>>
>> Its ok to keep them enabled by default. but I think this is a bug that
>> should be reported
>> to upstream QT, if the feature is knobbale then it should have worked.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


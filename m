Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E410A7859A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 15:41:04 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 199so1091602pgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 07:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D99q0SEOKv3ToQ1xEE3iMo5fIqmGHDnPkNwTb2JkaHU=;
	b=bwu5vcCrdr4F6ooe4T8i8Xt1cwiXHl8pd5SibSRQvysTLRNwNCkAQWE7Mv3Ttw/m3S
	VYfNxHu1/fwid0fCDoxieIbj4JFMqMbpdsm3jgkdmtL4XHpxukCdyH8K2ZbdxFqpzOwa
	+JHUk0+cVBKZK8j+B1nS+Pl7+6wYMBbOl0eX42dRSjAYYfPIZDxhEsnCAXPLbpdEaKFJ
	SHxdoytgvzsqqX1bTC7zKNoIanEmDYHsuTWlkWemY5NqSL5HbEUlT2yviAenH5TgmxV1
	Qqa0HWvug/ZjyXjeiCKciqHkZY07DVZ1qe83tWo8iCRXG8rU73CPf9AOSl8sRcrGR/tB
	cL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D99q0SEOKv3ToQ1xEE3iMo5fIqmGHDnPkNwTb2JkaHU=;
	b=oU639LGQOexkPRLL+rR5HnA2ZL3WVIwSzy8dgDy4MNQwxkgghPvBOtJR39iFWppiv9
	+K4HnguOEOsUbHXpRLivq2bAl2S1c7v5Q+md4ILFrZrY2zWerJcjkhsuCqniyOm98/jl
	9coELEagst2vrQDMLWJ6EaO3F4rtlYJY6URY1tdEkKMt7GBFKAUeiRQMyH0mVxxd5gvk
	16Y21gd9MGk2nNz0680Ui356/peiQgYHjWKr/Tup3y37FkDXHhRUwL0l+OlbHV00XbDz
	tz6Aa/KvAmAdlI7zKllHffFqHidDVk0trax+OT2eNwI5tdZ/aQ27w+NhTenh+bSOSmL6
	AKVQ==
X-Gm-Message-State: AJaThX7K8N+XcVrhqqwByytNhZcqxnUQ6DPt3+b89mxhFKYPdC2pT5D8
	Db8NDLA8OOTsf58XL8cMHkszeXvJWY3OsZDfmwI=
X-Google-Smtp-Source: AGs4zMZ9sE+FhP6GeHhYHa13UexxnL3oORNWmH2lfQMw/KZoIGa/zvhq/e26skhPbLWjawKvo/ytR8pIxvYwSI7O1wE=
X-Received: by 10.98.144.23 with SMTP id a23mr19636529pfe.155.1511365266028;
	Wed, 22 Nov 2017 07:41:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Wed, 22 Nov 2017 07:40:35 -0800 (PST)
In-Reply-To: <fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
References: <bfbfad0b-af40-5448-4aed-fc70eeb95c6c@windriver.com>
	<7bdd24ea-febf-86b4-e770-6f7533205d73@windriver.com>
	<37b787d0-ef5a-d821-0c09-a8547c58c52d@gmail.com>
	<e9e12bfb-1b89-d9f1-619e-1896e83837cb@windriver.com>
	<23178b55-e416-a67f-f90f-041f2ab21080@windriver.com>
	<fef8df4e-613a-2baa-398c-f137ce4f8dd1@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Nov 2017 07:40:35 -0800
Message-ID: <CAMKF1spQUU6B_O+Ovd6YzZ4pycTJP7jDko5i19e6ww+VBCE5aA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: +lpd-cdc-core-dev <lpd-cdc-core-dev@windriver.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Contribute meta-installer to yocto
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
X-List-Received-Date: Wed, 22 Nov 2017 15:41:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 22, 2017 at 12:58 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/22/2017 04:26 AM, Hongxu Jia wrote:
>>>
>>> If it is OK, I will send pull request to OE for review, and
>>> my opinion is to suggest to create meta-installer sub layer in OE.
>>>
>>
>> To clarify, I mean to create sub dir meta-installer in
>> git://git.openembedded.org/meta-openembedded
>
>
> Should the directory be called meta-anaconda then? There are many available
> installers, and this would make it clear what the directory contains, I
> think.
>
>

I think meta-installers is more generic and probably good, you could
create a top level
repo called meta-installers and put this implementation underneath at
meta-anaconda
which leaves room to aggregate other installers under same roof. but
again I dont
have strong opinion either way.

> Alex


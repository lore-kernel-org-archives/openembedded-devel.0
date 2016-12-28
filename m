Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEDF66612C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 23:22:25 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x186so25544208vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 15:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Equsy71vU9ohYwWVQGYc37sG5U0RpObvzyJzNgpyI+w=;
	b=nwVVNasiaHnOoiru1ZeG8FYmCC3OR7EGkncYYX6Iui6iw+5KQemCW1oErcPnkWEsNJ
	gBHu2+5dcIF7S6nyCmwRTHeSlftPVJa9Lso0aY70166NZgVZIQ1c7JUN79O8vnK2OEBf
	Mg+m1kZDafaF7RB/8c3bKQIjZsqx6Z99TaBNBYWlkg+Pod4clIj3G94FsoRrz1+YCabu
	tUE7BIuSWMvXnMPl6MBlRtigw25el6HCTRNjJpoR71CAeUx3lP4pxJK7z6roNAm7F6Op
	/M7saL+sWwraBiXarnxqfXG11v3qMJF31jDXAi0A+GM8FhVglu9wBkAMPAJ3P/wQUzuu
	TZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Equsy71vU9ohYwWVQGYc37sG5U0RpObvzyJzNgpyI+w=;
	b=CO/JgEKMTXzHdFu3Lk0jhaMxFle2ow3hIqtwgp1GVpw2IBAR7aqm7qcOlHDvw/DXSQ
	+MNq3ahCp+4Qe19tRSZ0Lq+QmJT6o1GW1Qqydio4OrtYlNeUZjgyaoOrPB9bJKWpRNbv
	FZyzbD7SbXoQ+4SQcjIGkiPvYnr2JFTGXSwcVtmGP2l8KttRXHRX/hfBbWw1tjijfduk
	CFExsKNd+pOUSoeb5rF/bGwdz29RNqHWPJDTHYROcIDfHLAkx99Llf98yKpdJoM88H8b
	WNAIgeINgrwWGcOYmKiPH+qHGPFm8VVsDitnBiguGEgjaU/iPUxYV5e4AzF1bz9LmgLw
	RHaw==
X-Gm-Message-State: AIkVDXK6QXg2h+xCuvij8fR+o2MFtpL5zhmodUSNsWtjVDw/fTLldykC/ajjhDx9arJb64qGRXUUDD96aDOSXQ==
X-Received: by 10.31.26.193 with SMTP id a184mr6124680vka.173.1482967346527;
	Wed, 28 Dec 2016 15:22:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 28 Dec 2016 15:21:56 -0800 (PST)
In-Reply-To: <CAKuJqM8AC2pi7y8xGE9o5yJnCkD3GbkLz8RD9y1YSFigwJjKGw@mail.gmail.com>
References: <1482926435-13846-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CA+chaQcgfRj827K4kSZog6-jDsMu3EX9dGCWT-QCaJihEp23aw@mail.gmail.com>
	<CAKuJqM8AC2pi7y8xGE9o5yJnCkD3GbkLz8RD9y1YSFigwJjKGw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Dec 2016 15:21:56 -0800
Message-ID: <CAMKF1srmFh83WsKAptTGtCiphnY6+hDzRbvZjVhNQBEpORx1eQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] devmem2: fix broken SRC_URI
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
X-List-Received-Date: Wed, 28 Dec 2016 23:22:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 28, 2016 at 4:17 AM, Oleksandr Kravchuk
<oleksandr.kravchuk@pelagicore.com> wrote:
> This is a reasonable question. I can only say that the header is
> slightly different, therefore I had to modify the checksums.
>
> I could use another mirror that contains original devmem2.c, but I am
> unfortunately not confident in their longevity.

Can we just store these files on OE src mirror ?
may be send the original files to Tom and he should be able to help
to host them

>
> On 28 December 2016 at 13:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>> If it's a mirror, then why would there be different LIC_FILES_CHKSUM and
>> SRC_URI checksums?
>>
>> On Wed, Dec 28, 2016 at 1:00 PM, Oleksandr Kravchuk <
>> oleksandr.kravchuk@pelagicore.com> wrote:
>>
>>> Original SRC_URI for devmem2 source code is accessible. Use the mirror
>>> provided by free-electrons instead.
>>>
>>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>>> ---
>>>  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb
>>> b/meta-oe/recipes-support/devmem2/devmem2.bb
>>> index e48cc92..ba9d4cb 100644
>>> --- a/meta-oe/recipes-support/devmem2/devmem2.bb
>>> +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
>>> @@ -1,9 +1,9 @@
>>>  SUMMARY = "Simple program to read/write from/to any location in memory"
>>>  LICENSE = "GPLv2+"
>>> -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=
>>> dd68f2b0a5184b3db3dc25c99e0bd0cd"
>>> +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=
>>> a9eb9f3890384519f435aedf986297cf"
>>>  PR = "r7"
>>>
>>> -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
>>> +SRC_URI = "http://free-electrons.com/pub/mirror/devmem2.c \
>>>             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
>>>  S = "${WORKDIR}"
>>>
>>> @@ -18,5 +18,5 @@ do_install() {
>>>      install devmem2 ${D}${bindir}
>>>  }
>>>
>>> -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
>>> -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d652
>>> 1e58ac482c4e29d6c9ebca8768f699c191"
>>> +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
>>> +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388
>>> edfec2175829ea1576a7a0c8606ebbe639"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
> --
> echo "EOF" >> /var/tmp/email
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


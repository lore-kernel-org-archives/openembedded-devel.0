Return-Path: <chmorgan@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 261FD6AC82
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 14:54:09 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so5625800wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qs2wqTuiZiSE2fBeekhWNEnkO4h5s1vYPeCTlk8nTM0=;
	b=CVADw514BIk2+pdC6sO/AqxLy0AEJJGMzK/ilsnGmN9BUbOjf9HSLM99o6Mk4fYFBg
	7FJHqUBcBESu1F2wPqVU3Zv658+yDA7BUvR5EsnxLmZQa5Fs5V2M5n0MoKYmflFqkgdy
	YNL5pVB9uEGicgbP5uYg3PILX7JvxPGnuspgOMEp5yAFe5pNhIsYcpZ5vYXpchTaCcQg
	Hu3rKL0I/Gx3XgP33nDJUcrdvi9BUYKqNWZxSKiRnUZ/QTfltvLf1XysitfnB1n8LuZe
	jbxGn2NBVqBhBTZKorfNeENitjzvY42E12bdHx0CX7gpAWUWRlMbwMz8BSxpCDoCnTPO
	kllQ==
X-Received: by 10.180.99.1 with SMTP id em1mr6406415wib.29.1416408850038; Wed,
	19 Nov 2014 06:54:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.27.52.8 with HTTP; Wed, 19 Nov 2014 06:53:49 -0800 (PST)
In-Reply-To: <20141119144901.GJ3315@jama>
References: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
	<20141119144901.GJ3315@jama>
From: Chris Morgan <chmorgan@gmail.com>
Date: Wed, 19 Nov 2014 09:53:49 -0500
Message-ID: <CAAPegz3PPzLqUOgcQqc20zxjDnzP8T5_Xhcf6i=zZcjtsqoNMg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] dfu-util: Point to gitorious.org repository as gnumonks.org is down
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 14:54:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 19, 2014 at 9:49 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Nov 10, 2014 at 01:46:33PM -0500, Chris Morgan wrote:
>> ---
>>  meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> index aa2b84d..c706fd1 100644
>> --- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> +++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
>> @@ -4,7 +4,10 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>
>> -SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
>> +S = "${WORKDIR}/${BPN}-${BPN}"
>> +
>> +REV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
>> +SRC_URI = "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
>
> Aren't archives on gitorious generated ad-hoc like on github (changing
> SRC_URI checksums from time to time)?
>
> Why not use git repo on gitorious?
>
>>      file://0001-configure.ac-Don-t-check-for-usbpath.patch \
>>  "
>>
>> @@ -12,5 +15,5 @@ inherit autotools pkgconfig
>>
>>  DEPENDS = "libusb1"
>>
>> -SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
>> -SRC_URI[sha256sum] = "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
>> +SRC_URI[md5sum] = "1de724551604bce1962960b7a301cc08"
>> +SRC_URI[sha256sum] = "5d253f924fd29bc13054b664bba9aa86b865299971195969478253c1775b7e56"
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


I thought this option would make caching easier and avoid having to
get the whole history of git each time during the build. I can switch
to using the repository directly though, thats no problem. You want me
to do that?

Any ideas where gnumonks.org went? I'm not sure this gitorious is an
official repository. There isn't really any information about that on
the web that I've been able to find.

Chris


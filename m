Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5EB0E710C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:54:35 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id b6so505109yha.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ibZ4dCVzv/7JdYFHf7RkcojnErC1o4aAHIWI9vkdBfY=;
	b=ccazpKHuzHn9LC3qYhTYTUDfPz7FNb7589sctQHtHDVbMLNam9LRRMgQ+JwS94Udes
	jFERJ/m6Lhi7rTFMydyoSOQlThSPm7kiueE7NZmiV+/XvFFQd08O3jxgkDuNDT4fFwTV
	Zl0p5X/Jgwu4AzvV+Yc2amPoxAe8kkRh42mEfOPtL0YlaSb5CUq0jhog/1NW774PecAm
	49erVZZ1CjqotUaF/+RlrW/goHpEgDyuzoe5bnnfnp9/0ZniYeCQO3tnjdoxuNMb16yd
	6tlp3NP8i9R4bWeG20jnTQzHIFIL2nYL4MKnoop9dUt9gtdQ6t1sCkMZKZUJZZ5cDNZ8
	LKng==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr4779438yhi.67.1409234076745; Thu,
	28 Aug 2014 06:54:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 28 Aug 2014 06:54:36 -0700 (PDT)
In-Reply-To: <CAP9ODKowYPXHShXiBVTG=2_r1_qm=E0gXRAtXDTUUYqD7vmmNQ@mail.gmail.com>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
	<CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>
	<CAP9ODKowYPXHShXiBVTG=2_r1_qm=E0gXRAtXDTUUYqD7vmmNQ@mail.gmail.com>
Date: Thu, 28 Aug 2014 10:54:36 -0300
X-Google-Sender-Auth: HYbINLtKqX1BRHG3cgTVKQsYogc
Message-ID: <CAP9ODKrzJAW+NXr7LmzQ0+CnmJE_pc5786Xq64AMqeRN_X6=kg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cliff Brake <cliff.brake@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][for-daisy][PATCH] php: Fix native build due mistakenly linking against host's iconv
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
X-List-Received-Date: Thu, 28 Aug 2014 13:54:41 -0000
Content-Type: text/plain; charset=UTF-8

Martin,

On Wed, Aug 27, 2014 at 11:04 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Aug 25, 2014 at 10:15 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Sun, Aug 24, 2014 at 8:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
>>> <otavio@ossystems.com.br> wrote:
>>>> The configure script has mistakenly choose to enable iconv support,
>>>> due host to provide it, adding '/usr/lib' to the linking flags and
>>>> failing as:
>>>>
>>>> ,----[ Linking error while testing 'fork' support ]
>>>> | conftest.c:268: warning: conflicting types for built-in function 'fork'
>>>> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
>>>> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
>>>> | collect2: ld returned 1 exit status
>>>> `----
>>>>
>>>> This patch disables iconv support for native builds fixing the error.
>>>>
>>>
>>> the patch subject is confusing. enabling iconv is not mistake but its
>>> probed and if found its used. in this case libz against which libxml2
>>> is linked is not used here and that ends up in error.
>>>
>>> Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
>>> and see if it helps ?
>>
>> The native does not depends on virtual/iconv. So the natural thing is
>> to disable it.
>
> Hey guys, can you review this one for backporting?

This is the Daisy backport one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


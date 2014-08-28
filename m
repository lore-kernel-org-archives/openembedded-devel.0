Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 39D507067B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:04:13 +0000 (UTC)
Received: by mail-yk0-f181.google.com with SMTP id 131so84456ykp.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 19:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uv38PewlzP05Fpufg8iXv3yNz2LhPH0jOYFILv+Jwg8=;
	b=X1ACqxa2tcHbVLW1JmWrNTR1DdwyTajYjkjuX2YWKmDiGnsB12LIy95lr+77jgCre+
	XJM1IH4ybZxs5uEtG3YMftKZF/RvIj0SvpTKWhn+hqAOZsa78+px2glafj7xaR/7osbi
	WcusyX4hkoNnlbzu8KrpEtyX/u8QZgwZ6nHUhObCRUorT04lDf+ot8FUes7Xz0SbcBqt
	lVkXAffkDvi+xpFy5mJnUk49di8MvYj1b4eo7CDsuIG4bb+xa+UOAd0rADK25pYiLJ+5
	HpsYpvSX/+SxUQZoA9ORzunG/bn/2wm2xKB1zn/J181Kybd8jiz4GlToERWOxLYYMXvI
	wR6w==
MIME-Version: 1.0
X-Received: by 10.236.79.230 with SMTP id i66mr1309083yhe.136.1409191454758;
	Wed, 27 Aug 2014 19:04:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 27 Aug 2014 19:04:14 -0700 (PDT)
In-Reply-To: <CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>
References: <1408914239-11562-1-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sqRuJ2Ncy=FR09ir4N0teHWvN3CfxGQR97niSDFAcHHzQ@mail.gmail.com>
	<CAP9ODKoX8jUYPoZDqF4WYK45p3tYT8g-MUsox6=frigEY_Eo+Q@mail.gmail.com>
Date: Wed, 27 Aug 2014 23:04:14 -0300
X-Google-Sender-Auth: jEj78g94luXDbt-mj3cO2N2QdTA
Message-ID: <CAP9ODKowYPXHShXiBVTG=2_r1_qm=E0gXRAtXDTUUYqD7vmmNQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cliff Brake <cliff.brake@gmail.com>, Armin Kuster <akuster808@gmail.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 02:04:20 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 10:15 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sun, Aug 24, 2014 at 8:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Aug 24, 2014 at 2:03 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>> The configure script has mistakenly choose to enable iconv support,
>>> due host to provide it, adding '/usr/lib' to the linking flags and
>>> failing as:
>>>
>>> ,----[ Linking error while testing 'fork' support ]
>>> | conftest.c:268: warning: conflicting types for built-in function 'fork'
>>> | .../build/tmp/sysroots/x86_64-linux/usr/lib/libxml2.so:
>>> |     undefined reference to `gzopen64@ZLIB_1.2.3.3'
>>> | collect2: ld returned 1 exit status
>>> `----
>>>
>>> This patch disables iconv support for native builds fixing the error.
>>>
>>
>> the patch subject is confusing. enabling iconv is not mistake but its
>> probed and if found its used. in this case libz against which libxml2
>> is linked is not used here and that ends up in error.
>>
>> Can you try to add --with-iconv-dir=${STAGING_LIBDIR_NATIVE}
>> and see if it helps ?
>
> The native does not depends on virtual/iconv. So the natural thing is
> to disable it.

Hey guys, can you review this one for backporting?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


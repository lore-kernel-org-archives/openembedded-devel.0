Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbTug-0002JD-6F
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 12:54:01 +0200
Received: by mail-vc0-f177.google.com with SMTP id ha12so4717105vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=mYBB1s4m36UM/rgLp0s6MeNwk3QiPRsFCbqF6p6DsY4=;
	b=udrX7CQW9NUTEP+OD54WP8/i8SKEF1U69+m5h3ojMmtU7CFXetHjKaggh27azLffCm
	jbfDPr/bJQEA9HzIWqTWXkJdLEjh9ogWrFJIpGVO2gCei5CDVhZkkWSHGsorNELIQt16
	Kfezrk71sO8CO0UZVVj0Th+OnUuMd8nEx7//A9pspiQ/+XHKs/J2y97SONuMOeMAGqgC
	NdB6oBtWKzDMWZpmlQaeCnqFa+V1OGUuBQnUm4GN0tHW8VtD6fJ0mD0YeoxcV9JIqY0+
	LPZIV/vQPBumlg1lF+dM7yYWPUs+rNGdph6dteM1XWAwyKHcBTnLanownIYWlMN0VCGh
	S8Hw==
MIME-Version: 1.0
X-Received: by 10.220.191.129 with SMTP id dm1mr1515951vcb.54.1368354949609;
	Sun, 12 May 2013 03:35:49 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Sun, 12 May 2013 03:35:49 -0700 (PDT)
In-Reply-To: <20130510172126.GG12329@jama.dyndns-home.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
	<518CCC61.5080504@opendreambox.org>
	<CALbNGRQZ-6XVzhCOZ7mX8_MF0Cqgzu4W49TmmWqxBCEKZ6ENHA@mail.gmail.com>
	<20130510172126.GG12329@jama.dyndns-home.com>
Date: Sun, 12 May 2013 12:35:49 +0200
Message-ID: <CALbNGRR9Sr6P9UPCVc=nJQ_DYSH8HOgqNf7JCbMg1p-1N0jO2A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-gnome 06/15] poppler: remove unrecognized configure options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 10:54:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2013 at 7:21 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, May 10, 2013 at 07:03:40PM +0200, Andreas M=C3=BCller wrote:
>> On Fri, May 10, 2013 at 12:30 PM, Andreas Oberritter
>> <obi@opendreambox.org> wrote:
>> > On 08.05.2013 00:41, Andreas M=C3=BCller wrote:
>> >> warning was:
>> >>
>> >> | configure: WARNING: unrecognized options: --disable-poppler-qt, --d=
isable-abiword-output
>> >>
>> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >> ---
>> >>  meta-oe/recipes-support/poppler/poppler.inc       |    1 -
>> >>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
>> >>  2 files changed, 0 insertions(+), 3 deletions(-)
>> >>
>> >> diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/re=
cipes-support/poppler/poppler.inc
>> >> index d0c0074..11286bc 100644
>> >> --- a/meta-oe/recipes-support/poppler/poppler.inc
>> >> +++ b/meta-oe/recipes-support/poppler/poppler.inc
>> >> @@ -11,7 +11,6 @@ EXTRA_OECONF =3D "\
>> >>      --enable-xpdf-headers \
>> >>      --disable-gtk-test \
>> >>      --disable-poppler-qt \
>> >> -    --disable-poppler-qt4 \
>> >>      --enable-zlib \
>> >>  "
>> >
>> > This hunk doesn't match the cited warning.
>> >
>> > Regards,
>> > Andreas
>> Oops - will send a correcting patch.
>
> I've also noticed that newer poppler fails to build on some
> architectures (I know, too late, it was building fine on qemu* on
> jenkins, but om-gta02 - armv4t fails with:
>
> | Splash.cc: In member function 'void Splash::drawAALine(SplashPipe*, int=
, int, int)':
> | Splash.cc:1497:19: error: conversion from 'SplashCoord {aka FixedPoint}=
' to 'Guchar {aka unsigned char}' is ambiguous
> |        pipe->shape =3D aaGamma[t];
> |                    ^
> | Splash.cc:1497:30: note: candidates are:
> |        pipe->shape =3D aaGamma[t];
> |                               ^
> | In file included from SplashMath.h:27:0,
> |                  from Splash.cc:44:
> | ../goo/FixedPoint.h:45:3: note: FixedPoint::operator int()
> |    operator int()
> |    ^
> | ../goo/FixedPoint.h:43:3: note: FixedPoint::operator double()
> |    operator double()
> |    ^
> | ../goo/FixedPoint.h:41:3: note: FixedPoint::operator float()
> |    operator float()
> |    ^
>
> --
Can you send me log.do_configure for this?

Andreas



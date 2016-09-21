Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id BED7D6FFC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 18:53:40 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id g192so3565944ywh.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 11:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=V1NbTuxL/nzouXZ3PipQfL5KXVlTnCg3xf/JjgfkAnw=;
	b=J1ilNFy+vV8NqXezarT+cooNlfcVpMQIGF5oZaqW+qk0OLA/AtV6pXdRtviSFC9PXs
	p/3WTqxhNEO8KVcrFJfQt1dpwTaP5x+rHJrSLDTKdZBzGmdgYPQ/QUQ9bRyCLFz1GK3t
	lenqMbUINVXM4G29h2HXgJcjpIZx3xwww4iSMYreHrC9GOhLfuVOxq/OFsF5QrLftPs1
	nMOhNe+TNvwda+dJog1uscHBUA0QmymHrp8+J1JtG6DgiwrC8cgcFPazcqET3TjTdS7y
	8/3OAnmsIGe6RjE+vxgBFcCg7uXoKFTTKXjOp7/Tx5DBAA/v+B9AsBitbNWs49D37m/e
	SeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=V1NbTuxL/nzouXZ3PipQfL5KXVlTnCg3xf/JjgfkAnw=;
	b=KVVgpf4W+/rHe52mBsHGAgt0UatKUjwmCgim6qJlvTVqbMokHptubIKvTse9vbGUt1
	sGxltR9m//FqZjJ6n8eJQE3JX4CR2fWdwD6P0rcZIOqs3+u+JTPUpv2zhJwyVhh/AqRT
	Fm1oS1wJEXRdvzGE52CxxPk/AVpTWsoDuU8o8O/Yw6S3s8YOnsdL+xvVLNOGC4T1KiP/
	GiKdH618+DrY7hBc09FsROYrTJINBpJ1laFuADrHOHV17L/OEob3hZ4JrPMznMQYh6lL
	wQojTbrW9CgsmrHrMvhEild12YT7gPQTnjj24Imrke/KbrdnrLsje/D2oiSABQYdFt4m
	aKrw==
X-Gm-Message-State: AE9vXwMYq3qCDrf4AgXnSsCKVI9mfYQcp9fC+aCGIAi3udSRF2anXos7uU9HS89LGbC241zLOjiqs4/jg5UlmA==
X-Received: by 10.129.121.7 with SMTP id u7mr35960920ywc.237.1474484021056;
	Wed, 21 Sep 2016 11:53:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Wed, 21 Sep 2016 11:53:10 -0700 (PDT)
In-Reply-To: <CALbNGRT05UShz5FDEyopsfV0RgRQo=Twi3XxoivYgWfx+fp+3g@mail.gmail.com>
References: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
	<1474159646-8902-2-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srsroUidAY9TRiuxT9KWYru5Guq22F2vSnYg_cw2EmpCg@mail.gmail.com>
	<CALbNGRT05UShz5FDEyopsfV0RgRQo=Twi3XxoivYgWfx+fp+3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2016 11:53:10 -0700
Message-ID: <CAMKF1soUJ8j=eNwm+qzrfFSdQHjdGYToAs_W+rTwjJkWi-FDBg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/2] imagemagick: depend on fftw not virtual/fftw
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
X-List-Received-Date: Wed, 21 Sep 2016 18:53:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2016 at 10:20 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Sep 21, 2016 at 4:41 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Sep 17, 2016 at 5:47 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> ---
>>>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b=
/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>>> index adfcf55..74fe369 100644
>>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>>> @@ -3,7 +3,7 @@ SECTION =3D "console/utils"
>>>  LICENSE =3D "ImageMagick"
>>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22d47a47bf252ca3ed7f71273b5=
3612e"
>>>  # FIXME: There are many more checked libraries. All should be added or=
 explicitly disabled to get consistent results.
>>> -DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw fre=
etype"
>>> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
>>
>> have we integrated all of the fftw recipes ?
>>
> See first patch of this series

yes thanks


>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


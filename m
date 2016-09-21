Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 328DE60616
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 05:20:50 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id v2so1885658ywg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=tij8dGWbvzsfct4xftW/EDPxE5osB+sIuBy0zgAa2fo=;
	b=rFAhx+4Rk1A8cuO5wOpNQG+en99m4VHsIkZfP2di0pY2QTyvQI5JljgPKYGihwV3J9
	JeR9zsHewLOIPqqDdlwi/RMx6eYmmgCHdcrd6uzGRELna/vSTcoPxbBf8yas8hlacaCM
	BhZiDz3zLOaNJfgR6ZxgWpfOzjkxFKTyG3Ly6IURYwZ6nsAvlRp6NF39U9r+yOImbzoe
	Xq+eyIemyiaAntLB0AcTUoye7D8e1u5KdBXpQPxCmkw4OR9m6HLem9Rq1rtxZl7VWHVE
	y/W6PC9PZZ8MYH6+rFAQDuz4PVwPLuJEuTkI106vFtibnGNkcn5Tyz3lbEPXBlL+HUfq
	SA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=tij8dGWbvzsfct4xftW/EDPxE5osB+sIuBy0zgAa2fo=;
	b=dlR/nDtnmeOKYByjt3IjC/P/1jZv+HllCiGcWmLaksQk5L2fsFpt2x1bzE06myXuhy
	agevjM7kYnlv2R89ekI4/x54TlCPHAFiMLtx3TGHwum0N00oRXhYZd+Dj5P7Mal4cnAm
	4vRC+Gs5+eollz4F/wNIVhg1/DMh3oEr7V8wUj4y4JkaJFPbft7bXtPDVam0rb2NZ5Vt
	/gggqnvbfqGPR+K1Ga/1Wo8iyCDPXj5Y+xDjLKulOflMRtdVsQSWfrL3cxssU03sOF7X
	emR/cwdu5EciKDbDoxmuJYW7YhJBagmfK/C4U7ZUXFFHdZt7dzJHh2VSeEs4OXWKZytg
	4rWQ==
X-Gm-Message-State: AE9vXwNx62JIox818IHi6nRAn5h7Xc7DMpzjlsCRdVUGFo5fIFRCZzINC21+0W/dg27X5+a+EmMCvI0azsRb3A==
X-Received: by 10.129.70.137 with SMTP id t131mr31395648ywa.268.1474435252034; 
	Tue, 20 Sep 2016 22:20:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 20 Sep 2016 22:20:51 -0700 (PDT)
In-Reply-To: <CAMKF1srsroUidAY9TRiuxT9KWYru5Guq22F2vSnYg_cw2EmpCg@mail.gmail.com>
References: <1474159646-8902-1-git-send-email-schnitzeltony@googlemail.com>
	<1474159646-8902-2-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1srsroUidAY9TRiuxT9KWYru5Guq22F2vSnYg_cw2EmpCg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 21 Sep 2016 07:20:51 +0200
Message-ID: <CALbNGRT05UShz5FDEyopsfV0RgRQo=Twi3XxoivYgWfx+fp+3g@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Sep 2016 05:20:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 4:41 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Sep 17, 2016 at 5:47 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/=
meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> index adfcf55..74fe369 100644
>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> @@ -3,7 +3,7 @@ SECTION =3D "console/utils"
>>  LICENSE =3D "ImageMagick"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D22d47a47bf252ca3ed7f71273b53=
612e"
>>  # FIXME: There are many more checked libraries. All should be added or =
explicitly disabled to get consistent results.
>> -DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw free=
type"
>> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
>
> have we integrated all of the fftw recipes ?
>
See first patch of this series

Andreas


Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 97A0A605BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 12:51:58 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id d97so3581674uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Aug 2016 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6JqRpxtm4aB2nYvcf08nhKzN0ie2DyJarnWdqvnGsEw=;
	b=PvFT7CwfFSTfAAreDszPnFCvzmZY8trgZ5v3nDVy0uadIwLCF4mrcw8KGIagDTLu2y
	Rfj4S3OF6O8SY5WcUSUHvwzjUnJwNY7DwJiGdplsHGpCgR8qmk3El81cVuxj2rdupXLz
	mZiSKfB05sD08ZgEzAnPLeqxgvUk4ADgVK2raKro2njYlVyVh1g/K5TO7vZwWT3kz6TY
	VaO0OMZADl4fsRFqFz31ZBf7G7v5TNb16K9pDLrsVKyi8Xx2HhXYe7CAWrQO5UpU5mbg
	XHKY2+R6q9QbCnVuc3NnZcqzievmL9uLcgrGeWvWCPd4g3N1gQfAHCBWFZoMP1OG4OVj
	KmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6JqRpxtm4aB2nYvcf08nhKzN0ie2DyJarnWdqvnGsEw=;
	b=JEHlJGRfmUFuzCq2V+zT2mZoWVaDY+4RDcx8QklSRLcgltasMYk13DC41enWOBSuYa
	CWCgMs/Z9MLlvFF3XCuPbbysy+0c1DRxqLc5lg6ip0ZlACJwq8PGi0A2Rk4KxtiHl/uV
	bm5CooGqjm/+yiX7ISMclWkqTWALhB1mvJ+E6/PC2Cg6DPww1ntyiKs3Kma3IwFRGREY
	aaGmi3L4VISyAFINikca7HX/jAgf1Hvip83u80J5rm2DejYCjxvMAK6hbpvXu/uHcg8/
	QVpUpj8aIGK58bmJvZcXXbc4DKyK7cjDWQh+5jDMGgMyzAskkEGkIFG5tsxAkwmjkkut
	JLsw==
X-Gm-Message-State: AE9vXwPyqR8PFKAhXKt/TnwY/HfCjNdSH7sqr+anhnnQ+N7ABS5kB6O8m1jRmYKET1QLlhxN0UUlXmnSIgnsCQ==
X-Received: by 10.176.2.242 with SMTP id 105mr4847265uah.10.1472129518422;
	Thu, 25 Aug 2016 05:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.138 with HTTP; Thu, 25 Aug 2016 05:51:57 -0700 (PDT)
Received: by 10.176.64.138 with HTTP; Thu, 25 Aug 2016 05:51:57 -0700 (PDT)
In-Reply-To: <e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
References: <1472063392-11490-1-git-send-email-raj.khem@gmail.com>
	<e6c87ae1-ca1d-895c-adb3-6c2b75abaaa9@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Aug 2016 05:51:57 -0700
Message-ID: <CAMKF1spmR94=-VGMJD0LGTLASWeOyq-wt-KM4p0Ut-vowzYcDA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade 7.0.3 release to patch level 9
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
X-List-Received-Date: Thu, 25 Aug 2016 12:52:03 -0000
Content-Type: text/plain; charset=UTF-8

On Aug 25, 2016 2:04 AM, "Jack Mitchell" <ml@embed.me.uk> wrote:
>
> On 24/08/16 19:29, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>
>
> 7.0.3?

Its a typo thanks
>
>
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> index 472e42d..604a848 100644
>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
>> @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib
virtual/fftw freetype"
>>   # Important note: tarballs for all patchsets within a version are
deleted when
>>   # a new pachset is created. To avoid multiple patches for each
patchset, try to
>>   # update to the last pachset of a version
>> -PATCHSET = "7"
>> +PATCHSET = "9"
>>   SRC_URI = "
http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz
\
>>   "
>> -SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
>> -SRC_URI[sha256sum] =
"1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
>> +SRC_URI[md5sum] = "2720ab8c480019f79e717b0237570311"
>> +SRC_URI[sha256sum] =
"22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53"
>>     S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


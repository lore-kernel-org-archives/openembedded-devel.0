Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EBDC56C3A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 08:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46mvBG3wQZz2J;
	Mon,  7 Oct 2019 10:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570437767;
	bh=nMLlkT8Uei7N7844t5c98+uuD5lG6+T8hxlSaSrb0RU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJR2KpLX1vOW/G3MfFHSadkfw9tQM8ujS4+aVBsO5Uixac9/r6wuk2BKfJUeeRMRb
	9nIv2iCr1cR+57TsiK31/57TwzRvJBjKtX8b5/fennPsv0liPQYjMKZSpZU0Uc/+4+
	Eun+iC0p0LiCx/ZoYFrf4GARm7SvaJNY5/YZZJH/iSpHwGqJncIUz0NnyqduipQ1Fs
	is2sq4aud46IXs6aMgwlSVi8pV6x/Q9N9uQFnGUq/5ztZbj8VnfumkTPxtQU62L9j8
	G3fadR+0p3YQoKL+/Zox2f2lTXv38yXIcAcSvXZrZBgNA0cBEx0Ce0KZPXqL3FWWDH
	TrdaKJAdNZm/obskZTglI5rgNJk2BDtITkIlIP31m1kuMhFjhbb1kApzRwMeHXzxwa
	tL5kMraetazi+iekHt9CsLCCb68pijpBaxx2VBRpKOVqH8PKLzC4hXF3vvJoB+afQG
	O1wQVG6hqWSDfZQG0cBPSpi5O8RJCa92qTFJURku+enE/8jNcIsBGSPpFb9yjCY8H5
	XaCUGq63lcdfAXa9y/+ROS4EUr280d+Fw0rbPyDtpJAeE3EJ2uC4CJul1I5MpwUBaD
	SINE5R6mboCQmI4FpQQ3TF0kPEVW982iStHCAPim5XtXybKYWc9pMwHcl9Q22vs6d6
	bc5/up3FxGIGHojpxOtX/SxM=
Date: Mon, 7 Oct 2019 11:42:44 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191007084244.GA18024@localhost>
References: <20191007052019.1127879-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191007052019.1127879-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] README: Document need for 32bit compiler
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
X-List-Received-Date: Mon, 07 Oct 2019 08:42:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Oct 06, 2019 at 10:20:19PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/README | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta-oe/README b/meta-oe/README
> index 0e9f8423bd..347816b0d1 100644
> --- a/meta-oe/README
> +++ b/meta-oe/README
> @@ -7,6 +7,13 @@ URI: git://github.com/openembedded/openembedded-core.git
>  branch: master
>  revision: HEAD
>  
> +luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
> +e.g. arm, so ensure that $CC -m32 is functional on build host,
>...

This would imply "cannot be built on arm64 hosts for 32bit targets".

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed



Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72391783A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 18:07:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m127so1975357wmm.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z/5C83oC12wq5jjpW4VxZlfj0FHsqRvuhGXiKi9ejN0=;
	b=snXvQDzM7Ic5uqXceNCv+/7h47jFsJaQPV7Xl8W7KUntfs+XCzASzOiWdzZ5zFUnjo
	/0HxU/AXqeg+En/WUoSy3DlFP2W+1NXqr/fYiEEabsJZBpszQbotWftGZoOs2zhimhiY
	BGPlbCp2uSzYpIXKelsD7/ZmI0296zGckE1S2GHi3IvJBxVGTviDk2wJ8X27tRqpfU0y
	ebNDILKECdVJsYRoTNUq5vysXfrZne+dE94eXIKbttZqcgLbE5eXVVWnSC5lTf2n3b4M
	VEzOgcXwfJlgMEMtNBCqB0xiMb9JgJMuzGCv2AlXl7HOsHfuJ93gbiCGF0bXQqp8vnxv
	4qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z/5C83oC12wq5jjpW4VxZlfj0FHsqRvuhGXiKi9ejN0=;
	b=VNI4Bo2zEd1AAd17hGZYs0FMSbwWGg1RaG+i2I6EAnTQfZL6TFhth0oG1GRaczr8xa
	7ocGRG1vhSQJTCcLb1KqPciKhiMz19II6a+iPa5MUTl49py/RGv8ud9okWHe3ljYk+7j
	fkjWc86M64hy5ZqxqoTQDKaUw5EQmAjPPdREO8gIt4kYfHJ03xLiWjJkMORUANt0sVOi
	3vqAm18n46sGkqhH/BWx8gTc7jIV4B2Zc6bVAhZPYr54SrBEGDDCXSijaNEGDfPwZmLc
	Tj2PKgBY/VHJcS3pnHKDN/CywbMQM3ChF+3TKighraW6TEqvkMvd33OSYPzuX5ZpXvxd
	tDVg==
X-Gm-Message-State: AHPjjUgWFIsCIl6U7yvRw9HFdCRD8L9chbZb6tv4X+27XXLkvYTSWyuj
	cAOLsDnTsC7bwYf6wFcfd2C+csWiw35s5UUbpBM=
X-Google-Smtp-Source: AOwi7QAf4DcSw86PPdu3YLpQNBdLJSglRrkxjHuxQvmCUHkUc0mUCbmbpkiwncHT0bqxqwI+SOi8sTQVR6XeFNypwfc=
X-Received: by 10.28.91.75 with SMTP id p72mr4672709wmb.89.1506103663342; Fri,
	22 Sep 2017 11:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Fri, 22 Sep 2017 11:07:42 -0700 (PDT)
In-Reply-To: <20170922175756.34609-1-raj.khem@gmail.com>
References: <20170922175756.34609-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 22 Sep 2017 11:07:42 -0700
Message-ID: <CAJ86T=VsGoih8gnkwGeZc0bLSbkA0tL-Day6iPYJmsmELAurjg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] mongodb: Pass computed endian variable
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
X-List-Received-Date: Fri, 22 Sep 2017 18:07:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 10:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> If not passed to SCon, it will try to guess it
> and do it by poking at build host, which wont
> work in cross environment
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/mongodb/mongodb_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> index d44d8d3c7..13ebd23f6 100644
> --- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
> @@ -58,6 +58,7 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
>                   --use-system-zlib \
>                   --js-engine=none \
>                   --nostrip \
> +                 --endian='${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}' \

Does checking TUNE_FEATURES work for all architectures? Or only
architectures which can be both big and little endian?

Maybe checking SITEINFO_ENDIANNESS would be more reliable.

>                   ${PACKAGECONFIG_CONFARGS} \
>                   mongod mongos"
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


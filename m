Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id D798771A8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 18:42:08 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id u48so98328184wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qL6fE4V5B6lzRauTxogDpY0W4RcpeeAYs/0fXIFUrU4=;
	b=ktRYQinv7nzw7jhBoMt5RD6Hax03Q37oFL5ifnaYVCtJq08+VyvDGtfZpRrLvHf5Dx
	4ajWAW9Ig5hbMbBYaCktk5L+0a+y37L/yQtzmrxjyOzXIkVAlgDWZhXszBvGtfirEVDf
	rcRSg9GbArEJw2ju0ddUiIGw6Pe5OZr40DwJi/yq9NagZatvNlyjtGrYl9VCxzBJubph
	0v3J2Gy/rlPSs6s4jlZCGw/gpIVkuxohwt1tb+ULSgeDj8R25vPYIBEIJQ54K5QPf98L
	jLGMEcByr5Q7vYV8bdM3FiAGrvZppqe05YlVkNInzGis4+C/TUcbSbz7uwg2XjEFAz2L
	Yr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qL6fE4V5B6lzRauTxogDpY0W4RcpeeAYs/0fXIFUrU4=;
	b=no8B2VcVkQSthIKoVoTTj3Xu1/6OvVeBP2UBXU3moU5uaYKpO1jAmn5t5yT/kxGnKi
	PU8hcLbP6ZDbYGXQIYWEHvg7hc9yPZlDJIGKRwUHCbczeVh8bD8hFeTPpOT8wmvjxwsC
	4K9c6VWD6UgYXBaZojmu/fyKtHgaNwXm8l93iIcDKPJNpRId+1b+PX6+QRYop3JEDbv9
	mlC1Zy0Vg9nSe9xJMl0j6jWeLLBCI63RtNYHw0vilPiLkAZ0AEvhec520GHqPs/6EVaU
	JP+cmBD1jit9Ow9x4PluhJ2jW2pEgutbP6Gh4aAOnVeCKDnWpy0TQ0Eqa7sN4kQk5oHo
	Tf+w==
X-Gm-Message-State: AFeK/H1NKoqRS7B3tq4H/AumnZOBtHq3gGsDkZXFold7RnKg7zpLWxbd89TdZp3GLJRLU3yXecQv3sCEygEqZA==
X-Received: by 10.223.154.149 with SMTP id a21mr26086944wrc.145.1490035329418; 
	Mon, 20 Mar 2017 11:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 20 Mar 2017 11:42:08 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703201126460.7124@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703200753460.9821@uk63952.mitel.com>
	<CALbNGRSQiaNCD4gjkxAO0FXY5Y7ZZmo0aQ9u6TZQ4uFusR2ugQ@mail.gmail.com>
	<CA+chaQeVXMSEXuCF7F2jRG4-TBzFWkGMWv=Gz=ksD6Z=tC4C1Q@mail.gmail.com>
	<alpine.LFD.2.20.1703201002240.20418@uk63952.mitel.com>
	<CA+chaQe7Rj2zH_E5gjO-BCrVUgT6DZD-Ohfp0f2n17z=bu2wgQ@mail.gmail.com>
	<alpine.LFD.2.20.1703201126460.7124@uk63952.mitel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Mar 2017 19:42:08 +0100
Message-ID: <CA+chaQdFkPjtUDEc4uhGWrMKi8iUW+S_Lp1W8Kxe2SVW9KEaJQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: blacklisted accel-ppp (under binutils-2.27) seems to compile under binutils-2.28
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
X-List-Received-Date: Mon, 20 Mar 2017 18:42:09 -0000
Content-Type: text/plain; charset=UTF-8

Yes, good enough for me to include the PNBLACKLIST removal in next bitbake
world run. thanks

On Mon, Mar 20, 2017 at 4:27 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Mon, 20 Mar 2017, Martin Jansa wrote:
>
> > Without "_pn-binutils".
>
>   so i rebuilt a core-image-minimal (for mpc8315e-rdb, don't ask)
> after setting:
>
>   DISTRO_FEATURES_append = " ld-is-gold"
>
> then rebuilt accel-ppp and it succeeded. is that considered an
> adequate test?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>


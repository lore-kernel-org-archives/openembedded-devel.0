Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 721557DC6B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 17:35:43 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id n68so2382335qka.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a13sJSVfh+gTOtUEHWmC84/tpVwwhKkxj0OKd3Rdxug=;
	b=aPkCRyqJzA9uD74kjdbmh1SUuPK3gNS7K5mOsLsM3BesQfjAPnKy7jJmVMQq/BGDm1
	NPQmbimBJW6GN8El+drgqsIwGteBbhXHSI0fnmyzj3ymMpsCaCizixWEDMVDPkkTMVH3
	eCTZyv4lh5E7YpnZsrTN6FPVPRr5Jk3bTPoUvdMDfYSCp2HQgFMHz8JVHDSRpo631GlN
	Mcel5MhBPtPGvPT2//QsM3NazU/F0NZcrP4d7Xy/klS7Hw2gd0APp2VHcChe4m+VGNBW
	xnssQ52zo/TIXtjTK7mUDgMrPLoXjAy5k1mQiLUtdIqfYDXG9V9TU97oD7yyypFV5+at
	Nq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a13sJSVfh+gTOtUEHWmC84/tpVwwhKkxj0OKd3Rdxug=;
	b=sHBQkLT/KV0kuFPyb+7vR926XPmkPPb8oib2jGQlB5piI8LXuG4uRhohKgyT5aHaQ2
	4Wt8FJEg1cDFocAdpfBUWkJPTTPEnA+ba0EBqVE6q4H9sTj5Gu82/sENYlwQBqpVibyQ
	KFRKoAAUGtWFK5jtXMNHgkznxVpL+3KzQYEbOaGuJtcngPD26fl8+M+rDS6qWOHftWi3
	ZX4lpu/sfYp8B4M5jweKVktmnufb1Yl94Bu7rFUcn7fnniQu5sBnc5thCIr6xfY1jZJA
	SONlLhAXBVkTFY96nx8sHKQR4QeMeMkLMz4mUel8AUMpokaKa78V1QC9cvQIBFaIySXv
	McWA==
X-Gm-Message-State: APjAAAWzaEriQ4qwj0skZc8At5UBGFzYPcUMtp+NV4eqK6EmfUB6URFM
	KRDzPf8rd8iamWXZiDgDgbXd8PoH0np3tHioewc=
X-Google-Smtp-Source: APXvYqzZIRmP0VRR7CWhtDTp5Z1rRflOopPUundGl9waMdKE5UAQs3+VUjhPGT37CNLvDetO5UVl4jKZkKtvM48XfL8=
X-Received: by 2002:a37:a849:: with SMTP id r70mr27646751qke.315.1556300144173;
	Fri, 26 Apr 2019 10:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
	<20190426052056.GB26023@localhost>
In-Reply-To: <20190426052056.GB26023@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Apr 2019 10:35:18 -0700
Message-ID: <CAMKF1sq3J1pjWp-sBijwi4VzGVAZWQCk8uznx0VbtODixTFY4A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Fri, 26 Apr 2019 17:35:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 25, 2019 at 10:21 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Apr 24, 2019 at 07:00:38PM +0000, Martin Jansa wrote:
> > * set COMPATIBLE_MACHINE to (^$) to prevent building it for any other
> >   architectures than armv7a and aarch64
> > * with new arm tune files it's easy to have armv7a in OVERRIDES even
> >   when there isn't armv7a in TUNE_FEATURES:
> >   meta/conf/machine/include/tune-cortexa9.inc:7
> >      "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '',d)}"
> >   in cases like this COMPATIBLE_MACHINE was satisfied thanks to the
> >   armv7a OVERRIDE, but then the anonymous python was failing with:
> >   ne10 was skipped: Incompatible with archs other than armv7 and aarch64
> >...
>
> How does this handle Cortex A9 SoCs without NEON support?

this is a valid concern although rare but this combination is out
there ( tegra2 )
and ne10 needs neon, so probably its better to check for neon in tune features
 than anything else first.


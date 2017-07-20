Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 159FE77E8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 01:38:06 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id w191so13628002wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 18:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xBPmZyNNAy0UXR2ofBjR8TJ6JEA/stsCUABGljNbmAg=;
	b=W02o1xC5NYLEs9dTuKTdtHnI0c+79kevUWb5ovJScdrvmmBil9DIhD1WCNUIrfKy7E
	pz5RlEbmHlr8JlKDFcZNKzMoXShty6K/Ou8GtL6R+dqCVazRPvZpr3Tbc/ZWwIlXmqab
	WWCczwa7rxb0keVEZzC2LO3q4N7JZpUVCitTeCTJdT6NbKaRfQ7fZvKSqkwX2igakp/D
	ixNLwCg/MHh0BgdZITfbwuZTxvdrdc5KaJS6ld4fU7ga2Kg9Slw6XedwVSovwgJJ1t6G
	jGIXcGaR1Brddd6qsYgnzvnoVykGAs/3z5t4A04h5Sw5+sBr3UIfVBS8V2/8z9CuGJ+l
	54eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xBPmZyNNAy0UXR2ofBjR8TJ6JEA/stsCUABGljNbmAg=;
	b=ZYikNYF+jPuiaK3tN7Jc2ljRNVVWGsHx46c3n9sWhjH1uJNMg8cJ13waGWPsC0d0FU
	OLZT39BucHHZwX7zWOCOGsuFJ4De4HkEzUAHHog5yDeOz2z3oLmh3j0d3vCz4hBuvKVe
	tbY2DQzBVam6pxeRjKDsOyhjws/kGvekow1PZipBgKgksoHk5POFc3ZERSyswupdn9jg
	mytVO07naJFI6FXicBtNU7QDHWjA/Jjlum2Whw/ZfrD3CMRlds0Wi2DcdGpe0dK6FM4o
	CjtTeFIyEf/yF3e6LCz8QRo6QiT1JkmFErhcVrHbYdPETif+hjrV9evDKh539zVdwXCx
	CkQg==
X-Gm-Message-State: AIVw111SomOOWjERcJu15lPC2ht2eXRjvUAG10gJuzNQ6nHpRF4/E9yt
	NcHSRmbFDNqADBOxclTlYV/TIn29VMrR
X-Received: by 10.80.217.75 with SMTP id u11mr1340938edj.250.1500514687661;
	Wed, 19 Jul 2017 18:38:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Wed, 19 Jul 2017 18:37:37 -0700 (PDT)
In-Reply-To: <4f5ed5b4-3ffe-78bc-e030-400a6b7794f4@ubiant.com>
References: <4f5ed5b4-3ffe-78bc-e030-400a6b7794f4@ubiant.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 21:37:37 -0400
Message-ID: <CAMKF1sr3OQKiwn1r_nxz26qQNjo104CNVEnyfX+MfJRP4OuFwg@mail.gmail.com>
To: Romain Bazile <romain.bazile@ubiant.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] Pip recipes PR
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
X-List-Received-Date: Thu, 20 Jul 2017 01:38:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 19, 2017 at 6:48 PM, Romain Bazile <romain.bazile@ubiant.com> wrote:
> Hello,
>
> I created a couple of meta-python recipes for pip packages that I want to
> share.
>
> Can I send a PR to this mailing-list with those?
>
> I assume one patch per recipe.
>

sure. These are guidelines to help you

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> Sincerely,
> --
> Romain Bazile
> Hardware R&D Engineer
> www.ubiant.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


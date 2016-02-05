Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A5DEC7716A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 22:54:31 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mw1so23852950igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 14:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8mQpX6uQgO9pPvQIMHEbKRVHGz7mlVkMwRqqoi7n8/g=;
	b=N8i9eaVPPIwdaidbWK9/plRRAOeMLz75K0GLhSQul65hj4GUQnj5rodEmaw7G6CD3n
	suXmunPBhQOyDaGQO9FVfTPg3ZfuC4sQnxL/Wo1mb0BXigq9r1Hos63Vu8zuPGPQl0rJ
	cVEwlm0+w3lKbiuW3TcCZcVylvYqiqXvr1WLfI3KkOtaT2FGgWq4+wKLrv18b9Bio5u8
	O7JNjZy9u0dgeAZFz9VCcipGgI2ruJ5GVgsHltJ6Lc//LICOvAfQzaPbVCXk6q0ZgEMU
	Z3WqqN1f0u5x/ESyD7x2jgTz/ddguBpqebecwUypJCYhgJ7gur2Lp1rdZo6RPpjyoKSY
	75mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=8mQpX6uQgO9pPvQIMHEbKRVHGz7mlVkMwRqqoi7n8/g=;
	b=JqXYg122ArLEumV9q5Z2x/D2gWy0V6aH9+66F5rJanWIjGq9FSE5qj1b+w+ibTfS81
	QHV50caS6KIyYpfWeqF8EbAaewnB+YthAycqb0LukkcLlyT3FbRI/RC4F13Lcdt8uyxZ
	PdXRUB56N8gXbjoMdsQX9rMSFG/gwTiRU9yyRhUaZVrPgnXCrfpfQwXHhraTM0EM1Wjg
	I3ZCRTYDlgjXl27Ai4gALRdOAzrLNX8ZeSi4/lneoaY2v8H5LDhydrv07kzcMX7lcksE
	0psUe5jUCaUW2+9DZEzBWdtt7p8AQ8bJa0nAZG53oveZWb0Cei083i9H7WDuG5U3umnD
	vKag==
X-Gm-Message-State: AG10YORXDd0LpC+FiKTcIB/OrRHI2vlHmPK8yljeQEnQRyOUUDoTz7WW7ffe8tn5BkOauEh9sp1ZTjoRnj3g6dHb
X-Received: by 10.50.126.8 with SMTP id mu8mr17254572igb.52.1454712872433;
	Fri, 05 Feb 2016 14:54:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 5 Feb 2016 14:54:13 -0800 (PST)
In-Reply-To: <CAMKF1srx2eRWua1d1B=VE00-8Exa+k0NGsAPmiKTN6fOgUipUg@mail.gmail.com>
References: <1454705380-22071-1-git-send-email-ross.burton@intel.com>
	<CAMKF1srx2eRWua1d1B=VE00-8Exa+k0NGsAPmiKTN6fOgUipUg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Feb 2016 22:54:13 +0000
Message-ID: <CAJTo0LYixRNEfrUbccUke=RDcoaQ2k+BcyDJ9x_crPJg3f_h3g@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] gtk-theme-torturer: add
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
X-List-Received-Date: Fri, 05 Feb 2016 22:54:32 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2016 at 20:51, Khem Raj <raj.khem@gmail.com> wrote:

> may be recipes-benchmarks in meta-oe is better place for it ?
>

It's a benchmark that's incredibly focused on GTK+2 theme performance so
I'm not sure that's the best place for it.  To be honest if I were a
meta-oe maintainer, I'd reject this patch and let the recipe disappear into
the ether.

Ross


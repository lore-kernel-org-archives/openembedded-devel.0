Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 404A86011B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 12:58:50 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id d78so470753qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q10w0vZUfXRGJu5/iOUFKKNGPR1fYvOG8D+2taPFg2I=;
	b=FUA65CmnM6APQOWzsWjpuQFmDNtjNsYu6/YZKGU43ukI0Nblm3Ll+/dgRfXFr1tx40
	lJdCKYr4pd1Athx9Gh3SFGoCbwvCiEiW1rXPjOY6ybCZ9au1u6B1ZYPl2FqkZV7ouHeL
	jRUiT24mb9auknvERzr1ETvItbsrfwn8/hj437JdSyq+sMJInKMf3BFGou7yrUGz/9qo
	1rLLHrBe2O7RMusRlnSAVZwkAJ9yZcK99FHKpb0xcIZEpzQ9Gy5cZAdxN3Zc+6A1KVE7
	31ptyW0iCircvfNFYL3tbuJ91QY5oCIFKYGkkTxXbL8fDCMcHpsnait/wwIOgxAI7aU6
	sCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q10w0vZUfXRGJu5/iOUFKKNGPR1fYvOG8D+2taPFg2I=;
	b=baBB8AtkDpq/tCQZy6YX33gsMRgikuzTbzNTd3UFNPPGXU/7wX6ROviUEJ3SvsTcKI
	nvEjLavnVHyjr5nb+XOYSkRiUTaNU8nD1fL32uOXJbAsXzlG7OYuqCWB/sd9i85jzmXr
	R1FeIffSNZ1lEY+Gdvxg0FPUkui8BZPBCRua7+OhikhmsDCe6v1QfrpSZq04jCV9OJd1
	JDxzp6NuQp9R8xQRQ1ZFWlWHLVJw69N+rqYXKYJzZwyo8eOPreLX73cuFmt0/O3Orkka
	+lqmMLUFvZy6Bo7PWhHGhcqsGjqTq5n28zFxb4seV9mTiqEALCD2PMVDemEOuNcWBKpM
	yCtg==
X-Gm-Message-State: AKS2vOxelMnpF3pg2rp8m00xd2XyQQ1jVEv3WYA+0m9zXzFQUJEVF12I
	9U51QCr8O3YXByze6zps2fPIdDyst1YO
X-Received: by 10.55.101.151 with SMTP id z145mr54761qkb.127.1498481932104;
	Mon, 26 Jun 2017 05:58:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 26 Jun 2017 05:58:31 -0700 (PDT)
In-Reply-To: <20170608173414.29852-2-acfoltzer@galois.com>
References: <a96952a133614ffc9779d8a7ce912f8e@XBOX02.axis.com>
	<20170608173414.29852-1-acfoltzer@galois.com>
	<20170608173414.29852-2-acfoltzer@galois.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Jun 2017 13:58:31 +0100
Message-ID: <CAJTo0LZEH_Bez0RKRFLnt4ztsy1nX8BVpNy7WHmVrA1=LN+bjA@mail.gmail.com>
To: "Adam C. Foltzer" <acfoltzer@galois.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meson: add LDFLAGS to bbclass C/C++ link arguments
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
X-List-Received-Date: Mon, 26 Jun 2017 12:58:52 -0000
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 18:34, Adam C. Foltzer <acfoltzer@galois.com> wrote:

> -cpu = '${TARGET_ARCH}'
> +cpu = '${TUNE_PKGARCH}'
>

This line was retracted in a later mail but the patch was merged.


>  SRC_URI = " \
>      git://github.com/mesonbuild/meson.git \
> -    file://native_bindir.patch \
>  "
>

Was this patch meant to be removed?  If so the file needs to be removed too.

Ross


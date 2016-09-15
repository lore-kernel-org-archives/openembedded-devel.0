Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 01472771F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 16:27:56 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id n143so84331860ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=LDdsRkT/iCepmDjvSFLsb4a1cA1huZMmKYm/1d2+0Ww=;
	b=O2jo4kkbLofSXHbE3r0nztHOWEMeOO8Pi1X00y6DsaUI6DfsNuqklTDST8HnUsSwaO
	lqZFJANQdJRV2VOTx9V2q1z5wsJWIKbfleKhKiSgOFRCHUWjS+4bnMqGwlsQ5baQV9C5
	D7j5Z/AwjPir9qCvfA2tLdyGkYmSvjpd6gJvZrxam/yXTUoWTPqcpGNSAQkkmz1jRdqQ
	updg+vZUu+4+TrCRDV8HU/l/fdljwA8nSdVmbTaOwh4ht68KMCPx2J5e4NhueNeBE51u
	7vXRAW18UmaR/BnGidBdRLJtfw8k5UcDThwFp1BhTMyE/Mn02b1ojZucOAsVyCW1OZeF
	BHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=LDdsRkT/iCepmDjvSFLsb4a1cA1huZMmKYm/1d2+0Ww=;
	b=TWwXd/j0u6rCtKw1LLTZfRvqh65c5x+G9NXxJHq4aEXfg+e1B9CZhUorga1RPeu8Ua
	RpiwnMd1U+Eat5TmWz0kAVtqC264TzvQ7UXFPoTk0ZPr9t6Mzmlz8XPTpArrXzd48lkO
	7weiKDgbVmo9j8/zUu2vyIZYYjhpdTof6ePWukBlkmaV9gmxA2koygpViepZJhpqEv8i
	CyY9d0JK8/H3nChLGT1zWQVMI3M30wFH0iSzTA9w00oEA4uGRqCyaGTmxea/jigfcv0T
	PvtNz7JaNHWX/Gj6p7ny4k8SClko8GvhBA8UGLE9wPYbCHom5uB0kxmEjfvv0p2vYiyu
	AmKg==
X-Gm-Message-State: AE9vXwPEjkaFfaAJfMTehckuKjBTjOVQT+OoW0Qko4eyM/iqcSH5WN+5jtmKo7r0NnJGY2uYKXAUk6pDbt8OpEaj
X-Received: by 10.107.53.206 with SMTP id k75mr20032265ioo.195.1473956876699; 
	Thu, 15 Sep 2016 09:27:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Thu, 15 Sep 2016 09:27:36 -0700 (PDT)
In-Reply-To: <CAPybu_2uCKcpvtba7Yrrs3trmSQ13w6Q9o+VsEXXFHJJO-EyUQ@mail.gmail.com>
References: <CAPybu_2CDc4eD=vRuEL7TOL2eb0mN=ygDrx0jX8WxmLqqAYnnw@mail.gmail.com>
	<CAJTo0LY7k+XDcwumMzfZLzOj_iOeKG_svL=QK_drDv_hHdbXhA@mail.gmail.com>
	<CAPybu_2uCKcpvtba7Yrrs3trmSQ13w6Q9o+VsEXXFHJJO-EyUQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Sep 2016 17:27:36 +0100
Message-ID: <CAJTo0LYM0OX4A3512Q1Y7TnmdWuj7ROxGYB+Drr2Dh5T4-urGA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: update_font_cache intercept: qemu: uncaught target signal 4 (Illegal instruction)
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
X-List-Received-Date: Thu, 15 Sep 2016 16:28:02 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2016 at 09:34, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> MACHINE is qt5022, which is:
>
> x86_64 + -march=btver1 -mtune=btver1
>

So the compiler is probably using instructions that qemu doesn't recognise.

If qemu can pretend to be that machine then you can pass the relevant
options to qemu in your BSP, see the QEMU_EXTRAOPTIONS variable assignments
in e.g. tune-corei7.inc.  If qemu can't execute target code then you can
either ignore the messages or extend qemu.bbclass so that it is possible to
say "qemu doesn't work" in a BSP.

Ross


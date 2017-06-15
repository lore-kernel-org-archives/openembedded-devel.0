Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 717FD78077
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 11:41:02 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w1so16416691qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 04:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dQvEL1fXW9cBm6HhNWayZvhQR5EXnbCCS7Ippftqujs=;
	b=Kci+X6OL5SGGwUoTKHgMZOep7iDNyTPi9EvBUhgft8AcQm4ZAfEuXxvrHS8rkO0ulN
	Ffwh4ZecZDj+TB0vSR8RaGAC8zHTX+mYv32isxUB95H3KiLXrYWR6m2IrW6MLzpgXUTj
	k+5kDIplNM6MEEjOcCQgvCkIQC/ygAkx/hs/tmxbt8quNzC0jGJ1dUnxj2omx3T/1F+g
	+RhGr73NSZzoHsAGJuTNIb6D5uKws1WJbi+3Zk4Tmoi67FR/1WZT1EWsPaV7sAOo3BoH
	A9OlYrw5kRKRqyBSpJsjluZ4rNWSH8eqOYwPcv3XDoVo4tEtXJ/E9ddkdYwJicoTI4Ow
	JPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dQvEL1fXW9cBm6HhNWayZvhQR5EXnbCCS7Ippftqujs=;
	b=WBBFy1ThWQfcG/O2rASjxpzv7OhFV5Heu7DNMOVNZKZqJtbMFz7fBL64e/p4bzVj8q
	y7UTMVCiroAzxJsNDgnEY8G7y05pD0qBsEs1F/PeNyRqZqqrfzGZapDlkeLC9qK4OKCS
	tUBsud9NhJtHAmIKAKARhTEdpWPdQH4N/a1vvAfPF8T8cPKnm8FB8/bNRvcqq/V7CqaN
	QZPxbQbvrVaxMeRNHAFRYubP/Isb7dH3oKbtzRS79bB0AWPHnfPeUn8ZpxQpGkhkh85l
	ZiJa/Jl20Cw5/DV/HwntbF3ZwRjVG1fGpMk3ZSPKZfXBrycZI9P81biNjP18G6o8k9bb
	gckA==
X-Gm-Message-State: AKS2vOy98VVPEIC5CaIauOOap+hXEgU3qUbpNkJuvByowWn65vHpNJPK
	HeUEMK3d4MRXISnG0EHYm3oC2+PvP9QZ
X-Received: by 10.55.100.130 with SMTP id y124mr6022942qkb.54.1497526863280;
	Thu, 15 Jun 2017 04:41:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 04:40:42 -0700 (PDT)
In-Reply-To: <88d795d0702cfafe40b7a821c2d09df76b6f3dc0.1497428466.git.jackie.huang@windriver.com>
References: <cover.1497428466.git.jackie.huang@windriver.com>
	<88d795d0702cfafe40b7a821c2d09df76b6f3dc0.1497428466.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 12:40:42 +0100
Message-ID: <CAJTo0LYda7e5GHATvCt=rcr44_jj+mZww51OQfCLa9nxLOM+zw@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1 v2] microcode-ctl: add new recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 11:41:02 -0000
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 02:36, <jackie.huang@windriver.com> wrote:

> The microcode_ctl utility is a companion to the
> IA32 microcode driver.
>

Wouldn't it make sense for this to be in meta-intel, alongside the
microcode? Also what's the difference between this and iucode-tool, which
is already in meta-intel?

Ross


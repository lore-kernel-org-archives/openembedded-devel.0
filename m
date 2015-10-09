Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC937391A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 15:49:54 +0000 (UTC)
Received: by iofh134 with SMTP id h134so95295158iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=3f5hVHkSP8ydyZR/+Qzig1FEtDFvCk1GYzzEfd6uN4I=;
	b=v11UGn3OcmAxIZKnWa0mfUJ2Mwjkxu8MuX3pNJiPmSRuaVxvnG04kTmsIMloqCTEzS
	Nx010tm/0dgvW5RwXwz0HgjINTGRRCS6XGilY8BqHTTpR1cbd3JCak5eZc8HQ6SuVYce
	oDLSmhCFKB+GBsoAsio6kXTlwvVB61pUxEKIgvZ/pahcLjz51HSpqlTo9WNeB9lqTs9d
	6SjzkVZFgiCDPCPmQoOLp5aI5ibUOMzjfeaVPn2jXN9QtcBEaa1ozMPeiZsruj8o6S6j
	XNiyznmt2IRwhH2Wvg5RDmo1XqtMHOmS9Un4vyXxGHACrFp2eSMdtqC7ZJk3noEDtHXZ
	Vuvw==
X-Received: by 10.107.34.149 with SMTP id i143mr17591257ioi.195.1444405794939; 
	Fri, 09 Oct 2015 08:49:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 9 Oct 2015 08:49:25 -0700 (PDT)
In-Reply-To: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
References: <CAAzKXnjdUYmLrXX4bCT9wmcH9nc3c1OL7eRsdTXXD-T70RDZmA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Oct 2015 08:49:25 -0700
Message-ID: <CAMKF1soPz_p6ZK9yQTiabh9vwnb9vcc3YbJD3AoSr0x+W52Nrg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Recipes draft for Chromium V45 and V47
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 15:49:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 4:31 AM, Zoltan Kuscsik
<zoltan.kuscsik@linaro.org> wrote:
> Hi,
>
> I'm working on updating the Chromium recipes to version 45.
>
> So far it is tested on Wayland builds (ARM 32bit and ARM 64bit):
>
> https://github.com/linaro-home/meta-browser
>
> It still needs some cleanup before upstream, comments are welcome.

xkbcommon change should go into oe-core
tc_malloc disabled, should become a PACKAGECONFIG, its a perf tool
anyway so disabling it is ok.

ozone and VAAPI should also become packageconfigs

fix_64_bit_builds.patch assumes gcc, I did not like it for that
reason, it could have been done in compiler independent way

> Br,
>
> Zoltan
>
> --
> Zoltan Kuscsik
>
> Senior Software Developer, Linaro Digital Home Group
> email: zoltan.kuscsik@linaro.org
> IRC: zoli_ on irc.linaro.org
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


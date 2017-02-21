Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5ED72F8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:15:33 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id r136so83311836vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=1Kzqo32LaKeFqYq/NEswz2UvWWiVQv4sMNkG9o724ok=;
	b=LG39kS4OgE/2PflT9gpxTxDsEmGwfuGar1cCv8nF4XmOWTOUsUjj3MgAhdL3KoTXBy
	3upYX9fVP79yMcnACczvzuaHP2my5DRS1cTisVr8NNUv35we/w4QHuLi9gCZMozYcKR5
	hVsRe857zfT/mPGsh0sPZ4iNxcVY65Kf38ObwHDkIYxOniuL6gqkiMbVwhpjdwwEEJoA
	Osq9EODLCMyHEqYRHTE7Mz9CFLmObAJGWPYb1erLm/eQP6+S7McHKJY/JsGWLfvSMiSp
	Ay0QotA8JKo6dNrk/YK+GhsA0EtkADc0Iy7J1x6cHqdc/YeMRLxtjLkQczFANqoussBz
	KrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=1Kzqo32LaKeFqYq/NEswz2UvWWiVQv4sMNkG9o724ok=;
	b=jmw3trOuE+69zLI4MjkJ53ARTIibY4JtTSIa2nJ2EKx2XArfnYq/Zwbji8Tov7ZakQ
	ptSHrCaNJaYwIForXnDSsBbSWHsLyyNIaawke9PxpH14YCTvohrzAF3EL6MzwH5HoWOU
	0MMt2wHcWModHA8on85ZTDKx30T8vJWD4DJVIXKUNZkPlYKGFSIT4nRR9SF9s9/BlaLR
	plaqFHoUe8/8BVxUu/oM8dPNjatqn+kzQ3W64pstZMQ5kNQKyIknb+w+KmX9O+ACb0RV
	h04glcMY91VGH6AhvYwPcQGrzXVP2nAKM22iiOPi+RKsaNZqexmjS/f4TDrX3x60tyKL
	Gr1w==
X-Gm-Message-State: AMke39mozDZZwwjFvVgzB7/p3LJO9RCEgAxtNjSCyYsvLgXm4D4JV8fZn4wR7AjiYEECGw4UHu85aPy+dyWaDg==
X-Received: by 10.31.197.196 with SMTP id v187mr13120610vkf.84.1487697334304; 
	Tue, 21 Feb 2017 09:15:34 -0800 (PST)
MIME-Version: 1.0
References: <21359dca-07af-b556-a589-a6a81ce65260@embed.me.uk>
	<48e918a7-edf9-5e9b-048e-96b98fc5f579@embed.me.uk>
In-Reply-To: <48e918a7-edf9-5e9b-048e-96b98fc5f579@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2017 17:15:23 +0000
Message-ID: <CAMKF1soEFbr0cD2Nryuvg-pVPyZRpo9z0_yfbngotZi0JeVf5w@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>, openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-clang] target triple issue
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
X-List-Received-Date: Tue, 21 Feb 2017 17:15:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2017 at 4:34 AM Jack Mitchell <ml@embed.me.uk> wrote:

> On 20/02/17 17:38, Jack Mitchell wrote:
> > I'm trying to install clang to my aarch64 target and receiving this
> > error when attempting to compile
> >
> > test.c:1:1: warning: type specifier missing, defaults to 'int'
> > [-Wimplicit-int]
> > main() {
> > ^
> > error: unable to create target: 'No available targets are compatible
> > with this triple.'
> > 1 warning and 1 error generated.
> >
> > The version of clang built is as follows:
> >
> > clang version 4.0.0 (git://github.com/llvm-mirror/clang.git
> > ee02028a97bfbce4d63787dd05366fafdda445c5)
> > (git://github.com/llvm-mirror/llvm.git
> > 6af4d1ac2acfc8c22db959f2b7b11d68688b2425)
> > Target: x86_64-unknown-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/bin
> >
> > Is it wrong that the target is x86_64-unknown-linux-gnu? Should it not
> > be something aarch64 related? The configure log seems to have passed the
> > right values
> >
> > 201 -- Native target architecture is AArch64
> >
> > ...
> >
> > 495 -- Constructing LLVMBuild project information
> > 496 -- Targeting AArch64
> >
> > Any ideas, would any of the logs be useful?
> >
> > Regards,
> > Jack.
>
> Turns out I just needed to specify a target, seems odd though as
> shouldn't the default target be the one it was built for?


Yes that is better I think the problem is the fact we do a cross build
default target needs to be taught explicitly otherwise it defaults to build
host

I will try to look into it sometimes later this week or next

>
>
> clang -target arm64 test.c
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


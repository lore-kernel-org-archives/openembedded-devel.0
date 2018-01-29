Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id A59987880B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:40:27 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id n206so6723033itg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 04:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3p46nlh7pH7Q6aYI2YOIR6Oynv+oJ0QPz5n9frc1kjs=;
	b=C06XfphN1hhRxVb4U7/YDb2TWmqtTJ2MUFbYxS0RbTarRlV6BLbU65yniJP/3kwxTY
	RPy1zcVTE6deUFN3K9UyolyybqfcTUMESok6jsH/0YCjj6JL5XabIzt0B5mItMxXdDED
	rNZ/LezPvxpdFPgTyB5qTQRSBw3Yn12axaRlvKkjljGUWQd0NbpyFYSv2+NpEvJI70YJ
	+5nBPPxb8FFAkXiqCHOVX26X4dBnUT40gq4e1xV0E7uJfuegAjZS1tVGjaMGBcckQq3/
	9xkCR3mFszSxiJMbI81N2RTWgc0PgnqVAU0CfPmPXEEScIcYNAl/M5p/U4VGPNQ76FLp
	RaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3p46nlh7pH7Q6aYI2YOIR6Oynv+oJ0QPz5n9frc1kjs=;
	b=B5EF3F+T9Fo8BNt3kTorDTrho+Xcr/fxwbH/cg8S+LYLeIpWxIYO87QXia1Iwi9xJj
	wz+apAog5s+OO9MKdDdhG8NtgPe+UbkIQK5dvcZ9i1n9LEQmwgCA0NrW+G/dtSJlbYYr
	kjJJMKaGxofcGpn+6cypjw2kmoiXwCble2puhYNsEq27qDhTB+W3YZLOVCtCOnU/4TZl
	83Q/op6HN1TvBPo694VY5GUifLoHS/xgcCvgOmZbwl9N+4Wchcv4P1/pOwXPGhf6F8tU
	JdtVqlt+wiGJE10tGnnI2w3ORHu+PJbtyLz10dJ37JIshsb8/J+jwOYotgo5f4Ca8qLU
	RDnQ==
X-Gm-Message-State: AKwxyteDsMc7nMkqD9djujTfrc/4NBcuZNYvx42VMDUQXC6PNo0eTWp9
	yaBHZrcnpQ4a242wxJe75XJ1jiJxKd05CLlNWy1vzQ==
X-Google-Smtp-Source: AH8x225a1r+h80EjGFeZguvSzQ/UMmsasGjImycP6dT4dljihvfNqwVAnEgcNyzbZ4FkocJjhtQQfXtgMho7MMIKH1U=
X-Received: by 10.36.86.20 with SMTP id o20mr27288944itb.53.1517229628817;
	Mon, 29 Jan 2018 04:40:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 04:40:08 -0800 (PST)
In-Reply-To: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
References: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 12:40:08 +0000
Message-ID: <CAJTo0Lbnb1PSJiP4v99mUt-uAFz+KeAxjPf4j3jdL=iBs2USGQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] Glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 12:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

The yocto autobuilder was idle so I fired it, fingers crossed :)

On 27 January 2018 at 21:44, Khem Raj <raj.khem@gmail.com> wrote:

> Hi All
>
> glibc 2.27 is releasing soon in few weeks. I have put together the recipes
> for upgrade, along with fixes for some of packages that I ran into here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?
> h=kraj/glibc-2.27
>
> This has gotten limited testing. I plan to put the package fixes as we
> plough through. Please test this out in your setups and report problems or
> fixes ( preferred ) to get various packages working on 2.27 release
>
> Thanks
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


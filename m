Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id C839960616
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 20:49:15 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id n1so200988150vkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 12:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=D1tuah6JjEU7Wk56Dn4AiCKWpXhUsg1bAhr9+0mhy7M=;
	b=hMKDGMIpaNuEzAzmWi87t0nbu+5AyJ9dqRXO1x/MeQBihEVMRWWQx7kkGJmkiOh25c
	fVyzW6aXfBFNCwNVH/HyYNj0qRfLm4L5J9bXY6EJ6JyjyiqAPkTYxvAlFw4WR6Tzye07
	t1OJOJLs5ohhdjEy/dKKEd+fWE+2fsScnjxKQLkRrfleW7yhUD8kmX4bkZBlL/wPCp/z
	grK2ZwZKlYa6WtyenOOkAUoqcNFEcpEOUfZh7y45NSKZSbmofSzEhonrgVCeD901HseZ
	HBqQRvPIaDvgCTEs4J2GZ6IhBQzk80dAWFVQEeTJD3il2FPtGp4aJTawuI+oR6YWD5P8
	F15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=D1tuah6JjEU7Wk56Dn4AiCKWpXhUsg1bAhr9+0mhy7M=;
	b=SjLV/hjziSpllmIGVkCNlcTwrI2nvUXR6EiGgfiU/J1KtaY2I1mrs7nLuj5nsnifZi
	MOsuRlAlRi7KaY28fG4XpoHnf+XwaoEA5uvrll/e4oS/E8Rsqqa1M8Oo3jymLJSTCRtV
	9nof+0b2H+6jyHsp51FJAZ6ES+MIRf1AOvtzinqUSHuhwUxXMsgUas1gepWza0tBOfLG
	3NX9OTSwNIi20h7uQUh42nlIdk9Ea5dg8rL05pYE8s7dpweIm8Ax2Xi431ekzCzcqTNF
	7co7lumQtrNft7j6AgfG7fvTIe3ZiV09fG0J5Qa42yJKWucBv+i6ytuKJ7nIjTkdU7B0
	NQkw==
X-Gm-Message-State: ALoCoQlPY25alohrLHiRoAt47SlLcx/R0uVyNM04b+zVbklBphTaQyzv03Ol7AhdxpjkUj6nWJGh9Z6roYKVlJbG2HnPh1+tVw==
X-Received: by 10.31.162.20 with SMTP id l20mr20061668vke.137.1453236556429;
	Tue, 19 Jan 2016 12:49:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 19 Jan 2016 12:48:57 -0800 (PST)
In-Reply-To: <CADySD0EvwTFr-0hGLTJDGTVLyhEtju3Rgxj85R8Tv=etXnRPuw@mail.gmail.com>
References: <CADySD0EvwTFr-0hGLTJDGTVLyhEtju3Rgxj85R8Tv=etXnRPuw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 20 Jan 2016 09:48:57 +1300
Message-ID: <CADySD0EPvpk+zwvn0PKFChZPBev6xz-XOgbPx8W7mgNkwzsDxQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-toolchain-qt5 error on fido branch
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
X-List-Received-Date: Tue, 19 Jan 2016 20:49:17 -0000
Content-Type: text/plain; charset=UTF-8

Looks like the problem is because of partial inclusion of following patch:

http://patchwork.openembedded.org/patch/91807/

libgcov-dev has been removed from libgcc packages but
packagegroup-core-standalone-sdk-target still adds libgcov-dev to target

Requesting to remove libgov-dev from
packagegroup-core-standalone-sdk-target as suggested in the above patch to
fix toolchain build error.

thanks


On Tue, Jan 19, 2016 at 1:57 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:

> Hi,
>
> While building qt5 toolchain, I am getting this error :
>
> Collected errors:
>  * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-core-standalone-sdk-target:
>  *     libgcov-dev *
>  * opkg_install_cmd: Cannot install package
> packagegroup-core-standalone-sdk-target.
>
> ERROR: Function failed: do_populate_sdk
> ERROR: Logfile of failure stored in: /home/nws/yocto-fido-dev/oe-
> layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.65427
> ERROR: Task 8
> (/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
> meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'
>
> Complete log @ http://pastebin.com/CNuJk2i2
>
> I have tried removing previous build tmp/work but still get this error on
> fresh builds.
>
> thanks
>


Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 243C9733B3
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 14 Feb 2015 07:53:41 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id s11so17501566qcv.8
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 23:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N4mkZUifiLaefQIlK7kBjwXvDSJ8y4L9cQlTKRJ2430=;
	b=PzXesmYYBBpXXaOqOdu/7qDMuKumdPe85ZcAnJ4NoloyUWfsp+coom24mpwMYratHd
	u6mYt/C4oTsshtdwpxwCmebHPf+IDdsruGwoPX9n/zpJpZEZ0e9YEJ25kDXM5aMvlLnU
	mZEACozUyNf+KGUaKNGgAKdzQfMwMZyOpPPCyitZp+Sr2M+6T4gQHUaFV6GExFC3hFCZ
	J/tUPDEn9EFn2RSYBRJwDFOvRLPXKzerJ4fwntg3L344JWJNkWByrGkFgzCg2Z6K4Y0G
	GxDFjNZMP7gMssetsQOTTMyWa7IyagDmQLy/e2zO2OBUUKT0NQwNnV7sZ6HwnwTTau47
	yoQA==
X-Gm-Message-State: ALoCoQkYroO2/NKgbnWgmm47MwncY1XodxATWpjBx2jZnPjqJTFAkoaLe1Qz1gnurbs2suXoVi8v
X-Received: by 10.140.133.69 with SMTP id 66mr4249090qhf.17.1423900422440;
	Fri, 13 Feb 2015 23:53:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 23:53:22 -0800 (PST)
In-Reply-To: <CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Feb 2015 07:53:22 +0000
Message-ID: <CAJTo0LZDh+nk6_JBbE7HEzqa8YVtorBXPvXMw+ne_fVekSbymg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 14 Feb 2015 07:53:42 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 12 February 2015 at 07:35, Khem Raj <raj.khem@gmail.com> wrote:

> I have refreshed the branch to include the patch which moves the src
> uri to use the newly released glibc 2.21 branch
> and please run it via autobuilder ( top 5 commits )
>

I did a preliminary test on my local build machines (core-image-sato-sdk on
all arches), and valgrind fails with "unsupported version 2.21, Valgrind
requires glibc 2.2 - 2.19".

Ross


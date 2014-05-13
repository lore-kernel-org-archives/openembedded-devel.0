Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (unknown [209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9F9A605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 15:29:02 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id j15so521823qaq.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 08:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Od8iLWP2BpVQVBpUiCyQV3YynQC8OG9MW4lpODYYNf0=;
	b=ZdMpFE9dPsogrEYnqpgkmpmUeY5HSFD0dNBLWIlejuFDWfDlps2Hw78vTV9Py+O6dJ
	oXjj5vI6cU7Gr+GXfBFunUC1bZfCw/ncapSeQa9p6gD/RELwIK0COhhuzwK7LIbUKqsm
	zb3GkTs1990rOZnZrdJPfE4dNh/SZeVvgYvtScWNX4NTSLJvW+rXWqWH2KRsZ2DN/Vv8
	Lqsl5COxXEvTxXuVk3vmYuWrX6jLB8UvgCvEs5jL4R4ZnaHwQrt+7rbW1qYqemcu68lb
	xqHAjuey/c0QJKoASBBtS0n1O9xktVI9l82Koyj4UdlagxiWbb6bEX/g/sxHwVwjbfuf
	O6lQ==
X-Gm-Message-State: ALoCoQkPfOyVsbKTSSMVWU7sJ+Zim1kQ7NrDRaLpjZvv93YelKorU7x5CwedVCIMGmz2Qt6BEHyz
X-Received: by 10.140.25.37 with SMTP id 34mr21016490qgs.60.1399994942738;
	Tue, 13 May 2014 08:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Tue, 13 May 2014 08:28:42 -0700 (PDT)
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 May 2014 16:28:42 +0100
Message-ID: <CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Tue, 13 May 2014 15:29:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

As this is a major release of Mesa I'm expecting breakage somewhere...
 Can BSP maintainers please test these patches if their machines build
Mesa?  I'm expecting machines that use mesa-gl to break if they don't
just use the pure software drivers (so that's at least EMGD and if I
recall correctly some ARM drivers).

Ross

On 13 May 2014 15:59, Valentin Popa <valentin.popa@intel.com> wrote:
> mesa upgrade to 10.1.3
>
> The following changes since commit 40551859671a1c9da26cfdcda34da952c66ac8c2:
>
>   qemu/local.conf.sample: Add sdl PACKAGECONFIG (2014-05-13 08:02:04 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib vpopa/mesa
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=vpopa/mesa
>
> Valentin Popa (3):
>   dri3proto: add it to oe-core
>   libxshmfence: add it to oe-core
>   mesa: upgrade to 10.1.3
>
>  .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
>  meta/recipes-graphics/mesa/mesa.inc                | 35 +++++++++++++---------
>  .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
>  meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
>  meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb | 17 +++++++++++
>  meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 +++++++++
>  6 files changed, 56 insertions(+), 18 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence_1.1.bb
>  create mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


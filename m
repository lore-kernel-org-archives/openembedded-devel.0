Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 194A777D21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 03:57:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 15so8865902wmm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jul 2017 20:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pGtHAaAp8lK+CdWUng5vSdAxLboetR67R7zKk4XEWJA=;
	b=sf/a1HfxBHQT3R+NPOr+yT1Xp/tBaKFEPwgByeVfrXFwlmCszM1k5upZVLMqmtpiry
	O75+b9l6Redt4O2Z/IkTuls6y8bCQMgKuPg+QMBjjtuC18kgI99KP8Vy6TAuUn2k89w9
	f6VTgg88s9v8DVJ4qL7tKX/2qMs1eIOrHAmrFb/r2gjDNSmXDd6tgXVFp/nJjCLTx80N
	ak+78grMfTBx08xP9mYT9pAEN4rrDk4pNGISVhFz2fw+1BniSpmVSKAxDbr2n/v7IPXv
	SYPJRV+FCrlqeo67DrfbuGTDI3hsb/I3OTVVKxZcM1cMKvRyfvnMlEvxYF52tmJZK3BF
	/rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pGtHAaAp8lK+CdWUng5vSdAxLboetR67R7zKk4XEWJA=;
	b=Ut8sElW1/wDrzxUZIhMwy9vqKfZ9y2jcgig4UKjV4eZNb7eZ2DqV7ievfuNb/+d8d1
	5uPV2k8267+YxPSdkTgZFGiCMF4nAhtb48bHSf37suI5qq3oTnyDOFUVm9V0TtDW5ViW
	zDHrCNxEZGFX7AJGg7pRrNye1I1Q6f22yM5KphaUrRVaZzNcDcbbI4Q5CsdbTwqkckVq
	IqUCYFl6sG7h0Yq9PEsQglaOB2WRwbg7HxY8r/DbRbEn+ku7v+VU92aaPNM2+kPFoppN
	mMqRSkmjwMi2/yd4SP68+lkmZUqF8Msq/kDU1nPCn3G0a7Qyy4u47VV6J9ipxI6EDURL
	dxFw==
X-Gm-Message-State: AIVw113T2reiLbMHOJNMsvJWNvBf4EuRI9KQwvF+OL91JCjQ8/EfK2vk
	4mDUz67GTxejXHFdkxUNNsOw7UGhQA==
X-Received: by 10.80.171.165 with SMTP id u34mr14479734edc.99.1500263845708;
	Sun, 16 Jul 2017 20:57:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Sun, 16 Jul 2017 20:56:55 -0700 (PDT)
In-Reply-To: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
References: <1500259691-9782-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jul 2017 20:56:55 -0700
Message-ID: <CAMKF1sqsw6e9+pASanV6LcOdGUX8zJVufXLPu+VUugFs6sDg=A@mail.gmail.com>
To: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
Cc: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt][PATCH 0/9] Patch series for enabling Juci in Poky
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
X-List-Received-Date: Mon, 17 Jul 2017 03:57:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 16, 2017 at 7:48 PM, Stanley Phoong
<stanley.cheong.kwan.phoong@intel.com> wrote:
> This series of patches would help to enable Juci in Poky, it would
> compile and build an image without issues, with Juci website installed.
> Compatible with Poky master build.
>
> Stanley Cheong Kwan, Phoong (9):
>   Juci: fix missing openssl for Luci
>   Juci: added dependency of luajit
>   Juci: fixed gcc 7 issue
>   Juci: fix uglify-js not found
>   Juci: fix issue extraneous package and missing lessc
>   Juci: replace yui-compressor with minify
>   Juci: fix missing Juci website
>   Juci: update Juci git to latest
>   Juci: fix node_modules dependencies error

There is one issue I see, besides that please send a gh pull request as well
to ease the merging.

>
>  recipes-core/juci/juci/0002-fix-bootstrap.patch    |  15 +++
>  recipes-core/juci/juci/0003-fix-juci-compile.patch |  16 +++
>  recipes-core/juci/juci/0004-makefile-local.patch   |  44 +++++++++
>  recipes-core/juci/juci/0005-makefile-local.patch   |  47 +++++++++
>  .../juci/juci/0006-package-json-update.patch       | 108 +++++++++++++++++++++
>  recipes-core/juci/juci_git.bb                      |  22 ++++-
>  recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch  |  41 ++++++++
>  recipes-core/juci/jucid_git.bb                     |   3 +-
>  recipes-core/luci/luci_git.bb                      |   2 +-
>  9 files changed, 292 insertions(+), 6 deletions(-)
>  create mode 100644 recipes-core/juci/juci/0002-fix-bootstrap.patch
>  create mode 100644 recipes-core/juci/juci/0003-fix-juci-compile.patch
>  create mode 100644 recipes-core/juci/juci/0004-makefile-local.patch
>  create mode 100644 recipes-core/juci/juci/0005-makefile-local.patch
>  create mode 100644 recipes-core/juci/juci/0006-package-json-update.patch
>  create mode 100644 recipes-core/juci/jucid/0001-gcc7-fix-jucid.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


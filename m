Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B03C365DF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:13:25 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so2014854iec.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hNFNWX7OMbhLUCYMHGIBbKKLltKHJcPbtlvNLMdbajs=;
	b=gnIafSQVphzzsv0WsykPbmp/SANaLU5i8VDiCtTexWXG0QWyO5XKG6tsT46qy8ZhfD
	Lm5rmFzrPoGpJ7SP3qqUcoR9T3IcgEmxyt7DRVqp593BHcSO5msTQPGsqVKBMYbIkUCA
	kl6Rx98HQCsYx2m9FbaOT6LDPY3lX9a8YtzJzJpesRtjS43c9hCb112a42GQjjzOna/B
	OF/5Lg78gyKz/nRKP2tnoNkXbS/FMOa7c1tEVChcBYTxO/AELwVKuNJGgXAjUaTDj2io
	2oQMEVTPM4TGIJfPi9H98MhZPfAbcy0muDyvtcYh3wLsg8TwYcG0sQcCgNtBWufFXlgs
	N4zw==
MIME-Version: 1.0
X-Received: by 10.42.90.11 with SMTP id i11mr6916833icm.26.1397031206417; Wed,
	09 Apr 2014 01:13:26 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 01:13:26 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 01:13:26 -0700 (PDT)
In-Reply-To: <d548095ff29cf093d3e6df22594476873a34a67c.1397024315.git.jackie.huang@windriver.com>
References: <cover.1397024315.git.jackie.huang@windriver.com>
	<d548095ff29cf093d3e6df22594476873a34a67c.1397024315.git.jackie.huang@windriver.com>
Date: Wed, 9 Apr 2014 01:13:26 -0700
Message-ID: <CAMKF1srp7jUDqxShC9TWzocrpytAeG1uTamOcZ+n3KXsOJ33ig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/2] eject: Fix wrong return value
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
X-List-Received-Date: Wed, 09 Apr 2014 08:13:32 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 8, 2014 8:27 PM, <jackie.huang@windriver.com> wrote:
>
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Remove the unnecessary return(1) from function usage(), so that eject -h
> can return the right value.

this is an API change i wonder if other programs rely on the value being >0
>
> Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../eject/eject/eject-2.1.5-error-return.patch     |   10 ++++++++++
>  meta-oe/recipes-support/eject/eject_2.1.5.bb       |    4 +++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>  create mode 100644
meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
>
> diff --git
a/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> new file mode 100644
> index 0000000..2cce3c3
> --- /dev/null
> +++ b/meta-oe/recipes-support/eject/eject/eject-2.1.5-error-return.patch
> @@ -0,0 +1,10 @@
> +Upstream-Status: Pending
> +
> +--- eject/eject.c.orig 2013-09-11 18:08:36.000000000 +0800
> ++++ eject/eject.c      2013-09-11 18:09:05.000000000 +0800
> +@@ -207,7 +207,6 @@
> + "If omitted, name defaults to `%s'.\n"
> + "By default tries -r, -s, -f, and -q in order until success.\n"),
> +                       DEFAULTDEVICE);
> +-  exit(1);
> + }
> diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bbb/meta-oe/recipes-support/eject/
eject_2.1.5.bb
> index 98319a3..c47c653 100644
> --- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
> +++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
> @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>
>  inherit autotools gettext update-alternatives
>
> -SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz"
> +SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
> +           file://eject-2.1.5-error-return.patch \
> +"
>
>  SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
>  SRC_URI[sha256sum] =
"ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e2ffe55"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


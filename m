Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 195A8717F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 04:28:58 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so6881836wgh.31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ehEj36HKMUnI2jhfDahbsGBXcRfZEVHH2elQRXNjidE=;
	b=F2je3x8LubGZNG9fn/mwU37rYecVZam2G83kB6QYi9bkfheHa8s+IjHH64qyt0Am19
	5b1mWoKOxvxBIKnigDHx2T24HfLadgsJ+UVafI9MNI7YdVsFMuOMWFzBEoeAprZZy+ku
	aYQlYZhW/Kestrm7W+ZDukp1vZuu3G0P1yzL6tbHdRS8YeNZRsleLl4CWIAprVXhbVOM
	EQ+Ruf8WYSFtiLtS09wrtV+vDMCrTWBSnN8PkUuMRzAfJVoU9ZgypMmzcfKv3QCUTZXK
	R6+/zkrnFSyPv7HXtVLqEwHzOAIZllE8dRDX8qiokdQzsLGP+tVeI2K3w7b52ql1o9cT
	j2sA==
MIME-Version: 1.0
X-Received: by 10.194.120.37 with SMTP id kz5mr1471301wjb.107.1412656139244;
	Mon, 06 Oct 2014 21:28:59 -0700 (PDT)
Received: by 10.194.82.103 with HTTP; Mon, 6 Oct 2014 21:28:59 -0700 (PDT)
In-Reply-To: <1412644341-15169-3-git-send-email-Martin.Jansa@gmail.com>
References: <1412644341-15169-1-git-send-email-Martin.Jansa@gmail.com>
	<1412644341-15169-3-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 21:28:59 -0700
Message-ID: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-core][RFC][PATCH 3/3] modphp: blacklist because of conflict with php
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
X-List-Received-Date: Tue, 07 Oct 2014 04:29:01 -0000
Content-Type: text/plain; charset=UTF-8

This one should blacklist xdebug as well, because xdebug depends on modphp.

On Mon, Oct 6, 2014 at 6:12 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-webserver/recipes-php/modphp/modphp5.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> b/meta-webserver/recipes-php/modphp/modphp5.inc
> index 6932429..8707950 100644
> --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> @@ -14,6 +14,9 @@ S = "${WORKDIR}/php-${PV}"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
>
> +PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
> +# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
> +
>  inherit autotools
>
>  CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED
> -I${STAGING_INCDIR}/apache2"
> --
> 2.1.1
>
>


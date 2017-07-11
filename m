Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE2D377E24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:01:20 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id x23so1599600wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=76iVNqrBjjncQYhj2hTTQQXQEym1G8opwEXD0i7Ckn0=;
	b=M8e0XupXECm3NwGL1UfJ0P/C5R0AH+2beIpp0B3TROq3vwpTYOC/GnFOQY7HMfmf19
	ae1PMxigZ68RYosp5wPdQ/HtRURi8JZzVCHrxmC5zEzDX0qCSl+DB4gZoWxMzfZeL4N2
	C0bNLUmKVqLGAeuvQILEIk91CdRKh5s6dU8pMsZENSYlkyDIEXKSlIPF3HMCoWiVwVPi
	bWDx9PgCa0e1zVZEKPoqvfSh/XHPVpkTb9xJuCLdqpWqUkV4oS5wLcaUsEhOP+05k0qG
	LRaYFfBGXHFFNI/wK64t1gKfdBinKwa5Y707gqFdjPhi7GnMVuPk6uC9AcBkcnOJ32T/
	/PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=76iVNqrBjjncQYhj2hTTQQXQEym1G8opwEXD0i7Ckn0=;
	b=CkO0ly4YSZdiK4ZEuzU6YSXPySxa0aCIXZCvegsrZxkqojx2Bu6N5n8V+vpsV4qzFE
	ddOqh8kgelIWPrHYgSyPvJIFwcQoWSr9DpF55Crv3kHgcPMFHS+9FgwazcKx5px3Z/OU
	w0MxrqcGpCi54Y9DBvfw/dwc4OLkQDLZBSEiARrbEQ+EeypEqIn91PmTcVFhNqRKrGOo
	rca2+NX7A2N/HS0/OnR63mJDkZvcBP4fjDiZ7GyBPTqecLrXY7VoCzQ1RtbZ5wAC7Nll
	BWMOpfUbjKnYphALcOE/4F2TFUy+2rFvZaOKJN6rUKQ8Si9XCq7ghep0TXGaI4+pBb+a
	wX8Q==
X-Gm-Message-State: AIVw112TayHiu1kT5m36qTVY/cFNFQc5kbH5CpVvQi8+h6A3y0/uzt5t
	r54LOx7jvsK4Ew0gI+LE1Szmz4M3NA==
X-Received: by 10.80.164.185 with SMTP id w54mr3469865edb.76.1499796079049;
	Tue, 11 Jul 2017 11:01:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Tue, 11 Jul 2017 11:00:48 -0700 (PDT)
In-Reply-To: <20170711085922.21020-1-Martin.Jansa@gmail.com>
References: <20170711085922.21020-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jul 2017 11:00:48 -0700
Message-ID: <CAMKF1sovEMpmpQaSBgJyP9sXj2FANYLeHuZLdju7deR_ccJoyw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-multimedia] kodi: Fix build on arm
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
X-List-Received-Date: Tue, 11 Jul 2017 18:01:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 11, 2017 at 1:59 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
> index 0b39116a1..5a9fa9801 100644
> --- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
> +++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
> @@ -134,6 +134,7 @@ BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
>  LDFLAGS_append_mips = " -latomic"
>  LDFLAGS_append_mipsel = " -latomic"
>  LDFLAGS_append_powerpc = " -latomic"
> +LDFLAGS_append_arm = " -latomic"

Perhaps it should just cover arm < armv6

>
>  EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
>
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


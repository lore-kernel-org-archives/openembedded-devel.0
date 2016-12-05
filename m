Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 30C29601F2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:09:09 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b14so225357021lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CB10GnggjlF1dxS92V7/cdX7Mn6t7xa6nCApSu48890=;
	b=k7OE6mz0TougHNk9Rwdpy/TRc/up2FQpQ/diBEyzPtjjUNzPFdl7sZEYbDdEFQDTTR
	W04jY6bF6xBJ8hefEzuooZ2RWPnw/n8kcxWitNDFyZKuMk8G+r6rNNWjCPaIBsECyD9P
	NWErLEkF2bk3doRD1K0bDFg5YCq1IA/NE3FItrKOqcas8QEELXa5sR/pNGBw9l890f9u
	dsmvNk3/fRIALW5KiLf7juyn/7eel4d8FgcJbH4W8kA69no/+uHwFLuhzzotm7LgUuWK
	2EitnHTo8va/VUKE0zcii5GDd8phMyxSANEQeyQMWSGFe1pwjzdEmcZKKsu7qNxEgRnF
	e3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CB10GnggjlF1dxS92V7/cdX7Mn6t7xa6nCApSu48890=;
	b=AhVN8WoRGphkNr2SDwpo13FJpRMePbrz385h2zfO5WCR6IgP0x+7NMJuV6UEV7l13K
	olH2m7IRcfFM3ChM4AoTv6+9K1NibYuewpxTkHVhYKEGHeoHLcTObqovFufICcff0OR1
	b8hXUGc2k0V2X83Ivo5A9Ytpt+3+6PASGUnEPuXubgN689yPIYk3ZRYXOW6O35MOi0H5
	OSlsZoT5t6xCSxZ0+Hx3wy1PDbZCiQglNdMJulr2Xr/hCH+IJWtburlAmXsAJoKtIaEZ
	IxJZLoNPNm5gKeJCK5GXw1z7WEnly8LGSp7i3pu1vdF/xoS7kqdL6ihdWiHut/QISwZX
	lBHg==
X-Gm-Message-State: AKaTC001b6Sb5wxGjuL9cFSAHWOe5ait1Fil6roZwm3r8nI2nGneARFOeSY9wxPnR1d5BVmvMVnK7NSRukCDqQ==
X-Received: by 10.46.72.18 with SMTP id v18mr20438598lja.12.1480954149914;
	Mon, 05 Dec 2016 08:09:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Mon, 5 Dec 2016 08:08:39 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <1479756919-17586-1-git-send-email-jslater@windriver.com>
References: <1479756919-17586-1-git-send-email-jslater@windriver.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 5 Dec 2016 14:08:39 -0200
Message-ID: <CAAPZna1tZVMDn3MZafgERMKLQF4+p7yMcKmZUUfHCUFam4-kCg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH 1/1] layer.conf: add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 05 Dec 2016 16:09:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi Joe,

This layer also depends on meta-oe.

On Mon, Nov 21, 2016 at 5:35 PM, Joe Slater <jslater@windriver.com> wrote:

> Version "1", and only depend on "core".
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  conf/layer.conf |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 84a4d89..0d92919 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -8,4 +8,10 @@ BBFILE_COLLECTIONS += "meta-java"
>  BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java = "10"
>
> +# This should only be incremented on significant changes that will
> +# cause compatibility issues with other layers
> +LAYERVERSION_meta-java = "1"
> +
> +LAYERDEPENDS_meta-java = "core"
> +
>  LICENSE_PATH += "${LAYERDIR}/licenses"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF8216C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:36:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 71so3152671qkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wvZiG4G/VSMPG1wN1HFHZowxFJX/IkGQZuBsvFQI808=;
	b=F8/pPcCIItTrZFKVgcAIVbN5z5P4DAZztSd1TeDaDnTGyvyqHic2lQL4XGYsbGyByR
	yVC9lkCWIF4YjQk82NKlvvLuzpxo6HKm52SjvsGufesESDiycmXpmVCGP0O6YKZdVWQp
	XFJ32/TuFq44kS9ysA3VZie//hvjJNHV6D6CZKjLyriM68k5gty5auzZxWvZU99H65or
	YBzGc8/kuoEV2szsAgvlz0/MJFuDU83Jyqb/F/c8PVxfqQdzHaOO3xzyVr5Nu+BJqag2
	ZYE4gnN33wIRIMEDNOICVTRQVOCR3cnuXV9/+7FXcNxbCV14Fbmh1ide6PXhTCcuuCTe
	ZsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wvZiG4G/VSMPG1wN1HFHZowxFJX/IkGQZuBsvFQI808=;
	b=iZsDNQu8p1BMR0HxMNWNwwJpDkJXbAGNOrne9P70UqkFkjn2b9B8JAORImiFBa3hUS
	b52rHtWE1yTaV5IL59bkx5ePEiud5g2ftqMjkxNXstMaMozijS8kX3OBE6/IThMMG/6t
	e9aEXq9VEd9kHwr26WDy0a8YqPKKGfOAgG0NEPEQTybNuTojOmptq40xS6mivY0xbQDn
	PBdSX7upCAcHCL1etBkiqp++i2t49J+i/QQgeJjMhLCwFoFNJtC88l2mrgsPU4f3oUwf
	BRb+O+vcC2Zgk2vbT7r6yBp59tJzAlPR0OrVF1kH7KMCWuFc/xt5a0NjXpYS0TsIMmvd
	ZtiA==
X-Gm-Message-State: APjAAAXXpLnmp+y66DkT+8IQsPfMcScoRwmC4Pgt3zb4smCplkohfQVh
	qST332p0lwmOEEhdX6Fd3jupFhcXHO/RKMAI2ZM=
X-Google-Smtp-Source: APXvYqzlQsIm7HCd+TaLvt5UrpVKcZfXChG0sOF5S6DZA8EIg1RC14IBRTIRk8AmCEURJSCBQoZ1lWnS26IvTMC3n/M=
X-Received: by 2002:a05:620a:1645:: with SMTP id
	c5mr5178181qko.212.1572039387413; 
	Fri, 25 Oct 2019 14:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20191011151148.39463-1-Trevor.Gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2019 22:36:01 +0100
Message-ID: <CAMKF1spHtQ0JQd3FUP7y_OrwAacMxZhbPzxkj2KMRCwQUhZQZA@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rsyslog: upgrade from 8.1908.0 to 8.1910.0
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
X-List-Received-Date: Fri, 25 Oct 2019 21:36:27 -0000
Content-Type: text/plain; charset="UTF-8"

Failed to build for musl here

https://errors.yoctoproject.org/Errors/Details/274648/

On Fri, Oct 11, 2019 at 4:12 PM Trevor Gamblin
<Trevor.Gamblin@windriver.com> wrote:
>
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Upgrade to latest version for CVE-2019-17040 fix plus
> other upstream bug fixes.
>
> [GitHub Issue] -- https://github.com/rsyslog/rsyslog/pull/3875
>
> CVE: CVE-2019-17040
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1908.0.bb => rsyslog_8.1910.0.bb} (98%)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> similarity index 98%
> rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
> rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> index bbb4b119a..f50f9a34b 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1908.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> @@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
>      file://0001-Include-sys-time-h.patch \
>  "
>
> -SRC_URI[md5sum] = "6e9aa4ef4cad8ae49affa0a786cc9e2f"
> -SRC_URI[sha256sum] = "f8c8e53b651e03a011667c60bd2d4dba7a7cb6ec04b247c8ea8514115527863b"
> +SRC_URI[md5sum] = "6d4d94359d083f449f089b8dbb93c423"
> +SRC_URI[sha256sum] = "0219ee692f31a39743acb62aaf4196b644ce94edf386df4605fd6a11a4fe0c93"
>
>  UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> --
> 2.18.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.3677.1586903925202702990
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 15:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S15POFpr;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id x66so15241940qkd.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qk55Hk+V0lDQrmZlvlOZVScr4zoeNyPHZx6Y38y9j7A=;
        b=S15POFprelJu5qu7YwTcQvf9LVmzrhjARZ7oOuxcwwTzBqKh6GC74Bnpjre+m9uNNR
         pwUVU7B7D58tNF/Fp8JdHghsHshT39tyb+gYTT+bEwTv+v8CkssZhgc4nj3yvWIOCBe8
         72iNZHeEmg0L2IlbIWeUB2nrgA3GmTqcCD54eApjzh7WuiN0bucTnVtAs4/ZxDoBMaYd
         njpcHcAFrxj9ufE0ZNYVseEDayJnrPIrCzvUaBugPdC4XLgIm1qjH8QvxQQR1VTWh6Jo
         a7sfcqybuqacS+EJVAq1lFiN7gjfSq/ZjomuurDp5NaN9cQ5RLnvt3dZ3uNmkRPZZOmO
         Wg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qk55Hk+V0lDQrmZlvlOZVScr4zoeNyPHZx6Y38y9j7A=;
        b=COkXkLWP4vF4x+q68JhIfuYmg5UStmZVBa0ckoGQ22pTJjOUCqwM1YFOIbRJXIuW86
         SPPSpp7vieaaNf+9n98iIljZyHvMC981RSd0RFam4PTsGWEeBN8ikBRnj5nS6zQhf6/A
         Xr5psAcn6713+ah7krFUHC/JB7GCwhOKfB9w2Zx7KxJEErbCqbXGqLYEILjqkZLsCy8W
         dIk4s5ukxJAEQuNmaG9Y5xOpEWiaQnFEFCttlrB63fFsPUiAoyVDul0+jgAMpaPE3uXe
         mrH1KGx7vKy27q7jmAcpS1UD7Stipe0Bxn2k/IfMxn5q7U9B56JIGvZc2A11DJ9a0tw/
         h9Mw==
X-Gm-Message-State: AGi0PuYmrgV9ohEw/Nd+GDp497eSmCLbIk+mYTYrTMsnkOrF2ROCqFxr
	U12LGTtfjW8+S4q9bPW2d8PVy+1mlgKMLbum+sg=
X-Google-Smtp-Source: APiQypLr/xZAj7CnZvanwMEvKUNmpa2mwq7Wg5fUozjh05FucFKmbr79zaIErVSoOzezaUXJ+3GwdnGitQ7MfsVtfyE=
X-Received: by 2002:a37:7143:: with SMTP id m64mr11669378qkc.215.1586903924027;
 Tue, 14 Apr 2020 15:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
In-Reply-To: <20200414194933.31798-1-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 14 Apr 2020 15:38:17 -0700
Message-ID: <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

apache-websockets does not like it

https://errors.yoctoproject.org/Errors/Details/403771/

On Tue, Apr 14, 2020 at 12:49 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
> LICENSE file was updated due to a typo fix.
>
> Note that this upgrade fixes two CVES affecting versions
> 2.4.41 and earlier:
>
> CVE: CVE-2020-1927
> CVE: CVE-2020-1934
>
> See:
> https://nvd.nist.gov/vuln/detail/CVE-2020-1927
> https://nvd.nist.gov/vuln/detail/CVE-2020-1934
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb}        | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.41.bb => apache2_2.4.43.bb} (97%)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> similarity index 97%
> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> index a34734c20..2fff153fc 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.43.bb
> @@ -24,9 +24,9 @@ SRC_URI_append_class-target = " \
>             file://volatiles.04_apache2 \
>             "
>
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
> -SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
> -SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
> +SRC_URI[md5sum] = "791c986b1e70fe61eb44060aacc89a64"
> +SRC_URI[sha256sum] = "a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43"
>
>  S = "${WORKDIR}/httpd-${PV}"
>
> --
> 2.17.1
>
> 

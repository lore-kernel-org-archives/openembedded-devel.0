Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.17270.1612677032977981370
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 21:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qA1SEUXI;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 19so1155153qkc.13
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/fVzGGNi9DuNwpNQKGNoEVL0tHR0pMGo5hRNsQYrmm0=;
        b=qA1SEUXI7DCOYETINr2kVLMgYv1cXVTzpoqbsmxPB07j2gW9884XjQpz6GQUzZUTxZ
         UhP9KGmt55mlvBArToWGlf6t7VH9SEoHSFqX+wsU90nD7tdF6/Z2TFrFgM1i1pdTX2RE
         yo5NEbfMATbbXXxtx8UBQps6RZEkHeFwUf03wHKNJVjh8bq+5Rx7Ocnt/rRwE1crVVZ0
         Vg+9DaSaVcGCFQ0sOfq0/l7rY7OjyVtmtdTpBkYc3dFmcsF62iGdn5bcGRMwJ1mFsDNy
         tS3arwPMysX97r8KB0sxZZy+p1syxYXDnDblROX/SU5gA4454cIfFffd5njQYfwgvTcE
         4BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/fVzGGNi9DuNwpNQKGNoEVL0tHR0pMGo5hRNsQYrmm0=;
        b=eGO9SMBzAx4oq6t/od6pZ5SZlgDMSq5/vZyLIEEyXx1GqEW19QeZPQaaL413LxSnz2
         zOZbNqJKvQaxIyu1r3CGXQmyCz0gI/lO5WluNjlKIcABh2dmJwwoqp+mgxKMyil3Bzr7
         iEAfgDrAMmI3je3fkTuUP31Akw1YQVT/7b9RaVqxmX0uhJH6WSOiJkvuT8QNh5mCnCdu
         hNO/X4KsoVOPeUwgVEh0eTASXy4ki+PlwEcBQgEZxvR73pDGTF11Sjbbcjh7nIm+XxQV
         LRuhZ0KdlzRF+hboiONVWqLXrduVT65zq7xqwPdHq3RZm13iEDVg+OdBgekh8hKh3v9B
         k9jQ==
X-Gm-Message-State: AOAM531/GVZxWrgAm5R9/QMF9W5OOJPryn1ieWAVyMPTl21BGuBZgOCZ
	qWy1KSaaPe9T4u25z15+W7kMGoLOxv93AnqElaCFu0hHX3w13A==
X-Google-Smtp-Source: ABdhPJxt21uH2yErP8EbHNEE4LL8BtIk7QeedydhOka/2RMpNfDdo0hzAKdAIelxMC0cE8E/mygcbB8rzyRIV7BGJAE=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr11388761qke.474.1612677031966;
 Sat, 06 Feb 2021 21:50:31 -0800 (PST)
MIME-Version: 1.0
References: <20210206220607.3969325-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210206220607.3969325-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 21:50:02 -0800
Message-ID: <CAMKF1srrzpWHxGuj+i--YRPuvJ92bcjeeyVqOFpRBAqbMA4=rQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] atftp: update to 0.7.4
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to patch on musl

https://errors.yoctoproject.org/Errors/Details/569674/

On Sat, Feb 6, 2021 at 2:06 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-daemons/atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-daemons/atftp/{atftp_0.7.2.bb => atftp_0.7.4.bb} (97%)
>
> diff --git a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
> similarity index 97%
> rename from meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
> rename to meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
> index ff9084dbf..76a9e144e 100644
> --- a/meta-networking/recipes-daemons/atftp/atftp_0.7.2.bb
> +++ b/meta-networking/recipes-daemons/atftp/atftp_0.7.4.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/atftp"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -SRCREV = "52b71f0831dcbde508bd3a961d84abb80a62480f"
> +SRCREV = "e56e8845f1070e89a4a6e509396b681688d03793"
>
>  SRC_URI = "git://git.code.sf.net/p/atftp/code \
>             file://atftpd.init \
> --
> 2.25.1
>
>
> 
>

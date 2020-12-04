Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web11.10693.1607063750157916250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 22:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IrtG+3JE;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id n9so2309283qvp.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 22:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MaW8OBt3LXSNo6Fd1OKHpZQXA7ieeRCfNEeX0QhmuNc=;
        b=IrtG+3JEtjJJ9fa+gClITKJ+TcWZT3lAJ1a0PTspesohwj2iCgEE3lPBs33JGETKHl
         e9tpRKgLM+qVGM8BDr3oEDzsKI7ls2bu4jezRUrfNcp7O3t/8jNFCKKlTJVrSnpB+I9U
         jHsW8Rw18/3f3rqQW44uNHt5yzZ5JTZx3V9WfUypU2xRIyUM2gC9m3gzFmll77sXyANG
         yVH/uaIHZMcPMFUBU3lsLqzzJM8XDOtjMAkoj+dYVHuP5b1nt/F5+C5gaMI9wxeL289s
         51As4wmnPC6kGyRJ5ITp5E82oJTLL2sLSh4ku7vzHETbX+6Y7Fk1L2dihJstgQIMg/xX
         C/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MaW8OBt3LXSNo6Fd1OKHpZQXA7ieeRCfNEeX0QhmuNc=;
        b=K3H5/GX0gRfAC4S8aAxxbvNijBRDVSXfhCYq9GMLNKBVxLJdpLfZfdMWqaditBPF19
         Og6z1LEE3ZwvssYDfA7SQzYjA3U0nWrSKSN1eSDXi393Rd1ADNIslhnyDPYn/zHfEWx0
         G2aPf+cC2NMd+hliHlMtQQ348vDABWmfH5UN00GyOSusNY91QYXWciFvpil7hEnLjlVe
         xwx6cLaRrqPqVWP2c5+nFvriMYnsfaouCaNfPwfriEzjziMnRfLWQ8J5bcEVxr36hagK
         MesV2BjAqG9543uCEoJGSivn7p+PFL2hiWWuII1uYoGtPNCVUsxOhZSeubPn9b8LxUP2
         WjJA==
X-Gm-Message-State: AOAM533zEsglfaR5ptCAshVAztcE5IAg1/I0JMqN1jnA1PUc0ca+p0MH
	V9EQUIu1YBBL9eiWoVSFv4BmNCepq2g37utpBP4=
X-Google-Smtp-Source: ABdhPJwyEZzR67aVtXTsZMBtJ2PwtUEpROpx3cZWnxepkX3II02J8NqLJV4S+dSE6qIzdV0BZCK/MF/Z4L4/1Df72p4=
X-Received: by 2002:ad4:524d:: with SMTP id s13mr3532658qvq.19.1607063748624;
 Thu, 03 Dec 2020 22:35:48 -0800 (PST)
MIME-Version: 1.0
References: <1607049195-63067-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1607049195-63067-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 22:35:22 -0800
Message-ID: <CAMKF1sqze-5OLV_R=eqEyOJdg7B0pRF8JQRUp4tPvDe595_R=g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] nanopb: upgrade 0.4.3 -> 0.4.4
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this needs rebased on top of master

On Thu, Dec 3, 2020 at 6:33 PM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../nanopb/{nanopb_0.4.3.bb => nanopb_0.4.4.bb}                 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/nanopb/{nanopb_0.4.3.bb => nanopb_0.4.4.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
> rename to meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
> index ed1a719fe..19db89bdc 100644
> --- a/meta-oe/recipes-devtools/nanopb/nanopb_0.4.3.bb
> +++ b/meta-oe/recipes-devtools/nanopb/nanopb_0.4.4.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
>  DEPENDS = "protobuf-native"
>
>  SRC_URI = "git://github.com/nanopb/nanopb.git"
> -SRCREV = "1466e6f953835b191a7f5acf0c06c941d4cd33d9"
> +SRCREV = "2b48a361786dfb1f63d229840217a93aae064667"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
>
>
> 
>

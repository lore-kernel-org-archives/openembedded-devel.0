Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.3025.1615236904457175466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 12:55:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nWM3bRBp;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id w6so8636337qti.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 12:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0KMRwPwKM0tnSgAHSLmFaSnlSyT+A2G0nTUQ1PummTM=;
        b=nWM3bRBpdeq1jPnLKhb2r2cHXlUnR9DGea+2zfD5yZNDi8H/75w1Uaq8AfSDgX+Btk
         2XnVhTU1I46aXLvvwkRaD1g+SVnC/uDXoto2u3rtY8D6YHiMD4WcWFVJTP+9VzfLHqPd
         ufZfHnxXR5FqbxiQE4mbOT2VYMfKLL7EyIgVSTybK31CkL1BrBtVgX4mM+u6SzGeQtBe
         9Q1dP31Tt4FryvhWmYfaOj0UiVyReq/1OoeTegaH/yiPSq5O5rCraSIkbiHdPhEq50sz
         ZK6lNKhHDZKpGNW592hmblqrFe+kbVzQcj8K/hCEDV1f7imWQxQO9p1eDvTXU8G83ykq
         TAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0KMRwPwKM0tnSgAHSLmFaSnlSyT+A2G0nTUQ1PummTM=;
        b=Mhw744ZLlIfv5Ib92rD2fE12W3gjY0FhsZgzu6gPL7gUJfrF16Ps79eRBV6TDmz1wZ
         oMUxmIOFEhVKfhVYsqgHDMCJJhigoaaYudiiWpyMUkWbstIgAHwG6xpajYVtjcI3bCUW
         Y0al48uBU7a3ZhPd7gs6zjQPmD2eW+gN0KYIOKmTmFLuccouaEUIH97Bx7bOyK3OkMf5
         r6YWWShD0hHlrJs5o4Q97WJj/KtHhHjybCuHVYPMncxYeMBRQ6qO5Kxl3iaWFmiYVW4j
         w6VwCsyNLhJgkKBaEk0LbjYoeuJCK37tivU/+iFfmEEwLsV1apBQCpKyt5JrGsRe3S4o
         9K/w==
X-Gm-Message-State: AOAM530/0AwmFg+jYcIaiqPmXbFNM5chePOwNInBJaVfVKtU+Nfv7ofN
	UQ7oTZSqUR1fWbZ36QrFI7gBocWzzCcIYn9MGtE=
X-Google-Smtp-Source: ABdhPJwpokpChafYoZnTdNs42dVU6kyV0e7WHux3cqeiPOMP8yI3V8Sd2019MWDfIBLwTTi2CGHF1Mxx4OsPNQL/B+Y=
X-Received: by 2002:ac8:4f52:: with SMTP id i18mr22390479qtw.82.1615236903389;
 Mon, 08 Mar 2021 12:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20210305190859.32217-1-JPEWhacker@gmail.com>
In-Reply-To: <20210305190859.32217-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Mar 2021 12:54:37 -0800
Message-ID: <CAMKF1sraAE4Y69=vnfnvhXoFRk=sHiOgyU+Ck3C12m1=FN_mFA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] classes: Add Android sparse image class
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 5, 2021 at 11:09 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Adds a class to create sparse image files using the Android tools
> ---
>  meta-oe/classes/image_types_simg.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/classes/image_types_simg.bbclass
>
> diff --git a/meta-oe/classes/image_types_simg.bbclass b/meta-oe/classes/image_types_simg.bbclass
> new file mode 100644
> index 000000000..a53fafe5e
> --- /dev/null
> +++ b/meta-oe/classes/image_types_simg.bbclass
> @@ -0,0 +1,16 @@
> +inherit image_types
> +
> +CONVERSIONTYPES += "simg"

I wonder if the name could be made sparse-img ?
simg might indicate, signed image too.

> +CONVERSION_CMD_simg() {
> +    in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
> +    out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.simg"
> +    case "${type}" in
> +        ext*)
> +            ext2simg "$in" "$out"
> +            ;;
> +        *)
> +            img2simg "$in" "$out"
> +            ;;
> +    esac
> +}
> +CONVERSION_DEPENDS_simg = "android-tools-native"
> --
> 2.30.0
>
>
> 
>

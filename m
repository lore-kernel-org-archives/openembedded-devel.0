Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.398.1613519172485541942
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Feb 2021 15:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Khu6PePG;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id c1so8394070qtc.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Feb 2021 15:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZmOtA5WjYdcii2SQmnTRKSVTzQ5fiEn5c6GK5gb6Hc=;
        b=Khu6PePGQp5gNtppxgLKtmoo9BQnsRRMyh/55mbIeY5roxZS/8xsfm7Qs16Z69gy/C
         oIu75Xsh4nadqsWRbhHaQFJuhZ/gIoUtuvFsLYcOCp/UdZznh8pW7UhDYb1c8XiEnvXm
         Vsypi0Kg9kBueXOazZyxCKiJED3DoEfq9YTRg9w/W1lJR7YKINAg1R1sGD2tHO12rnHu
         8KUJzNo1sg6is4HS/9JCCl8bg8gXxow8iAMF8SUMEDCxuuP02asL1KvANWx0MUsss8uc
         hAIFiZe58giYyirlhMj3N015hJA+BwHYrq53K71ixWxHNNCa9RePPCyQ8mNGITQ++HY0
         mQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZmOtA5WjYdcii2SQmnTRKSVTzQ5fiEn5c6GK5gb6Hc=;
        b=XNj9nLRJFVGfRwqqjMVgNMh7kEBAdaLVUKkgcD11asUQPX/ZbP5PbLdjTYAOoqIhcL
         bA8aSju1hmBQ8qrbpNS9H7//6CaLSNrdr+0a0Lf/+taRAFBUFBoP4bjAD+8+BA/Tc0IF
         PDv+Uy+/HcgD7JgGv3Cap8u6uQyNHHRA354nqy01+K2Rx1oHrbNDvZXrVjNPiq5sHcxj
         DDq3J7AcW3UAR05Ply1aP8zxvBwGqWUTvUVmcJKPR2h0jcnzNnspThNPDhaCOLKUSTPO
         NXmuWz/Bo/m1gHkT4KkiWFP2mJ/0cRPTnXoHvW7AzUMfFiSzINS9rVvNQL9a3qxn6dyB
         SK2A==
X-Gm-Message-State: AOAM530xJi+Pc1kDhHx+KlP/4J2U138Pqvm+zsFm1PU8J/7P2CmNh0g/
	jKswBZHxFYdFs30+wqORjickYsHErCRxuU5JExo=
X-Google-Smtp-Source: ABdhPJxUxYYKtvjWTJsDGFSlZHpHhfUf6uuoZ5Mur/07QsEVe4JsdSQYg6qhJUib4K2Rkfp1gHDZwWtYOA7ZfR1/WUI=
X-Received: by 2002:ac8:7210:: with SMTP id a16mr21039375qtp.82.1613519171508;
 Tue, 16 Feb 2021 15:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20210216221630.1162832-1-ross.burton@arm.com>
In-Reply-To: <20210216221630.1162832-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Feb 2021 15:45:44 -0800
Message-ID: <CAMKF1sr7JXD=F6U==_kREzn8T=OWvm6n2yACskbQZjkMvAO_Hw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-python] python3-intelhex: add recipe for the intelhex package
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

can you add it to packagegroup-meta-python as well ?

On Tue, Feb 16, 2021 at 2:16 PM Ross Burton <ross@burtonini.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-devtools/python/python3-intelhex_2.3.0.bb  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
> new file mode 100644
> index 0000000000..befcb34780
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Python library for Intel HEX files manipulations"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4eba844696655c3eae07aca8e3a94772"
> +
> +SRC_URI[sha256sum] = "892b7361a719f4945237da8ccf754e9513db32f5628852785aea108dcd250093"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> --
> 2.25.1
>
>
> 
>

Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.1086.1592370601664331270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2020 22:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pzj+yriH;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g62so608493qtd.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2020 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wyi7iWG6PNHOnh56+dEwOWb1xy612J1wDYsadot59YM=;
        b=pzj+yriHbI/lZgblKsEOcGT4npkkW9PYcVmtDW8iJYWUhj0MwxEH2CpJ3UE77wXBJ/
         e8JSwvCDJ2beGIJt0POt9piz7PTBzCPhdQUdCZrOprR0TpqUsmzBeCmjOq1iZKBv0mgu
         nW7jeGxf1Tu7hR8vYcg1k3jlIJ6r9DAmnokcA+/+GXxu8TJ124rDIBDRyCXWCiYWEl9k
         s7WQxv+L9o4teCQYiFA/FEiAMZlmxXTu5zqHWl6Xtw0kcXB9HO3Af/ZijcDy2VmSp6eq
         HjH265psjn+JE2YUCa0QPAZk6clDkcRtocI89+1/RH2EwBANt8Wcf+vNtLPFiQAnruU3
         jJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wyi7iWG6PNHOnh56+dEwOWb1xy612J1wDYsadot59YM=;
        b=MCWD2YpANhmcYA69fNvDG6HnWlkVav74KNIo7o6vLy4MZy6WcfLPBqRFtDso7kD6Zg
         OM2zs1Q2+zMNG466E8bKPAxxH8qJFFoOxNRfjyAt11uafAW+UmtJpwxDmaIuyo7XDHrl
         yBfsXQkYValoljt+GKj/cQ6cPS68uXCgMOLA5GFN/l9C5yylcrpX0N7RgS6GiHDm1+mX
         DOFvGLvhZCD3vhubNfl4mN9dFjJAiPIOnJW7l7X9QdPIiU1Z+6k6jUSMEtF3l44jG6GE
         Vm+jLLbQOd4zmLoAPp7lBr14WAboAGSC8QGqYTlAU/gdiv8x7oIwlfUVnPSLPhSw+le2
         3xHw==
X-Gm-Message-State: AOAM530WOECuAZOXAjNyi0/2bY/aHhkp5CWYaPmZPLAdArt3CYe/U3M1
	lKhjcyMa1r+Q62dUS0b24RuuntKmh4M3gIDzbuI=
X-Google-Smtp-Source: ABdhPJzSESUyQUUmGICQQaKDdOyY1yeI5AIt1dn/HDyfpiWxZGUi1rVMBHVn4hDe9DFtBKkxe58D05hP/wgz5DDVWdY=
X-Received: by 2002:ac8:3246:: with SMTP id y6mr25391628qta.146.1592370600563;
 Tue, 16 Jun 2020 22:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200617004648.43633-1-rrowe@xevo.com> <20200617004648.43633-2-rrowe@xevo.com>
In-Reply-To: <20200617004648.43633-2-rrowe@xevo.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Jun 2020 22:09:32 -0700
Message-ID: <CAMKF1spdxyADapv8pW_=hKtMZ0WUYs-B3QPzvXDV3auBCP7_oQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] add python3-argexec
To: Ryan Rowe <rrowe@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, jbroadus@xevo.com, 
	Martin Kelly <mkelly@xevo.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 16, 2020 at 5:47 PM Ryan Rowe <rrowe@xevo.com> wrote:
>
> Signed-off-by: Ryan Rowe <rrowe@xevo.com>
> ---
>  .../python/python3-argexec_1.0.2.bb           | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> new file mode 100644
> index 000000000..64fbf58c4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.2.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Expose your Python functions to the command line with one easy step!"
> +HOMEPAGE = "https://github.com/XevoInc/argexec"
> +SECTION = "devel/python"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ea70b07c354e36056bd35e17c9c3face"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "9fac09884c54db79e57ab80f0c423794"
> +SRC_URI[sha256sum] = "e271286b280f930aeaae7496454573f8029c3f48ef1dc47c780155dd4a7b9e7f"
> +
> +DEPENDS += "python3-setuptools-scm-native"
> +RDEPENDS_${PN} += "\
> +  python3-typing
> +  python3-dynamic-dispatch
> +  python3-typeguard
> +"

this RDEPENDS wont parse, since its missing multiline separators on
each line. Please fix it and resend.

> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.2 (Apple Git-113)
>
> 

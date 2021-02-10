Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.9444.1612979972152496095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 09:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mrjhc02Q;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l11so1278334qvt.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 09:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/nioO80vjbokuzRdJbH/p+2NI4Ssk+/bpNR+ADAXU/E=;
        b=mrjhc02QMIJ7HixKrQvuntgcIUCz5betexDMy5CZRex/bYKGBNfXsGfMWMsv116jIa
         Z5h3Z2oIzb5TfHYu6BmZKXmtxrGnkbwGcVUXKBg6xsFqOWEWL3GNnmkT38BOqS/SWOdw
         D8u+8RaVjwqcFST00uUpdusELXjnUXfc1cC/D3WfKFJyozYqe18NsIwRVXzI2fhrP87B
         keA+Uuzq/9ZNIVmetli29FOVEobbgyq/Ri7D3WDt/AMUCQHusPtDMkrnx99zhFT/Iqlg
         PK27/JdtW8fGDQP3JoXRsEoloysH3NWY8r8vNwviODPHWvWuqPsmSiuUDRxhk1Xayy6v
         QcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/nioO80vjbokuzRdJbH/p+2NI4Ssk+/bpNR+ADAXU/E=;
        b=BuSZ2fSPIyUYmZk7YDNwBJX7O1Q9H5E4V1y7KWEGtOiZ8Q8LEfpHWnPcSV0fOvHBHL
         hs1u6v2xW1LDrLxBgPpIPFpHUvcaDwPWEDF4D/yUC6ICSzblxLBcWcZ2pBbxejTk5tCJ
         lgDlhTPSa+Q6NRMve7RxNE/LWeGmJVCXXr2ohDdOEa7q8mtW96PEEs72tsaH1EPLui+1
         Vk3gZz1oyuxcmI55WccR2LbJ5WZPcSOls1g2n4rIc63vmqQbi+ienuImJu2A6O4zgSfr
         ITRtTZ5gOot++HI2MV4ZJAfJy0Leun0v2q5RqedEqbHqVPO/zsk2tNjZidE/C5HuhXVs
         83Iw==
X-Gm-Message-State: AOAM533mttt+ETSZVaXiObxOo/IMHRYFmRe84AWQHfPBZoPmFL8PmKTq
	woKizadXC9Gts9ipy3DriOC0+HeZUhd+QfZnUSE=
X-Google-Smtp-Source: ABdhPJxv9DYzeu6fG3uVeWh2TxWQUK6gc96hMTYvtr0D+7xUGZp6gf2n81iS6hiRRGEbOHbjbfUM3n+IczKyls5IR2A=
X-Received: by 2002:a0c:a8d3:: with SMTP id h19mr3752015qvc.21.1612979971218;
 Wed, 10 Feb 2021 09:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20210210142126.21906-1-brgl@bgdev.pl>
In-Reply-To: <20210210142126.21906-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Feb 2021 09:59:04 -0800
Message-ID: <CAMKF1sp_VTG+7mv4ZcqErPb5E9ZU2jSBnp_PV-PgtHnEpa6PPA@mail.gmail.com>
Subject: Re: [meta-python][PATCH] pydbus_manager: new package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, Tim moto-timo Orling <TicoTimo@gmail.com>, 
	Derek Straka <derek@asterius.io>, Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 6:21 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> pydbus is a popular (and probably the most 'pythonic') implementation
> of DBus for python but unfortunately it doesn't implement the
> ObjectManager interface. This project is an extension providing this
> functionality.
>
> The reason for having this as a separate project is simple: pydbus seems
> to no longer be actively maintained so it's hard to make it part of the
> original codebase.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  .../python/python3-pydbus-manager_git.bb            | 13 +++++++++++++

Please add it to packagergroup-meta-python as well

>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pydbus-ma=
nager_git.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_g=
it.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
> new file mode 100644
> index 000000000..ae9e42160
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "DBus.ObjectManager implementation for pydbus"
> +AUTHOR =3D "S=C3=A9bastien Corne"
> +
> +LICENSE =3D "WTFPL"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fd5bb1dae91ba145745db55870be=
6a7"
> +
> +inherit setuptools3
> +
> +SRC_URI =3D "git://github.com/seebz/pydbus-manager.git"
> +SRCREV =3D "6b576b969cbda50521dca62a7df929167207f9fc"
> +PV =3D "git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> --
> 2.29.1
>

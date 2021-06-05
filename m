Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.9995.1622882706327166890
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 01:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F3C88240006;
	Sat,  5 Jun 2021 08:45:03 +0000 (UTC)
Date: Sat, 05 Jun 2021 08:45:02 +0000
From: "Quentin Schulz" <foss@0leil.net>
To: yocto@lists.yoctoproject.org, JH <jupiter.hce@gmail.com>,
 yocto <yocto@lists.yoctoproject.org>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Is it a bug or it does not support device tree /delete-node/?
In-Reply-To: <CAA=hcWQ7vordSRwq-O2+8b5FV79EKHZM6s-dq49EWt6Ra5Owdg@mail.gmail.com>
References: <CAA=hcWQ7vordSRwq-O2+8b5FV79EKHZM6s-dq49EWt6Ra5Owdg@mail.gmail.com>
Message-ID: <06B2DF82-ACFE-4503-8174-39163A7DF959@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On June 5, 2021 12:43:19 AM UTC, JH <jupiter=2Ehce@gmail=2Ecom> wrote:
>Hi,
>
>I am building following imx6ulz-kobs=2Edts file to a dtb in zeus:
>
>$ cat imx6ulz-kobs=2Edts
>
>#include "imx6ulz=2Edts"
>
>/{
>  model =3D "customized imx6ull";
>  compatible =3D "fsl,imx6ull";
>};
>
>&gpmi {
>    /delete-node/ fsl,use-minimum-ecc;
>};
>
>The building process was fine, but that fsl,use-minimum-ecc in dtb was
>not deleted, is it a bug or it does not support  /delete-node/?
>

fsl,use-minimum-ecc is a property not a node, you need to use /delete-prop=
erty/ instead, c=2Ef=2E https://devicetree-specification=2Ereadthedocs=2Eio=
/en/latest/chapter6-source-language=2Ehtml?highlight=3Ddelete-property#node=
-and-property-definitions=2E

Cheers,
Quentin

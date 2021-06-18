Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.11485.1624039446177085961
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Jun 2021 11:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ICmifohc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id gt18so17107755ejc.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4IQQkYFvTDHcm/ngLG57btgr3HJKmmgR9+HCokhBb8M=;
        b=ICmifohcxvpgpYkf2GqTnQI+D5fflO5b5p8Saw0vtD7SkqXeBNrT/3wr9sfggY0MvC
         EG+Y2ptiojDzSEvj01UeYi6bcnzqN1Zb3BlIzL5QokiB1xof091K7/Ua4rwjAnR//5iB
         K9ui1/uHYtM4EL5EzLRJ2JwSVw6WXM/ckG+d9d25wWDZhO36AonWTbl9xslJFpAYWdpO
         q5G33wb0Hk7b/zUVLtklUSiq2RdGvUt0MbA9lcig8MJqk169Ux5jhcNScYpkWE3VATWM
         0bu09Pp+Qd6RG6E0iXx30eYPuYt9EwBoQzV5wJlfiYCAfWkm6ZOZkzzqEnfmSCI3CUFL
         ZLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4IQQkYFvTDHcm/ngLG57btgr3HJKmmgR9+HCokhBb8M=;
        b=BFxVFD9ILIXQgggvSic5IlpPz0NCtE4haA9RqojBErMvBslRSNdLjC69Wb1zQWYVAa
         PmY1Gp+9s4uvBPDHjUXNpSTfZbGT8nARHyqgq9dSjmOUa/pIqmoniQTfvr61M/lZTFo3
         pQDeajKgIM7WycAPntvg0GGemH0mk2zY137K3ROJp49LaoqvCaAQRPtcU1abqUw1DCyX
         vEH0ptcelxCZ8NeTe0vRCCKAlxFz3Wdp2hiWg3wFLnnllG8D7pwBT56lvKScek1b439c
         /WT0M1ieQneyUZGBX6hHLXCIKp1g8pMkT8E3HEYHqGIaJLioEF/4k7fuz5W2LZih65mL
         489g==
X-Gm-Message-State: AOAM531DqJHLQMWJRdl0so8eSikygyVXFGSQbx2dJuhMdfYBfOJBllr4
	IT66w+nBPPyUjqBPt8WTUytzySsxzi+m9FZc108=
X-Google-Smtp-Source: ABdhPJxgf4nMbQtHVw1B1VSLCWGe6mM/+/Gzr2G9SZIJYigQTsKPCzL6QdjXR1XEtusajOy5+A5g900M1eJYiBXqdyo=
X-Received: by 2002:a17:907:1b22:: with SMTP id mp34mr12422735ejc.408.1624039440575;
 Fri, 18 Jun 2021 11:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <98hT.1623132594082542882.bzIp@lists.yoctoproject.org>
 <CANNYZj9r_eZ8ZHEo801viRNuBekefmvKuqtLfKsKTQncw+uw-w@mail.gmail.com>
 <YMe6JtmeJc1NiRYZ@brokenbit> <ec0d85da208aa26517a50ea998b855a5aa0d1455.camel@linuxfoundation.org>
 <YMfKw9F6qY7daERE@brokenbit> <CANNYZj8DDhPseB_Vzr4oboJgQn6VY5LbRym6-Tp7=peHfKTJvw@mail.gmail.com>
 <DB6PR04MB3045822D414344179222A701900D9@DB6PR04MB3045.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR04MB3045822D414344179222A701900D9@DB6PR04MB3045.eurprd04.prod.outlook.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 18 Jun 2021 19:03:51 +0100
Message-ID: <CANPvuRnE01E0FCGmNCQW9bJDuR5XfDwGz8p5D9a_nCg3DtA8mg@mail.gmail.com>
Subject: Re: [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error
To: Alejandro Lozano Lozano <alejandro.lozano@nxp.com>
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"George.Mocanu@rinftech.com" <George.Mocanu@rinftech.com>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Alejandro Lozano Lozano <alejandro.lozano@nxp.com> escreveu no dia
sexta, 18/06/2021 =C3=A0(s) 14:08:
>
> Hello,
>
>
>
> Do you know where can we fetch the correct tarballs?

This files are now on the yocto mirror
https://downloads.yoctoproject.org/mirror/sources/f89009ada191.tar.bz2

>
>
>
> Thanks,
>
> Alejandro
>
>
>
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@list=
s.openembedded.org> On Behalf Of Alexander Kanavin via lists.openembedded.o=
rg
> Sent: Tuesday, June 15, 2021 1:53 AM
> To: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>; George.Mocanu@r=
inftech.com; Yocto-mailing-list <yocto@lists.yoctoproject.org>; openembedde=
d-devel@lists.openembedded.org
> Subject: [EXT] Re: [oe] [yocto] [meta-java] icedtea7 fetching error
>
>
>
> Caution: EXT Email
>
> On Mon, 14 Jun 2021 at 23:31, Richard Leitner - SKIDATA <Richard.Leitner=
@skidata.com> wrote:
>
> Thank you very much Richard!
> The openjdk8 tarballs are now hosted at https://downloads.yoctoproject.o=
rg/mirror/sources/
> with their local download names.
>
> Unfortunately I currently don't have the time and resources to provide a
> patch for fixing the URLs and adding the mirror.
> So help is greatly appreciated!
>
>
>
> Unfortunately I think you mirrored the wrong tarballs. The problematic o=
nes are specifically the six tarballs coming from http://icedtea.classpath.=
org/hg/
>
> and I am not seeing them mirrored. See the original error at the start o=
f this thread:
>
>
>
> --2021-06-07 17:24:33--  http://icedtea.classpath.org/hg/release/icedtea=
7-forest-2.1/archive/f89009ada191.tar.bz2
>
> Resolving icedtea.classpath.org (icedtea.classpath.org)... 172.104.137.1=
20
> Connecting to icedtea.classpath.org (icedtea.classpath.org)|172.104.137.=
120|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2021-06-07 16:21:05 ERROR 404: Not Found.
>
>
>
> Alex
>
>
>
>
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma

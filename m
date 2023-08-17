Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C22EC678DD
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 22:00:48 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.6358.1692309641337825413
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 15:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BqA8AXsm;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56d6879dcaaso247692eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692309640; x=1692914440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpdZXeI3YW5y81Uhj48/HVHfic5uVefHkum3lSqNqzo=;
        b=BqA8AXsmDCtZqWSwEuh4jVO3kWSX9+sMmRxMnc+YDxjtOczeBEkF8rYeK8u/CHXu/Q
         OsKreEPRT2WMOriXIZF91KvkgEJHrs6pHbAmYH2Fs/EyOMfbkLAil06wQxLdGzcyATwj
         TEZyq/QAAh8C2x4QJla6QlQ4PLq4NPin8aMnHotvc0Wb1uakY5YbHjTKfZgbJYLsTvJi
         V4dIrocfMLC4B6nBiZLLu48mPJoPl4sqOL2FEAX6LSV9AXW9eJJZMwl22PQnm83XOD2A
         1tzBqRY139SeOriEcSGTLtBZS7wBNiVmjFZdGmiwpIgp9vWMaZh23xKdAnD2uA1I+Hzb
         MAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692309640; x=1692914440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpdZXeI3YW5y81Uhj48/HVHfic5uVefHkum3lSqNqzo=;
        b=TnCA9L2w9+np19KExgMOSO/cMO/7JBiOymkKuf3A9TZq7xZUlQCYKU43a+yTpYeT+s
         YKozmk9kDxmCS/i3bhDf8o5Ep8K9Vh93QlGoSTsWU8hUqow0t5G42cFV5cFWu+bQttjm
         Uezzldc3pUBDeQvqkVws8wL9TJ3pppPqHaiCPOk/Mlt/e3vjKzyIkTUsp6yB9roQ9aLp
         SNqq73sHOuhlTCdK0EF1sQGPK1CPeoe1+0tKMwNInFvqyRWzj2k+Hl2FmBxzoJVnEnUe
         nUGIsms18fdr+1+1MugL03j38KbtZIIaYalpwiO028wHMdt4ZX1xRSKVNiSqXJyQjEdt
         L1FA==
X-Gm-Message-State: AOJu0YwIRYDxMKn7rjY7N8Pxg9abIi0trp3/iiHfdAdVw1dWGfXuuj0U
	JpAW5wkc1wmVdY9NS76WO0QZ7alw9Ih0Xr3hjyUNMyv3TTw=
X-Google-Smtp-Source: AGHT+IFi9g/3bRnhQ+DJrnNLxGbzhN+6wOE7O9ySv6X2V2M6z87nfvmWBcYG1uDBY2sYPYLDrK4WETjy2wxFqFN+Wvs=
X-Received: by 2002:a4a:d213:0:b0:56c:8c66:cea6 with SMTP id
 c19-20020a4ad213000000b0056c8c66cea6mr1128900oos.1.1692309640532; Thu, 17 Aug
 2023 15:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230817084423.20928-1-tymoteusz.burak@3mdeb.com>
In-Reply-To: <20230817084423.20928-1-tymoteusz.burak@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 15:00:14 -0700
Message-ID: <CAMKF1sqMksc=f-Q6f6ECL9=wb2e9=xn+QZJMH-3uMm3thPPnPQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libfaketime: add recipe
To: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 22:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104476

On Thu, Aug 17, 2023 at 1:45=E2=80=AFAM Tymoteusz Burak
<tymoteusz.burak@3mdeb.com> wrote:
>
> This commit adds the libfaketime library recipe, which provides time
> manipulation capabilities for testing and debugging purposes. libfaketime=
 allows
> developers to modify the system time reported to applications, aiding in =
scenarios
> where accurate time emulation is required.
>
> GitHub Repository: https://github.com/wolfcw/libfaketime
>
> Signed-off-by: Tymoteusz Burak <tymoteusz.burak@3mdeb.com>
> ---
>  .../recipes-test/libfaketime/libfaketime.bb   | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-test/libfaketime/libfaketime.bb
>
> diff --git a/meta-oe/recipes-test/libfaketime/libfaketime.bb b/meta-oe/re=
cipes-test/libfaketime/libfaketime.bb
> new file mode 100644
> index 000000000000..fadf9c432292
> --- /dev/null
> +++ b/meta-oe/recipes-test/libfaketime/libfaketime.bb
> @@ -0,0 +1,34 @@
> +DESCRIPTION =3D "A library for faking the system time in user-space prog=
rams"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +PV =3D "v0.9.10"
> +
> +SRC_URI =3D "\
> +    git://git@github.com/wolfcw/libfaketime.git;branch=3Dmaster;tag=3D${=
PV};protocol=3Dssh \

Also avoid using tag=3D in public recipes instead use SRCREV=3D"<SHA1>"
which might correspond to a tag too

> +    "
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE +=3D "\
> +    EXTRA_FLAGS=3D'-Wno-error=3Dnonnull-compare' \
> +    "
> +
> +do_configure[noexec] =3D "1"
> +do_compile () {
> +    oe_runmake
> +}
> +do_install () {
> +    install -d ${D}${libdir}/faketime
> +    oe_libinstall -C src libfaketime ${D}${libdir}/faketime
> +    install -d ${D}${bindir}
> +    install -m 0755 src/faketime ${D}${bindir}
> +}
> +
> +PACKAGES =3D+ "lib${PN}"
> +
> +FILES:${PN} =3D "${bindir}/faketime"
> +FILES:lib${PN} =3D "${libdir}/faketime/*"
> +
> +INSANE_SKIP:${PN} +=3D "dev-so"
> +INSANE_SKIP:lib${PN} +=3D "dev-so"
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104450): https://lists.openembedded.org/g/openembedde=
d-devel/message/104450
> Mute This Topic: https://lists.openembedded.org/mt/100796818/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


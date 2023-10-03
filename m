Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5437E74903
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 17:45:04 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.114788.1696355104064449349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 10:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JU+sb8Gp;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso774373fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696355103; x=1696959903; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bMEKyqTyZiTPch2ehVmOaA5gb/jF0phD45io5QLUZn8=;
        b=JU+sb8GpDUY1dkQSV4r21tGh1kFD45PBOr/I4DH3By6zD6qVU8qX2YaLPuR/XiZQE0
         wlYkMt8EjwStR08pBKgAQYurYk3BJ45T/WaFgLbA32U4wjT/BK0ZqIqaZcPZtBYLiHA2
         4B0ahpmSFwbe7cyyukbiC7u0S3W5MDHzlDM0oNjt5Wt8PM+t4sKzolIytPDedMOOy/IM
         ld+YxRBWJ7GCyeqAtxdkintijaYMqvtQolFzAfrjWkMjjOCuknblhaq+Cs0HdRoCE0pU
         NPF8iVNAtrRr/4hrU3u/yRsed1NUUunR2lkzq05jHq22FgZIARjBopWBZfijk8XlZzPB
         ED9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696355103; x=1696959903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMEKyqTyZiTPch2ehVmOaA5gb/jF0phD45io5QLUZn8=;
        b=Cssvh6LaClJHyP9x3+det2Ur/QO3lhXEb0KpZ2iTNTdj7FFfRGRaImh+pj1fdd03dh
         ykwSHyxakTmr52owbNHW4Br/tQR8Sd6vG7srNGvhmXYqGNsj8Zqi1rmH/r4ONUOmBRpu
         WmCvnME2SJZyNBhPgKifjUv7hG9fGfN6u8huNxt8sEhYbMdb5tReS++g50snuK2pRA7b
         EAY2sR/8dUolfCcnB/YE5hqT5XlRwWuxR6QR7aV1+du5uRS27SrfT3jxlRoO81ybPNxU
         k3US7z+AxM9Wfo10tjZYWmk6L4BDbbvyKzPGk7PEXDSfsT+ZLRpXL9lW4ZGlvmkJROmK
         8Irg==
X-Gm-Message-State: AOJu0Yx5X9LmEzcX9HiEendjGLzTC4ldHtJzyWBh/JzRDaMjpXL10h0B
	7LzIyjPaemvIWH56DESDMLm4GDP9O4NgyzBQ6YU=
X-Google-Smtp-Source: AGHT+IEzvar9WNi9IdsBukkcJ1/o3ZBEJtXwCkbFPJFwmMBHwtaooBYPfBvM3rbNvOFywdAFlGIjZRMC6b11mWQxjYQ=
X-Received: by 2002:a05:6870:4211:b0:1d5:21cd:7069 with SMTP id
 u17-20020a056870421100b001d521cd7069mr320336oac.8.1696355103185; Tue, 03 Oct
 2023 10:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <368e66df-f33f-ea8b-b380-d0920e438ee9@gmail.com>
In-Reply-To: <368e66df-f33f-ea8b-b380-d0920e438ee9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Oct 2023 10:44:52 -0700
Message-ID: <CAMKF1sr+DKb-+4TQ2=o0+RE8arqijTiPdTVoEX3fwVo+pDjMPw@mail.gmail.com>
Subject: Re: dunfell merge request: Oct 3rd
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000056a1120606d373bf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 17:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105325

--00000000000056a1120606d373bf
Content-Type: text/plain; charset="UTF-8"

Merged thanks Armin

On Tue, Oct 3, 2023 at 6:43 AM akuster808 <akuster808@gmail.com> wrote:

> The following changes since commit
> e42d1e758f9f08b98c0e8c6f0532316951bb276f:
>
>    postgresql: refresh patches (2023-09-09 12:52:03 -0400)
>
> are available in the Git repository at:
>
>    https://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to 0f10a0d394ddffeeb1db0ea94046d86792d704fe:
>
>    php: Fix CVE-2023-3824 (2023-09-30 08:55:03 -0400)
>
> ----------------------------------------------------------------
> Bhargav Das (1):
>        iperf3: Fix CVE-2023-38403
>
> Hitendra Prajapati (1):
>        wireshark: Fix CVE-2023-2906
>
> Kirill Esipov (1):
>        catch2: switch from master to v2.x branch
>
> Priyal Doshi (1):
>        open-vm-tools: Security fix for CVE-2023-20900
>
> Siddharth Doshi (1):
>        php: Fix CVE-2023-3824
>
>   meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch |
> 38 +++++++++++++++++++
>   meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb |  1 +
>   meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocation-hazard-1542-.-1543.patch
> | 46 +++++++++++++++++++++++
>   meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb |  1 +
>   meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch | 91
> ++++++++++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-devtools/php/php_7.4.33.bb |  1 +
>   .../open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch
> | 35 ++++++++++++++++++
>   meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb |  1 +
>   meta-oe/recipes-test/catch2/catch2_2.9.2.bb |  2 +-
>   9 files changed, 215 insertions(+), 1 deletion(-)
>   create mode 100644
> meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch
>   create mode 100644
>
> meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocation-hazard-1542-.-1543.patch
>   create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch
>   create mode 100644
> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML-token-signa.patch
>
>
>

--00000000000056a1120606d373bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Merged thanks Armin</div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 3, 2023 at 6:43 AM ak=
uster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The following changes=
 since commit e42d1e758f9f08b98c0e8c6f0532316951bb276f:<br>
<br>
=C2=A0=C2=A0 postgresql: refresh patches (2023-09-09 12:52:03 -0400)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded</a> dunfell-next<br>
<br>
for you to fetch changes up to 0f10a0d394ddffeeb1db0ea94046d86792d704fe:<br=
>
<br>
=C2=A0=C2=A0 php: Fix CVE-2023-3824 (2023-09-30 08:55:03 -0400)<br>
<br>
----------------------------------------------------------------<br>
Bhargav Das (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iperf3: Fix CVE-2023-38403<br>
<br>
Hitendra Prajapati (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wireshark: Fix CVE-2023-2906<br>
<br>
Kirill Esipov (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catch2: switch from master to v2.x bra=
nch<br>
<br>
Priyal Doshi (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open-vm-tools: Security fix for CVE-20=
23-20900<br>
<br>
Siddharth Doshi (1):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 php: Fix CVE-2023-3824<br>
<br>
=C2=A0=C2=A0meta-networking/recipes-support/wireshark/files/CVE-2023-2906.p=
atch | <br>
38 +++++++++++++++++++<br>
=C2=A0=C2=A0meta-networking/recipes-support/wireshark/<a href=3D"http://wir=
eshark_3.2.18.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_3.2.18.bb<=
/a> |=C2=A0 1 +<br>
=C2=A0=C2=A0meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocat=
ion-hazard-1542-.-1543.patch | 46 +++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-oe/recipes-benchmark/iperf3/<a href=3D"http://iperf3_3.7.b=
b" rel=3D"noreferrer" target=3D"_blank">iperf3_3.7.bb</a> |=C2=A0 1 +<br>
=C2=A0=C2=A0meta-oe/recipes-devtools/php/php/CVE-2023-3824.patch | 91 <br>
++++++++++++++++++++++++++++++++++++++++++++++<br>
=C2=A0=C2=A0meta-oe/recipes-devtools/php/<a href=3D"http://php_7.4.33.bb" r=
el=3D"noreferrer" target=3D"_blank">php_7.4.33.bb</a> |=C2=A0 1 +<br>
=C2=A0=C2=A0.../open-vm-tools/0001-Allow-only-X509-certs-to-verify-the-SAML=
-token-signa.patch | 35 ++++++++++++++++++<br>
=C2=A0=C2=A0meta-oe/recipes-support/open-vm-tools/<a href=3D"http://open-vm=
-tools_11.0.1.bb" rel=3D"noreferrer" target=3D"_blank">open-vm-tools_11.0.1=
.bb</a> |=C2=A0 1 +<br>
=C2=A0=C2=A0meta-oe/recipes-test/catch2/<a href=3D"http://catch2_2.9.2.bb" =
rel=3D"noreferrer" target=3D"_blank">catch2_2.9.2.bb</a> |=C2=A0 2 +-<br>
=C2=A0=C2=A09 files changed, 215 insertions(+), 1 deletion(-)<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-networking/recipes-support/wireshark/files/CVE-2023-2906.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-oe/recipes-benchmark/iperf3/iperf3/0001-Fix-memory-allocation-hazard-1=
542-.-1543.patch<br>
=C2=A0=C2=A0create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2023-38=
24.patch<br>
=C2=A0=C2=A0create mode 100644 <br>
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Allow-only-X509-ce=
rts-to-verify-the-SAML-token-signa.patch <br>
<br>
</blockquote></div></div>

--00000000000056a1120606d373bf--


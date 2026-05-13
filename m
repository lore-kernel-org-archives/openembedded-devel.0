Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8194CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:22:28 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.269.1778646139585403366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jHGy1rlO;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64d5a7926cfso5883089d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 21:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778646139; cv=none;
        d=google.com; s=arc-20240605;
        b=ae195rDeFaJ8E7B8+J5ONKtt2WvcLtuE8Ya08a1EnnZdrUlk10mqlt8kIBScaiHoXz
         ZFaGy2EQbuXPhu4A+wvb/ZMF+EMMQD8IM9SnkprgtknjgJHrbKDFP9YxeqnFxwPEI0H3
         fIuKmWe9SjfiovHFLd3jXEmNnd7dN2qmIN0c3Jgqe4ZZK8bYm1/5DjHa+1plHKOpPj5+
         skZu90en6VH0/NExxGeBr7jRwY3SqHutfNiPoIqQNceppXGr80dep6KTWzKan00gXzbZ
         PMmnIcRaoH1dwCmCr4tgqZvIHW4Nx3zYTE9ZVCityenWWiyzgIi5n0gNrutpAalgynet
         /V3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IvjCdOB+4O9PoyJBzhTZkBHvxJx89AW4q5/U/u7+HKk=;
        fh=x4G9YHSntyZXDj08KtmJ2w3MTCEibcvnYP/K47cOljc=;
        b=kk0PAo1D7zOnIujJ2g3F/kLpa16DvDviH1R0+WLqW3gT6qwKoJRWW6/04sQ3dndEDU
         7c2yBGYXQW5rFqbXHdG94jskZe66uL29CBPpn6lSSwvRT6PdCWz35p/XQKAQ4EIs7pWP
         +H1oQx1JsYbL8bTp8v866XtAQGuUfpLHwS0P05NoGeoyLLCgpJkneWWCKd8nk3IMxBiC
         VT4jtxQ1HHqfcK2HIf+rRzMGoOwzBH2rLALLDmoZTps7oC3BVG+C/FSFlZuBIFjCmn+A
         zijx3tGEoTB2Ls5r2HSVgrLQRDXBH28T03CWF3HIpbSYmMxlcwJ4nwt2ZxEihSUk539D
         MhJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778646139; x=1779250939; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IvjCdOB+4O9PoyJBzhTZkBHvxJx89AW4q5/U/u7+HKk=;
        b=jHGy1rlOkzyhJKDWY1fNjVgqSO9/oHbObilqiviI72x9yTu6ta37DERCzMPMZZcZJO
         JtlzlQNXW5esIxkSrDgzoL8MKJObYuUMRwlMbn03VhgmHIpBDMcM2sIQIfTP/PpNm/YW
         jMU5V/GmAdUm4quqEzwOQ4rOQNMUg8wx32vJfRAaeX5RmyTvKkU6U+iVO829wxvf9qAI
         UC2GhrNk7KFmlfSrUwfcGHXMSmy9qADHiTa4gGT+8hjZy5Xhg//cPxkJ9L34X2W4jlwa
         Q3ga/NRR1VqApA6gfjtl5u+kv0w9RMZiQtjIaTectq06wk2XLmKC+whvFU61ERCbwitn
         KYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778646139; x=1779250939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvjCdOB+4O9PoyJBzhTZkBHvxJx89AW4q5/U/u7+HKk=;
        b=YhmfTfiJ5wa/ycaTQ4NIZPAXbkhTaNDsjfNp2gAHshe7V0ItgEQg3XFfgxPCE/hwBl
         z/LpczU7w6vwp6XuIo///zSKyC8DV8hnwB6XXkiv5co2WR4Wz4rKG89VYuj9WpbV5oq8
         P9LCnyX4qC2sjFFFqMcxbpXyvBKspDWa+rhF7w6X7M041EmxVmkj+4BsFb9hDV08VwUF
         fsIQo3U06ZvVOFukSnbzXwrpYA2hhVcp/7LCLA8ykpXnYwqYc80+5H9ZF7PQNgInXD2F
         IyypW3IEuGWP2+DZtbPVk2cYvqMwUmfGVWEdTg0HrrYUKaUz/jQsPpRUR7qTTHJsPQdG
         sNVg==
X-Gm-Message-State: AOJu0YwSpMFONRik5cFWN+qFPH+vGQghoDl5bB5f57VCENnYrcPRPwJT
	oE5YSwI9Beg0KSXrB1QqOX+oJsKjihsrHb3eFRP42FCR/E/uC9pOpgI+DTSocTgGJnjqD0dYTHl
	F2qJyQsfAdg7oaQTqKW0+om+5Et+YM4S2csMYOUZ4eA==
X-Gm-Gg: Acq92OHFKWfu3IQEHDjrrqlpAQ1C7UFzl9UEWzAMQ5waX4N2Tp46tsHVevqT4X41mMj
	tDgygHg9xKwBrz3DrI1hq2VoFBX8LtHYuvVEwOCUGOENs2ZU7fk2IBTXsE9s9CU742E4btvhoDu
	spVj2agzcAxq9HgvT0VNVqU6AvZfAmy5jGQSDXBPSTWfISWmGlXr3gRPBbC3lkqzvjnnuDHsnfn
	mEl4/yCjM1y17IOum+CMBaCN0GNwoSgqc+I7HgWCG+4T7f4JfWyinfpo0DvDXD5UmlOJKtNl3X8
	vIUoreueFMo1X5UbfWxf7LTBxl+eFJhtaitzMGPlgLwVirMOABE1HcKFFbDVs5kMX+NCNSMUcsx
	wceIk1hGKrdVmgmwtKqI18fHtRRGWv0zKmqhm1VvBtFkKRRK3BSCGe+W7QGqbuR0B4Urv9PfNy8
	qLk37c
X-Received: by 2002:a05:690e:d56:b0:654:1261:8ba4 with SMTP id
 956f58d0204a3-65df814dc87mr1025132d50.19.1778646138604; Tue, 12 May 2026
 21:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260506172256.1259293-1-piotr.wejman@arm.com>
In-Reply-To: <20260506172256.1259293-1-piotr.wejman@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2026 21:21:52 -0700
X-Gm-Features: AVHnY4IBTHpmWnUFuWNSosK8fXlnvm47hQZ7IAGw2OqL0BvaKSAkJlbkMlo86dM
Message-ID: <CAMKF1sqDsN9onLMvE9rOsQ9bFLCvYnAk1V0w+Ad-GVaVmdYKuA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] nftables: add systemd PACKAGECONFIG
To: Piotr Wejman <piotr.wejman@arm.com>
Cc: openembedded-devel@lists.openembedded.org, joe@deserted.net, 
	ross.burton@arm.com, vincent.mailhol@arm.com
Content-Type: multipart/alternative; boundary="00000000000045d0cb0651ab5390"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126943

--00000000000045d0cb0651ab5390
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing this error
https://errors.yoctoproject.org/Errors/Details/938664/

Seems to be related to this patch

On Wed, May 6, 2026 at 10:24=E2=80=AFAM Piotr Wejman <piotr.wejman@arm.com>=
 wrote:

> Add a systemd PACKAGECONFIG option to install nftables systemd unit files=
.
> When "systemd" is present in DISTRO_FEATURES, the option is enabled and
> the service is installed but disabled by default.
>
> Signed-off-by: Piotr Wejman <piotr.wejman@arm.com>
> ---
>  meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> index d27e60a18d..dbe0e8f9f5 100644
> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
> @@ -16,9 +16,9 @@ SRC_URI =3D "
> http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
>            "
>  SRC_URI[sha256sum] =3D
> "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
>
> -inherit autotools manpages pkgconfig ptest python3native
> +inherit autotools manpages pkgconfig ptest python3native systemd
>
> -PACKAGECONFIG ?=3D "python readline json"
> +PACKAGECONFIG ?=3D "python readline json
> ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[editline] =3D "--with-cli=3Deditline, , libedit, , , linen=
oise
> readline"
>  PACKAGECONFIG[json] =3D "--with-json, --without-json, jansson"
>  PACKAGECONFIG[linenoise] =3D "--with-cli=3Dlinenoise, , linenoise, , ,
> editline readline"
> @@ -27,10 +27,14 @@ PACKAGECONFIG[mini-gmp] =3D "--with-mini-gmp,
> --without-mini-gmp"
>  PACKAGECONFIG[python] =3D ""
>  PACKAGECONFIG[readline] =3D "--with-cli=3Dreadline, , readline, , , edit=
line
> linenoise"
>  PACKAGECONFIG[xtables] =3D "--with-xtables, --without-xtables, iptables"
> +PACKAGECONFIG[systemd] =3D "--with-unitdir=3D${systemd_system_unitdir},
> --without-unitdir"
>
>  EXTRA_OECONF =3D " \
>      ${@bb.utils.contains_any('PACKAGECONFIG', 'editline linenoise
> readline', '', '--without-cli', d)}"
>
> +SYSTEMD_SERVICE:${PN} =3D "nftables.service"
> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
> +
>  PEP517_SOURCE_PATH =3D "${S}/py"
>
>  # xtables will need it on musl see iptables
>

--00000000000045d0cb0651ab5390
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seeing this error<div><a href=3D"https://errors.yoctoproje=
ct.org/Errors/Details/938664/">https://errors.yoctoproject.org/Errors/Detai=
ls/938664/</a></div><div><br></div><div>Seems to be related to this patch</=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Wed, May 6, 2026 at 10:24=E2=80=AFAM Piotr Wej=
man &lt;<a href=3D"mailto:piotr.wejman@arm.com">piotr.wejman@arm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add a s=
ystemd PACKAGECONFIG option to install nftables systemd unit files.<br>
When &quot;systemd&quot; is present in DISTRO_FEATURES, the option is enabl=
ed and<br>
the service is installed but disabled by default.<br>
<br>
Signed-off-by: Piotr Wejman &lt;<a href=3D"mailto:piotr.wejman@arm.com" tar=
get=3D"_blank">piotr.wejman@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-filter/nftables/<a href=3D"http://nftables_1.=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a> | 8 ++++=
++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-filter/nftables/<a href=3D"http://nfta=
bles_1.1.6.bb" rel=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a> b=
/meta-networking/recipes-filter/nftables/<a href=3D"http://nftables_1.1.6.b=
b" rel=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a><br>
index d27e60a18d..dbe0e8f9f5 100644<br>
--- a/meta-networking/recipes-filter/nftables/<a href=3D"http://nftables_1.=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a><br>
+++ b/meta-networking/recipes-filter/nftables/<a href=3D"http://nftables_1.=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">nftables_1.1.6.bb</a><br>
@@ -16,9 +16,9 @@ SRC_URI =3D &quot;<a href=3D"http://www.netfilter.org/pro=
jects/nftables/files/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank"=
>http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;372931bda8556b310636a2f9020adc710f9bab66=
f47efe0ce90bff800ac2530c&quot;<br>
<br>
-inherit autotools manpages pkgconfig ptest python3native<br>
+inherit autotools manpages pkgconfig ptest python3native systemd<br>
<br>
-PACKAGECONFIG ?=3D &quot;python readline json&quot;<br>
+PACKAGECONFIG ?=3D &quot;python readline json ${@bb.utils.filter(&#39;DIST=
RO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[editline] =3D &quot;--with-cli=3Deditline, , libedit, ,=
 , linenoise readline&quot;<br>
=C2=A0PACKAGECONFIG[json] =3D &quot;--with-json, --without-json, jansson&qu=
ot;<br>
=C2=A0PACKAGECONFIG[linenoise] =3D &quot;--with-cli=3Dlinenoise, , linenois=
e, , , editline readline&quot;<br>
@@ -27,10 +27,14 @@ PACKAGECONFIG[mini-gmp] =3D &quot;--with-mini-gmp, --wi=
thout-mini-gmp&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-cli=3Dreadline, , readline, =
, , editline linenoise&quot;<br>
=C2=A0PACKAGECONFIG[xtables] =3D &quot;--with-xtables, --without-xtables, i=
ptables&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;--with-unitdir=3D${systemd_system_unitdir=
}, --without-unitdir&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains_any(&#39;PACKAGECONFIG&#39;, &#39;=
editline linenoise readline&#39;, &#39;&#39;, &#39;--without-cli&#39;, d)}&=
quot;<br>
<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;nftables.service&quot;<br>
+SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;disable&quot;<br>
+<br>
=C2=A0PEP517_SOURCE_PATH =3D &quot;${S}/py&quot;<br>
<br>
=C2=A0# xtables will need it on musl see iptables<br>
</blockquote></div>

--00000000000045d0cb0651ab5390--


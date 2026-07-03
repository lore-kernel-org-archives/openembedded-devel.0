Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3B2C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 06:15:47 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86557.1783059337724463122
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 23:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kfMA7Dm5;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6663b4fe293so170752d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 23:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783059337; cv=none;
        d=google.com; s=arc-20260327;
        b=GDsw4Iw2vnXOGR4voy2VIXvYfCL18wFP9fznzmLW4nvmoTSPwvLbnMxOnLb7QmzCMf
         9EtdWvce5VazWux+fkPKkCJpwkOMRPkb0FAu88XWxwrmS+joQSeTuAKLKNvLgJtbXt5I
         kSEdJKuAHVnBaFo1d/1ObwI+LdAe0r1h5r+BEuqcHTk8Xn1mTTkADDt/deIrHV7LidcL
         v2MUUCLqV84Yi5nrnzqtNH9oUKIn+GEilMOCBbMhVeLUyXKVUPa5w5UwbA9yAPxN0322
         vLF5THhWBaOGLJo1fffIc0sDcthx96gHNF2l1+vG8AcSO9zYjL5PbYlAvJEMFpdo6sey
         Q9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=butXsz7bP52j8bHptxY4s6oUkNYrrN6f4BnN49pfEE8=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=Eg8OEjraqCbZIAMOPPCKWE9uHExxvucC9wUaX0HypPKad9GoAyscb/LV6iED7znXiS
         w7fgPkQ4Rp8un6RQDGFHhOtjlaslSwQEvSmcHwuY3zQdDvhome1elZE2kLTIaYCbGCl1
         5TkN2ohrwu8ty6jX/TEwjvnG2/mY+hpc55IyyV02NQjK+AmaSIn+1mkUg/EAuHtxLFRu
         NyOUvgzs72lAI/1zgN0IGaGiB9lSt6gEUM9s7dNZDL4P3W7m5pOrG+74XBjiNHa37HLQ
         bVF9PWh54YiMF7l3rUPfiEblhznRE/KUAfRVtxcP1LMCpKoTT9KgdATU+VHh6YR4muay
         eQaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783059337; x=1783664137; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=butXsz7bP52j8bHptxY4s6oUkNYrrN6f4BnN49pfEE8=;
        b=kfMA7Dm51dHbWuZDhCo1AS1TOFzIi8g2BwoiZqvExlrGtb0uHPrfERzYl3EPwi6zTu
         Fhv1mUUFvIJpgBnjXhz/Eyil1/wrEGDydPvOHF2lFAmmPWdJFRvd5OIAJYUZyy4Xfg5B
         eMFW2dtLjzbmcBI8JhfRFj3M3u/ua7utJluGM0Xn5u+6b+LBBqZdnFlQWRsLx1Z3OnFs
         n9APudX9ziuNpTKjPzIAjsXcwCYxxq1wdlEIUBekK1IjkCLQxYvU7DXvUxQk/3DGLjHN
         gCjYU5WpqHciLm5j4x8fBgWKgVH8cBWocaK3oaPTMCYs6TVvu0QUrzBzXqUSB1WYeH8v
         NXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783059337; x=1783664137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=butXsz7bP52j8bHptxY4s6oUkNYrrN6f4BnN49pfEE8=;
        b=jnDSONGyuUwAfWSY3sD7EAG+QB1LixmXrZ7iM0v5sRPltuIlVLf0o9k8PrukqMt0uZ
         WCN6XrQOVc0YR6cGWcFRoR4HZWiRHYzNEhFJcJ+NzwWFIKLi1/CwgTi/Umld4lq76NwG
         ZH5rFmsv24scpNojWBBBXF7CBRULyxbn5zERbHoT5mvQUpc4bxqMB7gfQQZ7PdjC+q/e
         0iVKzh0cFipJF9WxOb86f3aongKLClo10HDXaATtnlbM65KHPFVAXGvZ/D+BHllTlPHN
         sl2ugGq9n4J3H9GvtYR3vrIJ4xkFRy9rC3GmsQyoo0TQjVfhvfxds1eOWmVV7xJqkaAI
         CCzw==
X-Gm-Message-State: AOJu0YxpiBHwMreKq44oOR3FnQv05euU4dHtFySSdoiH5E+S8fr8TN9B
	0pupk/PWMY7MGRb/qK51QciywuR8E4jsR1UJya1s1ps7ypOb+NjJBgxA5ABNXIgwSsvKpm7DMV1
	TWjUuIcZ9ATBJv4SBHN5eeJdBFPoP3vQ=
X-Gm-Gg: AfdE7cndREzYPYtZquvB7NWywO+VDX3rvhccgmQXEVNs6A1MN6FcLYtvCnBpa5GkP/u
	YwZSInHz7Hldp7qVT8MbWGHm/gi+EZjaiwZpRVzC5AP687Y8SC4dy5rCNg4TOpZJzdYKocgcHBc
	WYEcGv7jntdjwVOpgDC81qCLNLJdfpgtNCpbTKQUZKdHCGSYY0jcU4T34WzDZZ2UgHEkqSdEK1M
	6aWBJD7SqltxNI8AwApMPLzQxMNq67vGofoCJSl7lCVLzCd3Qr0sTPKxa/6E/uiEf7Gi8ThX21v
	GesoaD8zbn5JSzxHRHIbZrmv2fbQltmMgQXqGaeud/CRueQi0oYn60JMCqSTMABWkO90KZ1JONC
	gtQebYEyVZJsAuiDJQqM+pCsTppqn5eMxWBoP+9i+KfjoREllCdGxLN58wpdm0gg/1ldGZp/MLo
	GOnHQGbMM=
X-Received: by 2002:a05:690e:190e:b0:663:9a0a:7b80 with SMTP id
 956f58d0204a3-665219eb176mr8172467d50.19.1783059336333; Thu, 02 Jul 2026
 23:15:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782985880.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1782985880.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jul 2026 23:15:09 -0700
X-Gm-Features: AVVi8Cd76WOJYFEG_HtfV4h72fdSgS1IHmtsGppxt_z2cRjc0p4NoT2w_iDy7qI
Message-ID: <CAMKF1sofs-nPn+9CrcFDfDGi37UcLc_-2JRNfNt1kLV-SjmrYw@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/16] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005b0be00655aeda5d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 06:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128004

--0000000000005b0be00655aeda5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good. merged now. Thanks Anuj

On Thu, Jul 2, 2026 at 3:45=E2=80=AFAM Anuj Mittal via lists.openembedded.o=
rg
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autobuilde=
r.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1592
>
> The following changes since commit
> b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:
>
>   nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 29a044218285fdc7fcdd63d5f0929cb3a27b6fed:
>
>   python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)
>
> ----------------------------------------------------------------
>
> Anuj Mittal (1):
>   python3-matplotlib: fix build
>
> Li Zhou (1):
>   haveged: upgrade 1.9.18 -> 1.9.20
>
> Nitin Wankhade (6):
>   strongswan: Fix CVE-2026-35328
>   strongswan: Fix CVE-2026-35329
>   strongswan: Fix CVE-2026-35330
>   strongswan: Fix CVE-2026-35331
>   strongswan: Fix CVE-2026-35332
>   strongswan: Fix CVE-2026-35333
>
> Shubham Pushpkar (5):
>   jq: Fix CVE-2026-40612
>   jq: Fix CVE-2026-41256
>   jq: Fix CVE-2026-41257
>   jq: Fix CVE-2026-43894
>   jq: Fix CVE-2026-43896
>
> Theo Gaige (Schneider Electric) (1):
>   nginx: patch CVE-2026-48142
>
> Venkatasainath Ravikanti (1):
>   syslog-ng: update config version to match installed binary
>
> Wang Mingyu (1):
>   haveged: upgrade 1.9.20 -> 1.9.22
>
>  ...-insensitive-matching-and-reject-exc.patch | 176 ++++++++++++++++++
>  ...-undersized-attributes-in-enumerator.patch |  41 ++++
>  ...t-zero-length-EAP-SIM-AKA-attributes.patch |  54 ++++++
>  ...d-NULL-pointer-dereference-when-veri.patch |  58 ++++++
>  ...accept-non-empty-ECDH-public-keys-wi.patch |  51 +++++
>  ...nt-infinite-loop-if-supported-versio.patch |  42 +++++
>  .../strongswan/strongswan_5.9.14.bb           |   6 +
>  .../jq/jq/CVE-2026-40612.patch                | 153 +++++++++++++++
>  .../jq/jq/CVE-2026-41256.patch                |  54 ++++++
>  .../jq/jq/CVE-2026-41257.patch                |  57 ++++++
>  .../jq/jq/CVE-2026-43894.patch                |  56 ++++++
>  .../jq/jq/CVE-2026-43896.patch                |  97 ++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   5 +
>  .../{haveged_1.9.18.bb =3D> haveged_1.9.22.bb}  |   3 +-
>  .../syslog-ng/files/syslog-ng.conf.systemd    |  11 +-
>  .../syslog-ng/files/syslog-ng.conf.sysvinit   |   9 +-
>  .../matplotlib-disable-download.patch         |  34 +++-
>  .../python/python3-matplotlib_3.7.2.bb        |   4 +-
>  .../nginx/nginx-1.24.0/CVE-2026-48142.patch   |  43 +++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
>  20 files changed, 938 insertions(+), 17 deletions(-)
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/constraints-Case-in=
sensitive-matching-and-reject-exc.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-un=
dersized-attributes-in-enumerator.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-ze=
ro-length-EAP-SIM-AKA-attributes.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-N=
ULL-pointer-dereference-when-veri.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-acc=
ept-non-empty-ECDH-public-keys-wi.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-=
infinite-loop-if-supported-versio.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.18.bb =3D>
> haveged_1.9.22.bb} (93%)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128000):
> https://lists.openembedded.org/g/openembedded-devel/message/128000
> Mute This Topic: https://lists.openembedded.org/mt/120081049/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005b0be00655aeda5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good. merged now. Thanks Anuj</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Jul 2, 2026 at 3:45=E2=80=AFAM Anuj Mittal via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=
=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Please merge these changes in scarthgap. Tested locally and=
 on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1592" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1592</a><br>
<br>
The following changes since commit b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9=
:<br>
<br>
=C2=A0 nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)<br=
>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 29a044218285fdc7fcdd63d5f0929cb3a27b6fed:<br=
>
<br>
=C2=A0 python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 python3-matplotlib: fix build<br>
<br>
Li Zhou (1):<br>
=C2=A0 haveged: upgrade 1.9.18 -&gt; 1.9.20<br>
<br>
Nitin Wankhade (6):<br>
=C2=A0 strongswan: Fix CVE-2026-35328<br>
=C2=A0 strongswan: Fix CVE-2026-35329<br>
=C2=A0 strongswan: Fix CVE-2026-35330<br>
=C2=A0 strongswan: Fix CVE-2026-35331<br>
=C2=A0 strongswan: Fix CVE-2026-35332<br>
=C2=A0 strongswan: Fix CVE-2026-35333<br>
<br>
Shubham Pushpkar (5):<br>
=C2=A0 jq: Fix CVE-2026-40612<br>
=C2=A0 jq: Fix CVE-2026-41256<br>
=C2=A0 jq: Fix CVE-2026-41257<br>
=C2=A0 jq: Fix CVE-2026-43894<br>
=C2=A0 jq: Fix CVE-2026-43896<br>
<br>
Theo Gaige (Schneider Electric) (1):<br>
=C2=A0 nginx: patch CVE-2026-48142<br>
<br>
Venkatasainath Ravikanti (1):<br>
=C2=A0 syslog-ng: update config version to match installed binary<br>
<br>
Wang Mingyu (1):<br>
=C2=A0 haveged: upgrade 1.9.20 -&gt; 1.9.22<br>
<br>
=C2=A0...-insensitive-matching-and-reject-exc.patch | 176 +++++++++++++++++=
+<br>
=C2=A0...-undersized-attributes-in-enumerator.patch |=C2=A0 41 ++++<br>
=C2=A0...t-zero-length-EAP-SIM-AKA-attributes.patch |=C2=A0 54 ++++++<br>
=C2=A0...d-NULL-pointer-dereference-when-veri.patch |=C2=A0 58 ++++++<br>
=C2=A0...accept-non-empty-ECDH-public-keys-wi.patch |=C2=A0 51 +++++<br>
=C2=A0...nt-infinite-loop-if-supported-versio.patch |=C2=A0 42 +++++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.14.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0.../jq/jq/CVE-2026-40612.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 153 +++++++++++++++<br>
=C2=A0.../jq/jq/CVE-2026-41256.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++++++<br>
=C2=A0.../jq/jq/CVE-2026-41257.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 57 ++++++<br>
=C2=A0.../jq/jq/CVE-2026-43894.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 56 ++++++<br>
=C2=A0.../jq/jq/CVE-2026-43896.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 97 ++++++++++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.7.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.7.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 +<br>
=C2=A0.../{<a href=3D"http://haveged_1.9.18.bb" rel=3D"noreferrer" target=
=3D"_blank">haveged_1.9.18.bb</a> =3D&gt; <a href=3D"http://haveged_1.9.22.=
bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.22.bb</a>}=C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0.../syslog-ng/files/syslog-ng.conf.systemd=C2=A0 =C2=A0 |=C2=A0 11 +-=
<br>
=C2=A0.../syslog-ng/files/syslog-ng.conf.sysvinit=C2=A0 =C2=A0|=C2=A0 =C2=
=A09 +-<br>
=C2=A0.../matplotlib-disable-download.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 34 +++-<br>
=C2=A0.../python/<a href=3D"http://python3-matplotlib_3.7.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-matplotlib_3.7.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-48142.patch=C2=A0 =C2=A0|=C2=A0 43 ++=
+++<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A020 files changed, 938 insertions(+), 17 deletions(-)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/constraints-Case-insensitive-matching-and-reject-exc.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/libradius-Reject-undersized-attributes-in-enumerator.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/tls-server-Prevent-infinite-loop-if-supported-versio.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patc=
h<br>
=C2=A0rename meta-oe/recipes-extended/haveged/{<a href=3D"http://haveged_1.=
9.18.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.18.bb</a> =3D&gt;=
 <a href=3D"http://haveged_1.9.22.bb" rel=3D"noreferrer" target=3D"_blank">=
haveged_1.9.22.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-48142.patch<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128000): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128000" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128000</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120081049/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120081049/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005b0be00655aeda5d--


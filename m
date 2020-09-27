Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web10.14967.1601219771368736717
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 08:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/ZU7jKt;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id s19so2025152plp.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2020 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PFKma6EqM8bAJJrlXlOGtBRz0VefgDZ022rEKXadbU0=;
        b=A/ZU7jKt7ODTu7knnlX5UERZZ1B4/8W/f0tsUKS2hCJJSMInZLHfSb1aytOXO5ZDwq
         ozBrf6265B9Pb/Hgz3iKlshS8PZkqCqEL0SF6OZ2newgf2bpkLKbO1kwHoFKJtEX+pCm
         hSaosnFbpOj53NXwAvYJNk1ECxrdzPtjd9Kz3zh9XYK95BGsGFBqwRseiap1W0Li0wBA
         VIE9BCiEcVzx8nnfTJLRTUUzxjeoS4EhYXtBMTMBwtjRjBdpbOxa/83Dp3EApPgVJaZn
         1G2+A1h16XwxVigN2c3e8ypuPQZT+Hw0uGANywB/JZQIw3/46BD2/ehkyL1D7qfcZgkx
         bWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PFKma6EqM8bAJJrlXlOGtBRz0VefgDZ022rEKXadbU0=;
        b=eG75FjISCUJUucpXjS0bxUf1JPT8T+yu5CAS0NRWAb/Tn/5wSc/tYbRBL3aun42VX9
         zwXOf1FN748f42d76SnNMCpowJFBgJp/NnQpRpidtjtFmD6xx0TAo0c9SelO7YvQm97P
         EAXwpTcRc8FY41ebJg+ETDiSiaWxcakq75cpCR6AjQH5EV83PauvxOTZ+gQUtEMEL1vQ
         2Rb8OBEDmZDp2v51osllLQilkrqDHrMJH63IEBjmc1eA0UA8v5VfMYPXx0KJQlKaT0GV
         Op3l4sb8KFET9Vya0sXu73OpjAGC/vL/WQhkQBhm4oKO665cXs+G/Zj3uUiogTmA/5lo
         jLUQ==
X-Gm-Message-State: AOAM5338Mx3Bw3ExZ+nVGICQPHJG9fc2z+ydatCUfCbb2Z2ctyJime7g
	ehYmHxU8RBba6CDlAdA3pwetM/o7DgaqA9l/2Jc=
X-Google-Smtp-Source: ABdhPJyLim/LardsQCyhjgFb88Shqeg9+fnhZ5A6LZ2n3MFVhagHLw506vwDne7yjKtHFo4fUEEIuZ1T6w5jdH05/l8=
X-Received: by 2002:a17:902:ee02:b029:d1:8c50:aa73 with SMTP id
 z2-20020a170902ee02b02900d18c50aa73mr8064470plb.42.1601219770878; Sun, 27 Sep
 2020 08:16:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200924093539.23693-1-kai.kang@windriver.com>
 <CALbNGRS_hYCpvLcnsdXL9Pj-gFx0vGEGHgxyBVJonKTfPE8VOA@mail.gmail.com> <92d5d20b-4c01-80ce-0ea5-56428cd08a28@windriver.com>
In-Reply-To: <92d5d20b-4c01-80ce-0ea5-56428cd08a28@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 27 Sep 2020 17:15:59 +0200
Message-ID: <CALbNGRRy6mSg+Hu4fv0kC+-oYxCOuct30apOYpP0rjgrM-E-eA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] crda: rdepends on wireless-regdb-static
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 2:52 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 9/25/20 5:36 AM, Andreas M=C3=BCller wrote:
>
> On Thu, Sep 24, 2020 at 11:36 AM kai <kai.kang@windriver.com> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The wireless-regdb has been moved to oe-core. According the commit
> message:
>
> wireless-regdb-static should be used with kernel >=3D 4.15.
> wireless-regdb can be used with older kernels and is mostly
> irrelevant here, but keeping it in meta-networking would
> create needless recipe duplication.
>
> it should replace runtime dependency wireless-regdb with
> wireless-regdb-static.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/crda/crda_3.18.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/crda/crda_3.18.bb b/met=
a-networking/recipes-connectivity/crda/crda_3.18.bb
> index b380eaf94..e59d2f437 100644
> --- a/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> +++ b/meta-networking/recipes-connectivity/crda/crda_3.18.bb
> @@ -35,4 +35,4 @@ do_install() {
>      oe_runmake SBINDIR=3D${sbindir}/ install
>  }
>
> -RDEPENDS_${PN} =3D "udev wireless-regdb"
> +RDEPENDS_${PN} =3D "udev wireless-regdb-static"
>
> It was wrong/at least dangerous before this - but the operator '+=3D'
> should be used
>
> Hi Andreas,
>
> Thanks for your comment.
>
> I do not get your point why it is dangerous. From output of 'bitbake -e c=
rda', RDEPENDS_crda is evaluated by:
>
> # $RDEPENDS_crda [2 operations]
> #   set /buildarea6/kkang/Yocto/meta-openembedded/meta-networking/recipes=
-connectivity/crda/crda_3.18.bb:38
> #     "udev wireless-regdb-static"
> #   rename from RDEPENDS_${PN} data.py:104 [expandKeys]
> #     "udev wireless-regdb-static"
> # pre-expansion value:
> #   "udev wireless-regdb-static"
> RDEPENDS_crda=3D"udev wireless-regdb-static"
>
> It does not show differences compares to other recipes that "RDEPENDS_${P=
N} =3D" widely used.
>
I could swear there were times that just using '=3D' overided the
RDEPNEDS done by ldd-like-magic. Checked in pkgdata: the results are
the same. So: Sorry for the noise

Andreas

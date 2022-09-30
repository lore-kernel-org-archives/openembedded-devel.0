Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B355C433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:21:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.3989.1664533295564474060
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=N9pI2mX4;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.167.49,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-lf1-f49.google.com with SMTP id bu25so6191934lfb.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jaL688inkqP3WD6LAYZZ7d7Mdk+8CwK6utHa+x/SH6w=;
        b=N9pI2mX4fyUviD9QkZ1j15szfx42+ZGPlG0cFk5kfuul3j/0b8IUNbxf/2Ur3K0ni9
         NPDsWNOPbUWf/FRSJlRpkaadMEi6jzvuKyL1h8h1CL9OEY0pK/2RWAFM9DTYaYk2rPTc
         qlE1+i4zlaDBPgfUfzFjPHtbJo6KFE+0KVQDtvIQtZanFQY6cIZV7FeFGfCXn7qBBQKG
         YiFrds29ncJnk3Rj5xWs05dw3ZkjQ6RZrxWK/Y7R4aiH0mm66GTjF00xPOI7BV98SaiK
         s3/kwJTl/UFpXDcPK6abruW7Cn4u3wSNDqSBmKdEYujaEFQyXVvwIBEc9ZkooiU784JD
         ji3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jaL688inkqP3WD6LAYZZ7d7Mdk+8CwK6utHa+x/SH6w=;
        b=i2dZ7VbHOYdNZ8LjGd8ozQJ2J4eVHdR5ZpkLKMPbYsIhE+wl/m983Z2B79NSbhSACL
         91E5EFm+xEplkdfnKuVKDHF+3xdQKU/oQjt4hnlnANVfPMkb/3zvpyrzxSSCn841tRHI
         mkQKnImuZQ5ckMaolOjdeHzngaau9imQCwEiV0dkUp5rwA93fI7GAF70F57VxKuZk/uQ
         xcNw22S+otJYFVYas4fcVXw060SpplbxTmD4znvFj0j0CiC/4nVGkH+8r/jwsP9ZkqfD
         cvek2euwkhd0mNeU8iFrFOcm8teBH89l1jEki7ZqNw+7o3i6Bkgr6prVT9wgLG9zfbQe
         Hd8g==
X-Gm-Message-State: ACrzQf3sHnAgFzfKLHQ2TyzhYiuI08PkCA39gSdAaW1W8EkQupiNCVNn
	Uwb3mwDUYAuZHeIAcbPfl3tNoa+tkWMSGiPoENWdzQ==
X-Google-Smtp-Source: 
 AMsMyM7qGmnpPiUaCw5b6jdF1Cdc5VOuO7eW5XGgkohGt0Q82izr2zftOU7bx2vJtM9DdrY/SG1AinpGar4KN7d+DJ0=
X-Received: by 2002:ac2:5208:0:b0:497:aadf:eac7 with SMTP id
 a8-20020ac25208000000b00497aadfeac7mr3246972lfl.315.1664533293422; Fri, 30
 Sep 2022 03:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <17199BE6DFF1463E.8075@lists.openembedded.org>
 <17199C08D0D01895.8075@lists.openembedded.org>
In-Reply-To: <17199C08D0D01895.8075@lists.openembedded.org>
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
Date: Fri, 30 Sep 2022 12:21:22 +0200
Message-ID: 
 <CAHEaGdZzHy3+8tn3_F-8=zuXBYr6v7AWzfMtD2ad89Z=EXfMew@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager: Update to 1.22.16
To: mathieu.dubois-briand@hyprua.org
Cc: openembedded-devel@lists.openembedded.org,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Content-Type: multipart/alternative; boundary="000000000000abfdde05e9e25b13"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 10:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99023

--000000000000abfdde05e9e25b13
Content-Type: text/plain; charset="UTF-8"

Sorry, I completely messed-up the topic here, it was supposed to be
[meta-networking][dunfell][PATCH].

Sorry for that.

On Fri, 30 Sept 2022 at 12:18, Mathieu Dubois-Briand via
lists.openembedded.org <mathieu.dubois-briand=
hyprua.org@lists.openembedded.org> wrote:

> Update network manager stable branch to last version, allowing to fix
> CVE-2020-10754.
> ---
>  .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb}   | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/networkmanager/{
> networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (98%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> similarity index 98%
> rename from meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> rename to meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> index 33a2b7c0ce93..a28372dd1f9e 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.10.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.22.16.bb
> @@ -33,11 +33,12 @@ SRC_URI_append_libc-musl = " \
>      file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
>      file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
>  "
> -SRC_URI[sha256sum] =
> "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
> +SRC_URI[sha256sum] =
> "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
>
>  S = "${WORKDIR}/NetworkManager-${PV}"
>
>  EXTRA_OECONF = " \
> +    --disable-firewalld-zone \
>      --disable-ifcfg-rh \
>      --disable-more-warnings \
>      --with-iptables=${sbindir}/iptables \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99022):
> https://lists.openembedded.org/g/openembedded-devel/message/99022
> Mute This Topic: https://lists.openembedded.org/mt/94013338/6035482
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> mathieu.dubois-briand@hyprua.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000abfdde05e9e25b13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I completely messed-up the topic here, it was =
supposed to be [meta-networking][dunfell][PATCH].</div><div><br></div><div>=
Sorry for that.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, 30 Sept 2022 at 12:18, Mathieu Dubois-Bria=
nd via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;mathieu.dubois-briand=3D<a href=3D"mailto:hyprua.org@lists.openembedde=
d.org">hyprua.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Update network manager stable branc=
h to last version, allowing to fix<br>
CVE-2020-10754.<br>
---<br>
=C2=A0.../{<a href=3D"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" =
target=3D"_blank">networkmanager_1.22.10.bb</a> =3D&gt; <a href=3D"http://n=
etworkmanager_1.22.16.bb" rel=3D"noreferrer" target=3D"_blank">networkmanag=
er_1.22.16.bb</a>}=C2=A0 =C2=A0| 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
=C2=A0rename meta-networking/recipes-connectivity/networkmanager/{<a href=
=3D"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">=
networkmanager_1.22.10.bb</a> =3D&gt; <a href=3D"http://networkmanager_1.22=
.16.bb" rel=3D"noreferrer" target=3D"_blank">networkmanager_1.22.16.bb</a>}=
 (98%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/networkmanager/<a href=3D=
"http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">net=
workmanager_1.22.10.bb</a> b/meta-networking/recipes-connectivity/networkma=
nager/<a href=3D"http://networkmanager_1.22.16.bb" rel=3D"noreferrer" targe=
t=3D"_blank">networkmanager_1.22.16.bb</a><br>
similarity index 98%<br>
rename from meta-networking/recipes-connectivity/networkmanager/<a href=3D"=
http://networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">netw=
orkmanager_1.22.10.bb</a><br>
rename to meta-networking/recipes-connectivity/networkmanager/<a href=3D"ht=
tp://networkmanager_1.22.16.bb" rel=3D"noreferrer" target=3D"_blank">networ=
kmanager_1.22.16.bb</a><br>
index 33a2b7c0ce93..a28372dd1f9e 100644<br>
--- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:/=
/networkmanager_1.22.10.bb" rel=3D"noreferrer" target=3D"_blank">networkman=
ager_1.22.10.bb</a><br>
+++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"http:/=
/networkmanager_1.22.16.bb" rel=3D"noreferrer" target=3D"_blank">networkman=
ager_1.22.16.bb</a><br>
@@ -33,11 +33,12 @@ SRC_URI_append_libc-musl =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0file://musl/0004-Fix-build-with-musl-systemd-specific.p=
atch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2b29ccc1531ba7ebba95a97f40c22b963838e8b683374=
5efe8e6fb71fd8fca77&quot;<br>
+SRC_URI[sha256sum] =3D &quot;377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd=
4ad72425a68982cffc6&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/NetworkManager-${PV}&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 --disable-firewalld-zone \<br>
=C2=A0 =C2=A0 =C2=A0--disable-ifcfg-rh \<br>
=C2=A0 =C2=A0 =C2=A0--disable-more-warnings \<br>
=C2=A0 =C2=A0 =C2=A0--with-iptables=3D${sbindir}/iptables \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99022): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99022" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99022</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94013338/6035=
482" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94013338/6035482</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:mathieu.dubois-briand@hy=
prua.org" target=3D"_blank">mathieu.dubois-briand@hyprua.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000abfdde05e9e25b13--


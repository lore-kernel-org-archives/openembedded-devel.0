Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8A5C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 13:49:30 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.23380.1709819369362619839
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 05:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=bVz4JOR/;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a441d7c6125so100897066b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 05:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709819368; x=1710424168; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm0naI+n5uoo+z3fbdMDEpKHofHEA2JVOR2PktvdgAY=;
        b=bVz4JOR/tHwoYm/zxe3prDBmjyYtigDG1GmdyEs3STKK3ZNJLuv+JAXYKAShOaPU8V
         FXCXJGWhK1KFhZathtxo6UjkzAbuhdkqAdHXY7KWC92EUF/7AFTvz+xoKBckFEuTLyNf
         dLURDKQzlOlAlQtURc4iB06dkSa/dYbZuZjNrCQ1hHE9/dqyfB2QlZg+T0duKC5ytQ9V
         2Y4hTAro8YHvEzEYZGSbolxFwm9JDXt4/4v2mCsrKNoLNHmNbxbijvIvTzxykZivugPP
         7COguyNGeDO3blsPZGgISzfuPOFtJX7qNqNmixRTnbfJ7iL2b24ZdYxMqsQ+7naeCMdy
         gRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709819368; x=1710424168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wm0naI+n5uoo+z3fbdMDEpKHofHEA2JVOR2PktvdgAY=;
        b=tKMGlf81oHn3UwhZOkmtALYcvB69TTkGWZ8XMhS8joOj75GoiIDe6ifPefKn/75YM7
         pSxH0dBXyDKBVZBKarmGzQfVaR7cO1JGQylIXECq6wBT16cYQ1G07lXJJ36zcpxyNtZT
         snNitt4NAC+zYarCZAxghEz3jbCVBEKObhHEnbRcSKAN/xjmiv0kxfBHq27A6KePOKCZ
         Z/cj5yRkNlkYzhOJXJjXptB23nSPRiJxiezCrSxXH7h5xx0fT6UY6H4aTmscbrIy3Q5R
         zi48XPr/5NSZ26SwMKkwE5+/SofCjlxP+W1k8mz85lCcmvq0CSHrdYPZmVHRkiQRAYRf
         3L3g==
X-Gm-Message-State: AOJu0YwLYENNFbXjPqxpr6cqqz8z7FY+Eg5sRtPZKWHTHeIZtS8mdsGY
	WgDKfhYi3zKFh03N2ReP/3QBQ40C6KUAVSwRWf9UIIWpWBBSBCNiA1+DvKVvI4AckW/+f9iYjxR
	9Qw2LUdqpVL+oJwWkxI4G2RggYMGKdRB9uXtp4QrJHS90talVOuk=
X-Google-Smtp-Source: AGHT+IG8PwMxrYAhlQy3zW1Cd+J1CS5RszyCZMw53SnWmRq9Prnv/FylvUEq2M0AxSXvFlUkBwFfONIAYHfi/X8K074=
X-Received: by 2002:a17:906:d106:b0:a45:b7a3:e8a0 with SMTP id
 b6-20020a170906d10600b00a45b7a3e8a0mr3637148ejz.56.1709819367464; Thu, 07 Mar
 2024 05:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20240307092113.3674886-1-soumya.sambu@windriver.com>
In-Reply-To: <20240307092113.3674886-1-soumya.sambu@windriver.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 7 Mar 2024 14:49:01 +0100
Message-ID: <CAMSfU+5fWfoHoguf12vNjE+Lakd3bxGQ1TStUf7xOPgKCjaccg@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] openvpn: ignore CVE-2023-7235
To: soumya.sambu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000073fb70613125852"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 13:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109196

--000000000000073fb70613125852
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeu. 7 mars 2024 =C3=A0 10:21, Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> a =C3=A9crit :

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> This CVE is related to OpenVPN 2.x GUI on Windows.
>
> References:
> https://community.openvpn.net/openvpn/wiki/CVE-2023-7235
> https://security-tracker.debian.org/tracker/CVE-2023-7235
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
> b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
> index 218e72b7a..828cd5033 100644
> --- a/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.6.bb
> @@ -19,6 +19,9 @@ SRC_URI[sha256sum] =3D
> "333a7ef3d5b317968aca2c77bdc29aa7c6d6bb3316eb3f79743b59c532
>  # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not
> for openvpn.
>  CVE_CHECK_IGNORE +=3D "CVE-2020-7224 CVE-2020-27569"
>
> +# CVE-2023-7235 is specific to Windows platform
> +CVE_CHECK_IGNORE +=3D "CVE-2023-7235"
>

That's weird, this CVE does not appear as applicable neither locally for me
or on the AB:
https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-statu=
s-kirkstone.txt
Did you do something specific to see this CVE?


> +
>  SYSTEMD_SERVICE:${PN} +=3D "openvpn@loopback-server.service
> openvpn@loopback-client.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109193):
> https://lists.openembedded.org/g/openembedded-devel/message/109193
> Mute This Topic: https://lists.openembedded.org/mt/104784192/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000073fb70613125852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 7 mars 2024 =
=C3=A0=C2=A010:21, Soumya via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;soumya.sambu=3D<a href=3D"mailto:windriver.com@=
lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.com" target=
=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
<br>
This CVE is related to OpenVPN 2.x GUI on Windows.<br>
<br>
References:<br>
<a href=3D"https://community.openvpn.net/openvpn/wiki/CVE-2023-7235" rel=3D=
"noreferrer" target=3D"_blank">https://community.openvpn.net/openvpn/wiki/C=
VE-2023-7235</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-7235" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-7235</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.co=
m" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5=
.6.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.6.bb</a> | 3 +++<br=
>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"http://open=
vpn_2.5.6.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.6.bb</a> b/m=
eta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5.6.bb" =
rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.6.bb</a><br>
index 218e72b7a..828cd5033 100644<br>
--- a/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5=
.6.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.6.bb</a><br>
+++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://openvpn_2.5=
.6.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.5.6.bb</a><br>
@@ -19,6 +19,9 @@ SRC_URI[sha256sum] =3D &quot;333a7ef3d5b317968aca2c77bdc2=
9aa7c6d6bb3316eb3f79743b59c532<br>
=C2=A0# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, n=
ot for openvpn.<br>
=C2=A0CVE_CHECK_IGNORE +=3D &quot;CVE-2020-7224 CVE-2020-27569&quot;<br>
<br>
+# CVE-2023-7235 is specific to Windows platform<br>
+CVE_CHECK_IGNORE +=3D &quot;CVE-2023-7235&quot;<br></blockquote><div><br><=
/div><div>That&#39;s weird, this CVE does not appear as applicable neither =
locally for me or on the AB: <a href=3D"https://autobuilder.yocto.io/pub/no=
n-release/patchmetrics-meta-oe/cve-status-kirkstone.txt">https://autobuilde=
r.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-kirkstone.txt</a=
></div><div>Did you do something specific to see this CVE?<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0SYSTEMD_SERVICE:${PN} +=3D &quot;openvpn@loopback-server.service open=
vpn@loopback-client.service&quot;<br>
=C2=A0SYSTEMD_AUTO_ENABLE =3D &quot;disable&quot;<br>
<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109193): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109193" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109193</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104784192/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104784192/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000073fb70613125852--


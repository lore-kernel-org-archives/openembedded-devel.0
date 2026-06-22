Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D565CCDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:39:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38746.1782117579418927664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 01:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cupQole9;
 spf=pass (domain: snapchat.com, ip: 209.85.128.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso28035045e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 01:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782117577; cv=none;
        d=google.com; s=arc-20240605;
        b=TzcTNOiYnggaZJtUyhayf3kLsNCPeMOhnEr86qEIWiLgpygdZjVgUCawE9gr/DHFJV
         P8xXxf4/Zny0NmnSDzYACkp3Ck5KpTk0dJRlgQH3JOipzTie9lDFf4GQ7+KIqmu7tUea
         v/shuZqCgh+8FZFcA7+FRh5jQVAZs7QX6brzpfSsf5oyxya23QRG664dE/XJzjLub67u
         U8AEI7PKq5aHv8JPuO/TKZWnaQXoxfnFJz37zW+z45dWsTnGaagTOA3T5gWR3EHZ2IS9
         fhT6xFXzKXpYHG1Y4hTdeBP3ymVrKrAeokdrXotop7E+tUuLUXVDL1UqkGTRO63LemeC
         hY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=egMbqNHX9x5YvVuV0cEjznuRnA5ydX9TvWPQlTUZ6wA=;
        fh=slY3CzseMmVDlMmqrvz76xOxCzFnPvB9OKGPtS1cyuU=;
        b=CLzdlhuXBFUYIdCkkQe87mRN6qWd3ebqAzm6+3xYh3g359WBkfIvqlAwYtqpdZOC/7
         BhETZ6jW+AHzl3NH0o9woRn5040DPtefMPvT3lcsplPw7JIHeqgUK1xkdyRJ3amjnz8Q
         ws5/wjkqldEBFFUsdY67Le/IBtw0pICLjpgnYn3aSJBvGaV1pWVCEyzgNEfY7D6GDmB+
         e9eGjZjOWRZRAdMz0SEzHGOEYnvVxPxQihdAT54islNPFFEYHcaeHNRxeQOHuq+SuJ0l
         GU1Ubh0ZNS6/7YDnmts+U3paJeqF76/MtQZEdqT71G2H23AEFGdchXzC+vb2gujJtd4V
         WF5Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1782117577; x=1782722377; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=egMbqNHX9x5YvVuV0cEjznuRnA5ydX9TvWPQlTUZ6wA=;
        b=cupQole9P0rN6VpYUV3V7LG7wPZfjMIlk0LjpCXYbwethj0ngUb5fUUEU9kUoqFV+y
         gLAYjO0l+qvpzoBgtWgkuE3Rm2+7cIZx/41d2eGDI0g0TN58iZMGN0LAG0lK7WNV1jIp
         9eWNITk214qdjF8NnYUfk628gNT88uHuW9pt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117577; x=1782722377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egMbqNHX9x5YvVuV0cEjznuRnA5ydX9TvWPQlTUZ6wA=;
        b=eDEHWYQVFCInU1KMANUl5t/H+p/ICkRBaVE2Zw8xn1B7D/nQkYAvAFCEOkK1D/86Xv
         X7pX/PtXQw3aZouKeeX1ziCfWETV3IoMrX9AHo2u06CeIqzz1T7hR8NAJweOh3MX1aq/
         PaK0tI2ItYKVBlsmbmrZjMU1uXU8pqOWXNiL7RDGmTF+vpyR3xCieKu7hOppBvf+i0y6
         rVs3nOIRYEd51XruPX8hUGWTzU44DfMPat8t3ze36sodrquQ8GWanib8TreNq+QDX86D
         oS1e20+FGGVVJOGOfbSADpmdD7r3PDd9U+2FaY2vd+eNoVFJtf4DmFQpq2Z1bE+2CqSU
         ysNw==
X-Gm-Message-State: AOJu0YygxyrrXngqkuCz+/8rK4vBQU/34e+jHXYr3br8s98yGHsSpWwT
	4xZYmpItLXPY/hYhMCy2/YCH006PxXIK1Rqan8c7wJzFSc9xBfbw3WNH4/Gwr/1v/wR5cvQ7pEt
	fyIYr/r+SEqRFdP43/MCQLaZRFJFzwtWJOhINjiEPKw==
X-Gm-Gg: AfdE7cmZ1zWqHt4o7MzDNd8+WxP8a+PWUnAD3rUjzK1fK53TR1IuzC2KbohrcOUgeae
	kSG7m9j5vzbrLFOGQYiOcobDyxX1Ir2IJ9G231T/3HwOljvS6Wdi3OTTDuAtofrKwYuQsi7oHF8
	+SwD+UFIXMWqr46rBWmmh5/xhEeMEAmyu3J6AX/3oTYX5xpLP/CJBlF2dpkgHfn5uLyRDyUio82
	d+ew5W6zCbGu7+sZ56SBdr+0FChjpQQDWuoWvy+ZbSHFZF/dBvxcv38x+4vYmPJK3Eup6k8RC2m
	kWF4vvxKHtPXfEKB27b8Pn2tDfz1xw==
X-Received: by 2002:a05:600c:3507:b0:492:433a:53af with SMTP id
 5b1f17b1804b1-492433a552bmr210996185e9.16.1782117576305; Mon, 22 Jun 2026
 01:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260622070114.170139-1-emailaddress.ashish@gmail.com>
In-Reply-To: <20260622070114.170139-1-emailaddress.ashish@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 22 Jun 2026 10:39:24 +0200
X-Gm-Features: AVVi8Cc1P3RFC2cB0EiLN60QnUsw9jBdwtXnFXngqZ2tBanmEDLerdIi42fc3tQ
Message-ID: <CAHUKmYZYiMDMnXe0XYe0CCKspxTNOzNxE4KV82zFCtdXFRW67Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools: switch DEPENDS from libpcre
 to libpcre2
To: emailaddress.ashish@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001590620654d395f8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jun 2026 08:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127688

--0000000000001590620654d395f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
this patch is changing v29 of android-tools, which doesn't exist any more
in the master branch (it was updated to version 35).

=C3=89tienne

On Mon, Jun 22, 2026 at 9:02=E2=80=AFAM Ashish Mishra via lists.openembedde=
d.org
<emailaddress.ashish=3Dgmail.com@lists.openembedded.org> wrote:

> From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
>
> libpcre was removed from oe-core in commit-057cccd957
>
> Migrate the DEPENDS to libpcre2, which provides the required
> functionality and is actively maintained.
>
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
>  .../recipes-devtools/android-tools/android-tools_29.0.6.r14.bb  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_29.0.6.r14.bb
> index b3a3f78254..9d76fab08d 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f
> \
>
>  file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9
> \
>  "
> -DEPENDS =3D "libbsd libpcre zlib libcap libusb squashfs-tools 7zip
> googletest"
> +DEPENDS =3D "libbsd libpcre2 zlib libcap libusb squashfs-tools 7zip
> googletest"
>
>  SRCREV_core =3D "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127687):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_127687&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3Df5O4uqo0sA2G8DyzHRb-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&s=3DRZ=
2R8-0dKlCcfyKi-hqOX2N5z1lS1NQSLnfpG8R2VZM&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_119920452_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Df5O4uqo0sA2G8=
DyzHRb-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&s=3DP9Zg87FJk6Oj3qzsps1=
Yo9t0ogYshFVu-dIg7faD60w&e=3D
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3Df5O4u=
qo0sA2G8DyzHRb-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&s=3D9-T1Q6KrhMD=
wM9kuGTedSE3Ny1_dfShRrnQ4sdsVSgQ&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001590620654d395f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>this patch is changing v29 of android-tools, which =
doesn&#39;t exist any more in the master branch (it was updated to version =
35).<br><br>=C3=89tienne</div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 22, 2026 at 9:02=
=E2=80=AFAM Ashish Mishra via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;emailaddress.ashish=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: AshishKuma=
r Mishra &lt;<a href=3D"mailto:emailaddress.ashish@gmail.com" target=3D"_bl=
ank">emailaddress.ashish@gmail.com</a>&gt;<br>
<br>
libpcre was removed from oe-core in commit-057cccd957<br>
<br>
Migrate the DEPENDS to libpcre2, which provides the required<br>
functionality and is actively maintained.<br>
<br>
Signed-off-by: AshishKumar Mishra &lt;<a href=3D"mailto:emailaddress.ashish=
@gmail.com" target=3D"_blank">emailaddress.ashish@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/android-tools/<a href=3D"http://android-tools_29=
.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.=
bb</a>=C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://andro=
id-tools_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_=
29.0.6.r14.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"http:=
//android-tools_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android=
-tools_29.0.6.r14.bb</a><br>
index b3a3f78254..9d76fab08d 100644<br>
--- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.=
r14.bb</a><br>
+++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.=
r14.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc=
04cda31daea161b1bc15da69f \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \<br>
=C2=A0&quot;<br>
-DEPENDS =3D &quot;libbsd libpcre zlib libcap libusb squashfs-tools 7zip go=
ogletest&quot;<br>
+DEPENDS =3D &quot;libbsd libpcre2 zlib libcap libusb squashfs-tools 7zip g=
oogletest&quot;<br>
<br>
=C2=A0SRCREV_core =3D &quot;abfd66fafcbb691d7860df059f1df1c9b1ef29da&quot;<=
br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127687): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_message_1=
27687&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&am=
p;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Df5O4uqo0sA2G8DyzH=
Rb-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&amp;s=3DRZ2R8-0dKlCcfyKi-hq=
OX2N5z1lS1NQSLnfpG8R2VZM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">htt=
ps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_=
g_openembedded-2Ddevel_message_127687&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjID=
Ph0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa=
66m67E&amp;m=3Df5O4uqo0sA2G8DyzHRb-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho=
-QbJ&amp;s=3DRZ2R8-0dKlCcfyKi-hqOX2N5z1lS1NQSLnfpG8R2VZM&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_119920452_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3Df5O4uqo0sA2G8DyzHRb-uA--Wat2Fa1tuNQnMBtGFLFbnq=
iiHzvnbwzJKXho-QbJ&amp;s=3DP9Zg87FJk6Oj3qzsps1Yo9t0ogYshFVu-dIg7faD60w&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_119920452_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Df5O4uqo0sA2G8DyzHRb-uA--Wat2Fa1=
tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&amp;s=3DP9Zg87FJk6Oj3qzsps1Yo9t0ogYshFVu-=
dIg7faD60w&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIFaQ&amp;=
c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj=
9TsRih1DULJTKUkSGa66m67E&amp;m=3Df5O4uqo0sA2G8DyzHRb-uA--Wat2Fa1tuNQnMBtGFL=
FbnqiiHzvnbwzJKXho-QbJ&amp;s=3D9-T1Q6KrhMDwM9kuGTedSE3Ny1_dfShRrnQ4sdsVSgQ&=
amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoin=
t.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_un=
sub&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;=
r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Df5O4uqo0sA2G8DyzHRb=
-uA--Wat2Fa1tuNQnMBtGFLFbnqiiHzvnbwzJKXho-QbJ&amp;s=3D9-T1Q6KrhMDwM9kuGTedS=
E3Ny1_dfShRrnQ4sdsVSgQ&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001590620654d395f8--


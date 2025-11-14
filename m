Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E1ECDB470
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:17:05 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9231.1763086624576418104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X3H8MW25;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-780fe76f457so14298787b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763086624; x=1763691424; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B7h6oya3z4YIZDsjkq1l0NXAEPCg2/jeWdg7InhZZFU=;
        b=X3H8MW25aIPJ3LluqavJoC+CEBR7tlSHwNov2V/+78/D2gFSMwr6VByjCNyT8AMPZn
         xvVyz22E/o9nEUfCa6UwmSs9X3E+2+tSc0F8fiCB8j3MgYFal4iLPXeN28IeYW+EBmsa
         G3pDSKV96qBwQTQ9EWIDtcIKxit4HeLyTC2v3NARXEmWB/JBM2Da4iZ1QRaZaFczdo6U
         /17LRER3xCc9RRxyKq+1jkCrhlB2xykMfHmn0+dD6vgiKw4RwFirc+9I0V8Ael7uETdz
         AQpkqDeX7ovKv5NqK9Je4sD/Oi9pZsANld1FrbL410/8zoe9ChVRLeO05DxNfUVTFPLJ
         9PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763086624; x=1763691424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7h6oya3z4YIZDsjkq1l0NXAEPCg2/jeWdg7InhZZFU=;
        b=BeIl5tHASic93P90U4yVy3ux2rd9ZqhrrGeWshIF9zg0RceYbTQdOiRduNrO8AIkke
         3ESdO7G5anVPsSyEl4Ze9yXeMS68KkYB+m1Tg7GkJ9GZPgzVPKLummlWUs2Z28CDKRv9
         T2Gylvs3yKrD6f70xANP1GybnHgalp3VztRt6kTFR2bf8yqhjEZHuofYy6G9te2Vqup8
         KohyZghzaROXqfn1nDNGbKZ5bQlx5xGfEiDUQlgZvBVCKWMLFJMzjov03AOOOvVXHDxq
         VOnUyCgqsulWOlfybugZNzdeJ8zAPsgVZLXcNNdF5qBwTD5IknJ8deQxCFZGdoFfU0QE
         WTWA==
X-Gm-Message-State: AOJu0Yx7Cjib+UEhiDAyfC4mCpUMap5aHYKy8SsEmMhYRRFQDJexCQEf
	Fyicn+ayd66SsZbqALK8fY4nAI/OWyV2SfVnO0308+rCZr0iGQM1/MozGn4PnXlrg5/Q4VNem1h
	Z6ZaQQvCJ9cC2OCenhIrR/0/CHh8DqHU=
X-Gm-Gg: ASbGncth3l/q1wY+QEK8PntUScX/XF5Od2NeA/9wPtO8dH0Q584abgtKIgFBNfM1j/K
	RpIUBxSRHcVBhrXLhiYpFp3LdWWsDuU1ZmahvNJYTMdfQ85rwY6xkpNunKnoV+hmnNqfeZtm7Vr
	RiRkRkRFnfOkwCwQVgC7oclEWU8sIN3jTbWz/LRPHyglYPbG6vwEMv3ADYazSg7Hmt1/qlfBPAg
	e8Dr/ILVK6guJyQ+Gk8wyIc+JlrABea58p84pPsMffJJjcveFJMpAW5dKE7Q8XOxeLHvp+6YBMr
	y5dTmo9qWM5MycVTo8hpb1I1equg3awQea+5eq+PynDdli0yJ8I6RSk4tizSUbUWhOjIorMsyAb
	iwza2hnanzPbiWiF7ylrWlae77mco6cWnHLjEYp9MKmnWqQgE1R4o/yaX
X-Google-Smtp-Source: AGHT+IGmSqA00uZfOYnE7iO4ruaTQhKCukJZ7b41iyIDqT7Qlm2sG0qwN+aJZ+xzcLUpl0+7xZLM2d5/4g2FYAYOn5I=
X-Received: by 2002:a05:690c:3588:b0:788:e74:b267 with SMTP id
 00721157ae682-78929f236fcmr28990747b3.65.1763086623648; Thu, 13 Nov 2025
 18:17:03 -0800 (PST)
MIME-Version: 1.0
References: <20251113112122.1553793-1-anuj.mittal@oss.qualcomm.com>
In-Reply-To: <20251113112122.1553793-1-anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Nov 2025 18:16:37 -0800
X-Gm-Features: AWmQ_bnp62TPhuIhkHySTuuV1QrFkqODLExWv6GqFBMUHc2r403QNjTxRlh0IoY
Message-ID: <CAMKF1sqQF434+QRz02vjnaSSzmBrXpoHgEsuqh==d2AzdBEr3Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][master][scarthgap][PATCH] remmina: add
 DEPENDS on curl
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e92efb064384974c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121664

--000000000000e92efb064384974c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch mentions master in subject but the patch is not for version of
recipe in master. Can you confirm if it is still needed with the master
version ?

On Thu, Nov 13, 2025 at 3:21=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> remmina has a hard dependency on curl [1]. This doesn't result in an
> error on branches with gtk4 because curl gets pulled in via vte ->
> gtk4 -> gstreamer-plugins-bad -> curl.
>
> Add an explicit DEPENDS on curl to reflect the dependency.
>
> [1]
> https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc041156952=
9cd0296/src/CMakeLists.txt#L259
>
> Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.4.34.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
> b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
> index 921d34d9fd..d101908b94 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
> @@ -20,6 +20,7 @@ DEPENDS =3D " \
>      libvncserver \
>      libsecret \
>      libxkbfile \
> +    curl \
>  "
>
>  DEPENDS:append:libc-musl =3D " libexecinfo"
> --
> 2.51.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121643):
> https://lists.openembedded.org/g/openembedded-devel/message/121643
> Mute This Topic: https://lists.openembedded.org/mt/116272361/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e92efb064384974c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch mentions master in subject but the patch is not=
 for version of recipe in master. Can you confirm if it is still needed wit=
h the master version ?</div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 13, 2025 at 3:21=E2=
=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lis=
ts.openembedded.org">oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">remmina has a h=
ard dependency on curl [1]. This doesn&#39;t result in an<br>
error on branches with gtk4 because curl gets pulled in via vte -&gt;<br>
gtk4 -&gt; gstreamer-plugins-bad -&gt; curl.<br>
<br>
Add an explicit DEPENDS on curl to reflect the dependency.<br>
<br>
[1] <a href=3D"https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce=
2ebc0411569529cd0296/src/CMakeLists.txt#L259" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc041=
1569529cd0296/src/CMakeLists.txt#L259</a><br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@oss.qualcomm.c=
om" target=3D"_blank">anuj.mittal@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.=
34.bb" rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a> b/meta-oe=
/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" rel=3D"norefe=
rrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
index 921d34d9fd..d101908b94 100644<br>
--- a/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
+++ b/meta-oe/recipes-support/remmina/<a href=3D"http://remmina_1.4.34.bb" =
rel=3D"noreferrer" target=3D"_blank">remmina_1.4.34.bb</a><br>
@@ -20,6 +20,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libvncserver \<br>
=C2=A0 =C2=A0 =C2=A0libsecret \<br>
=C2=A0 =C2=A0 =C2=A0libxkbfile \<br>
+=C2=A0 =C2=A0 curl \<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS:append:libc-musl =3D &quot; libexecinfo&quot;<br>
-- <br>
2.51.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121643" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116272361/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116272361/1997914</a><br>
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

--000000000000e92efb064384974c--


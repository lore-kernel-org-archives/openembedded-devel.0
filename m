Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C33BCD98D2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 01:25:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6171.1781659529165104734
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 18:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZIbnJe6g;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7dfe7712572so45648397b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 18:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781659528; cv=none;
        d=google.com; s=arc-20240605;
        b=LZPW/R+aV3/oGQcXl8UMa+DUHS8GQHPh9ojEA6cpfLZXdRKk6l/Gd6n45ayhvIfEUi
         BQPQHS7WCvTLHVpOYD+v0raygBqqtGbpds/Ghp+g+naKlESUSfVylefPKm7TNYQK8qAR
         lAlePClsZKI0NGQSO72dSmKH7wHJ/memFkY2mjaTa8ulKuuYI9DsIYEIWJrvY0mULMVq
         l7PaMVrb5U+ojd6+DtczvQcANBLAWR4LVrkFmwJVYk/qLF60m/x42YdD4mp1+NuOu2Lu
         x3cDh3XN6AIxouvYHGDTUS4KtYfZdNbxArUnKt+CE5OG6AZLZCdkGwrvAE6Cwp+Ug674
         CSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wXjj9O59c27/sPhQ2VnfEP6K/ouYXbOwCnvmdlTfz/o=;
        fh=ikUggdTT9GwHkAxhMEbjPw+CSDU8kfFwGzJeX4+iT6o=;
        b=XIyOyBrmZW18kSLFc7KPTdttg0N4Y8GkOW6oTNBxtlUBDWNscTGVdx7dhNx+ZcdJpG
         /foZe+tEEf/KkMSIMsHG6YlO12xquNTffc93mPKzSXCT5eu8hyMLOfnAZ5AkxWcg+ZPd
         qkDT/h/imJ7ECCVoYqCCGDdUDN6Vx6Z7Oe4gLxmtXEbyfYAyAQEQoxlqcMAtbe+qcawH
         m4fEcYYtYTgVVcT+KUJV9TJXiza/MZzMyIWXjhmcIk7I6UyTo7L8WYn6km6lLi7vHa4F
         EnBOjcrmynVp3Mg0f8FRG2ynW4kMg9O+F3YZ4453Gnekdto5BY8oi9SEtz+HVjrSFoY5
         otdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781659528; x=1782264328; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wXjj9O59c27/sPhQ2VnfEP6K/ouYXbOwCnvmdlTfz/o=;
        b=ZIbnJe6gjCV3//Pdxo3BoGz/siIm1X5OLKI0Er57StcMoT8RUJYTd9VViXZNNx8Ul8
         Tgzr2hRNj9BCrWIar+gF31BbVk7MKSueMDRug78A6zGhl1g1D00GWcgonhBba/f41KGR
         bDbFrFk1YcbHjicgMc7NbUReXdBj7+fcCjOV1TfsivldWU9oc2mEi2kAeKjKYfi1SExY
         EKwH6Yc0eoq/C8q+F8zPw5/veEhPpcfOvGuf8tMLVlx1P6b2Qv6n4fZM3pWFoe2xIYgF
         mNZ5pgHyK0dXFwes3ePZGZo1Yh/oyuMMMsjw68nHH0dMxDUZSatoUE97cD5b24s6IzCt
         pxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781659528; x=1782264328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXjj9O59c27/sPhQ2VnfEP6K/ouYXbOwCnvmdlTfz/o=;
        b=qe+vvTMETPY1F8jW8V3jCtaedkUC4Q/Q5s6CPvAuoogYdTbGgB7mHUEMzXmFFbhfR+
         UKo3roSxiqMJcrhLbIArj/hPe7AseITo4Tdj97aTXhc4rpF3nx5xFfekr3SFU4vjhmRX
         QxlNDTYRV1L+eLKeKuFv7L6swBAAh+Mk3PZXa80Wzf7LQpBv03XADIcnPt6daeaT8022
         IYb5XHiuIrA3zaG9tdfOgMoZ5Cg37daEnLwooFz8WU2ecd+RzMa6uISmuAVrnN1Cx8IH
         V5+38m4IkZKXo0eCRIEUH2VpnXLgP2rY+t1Qr8vgp/wtnhpxChgf5RDzarB3y5Q5NlaJ
         IOZA==
X-Gm-Message-State: AOJu0Yyx0v0fOgOuCXO9q720MuGIjfsI1kRcQ/5WmAlvaEv5+jYz9y/w
	GAK5c/X6pYD9YWnAQGrJ/PWI9jxPGDGKj/oK3WxgwR4NTVNcvVAMcUJbw/Jo/zBMEQQ1uz3sdyk
	nGgrBd8s2UMjkC7YHulx0koTzE+0eEyk=
X-Gm-Gg: AfdE7cnH7292G4C1ZFsGelqdGATiZmyb//IkGEdzJ3kKOJudyOHPiG9UI91WtOzbl43
	UJGIYRwuuaQB0KZabi0mp4kM+FgS1hyAi77yHJB57JBraHBOeDaH4kOuX9b4cQlQwTZOIwG7bO5
	sy0GNh3vglWm/O+ZN6h5xiewUBivrbkawBbU1pOhSqUlE30NVYPFR92FqSvw07PrC6oNTVAE05q
	nk3ozIOfxE/3BMOzsU6/4TbvywkLUpdSUMARxBLnMmmip9hQScAQFU0qu+bFOS6k9Fx56DxdUxD
	3k/8QM9wHKsZz3LST3BB/hSlWN2k+ZfMuiOf6bCljAVY1Dtqmfi1hCdp7nyjmeXhARMIDsaQDWS
	+2OsN4G1tZMvfeC195/EkxK+2MAMzISdlXS1wemsoCrIa77TMKa+FRL0Y1Mvj0ecouATzoxBCoZ
	0tpo9a
X-Received: by 2002:a05:690e:e86:b0:662:c4c4:dabf with SMTP id
 956f58d0204a3-662cb8ce7f7mr1731872d50.16.1781659528040; Tue, 16 Jun 2026
 18:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260616062754.748436-1-antonsk@axis.com>
In-Reply-To: <20260616062754.748436-1-antonsk@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jun 2026 18:25:01 -0700
X-Gm-Features: AVVi8Cf1uNrsoQeWy8Ug_P-fOXDVEIYaF6Gn77W8iO_zDiyPJLo-XyOVDt6EG7M
Message-ID: <CAMKF1srpmMaM4pKV5tx3UB04pO2xC_GSJFy0+F6vzhU8QgGUCw@mail.gmail.com>
Subject: Re: [oe] [PATCHv2 1/8] jq: patch CVE-2026-49839
To: antonsk@axis.com
Cc: openembedded-devel@lists.openembedded.org, Anton Skorup <anton@skorup.se>, 
	Anton Skorup <anton.skorup@axis.com>
Content-Type: multipart/alternative; boundary="00000000000047946e065468ef24"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 01:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127627

--00000000000047946e065468ef24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on top of latest master-next and resend.

On Tue, Jun 16, 2026 at 12:11=E2=80=AFAM Anton Skorup via lists.openembedde=
d.org
<antonsk=3Daxis.com@lists.openembedded.org> wrote:

> From: Anton Skorup <anton@skorup.se>
>
> CVE details: https://vulert.com/vuln-db/--4743
>
> Signed-off-by: Anton Skorup <anton.skorup@axis.com>
> ---
> v2
>  * Added patch to stack of jq CVEs
> ---
>  .../jq/jq/CVE-2026-49389.patch                | 31 +++++++++++++++++++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
>
> diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
> b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
> new file mode 100644
> index 0000000000..3189158b4a
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch
> @@ -0,0 +1,31 @@
> +From e987df0d463d85fd70825e042a082427e8275b86 Mon Sep 17 00:00:00 2001
> +From: itchyny <itchyny@cybozu.co.jp>
> +Date: Mon, 8 Jun 2026 22:14:48 +0900
> +Subject: [PATCH] Fix heap-buffer-overflow in raw file loading
> +
> +When `jv_string_append_buf` overflows the string length limit,
> +it returns an invalid `jv`; `jv_load_file` then re-entered it
> +on the invalid value and overran the heap. Break out of the loop
> +once the value is invalid.
> +
> +Fixes CVE-2026-49839.
> +
> +Signed-off-by: Anton Skorup <anton.skorup@axis.com>
> +Upstream-Status: Backport [
> https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275=
b86
> ]
> +---
> + src/jv_file.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/jv_file.c b/src/jv_file.c
> +index 7706b0e06e..fbc1e4d653 100644
> +--- a/src/jv_file.c
> ++++ b/src/jv_file.c
> +@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
> +
> +     if (raw) {
> +       data =3D jv_string_append_buf(data, buf, n);
> ++      if (!jv_is_valid(data))
> ++        break;
> +     } else {
> +       jv_parser_set_buf(parser, buf, n, !feof(file));
> +       jv value;
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> index 026f6bfa71..0419ccd46d 100644
> --- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> +++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://
> github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Djq-${
> <http://github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Dj=
q-$%7B>
>             file://CVE-2026-33947.patch \
>             file://CVE-2026-33948.patch \
>             file://CVE-2026-39979.patch \
> +           file://CVE-2026-49389.patch \
>             "
>
>  inherit autotools ptest
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127606):
> https://lists.openembedded.org/g/openembedded-devel/message/127606
> Mute This Topic: https://lists.openembedded.org/mt/119829812/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000047946e065468ef24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase it on top of latest master-next and resend.<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jun 16, 2026 at 12:11=E2=80=AFAM Anton Skorup =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;antonsk=3D<a href=3D"mailto:axis.com@lists.openembedded.org">axis.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Anton Skorup &lt;<a href=3D"mailto:anton@skorup.se=
" target=3D"_blank">anton@skorup.se</a>&gt;<br>
<br>
CVE details: <a href=3D"https://vulert.com/vuln-db/--4743" rel=3D"noreferre=
r" target=3D"_blank">https://vulert.com/vuln-db/--4743</a><br>
<br>
Signed-off-by: Anton Skorup &lt;<a href=3D"mailto:anton.skorup@axis.com" ta=
rget=3D"_blank">anton.skorup@axis.com</a>&gt;<br>
---<br>
v2<br>
=C2=A0* Added patch to stack of jq CVEs<br>
---<br>
=C2=A0.../jq/jq/CVE-2026-49389.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 31 +++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patc=
h<br>
<br>
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch b/meta-oe/=
recipes-devtools/jq/jq/CVE-2026-49389.patch<br>
new file mode 100644<br>
index 0000000000..3189158b4a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2026-49389.patch<br>
@@ -0,0 +1,31 @@<br>
+From e987df0d463d85fd70825e042a082427e8275b86 Mon Sep 17 00:00:00 2001<br>
+From: itchyny &lt;<a href=3D"mailto:itchyny@cybozu.co.jp" target=3D"_blank=
">itchyny@cybozu.co.jp</a>&gt;<br>
+Date: Mon, 8 Jun 2026 22:14:48 +0900<br>
+Subject: [PATCH] Fix heap-buffer-overflow in raw file loading<br>
+<br>
+When `jv_string_append_buf` overflows the string length limit,<br>
+it returns an invalid `jv`; `jv_load_file` then re-entered it<br>
+on the invalid value and overran the heap. Break out of the loop<br>
+once the value is invalid.<br>
+<br>
+Fixes CVE-2026-49839.<br>
+<br>
+Signed-off-by: Anton Skorup &lt;<a href=3D"mailto:anton.skorup@axis.com" t=
arget=3D"_blank">anton.skorup@axis.com</a>&gt;<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/jqlang/jq/commit/=
e987df0d463d85fd70825e042a082427e8275b86" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e82=
75b86</a>]<br>
+---<br>
+ src/jv_file.c | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/src/jv_file.c b/src/jv_file.c<br>
+index 7706b0e06e..fbc1e4d653 100644<br>
+--- a/src/jv_file.c<br>
++++ b/src/jv_file.c<br>
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (raw) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D jv_string_append_buf(data, buf, n);<br=
>
++=C2=A0 =C2=A0 =C2=A0 if (!jv_is_valid(data))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv_parser_set_buf(parser, buf, n, !feof(file));=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0jv value;<br>
diff --git a/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">jq_1.8.1.bb</a> b/meta-oe/recipes-devtool=
s/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"noreferrer" target=3D"_blank">jq=
_1.8.1.bb</a><br>
index 026f6bfa71..0419ccd46d 100644<br>
--- a/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a><br>
@@ -17,6 +17,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/jqla=
ng/jq.git;protocol=3Dhttps;branch=3Dmaster;tag=3Djq-$%7B" rel=3D"noreferrer=
" target=3D"_blank">github.com/jqlang/jq.git;protocol=3Dhttps;branch=3Dmast=
er;tag=3Djq-${</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-33947.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-33948.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-39979.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-49389.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127606): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127606" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127606</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119829812/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119829812/1997914</a><br>
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

--00000000000047946e065468ef24--


Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB3ECD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 16:39:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.43393.1712248753567760270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 09:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=AC8VZDVq;
 spf=pass (domain: smile.fr, ip: 209.85.167.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d04fc04bso1188672e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 09:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712248751; x=1712853551; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nAjUCEebgkPZgUAAlndD7wito3vwkiXcb3eI7ZetOY=;
        b=AC8VZDVqDSHlSojUP/WO2s5xg+herQurXYey2kLMXfrwTyF66R2FMy9UiC+q6HTQsm
         J3VBTjoVt24vE6ZD6yQ5vu4WdlsUX9rEH5lzGbwUSKHCTeBdy/vBTK/t9gjPe+u688HK
         JTZ0LfiXTtHUtoASsJoC2HGo+UCci48+Jl6AJ7L6Pvi9QI21Gqt1UUtXJazL+GUZwoqJ
         Mi/gtxl2tYSFAQY7oVFXAIIpc0EKPd3shKebPO29xGoLFKRki+yY5Grx4D6d3xF9PZx1
         BKA1WZGnAtOJ5VQbOtvm8/w/aMKP1otTdnyhnaFnbUI86ltGWzTBM4AlqrxqU8yQh+Ug
         vuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712248751; x=1712853551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nAjUCEebgkPZgUAAlndD7wito3vwkiXcb3eI7ZetOY=;
        b=AzvSNBDDAGpTuDWcBzbKHhBtEJ7AlhaqBL7lZJpgnINh8JTm0gEXje7V/Irjw04kZj
         UsqNWqms+hdz2FUj67uQF3unUv4sHnOIV7VWQ8xDRpaQ1GIsohp7cXx04OGHLs03cNJD
         MMYKLWtqaQ4Er/6nNFJpssi7yQaO6tmu3l6as/eIxw7XRWhB7LWhRLbOV1SiwSIitmZQ
         Ux1NWn89pUL4BIE68P/oDnqoiyXurCzhMLMDph8p2iRZxg60Dhk7zAlFv3rDgY/R4QM8
         BweBS2GjnDi3owcq/hT7rZ0c7+9Sg3biLmOjjeZ/deMtrVL97Ovif/NnovgkZEywOMS8
         3P2Q==
X-Gm-Message-State: AOJu0YzNu44nhz+7O9eZUXiNQknXKqoouox94S1Rq1GGaNzOJ6pU1EJ6
	Oh9Zu5lZ3h9lprNT0PTMn4DdNm2k0CEEzwUt++UY/BFsHc6wJP0fVJX62tuL1wEtk9PnpeKSyVy
	EvZwB7GDp5j1u+Yb7F7zvYP4N2iF9EfwI/Ox5+A==
X-Google-Smtp-Source: AGHT+IHGiHFFE1tFu3pgD1ZomK+u3QIxlZGjh6ndhlyigElf2t4J1BMZ76mYcQDOCwXhsJybNMdeaDvF/WXTiuTSch4=
X-Received: by 2002:ac2:43b9:0:b0:516:d26e:ea6f with SMTP id
 t25-20020ac243b9000000b00516d26eea6fmr125034lfl.35.1712248751446; Thu, 04 Apr
 2024 09:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240404125210.3365296-1-chaitanya.vadrevu@ni.com>
In-Reply-To: <20240404125210.3365296-1-chaitanya.vadrevu@ni.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Thu, 4 Apr 2024 18:38:45 +0200
Message-ID: <CAMSfU+4f33EZozrWGMLn96i=hTxSXDgp6=5o_006L+XCs1Wp7g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Use inherit_defer for native class
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000992b96061547fa2a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 16:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109798

--000000000000992b96061547fa2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 avr. 2024 =C3=A0 14:52, Chaitanya Vadrevu <chaitanya.vadrevu@ni.c=
om> a
=C3=A9crit :

> Since useradd.bbclass is using inherit_defer in oe-core, some classes are
> now
> appearing after native resulting in QA errors
>
> QA Issue: mariadb-native: native/nativesdk class is not inherited last,
> this can result in unexpected behaviour. Classes inherited after
> native/nativesdk: useradd-staticids.bbclass [native-last]
>
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
>

Hi!

I believed I fixed this on master since
https://git.openembedded.org/meta-openembedded/commit/?id=3D065d6496e4af178=
e5b1f8e4e3c5f17ac587717a6

I just tested this again : no QA issue on master on my local build.
Are you targeting a non-master branch?


> ---
>  meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> index 578357b48..04380eb43 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
> @@ -1,5 +1,5 @@
>  require mariadb.inc
> -inherit native
> +inherit_defer native
>
>  PROVIDES +=3D "mysql5-native"
>  DEPENDS =3D "ncurses-native zlib-native bison-native libpcre2-native \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109797):
> https://lists.openembedded.org/g/openembedded-devel/message/109797
> Mute This Topic: https://lists.openembedded.org/mt/105327970/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000992b96061547fa2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 4 avr. 2024 =C3=A0=C2=A014:5=
2, Chaitanya Vadrevu &lt;<a href=3D"mailto:chaitanya.vadrevu@ni.com" target=
=3D"_blank">chaitanya.vadrevu@ni.com</a>&gt; a =C3=A9crit=C2=A0:</div><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sin=
ce useradd.bbclass is using inherit_defer in oe-core, some classes are now<=
br>
appearing after native resulting in QA errors<br>
<br>
QA Issue: mariadb-native: native/nativesdk class is not inherited last, thi=
s can result in unexpected behaviour. Classes inherited after native/native=
sdk: useradd-staticids.bbclass [native-last]<br>
<br>
Signed-off-by: Chaitanya Vadrevu &lt;<a href=3D"mailto:chaitanya.vadrevu@ni=
.com" target=3D"_blank">chaitanya.vadrevu@ni.com</a>&gt;<br>
</blockquote><div><br></div><div>Hi!</div><div><br></div><div>I believed I =
fixed this on master since <a href=3D"https://git.openembedded.org/meta-ope=
nembedded/commit/?id=3D065d6496e4af178e5b1f8e4e3c5f17ac587717a6">https://gi=
t.openembedded.org/meta-openembedded/commit/?id=3D065d6496e4af178e5b1f8e4e3=
c5f17ac587717a6</a></div><div><br></div><div>I just tested this again : no =
QA issue on master on my local build.</div><div>Are you targeting a non-mas=
ter branch?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">---<br>
=C2=A0meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.11.7.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.7.bb</a> | 2 +-=
<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.=
11.7.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.7.bb</a>=
 b/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.11.7.bb" r=
el=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.7.bb</a><br>
index 578357b48..04380eb43 100644<br>
--- a/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.11.7.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.7.bb</a><br>
+++ b/meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb-native_10.11.7.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.7.bb</a><br>
@@ -1,5 +1,5 @@<br>
=C2=A0require mariadb.inc<br>
-inherit native<br>
+inherit_defer native<br>
<br>
=C2=A0PROVIDES +=3D &quot;mysql5-native&quot;<br>
=C2=A0DEPENDS =3D &quot;ncurses-native zlib-native bison-native libpcre2-na=
tive \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109797): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109797" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109797</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105327970/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105327970/4316185</a><br>
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

--000000000000992b96061547fa2a--


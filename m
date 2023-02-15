Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B3AC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 21:00:33 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.4950.1676494825692494827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Feb 2023 13:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XatyPGLr;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id o15so17200056wrc.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 13:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PwGvPEdbTWEmC+Prp73NK0nP9pC+vKaJh4yHLU+zZaw=;
        b=XatyPGLrlvHHPUmzWjUkEtxlWFGB1a8JJid4C7exLr1vfIfJ0rNKEME4448lfhgNQL
         hu3U9Sfl130+uiHNQRoqkhzAOh0khbKxoCidS9LEY0SNvi1ZqCvk/xg5A47lvmTo6tbW
         +xPLIvD8HH/vcB0oN5qdssmyyGHXRLAKRsfMwiAI1LW9tiw3NKptThPkT6uDd7vMjuuw
         XZhchTNu9RXKfNBOci74v67qX904x0il2X6a3zbgfdLg9qlVe4rUzaogMmOXSRUvg15V
         v3MVjKPtrQiXHOdai8uPDS7eFCVXSvceAfrJOIcVOY7itMqB7l0Lq8torT+6LHfs71xS
         DXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PwGvPEdbTWEmC+Prp73NK0nP9pC+vKaJh4yHLU+zZaw=;
        b=tc0kxpE6L0xrb+rRDuGVYAJI9YX9z7PYlEgAQseaSEqOlaSQ0e9W8YpZ1yKFRlSnPT
         NHSZApEr0o/T6VUoueYev7Ke33M+xE0J3BPbVy5krspekPcrpoerCbKG8yweh6TVMx1F
         1KTWFvO3LFynnjGoWuFa8mlC0PXxqayEdSdiyvZAwh1/7Ars/1zlCyQERquV823CGwOF
         RA5mD76OhWCAtQm8qvYiFDSInmJSyKw2V1yvSW5r1kE13Px5r+10Odfc4Tck3DNCn3I+
         xUJo6eSXLxjgrQt6p8Q1nka6DJ3Z29lQsJDVlLu6SYj/zgL1cC8vMEUUAn44wiSd+ajV
         9gLQ==
X-Gm-Message-State: AO0yUKW5kswOMxl3NJacfQpfTF7C9e3rconPnZO1fuAxt7GQpqUB9Aua
	QdgmLPZSHK+EZhh44hBG/j8gY+Rn8YjtZWh4PUk=
X-Google-Smtp-Source: AK7set+J8urxFjH3VS3gWXeopcUwz4cgIfJvglt+KCBBlUo3zdeJftgNDXw43yNl9ph+Q4muLR78zycr00rWBsVDXwo=
X-Received: by 2002:a5d:4a11:0:b0:2c4:24a:b51d with SMTP id
 m17-20020a5d4a11000000b002c4024ab51dmr95572wrq.92.1676494823912; Wed, 15 Feb
 2023 13:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20230208131157.2564692-1-archana.polampalli@windriver.com> <1744195A99711A03.22975@lists.openembedded.org>
In-Reply-To: <1744195A99711A03.22975@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2023 22:00:09 +0100
Message-ID: <CA+chaQcMqU=V4BoAoBP=vjGfhhyhVXXb2wBBsqGUBZfo6+5HnQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] Nodejs: fix buildpaths warning
To: Martin.Jansa@gmail.com
Cc: "Polampalli, Archana" <archana.polampalli@windriver.com>, 
	openembedded-devel@lists.openembedded.org, Hari.GPillai@windriver.com
Content-Type: multipart/alternative; boundary="0000000000007279b605f4c35e13"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Feb 2023 21:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101085

--0000000000007279b605f4c35e13
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 15, 2023 at 9:27 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> This breaks the do_install when "shared" PACKAGECONFIG is enabled, see:
>
> http://errors.yoctoproject.org/Errors/Details/689959/
>

Using baselib (just "lib") works and install respects prefix as well, so it
ends in  image/usr/lib/libnode.so.108 as before and there are no TMPDIR
warnings as well.

On Wed, Feb 8, 2023 at 2:12 PM Polampalli, Archana <
> archana.polampalli@windriver.com> wrote:
>
>> Correct libdir used at configure time to avoid packaging warnings
>> WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:
>> File /usr/bin/node in package nodejs contains reference to TMPDIR
>> [buildpaths]
>> File /usr/bin/.debug/node in package nodejs-dbg contains reference to
>> TMPDIR
>> File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains
>> reference to TMPDIR [buildpaths]
>> File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains
>> reference to TMPDIR [buildpaths]
>> File /usr/include/node/config.gypi in package nodejs-dev contains
>> reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
>> ---
>>  meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> index e96913e56..04a80a6b8 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
>> @@ -145,7 +145,7 @@ do_configure () {
>>                 --without-etw \
>>                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'),
>> d)}" \
>>                 --dest-os=linux \
>> -               --libdir=${D}${libdir} \
>> +               --libdir=${libdir} \
>>                 ${ARCHFLAGS} \
>>                 ${PACKAGECONFIG_CONFARGS}
>>  }
>> --
>> 2.34.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101084):
> https://lists.openembedded.org/g/openembedded-devel/message/101084
> Mute This Topic: https://lists.openembedded.org/mt/96829436/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007279b605f4c35e13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Feb 15, 2023 at 9:27 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">T=
his breaks the do_install when &quot;shared&quot; PACKAGECONFIG is enabled,=
 see:<div><br></div><div><a href=3D"http://errors.yoctoproject.org/Errors/D=
etails/689959/" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/689959/</a></div></div></blockquote><div><br></div><div>Using baselib =
(just &quot;lib&quot;) works and install respects prefix as well, so it end=
s in=C2=A0=C2=A0image/usr/lib/libnode.so.108 as before and there are no TMP=
DIR warnings as well.</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Feb 8, 2023 at 2:12 PM Polampalli, Archana &lt;<a href=3D"ma=
ilto:archana.polampalli@windriver.com" target=3D"_blank">archana.polampalli=
@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Correct libdir used at configure time to avoid packaging warn=
ings<br>
WARNING: nodejs-18.12.1-r0 do_package_qa: QA Issue:<br>
File /usr/bin/node in package nodejs contains reference to TMPDIR [buildpat=
hs]<br>
File /usr/bin/.debug/node in package nodejs-dbg contains reference to TMPDI=
R<br>
File /usr/lib64/nodejs/ptest/.debug/cctest in package nodejs-dbg contains r=
eference to TMPDIR [buildpaths]<br>
File /usr/lib64/nodejs/ptest/cctest in package nodejs-ptest contains refere=
nce to TMPDIR [buildpaths]<br>
File /usr/include/node/config.gypi in package nodejs-dev contains reference=
 to TMPDIR [buildpaths]<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r>
---<br>
=C2=A0meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12=
.1.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
index e96913e56..04a80a6b8 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_18.12.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_18.12.1.bb</a><br>
@@ -145,7 +145,7 @@ do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-etw \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dest-cpu=3D&quot;=
${@map_nodejs_arch(d.getVar(&#39;TARGET_ARCH&#39;), d)}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --dest-os=3Dlinux \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3D${D}${li=
bdir} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--libdir=3D${libdir=
} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${ARCHFLAGS} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PACKAGECONFIG_CON=
FARGS}<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101084): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101084" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101084</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96829436/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96829436/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007279b605f4c35e13--


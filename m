Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.13179.1616767753769592944
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 07:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O3SsN80I;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id l18so6452359edc.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 07:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Q6oF8yAtRxhFKSC6coxHZmKJdUQA+G8fb2sW7bDZuA=;
        b=O3SsN80IlIzHrDircbQ9qmNvNo/erQDwsT9nCf5xgtcT8l8DE5vTG90l6O8Wm2Cntq
         0vZ4MfcOHgpn0g0iukUC9ptv8GtvOx9yCcYCoKdBnNWLE1kJD5YnKh81rbW34P2VoJst
         Hbjg17sSTahhFvSVzT5ZasBsiVneWURdXeFvTJ9zdFQ3yPHx/NrH47QfuuT6tYis6xS6
         6MBftmuyzVsuPczi46Xg8Hi2EZqfVtraXG8auS4suEobHH5zxRfc/2D5flgoNowJZTPW
         iJkp86XgCJUPTsGWkS3K8Fpw7U42AqX2J1qj1YKSN7+kctKeB9JUREpdVPrLNW+UW28M
         oj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Q6oF8yAtRxhFKSC6coxHZmKJdUQA+G8fb2sW7bDZuA=;
        b=FF7rKJxOpXuYc9z2Z2+Fi9Lg0TrGAHsu/7ZF1huOQVciytuJeSh51JCVjXAIv/yr6h
         DcRaTmwOgCME/1VyFOeG+IiAlPLsiExvWkxn1NSGSz+yxqDU3c8Dmr1bPBnMDQ95Otbb
         XT6qE1uu389VvVs3bt/cqg4wUAMDVLyLRH2tafCsVtQafC9Ss82F+mS+qhQeEK52sV/d
         EJyj6P5DjQYX8F8MEWntePxmLY1nWypBcJUKuDOAgwX1ijbqLred0QGh5sbJc04ECcRK
         tGb8EDOhps8T9bgRP4TnJvRbg90oJPa3dY4ss3h+9nNXWztZzgl7u27Db9F56+o+FmIf
         eI6w==
X-Gm-Message-State: AOAM531qiA4ukoI+7wAmFkWuYQKisCQ+i+xQrqjzKrNBIApgzJn+Gezo
	znbCIvAmbYuBmOIDI8lXwzcpHE7R6Vf9n/Y5MsY=
X-Google-Smtp-Source: ABdhPJy4jOqM6NoATepqavRCNm0ffvVLKn8Y836n8P00oupRKOuKJChXp35PZy7EjekKBipLWUOCUhoIH/JLiK0T6mI=
X-Received: by 2002:aa7:d4ca:: with SMTP id t10mr15047357edr.388.1616767752138;
 Fri, 26 Mar 2021 07:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210323211230.1639990-1-raj.khem@gmail.com> <166F54E97FC55079.16615@lists.openembedded.org>
In-Reply-To: <166F54E97FC55079.16615@lists.openembedded.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 26 Mar 2021 15:09:01 +0100
Message-ID: <CA+chaQc8QaP51_H=Qqy9BXuo6y6ikKOiC_v5D=ugqRv4DO15YA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] guider: Upgrade 3.9.7 -> 3.9.8
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, Peace Lee <iipeace5@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008cf4ab05be7113cf"

--0000000000008cf4ab05be7113cf
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 24, 2021 at 5:42 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> The PR on github changed SRCREV couple times (while calling it 3.9.8 whole
> time) and the currently latest version on github says
>
> SRCREV = "bab995ce718b58d4b5fee594771884dea238d70a"
>
> On Tue, Mar 23, 2021 at 10:12 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> From: Peace Lee <iipeace5@gmail.com>
>>
>> Upgrade to release 3.9.8
>>
>> Signed-off-by: Peace Lee <iipeace5@gmail.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../guider/{guider_3.9.7.bb => guider_3.9.8.bb}             | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-devtools/guider/{guider_3.9.7.bb =>
>> guider_3.9.8.bb} (78%)
>>
>> diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>> b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>> similarity index 78%
>> rename from meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>> rename to meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>> index 88fad936ba..91693d8626 100644
>> --- a/meta-oe/recipes-devtools/guider/guider_3.9.7.bb
>> +++ b/meta-oe/recipes-devtools/guider/guider_3.9.8.bb
>> @@ -1,4 +1,4 @@
>> -SUMMARY = "runtime performance analyzer"
>> +SUMMARY = "performance analyzer"
>>  HOMEPAGE = "https://github.com/iipeace/guider"
>>  BUGTRACKER = "https://github.com/iipeace/guider/issues"
>>  AUTHOR = "Peace Lee <ipeace5@gmail.com>"
>> @@ -6,10 +6,10 @@ AUTHOR = "Peace Lee <ipeace5@gmail.com>"
>>  LICENSE = "GPLv2+"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
>>
>> -PV = "3.9.7+git${SRCPV}"
>> +PV = "3.9.8+git${SRCPV}"
>>
>>  SRC_URI = "git://github.com/iipeace/${BPN}
>> <http://github.com/iipeace/$%7BBPN%7D>"
>> -SRCREV = "459b5189a46023fc98e19888b196bdc2674022fd"
>> +SRCREV = "f2e6d84ffa341728daf0cc2ba2736d58008ea9f1"
>>
>

WARNING: Failed to fetch URL git://github.com/iipeace/guider, attempting
MIRRORS if available
DEBUG: Fetcher failure: Unable to find revision
bab995ce718b58d4b5fee594771884dea238d70a in branch master even from upstream

Looks like he updated the PR even after this was merged and then he opened
new PR with just another SRCREV:
https://github.com/openembedded/meta-openembedded/pull/325/commits/b8b26a1fc8b39d06829fecbdb50532b6e98dcc6a

a502cd93b13235b7539557a91328de00b7c51bc3

this is indeed very sad.

--0000000000008cf4ab05be7113cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Mar 24, 2021 at 5:42 PM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr">The PR on github changed SRCREV couple times (while calling=
 it 3.9.8 whole time) and the currently latest version on github says<div><=
br></div><div>SRCREV =3D &quot;bab995ce718b58d4b5fee594771884dea238d70a&quo=
t;</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 23, 2021 at 10:12 PM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Peace Le=
e &lt;<a href=3D"mailto:iipeace5@gmail.com" target=3D"_blank">iipeace5@gmai=
l.com</a>&gt;<br>
<br>
Upgrade to release 3.9.8<br>
<br>
Signed-off-by: Peace Lee &lt;<a href=3D"mailto:iipeace5@gmail.com" target=
=3D"_blank">iipeace5@gmail.com</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../guider/{<a href=3D"http://guider_3.9.7.bb" rel=3D"noreferrer" tar=
get=3D"_blank">guider_3.9.7.bb</a> =3D&gt; <a href=3D"http://guider_3.9.8.b=
b" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/guider/{<a href=3D"http://guider_3.9.=
7.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a> =3D&gt; <a h=
ref=3D"http://guider_3.9.8.bb" rel=3D"noreferrer" target=3D"_blank">guider_=
3.9.8.bb</a>} (78%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.7=
.bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a> b/meta-oe/rec=
ipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" rel=3D"noreferrer" =
target=3D"_blank">guider_3.9.8.bb</a><br>
similarity index 78%<br>
rename from meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.7.=
bb" rel=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a><br>
rename to meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb=
" rel=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
index 88fad936ba..91693d8626 100644<br>
--- a/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.7.bb" re=
l=3D"noreferrer" target=3D"_blank">guider_3.9.7.bb</a><br>
+++ b/meta-oe/recipes-devtools/guider/<a href=3D"http://guider_3.9.8.bb" re=
l=3D"noreferrer" target=3D"_blank">guider_3.9.8.bb</a><br>
@@ -1,4 +1,4 @@<br>
-SUMMARY =3D &quot;runtime performance analyzer&quot;<br>
+SUMMARY =3D &quot;performance analyzer&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://github.com/iipeace/guider" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/iipeace/guider</a>&quo=
t;<br>
=C2=A0BUGTRACKER =3D &quot;<a href=3D"https://github.com/iipeace/guider/iss=
ues" rel=3D"noreferrer" target=3D"_blank">https://github.com/iipeace/guider=
/issues</a>&quot;<br>
=C2=A0AUTHOR =3D &quot;Peace Lee &lt;<a href=3D"mailto:ipeace5@gmail.com" t=
arget=3D"_blank">ipeace5@gmail.com</a>&gt;&quot;<br>
@@ -6,10 +6,10 @@ AUTHOR =3D &quot;Peace Lee &lt;<a href=3D"mailto:ipeace5@=
gmail.com" target=3D"_blank">ipeace5@gmail.com</a>&gt;&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D2c1c00f9d3ed9e24fa69b=
932b7e7aff2&quot;<br>
<br>
-PV =3D &quot;3.9.7+git${SRCPV}&quot;<br>
+PV =3D &quot;3.9.8+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iipeace/$%7BBPN%=
7D" rel=3D"noreferrer" target=3D"_blank">github.com/iipeace/${BPN}</a>&quot=
;<br>
-SRCREV =3D &quot;459b5189a46023fc98e19888b196bdc2674022fd&quot;<br>
+SRCREV =3D &quot;f2e6d84ffa341728daf0cc2ba2736d58008ea9f1&quot;<br></block=
quote></div></blockquote><div><br></div><div>=C2=A0</div>WARNING: Failed to=
 fetch URL git://<a href=3D"http://github.com/iipeace/guider">github.com/ii=
peace/guider</a>, attempting MIRRORS if available<br>DEBUG: Fetcher failure=
: Unable to find revision bab995ce718b58d4b5fee594771884dea238d70a in branc=
h master even from upstream</div><div class=3D"gmail_quote"><br></div><div =
class=3D"gmail_quote">Looks like he updated the PR even after this was merg=
ed and then he opened new PR with just another SRCREV:</div><div class=3D"g=
mail_quote"><a href=3D"https://github.com/openembedded/meta-openembedded/pu=
ll/325/commits/b8b26a1fc8b39d06829fecbdb50532b6e98dcc6a">https://github.com=
/openembedded/meta-openembedded/pull/325/commits/b8b26a1fc8b39d06829fecbdb5=
0532b6e98dcc6a</a></div><div class=3D"gmail_quote"><br></div><div class=3D"=
gmail_quote">a502cd93b13235b7539557a91328de00b7c51bc3</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">this is indeed very sad.</d=
iv></div>

--0000000000008cf4ab05be7113cf--

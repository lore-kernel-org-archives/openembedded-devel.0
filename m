Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9480C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 04:01:35 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.6592.1648785695114140949
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MOiBMyNt;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id cm17so1330076pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 21:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rM84bATfLNPMQd7J/rqWh1bQ0IU1CLggnQ2HB0esQRo=;
        b=MOiBMyNtORBxdvRXLJKaPA1ZwzLDIo9jCYOs0kkwl7fE/lT89nDUWfDsJwLKcetpuQ
         8dIax0ifGbeXPhrC89lI2PqfRBCfrvBlGgeVbLvpzSIgtDSrn+XwLiV+ZAUJ/8mOi7Vq
         aTKcODm7tU3dyZRadIHKcuhi00ojnn2Fcm+hvPNs2tKCQgzzas/IVBkOLhpFaD6MTM/9
         fG1Hya3mW03WyHUlWhxtHq342N43YZTuimbBBNhl9YlvKM4ouDfh03qBfssA+lCpBe6r
         xU0liR92a1YZPqi1Syw4bmbNqfU/aRzYj8jEDch7kzCR1oGce/FC9H96hVxOCS3sBLo0
         U4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rM84bATfLNPMQd7J/rqWh1bQ0IU1CLggnQ2HB0esQRo=;
        b=lMrWynvs5D1cpDBRPWPJRLvzN9j1ZpHD0tNAtoIo/qWTsnXSA3qr8tVBj9dmn97W7m
         roE3YUNGNkoITsn+0SgxC92Djyu1iJrVmPYzeWkheExs9RF5Vhv6WTDA2ysbvyWAprWa
         +bulG6aWrvYBOh7fdJ3izXVvuU3QqVNRMwN3zeXrDYbYpW1n5ILEjSPcybhzgnWsbE5Z
         DkjY7fnqwazQrVrrFnJM4UfOy0rEylMdw/KWsAxt4advAIFXm7cojk0dN3ndj4e7pvBl
         OavUZV7iKPiqZmbMJpHPdmConj5Oha1T9qtk0HrdmjdwPB3T3dBF/N/qFqBbcDVDOWkN
         ZSTw==
X-Gm-Message-State: AOAM532LsfdFVji6wp8Pb58/R/JCUVIALNX3YnvzDBjaGCAG+l+u/hAZ
	TL+zZFM7lbgqqle2gO/zCPtVHVoR8sX6HcqlHXI=
X-Google-Smtp-Source: 
 ABdhPJzoWcJjSVHA1t5gk2FqCJDQniyz4ZD1LYGRGPJTe5G71YXLT0GbICE9iaJngfmdQc43Fis4d5bCtums2ddkRbo=
X-Received: by 2002:a17:902:b704:b0:156:624:934b with SMTP id
 d4-20020a170902b70400b001560624934bmr8814526pls.116.1648785694535; Thu, 31
 Mar 2022 21:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <1648784595-10309-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1648784595-10309-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 31 Mar 2022 21:01:22 -0700
Message-ID: 
 <CANx9H-Coyef9MikVruehpPKRJQE-R=kaxCZsf8Xm5VZ7sF7DHg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-nocaselist: upgrade 1.0.4 ->
 1.0.5
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a2336105db8fd503"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 04:01:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96318

--000000000000a2336105db8fd503
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 31, 2022 at 8:43 PM zhengruoqin <zhengrq.fnst@fujitsu.com>
wrote:

> License-Update: version updated to 1.0.5
>
This is not a useful use of the License-Update tag. The reason for this is
to tell us _why_ the LIC_FILES_CHKSUM changed. Comparing the two LICENSE
files with BeyondCompare shows no textual difference AT ALL, so perhaps it
is whitespace/linefeeds.

The LICENSE file has also not changed at all in the github repository.

Please make an attempt to figure out why upstream is causing this thrash
for a text file that has not changed AT ALL.


>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-nocaselist_1.0.4.bb   | 8 --------
>  .../recipes-devtools/python/python3-nocaselist_1.0.5.bb   | 8 ++++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.4.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.4.bb b/meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.4.bb
> deleted file mode 100644
> index 60c79c22a8..0000000000
> --- a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.4.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -SUMMARY = "A case-insensitive list for Python"
> -HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d229da563da18fe5d58cd95a6467d584"
> -
> -SRC_URI[sha256sum] =
> "73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c690ebd31afb72a4e03ac0"
> -
> -inherit pypi setuptools3
> diff --git a/meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.5.bb b/meta-python/recipes-devtools/python/
> python3-nocaselist_1.0.5.bb
> new file mode 100644
> index 0000000000..22b8825801
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.5.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A case-insensitive list for Python"
> +HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[sha256sum] =
> "e1c12ca2ae9d345b34948f2c8f60e3894619e2be2ed28b4ecc5e7f1dea117d1d"
> +
> +inherit pypi setuptools3
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96316):
> https://lists.openembedded.org/g/openembedded-devel/message/96316
> Mute This Topic: https://lists.openembedded.org/mt/90170589/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a2336105db8fd503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 31, 2022 at 8:43 PM zheng=
ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">License-Update: version updated to 1.0.5<br></blockquote><div>This is n=
ot a useful use of the License-Update tag. The reason for this is to tell u=
s _why_ the LIC_FILES_CHKSUM changed. Comparing the two LICENSE files with =
BeyondCompare shows no textual difference AT ALL, so perhaps it is whitespa=
ce/linefeeds.</div><div><br></div><div>The LICENSE file has also not change=
d at all in the github repository.</div><div><br></div><div>Please make an =
attempt to figure out why upstream is causing this thrash for a text file t=
hat has not changed AT ALL.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-nocaselist_1.0.=
4.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselist_1.0.4.bb</a>=
=C2=A0 =C2=A0| 8 --------<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python3-nocaselist_1.0.=
5.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselist_1.0.5.bb</a>=
=C2=A0 =C2=A0| 8 ++++++++<br>
=C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-nocaselist_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-nocaselist_1.0.4.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-nocaselist_1.0.5.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-nocaselist_1.0.5.bb</a><br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
nocaselist_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselis=
t_1.0.4.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-nocaselist_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocas=
elist_1.0.4.bb</a><br>
deleted file mode 100644<br>
index 60c79c22a8..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-nocasel=
ist_1.0.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselist_1.0.4=
.bb</a><br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-SUMMARY =3D &quot;A case-insensitive list for Python&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://nocaselist.readthedocs.io/en/latest/=
" rel=3D"noreferrer" target=3D"_blank">https://nocaselist.readthedocs.io/en=
/latest/</a>&quot;<br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd229da563da18fe5d58cd95a64=
67d584&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;73a9c0659e7135c66e46a6ab06e2cb637ce9248d73c69=
0ebd31afb72a4e03ac0&quot;<br>
-<br>
-inherit pypi setuptools3<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
nocaselist_1.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselis=
t_1.0.5.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pyth=
on3-nocaselist_1.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocas=
elist_1.0.5.bb</a><br>
new file mode 100644<br>
index 0000000000..22b8825801<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-nocasel=
ist_1.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-nocaselist_1.0.5=
.bb</a><br>
@@ -0,0 +1,8 @@<br>
+SUMMARY =3D &quot;A case-insensitive list for Python&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://nocaselist.readthedocs.io/en/latest/=
" rel=3D"noreferrer" target=3D"_blank">https://nocaselist.readthedocs.io/en=
/latest/</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D86d3f3a95c324c9479bd898696=
8f4327&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;e1c12ca2ae9d345b34948f2c8f60e3894619e2be2ed28=
b4ecc5e7f1dea117d1d&quot;<br>
+<br>
+inherit pypi setuptools3<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#96316): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/96316" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/96316</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90170589/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
90170589/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000a2336105db8fd503--


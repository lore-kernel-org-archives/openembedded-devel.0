Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FAFC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 01:17:54 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.44866.1697764665209413411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 18:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnVjwgb/;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5a7d532da4bso2682567b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 18:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697764664; x=1698369464; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9w99X3a4uCz14x27q6GkTuazH8MFTXePHwNvD78oS3s=;
        b=FnVjwgb/fy/PWcBZEa8Elt1jpWVP+VNQLoXAus+q9j44/6sSbaLa8NDMXjkB1Ez726
         jT+ud2rk5VWHACDibeZ+ClcrLOD30xlT4rKcVKkvyavzlgDu4uD4pKMEwknHS+1Cd4mI
         /P3HQ89ubdzD2TR60S8DAPFxBjc0/z01fQK5pPBgLQK2b23LrdNXNNPBVACKJFQ44YIj
         jFDnsx9NQxluxc0h0TmWa7RtE4DWYw9RK0Ni48RSLBtbo3V3VIh8eNKg81fp6ZjJq/tY
         L/pY69jZKovtmsSZmbiEv41xoYVX/CyoZ4eC8kVwjh62xSWncmhLswo+mU545aA6Gm48
         xcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697764664; x=1698369464;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w99X3a4uCz14x27q6GkTuazH8MFTXePHwNvD78oS3s=;
        b=O3G+2WtBylx8toURgsjpAwIdZqlO9uQZXCTMv0QHnCkZGkFCaownf/fYgTff6uzVKJ
         l7qe3MlfXp8hZiVuks0p+zgVS47xRjVZcvl9u3qcYgheSi0N/60svLjy3plAYXQmvJv4
         7/6pEC4xANeWJin3mGqi5N0ux6S+m/qvSAVy4USj9fOYgn5GzcLTqLhBXCeFPWEhtqni
         ylhtc+LZDCqn6vAK8gbvjVtNk8gNnRMPY8cVBGJDa4zDzFCXQJ1LFf52eJ0ZW6dZy6Y9
         nZYci07ePIKAhha4C5ZanWg8wkSlKSVpwzyOp3RCWe19alANWh2ZitOOWljEHhmhe3oF
         Ndow==
X-Gm-Message-State: AOJu0YweadXU2ID8Oc8omZlMcwPuX6X67ysVOrmq7pm21g62wiFcjuDj
	Nmn1EJwYAGIMGS8+36EwWs5du+u/AB6Zh6enOwBLs/0zsjWvv0nh
X-Google-Smtp-Source: AGHT+IE5YQNNCbUV1LMl3yaHtU+nXXFOYxGT23jz7NBy3oZ4tizPu/YgCBFI/a5iliw6KciAdFMYhQmg9g52Ox9/9Ao=
X-Received: by 2002:a05:690c:dc8:b0:5a7:fd05:2af2 with SMTP id
 db8-20020a05690c0dc800b005a7fd052af2mr750791ywb.2.1697764664004; Thu, 19 Oct
 2023 18:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <178F5D28C85B858E.11247@lists.openembedded.org>
In-Reply-To: <178F5D28C85B858E.11247@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 19 Oct 2023 18:17:32 -0700
Message-ID: <CANx9H-Ac2W_ojKW09BdVPoFFRANHkJs=-88=+G5XuH+gvn=YYQ@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH 1/2] po4a: remove old recipe
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b5d39f06081ba3da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105605

--000000000000b5d39f06081ba3da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Turns out the query was flawed, no recipes DEPENDS on po4a, but instead
po4a-native:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepen=
ds%3Apo4a-native

Strangely enough, this highlights a recipe in oe-core:
dos2unix
https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/do=
s2unix/dos2unix_7.5.1.bb?h=3Dmaster#n25

On Wed, Oct 18, 2023 at 6:13=E2=80=AFPM Tim Orling via lists.openembedded.o=
rg
<ticotimo=3Dgmail.com@lists.openembedded.org> wrote:

> po4a has been failing AUH upgrades for a long time now.
> The latest attempt to get ptests working for it can be found at:
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/po4a=
_0.69%2bptest
>
> If you care about this recipe, please continue the effort above and get
> ptests functional.
>
> According to the layerindex, the po4a recipe is not depended upon by any
> other known recipes:
>
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Apo4a
>
> (debsums in meta-oe dynamic-layers will be removed in another commit)
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../packagegroups/packagegroup-meta-perl.bb   |  1 -
>  meta-perl/recipes-perl/po4a/po4a_0.49.bb      | 33 -------------------
>  2 files changed, 34 deletions(-)
>  delete mode 100644 meta-perl/recipes-perl/po4a/po4a_0.49.bb
>
> diff --git a/meta-perl/recipes-core/packagegroups/
> packagegroup-meta-perl.bb b/meta-perl/recipes-core/packagegroups/
> packagegroup-meta-perl.bb
> index 187424b44..2672ab584 100644
> --- a/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
> +++ b/meta-perl/recipes-core/packagegroups/packagegroup-meta-perl.bb
> @@ -79,7 +79,6 @@ RDEPENDS:packagegroup-meta-perl =3D "\
>      libtest-nowarnings-perl \
>      libtest-warn-perl \
>      libunicode-linebreak-perl \
> -    po4a \
>  "
>
>  RDEPENDS:packagegroup-meta-perl-extended =3D "\
> diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
> b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
> deleted file mode 100644
> index 679ea0fb4..000000000
> --- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY =3D "PO for anything"
> -DESCRIPTION =3D "The po4a (PO for anything) project goal is to ease
> translations \
> -(and more interestingly, the maintenance of translations) using gettext
> tools \
> -on areas where they were not expected like documentation."
> -HOMEPAGE =3D "https://po4a.alioth.debian.org"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da96fc9b4cc36d80659e694ea109f0=
325"
> -
> -SRC_URI =3D "git://
> github.com/mquinson/po4a.git;protocol=3Dhttps;branch=3Dmaster"
> -
> -# v0.49
> -SRCREV =3D "79ed87a577a543538fe39c7b60079981f5997072"
> -
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS =3D " \
> -    libmodule-build-perl-native \
> -    libtext-wrapi18n-perl \
> -    libterm-readkey-perl \
> -    liblocale-gettext-perl \
> -    libunicode-linebreak-perl \
> -"
> -
> -RRECOMMENDS:${PN} =3D " \
> -    libtext-wrapi18n-perl \
> -    libterm-readkey-perl \
> -    liblocale-gettext-perl \
> -    libunicode-linebreak-perl \
> -"
> -
> -inherit cpan_build
> -
> -BBCLASSEXTEND =3D "native"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105586):
> https://lists.openembedded.org/g/openembedded-devel/message/105586
> Mute This Topic: https://lists.openembedded.org/mt/102052086/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b5d39f06081ba3da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Turns out the query was flawed, no recipes DEPENDS on=
 po4a, but instead po4a-native:</div><div><a href=3D"https://layers.openemb=
edded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Apo4a-native">http=
s://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3=
Apo4a-native</a><br></div><div><br></div><div>Strangely enough, this highli=
ghts a recipe in oe-core:</div><div>dos2unix</div><div><a href=3D"https://g=
it.openembedded.org/openembedded-core/tree/meta/recipes-support/dos2unix/do=
s2unix_7.5.1.bb?h=3Dmaster#n25">https://git.openembedded.org/openembedded-c=
ore/tree/meta/recipes-support/dos2unix/dos2unix_7.5.1.bb?h=3Dmaster#n25</a>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Oct 18, 2023 at 6:13=E2=80=AFPM Tim Orling via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;ticotimo=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">po4a has been failing AUH upgrades for a long time now.<br>
The latest attempt to get ptests working for it can be found at:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/log/?h=3D=
timo/po4a_0.69%2bptest" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/po4a_0.69%2bptest</a=
><br>
<br>
If you care about this recipe, please continue the effort above and get pte=
sts functional.<br>
<br>
According to the layerindex, the po4a recipe is not depended upon by any ot=
her known recipes:<br>
<a href=3D"https://layers.openembedded.org/layerindex/branch/master/recipes=
/?q=3Ddepends%3Apo4a" rel=3D"noreferrer" target=3D"_blank">https://layers.o=
penembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Apo4a</a><br=
>
<br>
(debsums in meta-oe dynamic-layers will be removed in another commit)<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-perl.bb" rel=3D=
"noreferrer" target=3D"_blank">packagegroup-meta-perl.bb</a>=C2=A0 =C2=A0|=
=C2=A0 1 -<br>
=C2=A0meta-perl/recipes-perl/po4a/<a href=3D"http://po4a_0.49.bb" rel=3D"no=
referrer" target=3D"_blank">po4a_0.49.bb</a>=C2=A0 =C2=A0 =C2=A0 | 33 -----=
--------------<br>
=C2=A02 files changed, 34 deletions(-)<br>
=C2=A0delete mode 100644 meta-perl/recipes-perl/po4a/<a href=3D"http://po4a=
_0.49.bb" rel=3D"noreferrer" target=3D"_blank">po4a_0.49.bb</a><br>
<br>
diff --git a/meta-perl/recipes-core/packagegroups/<a href=3D"http://package=
group-meta-perl.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-=
perl.bb</a> b/meta-perl/recipes-core/packagegroups/<a href=3D"http://packag=
egroup-meta-perl.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta=
-perl.bb</a><br>
index 187424b44..2672ab584 100644<br>
--- a/meta-perl/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-perl.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-perl.bb=
</a><br>
+++ b/meta-perl/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-perl.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-perl.bb=
</a><br>
@@ -79,7 +79,6 @@ RDEPENDS:packagegroup-meta-perl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libtest-nowarnings-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtest-warn-perl \<br>
=C2=A0 =C2=A0 =C2=A0libunicode-linebreak-perl \<br>
-=C2=A0 =C2=A0 po4a \<br>
=C2=A0&quot;<br>
<br>
=C2=A0RDEPENDS:packagegroup-meta-perl-extended =3D &quot;\<br>
diff --git a/meta-perl/recipes-perl/po4a/<a href=3D"http://po4a_0.49.bb" re=
l=3D"noreferrer" target=3D"_blank">po4a_0.49.bb</a> b/meta-perl/recipes-per=
l/po4a/<a href=3D"http://po4a_0.49.bb" rel=3D"noreferrer" target=3D"_blank"=
>po4a_0.49.bb</a><br>
deleted file mode 100644<br>
index 679ea0fb4..000000000<br>
--- a/meta-perl/recipes-perl/po4a/<a href=3D"http://po4a_0.49.bb" rel=3D"no=
referrer" target=3D"_blank">po4a_0.49.bb</a><br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-SUMMARY =3D &quot;PO for anything&quot;<br>
-DESCRIPTION =3D &quot;The po4a (PO for anything) project goal is to ease t=
ranslations \<br>
-(and more interestingly, the maintenance of translations) using gettext to=
ols \<br>
-on areas where they were not expected like documentation.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://po4a.alioth.debian.org" rel=3D"noref=
errer" target=3D"_blank">https://po4a.alioth.debian.org</a>&quot;<br>
-LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da96fc9b4cc36d80659e694ea10=
9f0325&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/mquinson/po4a.git;pro=
tocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.=
com/mquinson/po4a.git;protocol=3Dhttps;branch=3Dmaster</a>&quot;<br>
-<br>
-# v0.49<br>
-SRCREV =3D &quot;79ed87a577a543538fe39c7b60079981f5997072&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-DEPENDS =3D &quot; \<br>
-=C2=A0 =C2=A0 libmodule-build-perl-native \<br>
-=C2=A0 =C2=A0 libtext-wrapi18n-perl \<br>
-=C2=A0 =C2=A0 libterm-readkey-perl \<br>
-=C2=A0 =C2=A0 liblocale-gettext-perl \<br>
-=C2=A0 =C2=A0 libunicode-linebreak-perl \<br>
-&quot;<br>
-<br>
-RRECOMMENDS:${PN} =3D &quot; \<br>
-=C2=A0 =C2=A0 libtext-wrapi18n-perl \<br>
-=C2=A0 =C2=A0 libterm-readkey-perl \<br>
-=C2=A0 =C2=A0 liblocale-gettext-perl \<br>
-=C2=A0 =C2=A0 libunicode-linebreak-perl \<br>
-&quot;<br>
-<br>
-inherit cpan_build<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105586): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105586" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105586</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102052086/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102052086/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b5d39f06081ba3da--


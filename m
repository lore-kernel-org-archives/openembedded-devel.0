Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.7804.1599867163072364141
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 16:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qf/2Bgx9;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id y13so12855554iow.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gtEQCWokg4sbR/CAyaWfIObgS2M1Itof3ppleUbBpww=;
        b=Qf/2Bgx9KXrrNLpEHRKfsSuPJOhFxiyWUn+MkTrOoRNEGyc4M8Yb9iScZ2RuNjzHvu
         IqjTx2hTbAXuvJK1OJe4aJJDZh8IBa9SJAs2y4vJDW1+KM6CXqdAqetR0fLM8Vk1E3fc
         cVK72iGppVfmbITSS2jZRxE2f11j21CKUc+XtoWKWsT7hg1z0H2kz+fO0/Rb7yEujDD9
         /CoXrUh3Rcm60aFRQ5gBwhXjBrMphl+D8RvL6yqo1rTQBEnuZWZlF3uuU8VWya+Y6YYM
         QnVEgXfM165DQgm0zP8PHeYWDPLv1UyDx+j30cZbspUrBt+v+7awmMFbUISYDC8DvS2O
         yf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gtEQCWokg4sbR/CAyaWfIObgS2M1Itof3ppleUbBpww=;
        b=NGS6OMo78NA1R1ETC2ikqaQxOPgtmsg9Lv5AoU+v/I6waHUXpd3k9USimbEAzUI+N8
         M910DYUxDteal6BPjAFLWqqhSPPGVSO7IeE4SWsV4RGXgTFv+hdjmR8eZq5KB2a9iBii
         DRhZGchi6qzJbgqDT3+Dr0UKN43FbT0CCXcPbnVhsfqKr0BV7jye0x+eIDhYn6zDXQfl
         Uab/PiA6Wpa5kwrRbIhYLMV8s68FiniScFz3VI54s0gNSQGMuc3SZ5nEYH0LaFWMp86/
         eymZU1oIsDjsQ+l8cpaeffaahVkRmvvBVYN28aC/vq1GdLT3xk0pRFS1CiIg8eFwOGLn
         6GSA==
X-Gm-Message-State: AOAM531VQq76WMRVKaK58yKph0OYMUxtO4jjv2N1sv9w20qsL67HWDO9
	mFOFZco66moN84ryRkmnRfO4AX5CY112eF9+WNKGWFzWkjQ=
X-Google-Smtp-Source: ABdhPJyWJRGZp7VGjJ44omjSk1Ew3NZKuwz1wfPUG3NgG6MWXKxT8D4udMFvCqyp0C7EznbgVLRXEqvc/O7GRTm6P5Y=
X-Received: by 2002:a05:6602:26c1:: with SMTP id g1mr3716418ioo.10.1599867162359;
 Fri, 11 Sep 2020 16:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200828161009.2351244-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200828161009.2351244-1-Martin.Jansa@gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 11 Sep 2020 16:32:31 -0700
Message-ID: <CANx9H-B2VXqUoYfRvw1AShR4ORcTwg5rywWkXgqTQpbiUmtWzg@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] python-pyparted: upgrade to latest python2 compatible commit to fix build with gcc10 -fno-common
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e68c6605af1219f1"

--000000000000e68c6605af1219f1
Content-Type: text/plain; charset="UTF-8"

Merged. Thank you.

On Fri, Aug 28, 2020 at 9:10 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * this is one of last python2 compatible commits, before:
>
> https://github.com/dcantrell/pyparted/commit/c4949263538784036a5917195f956f8fcda9cf20
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../{python-pyparted_3.11.3.bb => python-pyparted_git.bb}    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>  rename recipes-extended/python-pyparted/{python-pyparted_3.11.3.bb =>
> python-pyparted_git.bb} (88%)
>
> diff --git a/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
> b/recipes-extended/python-pyparted/python-pyparted_git.bb
> similarity index 88%
> rename from recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
> rename to recipes-extended/python-pyparted/python-pyparted_git.bb
> index 86caf2a..1f36924 100644
> --- a/recipes-extended/python-pyparted/python-pyparted_3.11.3.bb
> +++ b/recipes-extended/python-pyparted/python-pyparted_git.bb
> @@ -11,8 +11,11 @@ LIC_FILES_CHKSUM = "\
>
>  file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2
> \
>  "
>
> +# 3.11.4 tag + gcc10 fixes for -fno-common
> +PV = "3.11.4+git${SRCPV}"
> +
>  # upstream only publishes releases in github archives which are
> discouraged
> -SRCREV = "481510c10866851844b19f3d2ffcdaa37efc0cf8"
> +SRCREV = "104ca13567c08c1188b126a395c4602841aae2c6"
>  SRC_URI = "git://github.com/rhinstaller/pyparted.git;protocol=https"
>
>  DEPENDS += "parted"
> --
> 2.25.1
>
> 
>

--000000000000e68c6605af1219f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Merged. Thank you.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 28, 2020 at 9:10 AM Martin J=
ansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* =
this is one of last python2 compatible commits, before:<br>
=C2=A0 <a href=3D"https://github.com/dcantrell/pyparted/commit/c4949263538=
784036a5917195f956f8fcda9cf20" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/dcantrell/pyparted/commit/c4949263538784036a5917195f956f8fcda9c=
f20</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python-pyparted_3.11.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">python-pyparted_3.11.3.bb</a> =3D&gt; <a href=3D"http://=
python-pyparted_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparte=
d_git.bb</a>}=C2=A0 =C2=A0 | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
=C2=A0rename recipes-extended/python-pyparted/{<a href=3D"http://python-py=
parted_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_3.11=
.3.bb</a> =3D&gt; <a href=3D"http://python-pyparted_git.bb" rel=3D"noreferr=
er" target=3D"_blank">python-pyparted_git.bb</a>} (88%)<br>
<br>
diff --git a/recipes-extended/python-pyparted/<a href=3D"http://python-pyp=
arted_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_3.11.=
3.bb</a> b/recipes-extended/python-pyparted/<a href=3D"http://python-pypart=
ed_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_git.bb</a><=
br>
similarity index 88%<br>
rename from recipes-extended/python-pyparted/<a href=3D"http://python-pypa=
rted_3.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_3.11.3=
.bb</a><br>
rename to recipes-extended/python-pyparted/<a href=3D"http://python-pypart=
ed_git.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_git.bb</a><=
br>
index 86caf2a..1f36924 100644<br>
--- a/recipes-extended/python-pyparted/<a href=3D"http://python-pyparted_3=
.11.3.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_3.11.3.bb</a=
><br>
+++ b/recipes-extended/python-pyparted/<a href=3D"http://python-pyparted_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">python-pyparted_git.bb</a><br>
@@ -11,8 +11,11 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://src/_pedmodule.c;beginline=3D10;endline=3D22;md=
5=3D9e53304db812b80d0939e11bb69dcab2 \<br>
=C2=A0&quot;<br>
<br>
+# 3.11.4 tag + gcc10 fixes for -fno-common<br>
+PV =3D &quot;3.11.4+git${SRCPV}&quot;<br>
+<br>
=C2=A0# upstream only publishes releases in github archives which are disc=
ouraged<br>
-SRCREV =3D &quot;481510c10866851844b19f3d2ffcdaa37efc0cf8&quot;<br>
+SRCREV =3D &quot;104ca13567c08c1188b126a395c4602841aae2c6&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/rhinstaller/pyp=
arted.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/rhinstaller/pyparted.git;protocol=3Dhttps</a>&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;parted&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div>

--000000000000e68c6605af1219f1--

Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6100CD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:37:08 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1670.1778175422505650076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2026 10:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z70njW4I;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-651bc83e74aso1176988d50.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 10:37:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778175421; cv=none;
        d=google.com; s=arc-20240605;
        b=UAKPjSRo7AkvZGCZXs+3OjnM71qk5dR0qwvzOkWCInoB2pvtK6y+5JpeId8iknsxoX
         I7Yyd5NNRchHHE6AiucDWGNyB8Y/EpTBJSBqdwtY0mSeC+1ZhjzJjc4F+BXLfY9GASe0
         gM5jI1zGEA8qn8PZQx0IFSZMWdZFEHBEOvgl3JhwBTNvGFySi1E57k+S9uCRoHP0LrM1
         wuTBpAqnlUIWDXiZX6778FiN/JSptxKWGDdXRvE76E06q1wvVvT0hDM8tdKTjszCL/9e
         IZRcgk9cR6YyopIS5B9qEBOusuqjwqFv892q7fLOpksYgZpPs8yGx+Smmz5ax9Rak5G+
         oDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BJgbY/UpkHSEFVd0s9m17++cMJ8CMuOFipX2wk33VGM=;
        fh=v4WyAjFoYiqffg7EC4d9FKBzZwVDxoKYVv7EcI9UvMk=;
        b=hW3A/85ZsgWacAf1JwKFMkqyjqzK6p290KThju9/fOUZ0qTefEnWnMWl2+RgyZGPPz
         dvPhne7xce7R432qIwlc7poYHLvXRNVB/6sxd1HQ7Au5RFyewFBQyOj4lDKXXmPjw3rv
         f1mQ+8lTVt54pbLhzUuXNRQyXxiVUBg6sywN8v38JhnLwq4KEQDMjt6Yj1dUECXGvKve
         Z6wJVAwrnzyPaBd124GHo9IqjhGbpdKgSQQiz8QpC7oCqrcRX7zSckpHgoECMWNY1ehQ
         gMgVxOes+00gRwRu1ZLTiqBJyWV4il94yE+lFjqRF/D1W5IyKiEh3gRXA+BgVZZ8uErq
         Zhog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778175421; x=1778780221; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BJgbY/UpkHSEFVd0s9m17++cMJ8CMuOFipX2wk33VGM=;
        b=Z70njW4Im296VX98FsZHXnwRtq6rrAyFlHiaR0CfAfik/5bxjfldsS97a+Hlkio0fm
         fU9DfDOFs8c1e+GZSZXXIplGGziidUK7qv5GPyP5ezfD4DAttL5gxh1MBucV1IzVrAS2
         gWtLEuS6ei4bu7jo2CMS5/blPmlowebFoDQhtGPvdLmK8e4MyX8YhKIVCfKwwlKnOPU7
         dI7kYFGb74BgEuYQ28Eit563nEIhDV+/WQ/iGpPiiQOG1KJTWSpn+z/B41k9RLIEAjWT
         bozl0rJdT+Nr2/U1XroeEk378/VrbvF3IYmH8vUWdy1fx81gY6DqFyGqtMyZZiXEi/Ls
         sB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778175421; x=1778780221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJgbY/UpkHSEFVd0s9m17++cMJ8CMuOFipX2wk33VGM=;
        b=A7Ya7RDpSE0KGvZsWXBfWwlVvr7TREev+OBpBhpK+pViMXazOWAsluXrtO2sNv757z
         4SclTRm0ijodYqYeFFwtqThBDBRLODd4uqXBjgaTiB156OrAUm/wwRwmytg4QOdoMtuh
         5u4CuWkgMYuSVAPqWidJFXBw+o6SJsDaNA+2PQ6WeqVJRwlW2xiFY9Q9jP+E93IYIgyw
         CTHwI15Uw5rrSelrjfdOP3wlTwUtfdG+pG430nAfaFVPQdRoB3LeGyje3BmeSBSk0enS
         f7nmB69jwmDkOOD5I+8oWJLLUDxSYVPS2nCuL8x+2w7THA07/D7HyS9v5UmQ1tIWUAE1
         IBUg==
X-Forwarded-Encrypted: i=1; AFNElJ/gZ/6tfVJs4QRvVbz0vAFvoYjjq101BqDgsPxRnsSHf0PQByKucFrl451VlX3wKgiE+u8rxrQT8nO4Ul4wmgXVKdA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQrfIWttzo1pvTHG1HFZc3Vzbr7fHYIZQM+JJiaPrzXKevRFxF
	j0mQc4UNi0LM3YhM87LZWX8L0nebrdPHISBf264J3Gspm82D/4hHV9C0z2wR0aiZ67yYFjcCIgj
	p6e2qifwK9GmCsF9iWzLlxLi3+T2ICWI=
X-Gm-Gg: Acq92OFeljOJwmp9GuN1MmxCpvHjqk7/Flws2pBFiMvvXyBVoTFkm7Z/pwK06Oqm5GZ
	/89VJ9C4MSBk2jX5hwp6lxom565+lgZISP4N6/+0mMG4NEhtz2B+kgR9UiuxOiUnWoN2KyY+Adi
	M9scbcTOoNOt2ldwwwFO5UcB/ti8JIZYBT9TcUhN6YXp8j2LyRrWI9VmTZETm8E7ZjjoDq2hsEi
	doSSjBnHnCSG78z+uXsVlX06jxEEzxJkvPoEcpB7ZI6knGdChqLeG8uNIUCX8z0cg5aiXlHaqwd
	3Y7z5b9zctYuSjlNNB5LI8xmyQc2TEaoG2wbg/QhTVNFs7cWk+IaYwrRjCNbcfP+4TkgWqVJEvo
	eeldqfo7HMfMoVJKEFziMx64x8UdJCuuSY9fWbk8cjpnnr0pS7NwaQiOwq6TF05skvuj0+nmOn/
	xl0jt++w==
X-Received: by 2002:a05:690e:c49:b0:63f:b4ee:7920 with SMTP id
 956f58d0204a3-65c79c67e90mr9070223d50.11.1778175421361; Thu, 07 May 2026
 10:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260502075925.1861299-1-ankur.tyagi85@gmail.com>
 <c7d17e42-e8bd-4152-a0c2-91b38cb52399@gmail.com> <CADySD0EpRMD709L5uFQf+72ULcokCHWOcJoMtjL4k7Z8BjNjKQ@mail.gmail.com>
In-Reply-To: <CADySD0EpRMD709L5uFQf+72ULcokCHWOcJoMtjL4k7Z8BjNjKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 May 2026 23:06:35 +0530
X-Gm-Features: AVHnY4IghQN34NAmj3I_ieMtL7QkQjA34j5QkYkU9bLipcj3Vc0Q5vEjWHsQYFw
Message-ID: <CAMKF1sq7TTiX-+SgOxtTxCMYt1tLEySeds2Tn08W_zzqcgPaYg@mail.gmail.com>
Subject: Re: [oe][meta-webserver][PATCH 1/1] nginx: upgrade 1.29.7 -> 1.30.0
To: ankur.tyagi85@gmail.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000056b42706513dba29"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2026 17:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126817

--00000000000056b42706513dba29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 3, 2026 at 2:55=E2=80=AFAM Ankur Tyagi via lists.openembedded.o=
rg
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> On Sat, May 2, 2026 at 8:17=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com>
> wrote:
> >
> > On 5/2/26 09:59, Ankur Tyagi via lists.openembedded.org wrote:
> > > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > >
> > > 1.30.0 stable version has been released, incorporating new features
> and bug
> > > fixes from the 1.29.x mainline branch (
> https://nginx.org/en/CHANGES-1.30)
> > >
> > > Set v1.30.0 branch as default preference.
> > >
> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > > ---
> > >  meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  5 +++++
> > >  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
> > >  meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++
> >
> >
> >
> > I think rather the 1.28 recipe should be deleted with this patch. Odd
> > versions are mainline/bleeding edge releases, and even versions are
> > stable ones. AFAIK 1.28 isn't supported anymore with the release of
> > 1.30. (I'd expect that there will be a 1.31 release in a week or two, a=
s
> > a continuation of the 1.29 series)
>
> Since 1.28 was the last stable branch, I suspect the majority of the
> users will be using it.
> Until 1.31 is released, I wanted to keep both stable versions to allow
> time for the transition.
>
> Once we add 1.31 support, then IMO it will be appropriate to drop
> 1.28. Thoughts ?
>

lets just have 1.30 and remove all others. If need be when 1.31 is released
someone needing it should send the patch.


> >
> >
> >
> > >  3 files changed, 11 insertions(+), 10 deletions(-)
> > >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.b=
b
> > >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.b=
b
> > >
> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > > index 9872a6de3b..f2b10a5c69 100644
> > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> > > @@ -5,3 +5,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D3dc49537b08b14c8b66ad247bb4c4593"
> > >  SRC_URI[sha256sum] =3D
> "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
> > >
> > >  CVE_STATUS[CVE-2025-53859] =3D "cpe-stable-backport: Fix is included=
 in
> 1.28.1"
> > > +
> > > +# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is built =
by
> > > +# default. To build the 1.28.x branch,
> > > +# PREFERRED_VERSION_nginx =3D "1.28.%" can be added to local.conf
> > > +DEFAULT_PREFERENCE =3D "-1"
> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > > deleted file mode 100644
> > > index 4d884fcbb3..0000000000
> > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> > > +++ /dev/null
> > > @@ -1,10 +0,0 @@
> > > -require nginx.inc
> > > -
> > > -# 1.28.x branch is the current stable branch, the recommended defaul=
t
> > > -# 1.29.x is the current mainline branches containing all new feature=
s
> > > -DEFAULT_PREFERENCE =3D "-1"
> > > -
> > > -LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad393f99"
> > > -
> > > -SRC_URI[sha256sum] =3D
> "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
> > > -
> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> > > new file mode 100644
> > > index 0000000000..139fe24dcd
> > > --- /dev/null
> > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> > > @@ -0,0 +1,6 @@
> > > +require nginx.inc
> > > +
> > > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D79da1c70d587d3a199af9255ad393f99"
> > > +
> > > +SRC_URI[sha256sum] =3D
> "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
> > > +
> > >
> > >
> > >
> > >
> > >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126767):
> https://lists.openembedded.org/g/openembedded-devel/message/126767
> Mute This Topic: https://lists.openembedded.org/mt/119112437/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000056b42706513dba29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 3, =
2026 at 2:55=E2=80=AFAM Ankur Tyagi via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, May =
2, 2026 at 8:17=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun=
@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 5/2/26 09:59, Ankur Tyagi via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; &gt; From: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; 1.30.0 stable version has been released, incorporating new featur=
es and bug<br>
&gt; &gt; fixes from the 1.29.x mainline branch (<a href=3D"https://nginx.o=
rg/en/CHANGES-1.30" rel=3D"noreferrer" target=3D"_blank">https://nginx.org/=
en/CHANGES-1.30</a>)<br>
&gt; &gt;<br>
&gt; &gt; Set v1.30.0 branch as default preference.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gm=
ail.com" target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.28.3.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a> |=C2=A0=
 5 +++++<br>
&gt; &gt;=C2=A0 meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a> | 10 --=
--------<br>
&gt; &gt;=C2=A0 meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.30.0.bb</a> |=C2=A0=
 6 ++++++<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I think rather the 1.28 recipe should be deleted with this patch. Odd<=
br>
&gt; versions are mainline/bleeding edge releases, and even versions are<br=
>
&gt; stable ones. AFAIK 1.28 isn&#39;t supported anymore with the release o=
f<br>
&gt; 1.30. (I&#39;d expect that there will be a 1.31 release in a week or t=
wo, as<br>
&gt; a continuation of the 1.29 series)<br>
<br>
Since 1.28 was the last stable branch, I suspect the majority of the<br>
users will be using it.<br>
Until 1.31 is released, I wanted to keep both stable versions to allow<br>
time for the transition.<br>
<br>
Once we add 1.31 support, then IMO it will be appropriate to drop<br>
1.28. Thoughts ?<br></blockquote><div><br></div><div>lets just have 1.30 an=
d remove all others. If need be when 1.31 is released</div><div>someone nee=
ding it should send the patch.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt;=C2=A0 3 files changed, 11 insertions(+), 10 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-webserver/recipes-httpd/nginx/<a hr=
ef=3D"http://nginx_1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.=
29.7.bb</a><br>
&gt; &gt;=C2=A0 create mode 100644 meta-webserver/recipes-httpd/nginx/<a hr=
ef=3D"http://nginx_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.=
30.0.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-webserver/recipes-httpd/nginx/<a href=3D"http:/=
/nginx_1.28.3.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a> =
b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.28.3.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a><br>
&gt; &gt; index 9872a6de3b..f2b10a5c69 100644<br>
&gt; &gt; --- a/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.28.3.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a><br>
&gt; &gt; +++ b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.28.3.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.28.3.bb</a><br>
&gt; &gt; @@ -5,3 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3=
dc49537b08b14c8b66ad247bb4c4593&quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;2c96a946bfb0882a21744ed429770a=
2123ae1828c7c48665092993ddee91a918&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CVE_STATUS[CVE-2025-53859] =3D &quot;cpe-stable-backport: F=
ix is included in 1.28.1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is bu=
ilt by<br>
&gt; &gt; +# default. To build the 1.28.x branch,<br>
&gt; &gt; +# PREFERRED_VERSION_nginx =3D &quot;1.28.%&quot; can be added to=
 local.conf<br>
&gt; &gt; +DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; &gt; diff --git a/meta-webserver/recipes-httpd/nginx/<a href=3D"http:/=
/nginx_1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a> =
b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.29.7.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a><br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index 4d884fcbb3..0000000000<br>
&gt; &gt; --- a/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.29.7.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.29.7.bb</a><br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,10 +0,0 @@<br>
&gt; &gt; -require nginx.inc<br>
&gt; &gt; -<br>
&gt; &gt; -# 1.28.x branch is the current stable branch, the recommended de=
fault<br>
&gt; &gt; -# 1.29.x is the current mainline branches containing all new fea=
tures<br>
&gt; &gt; -DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D79da1c70d587d3a1=
99af9255ad393f99&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;673f8fb8c0961c44fbd9410d61618314536=
09b44063d3f2948253fc2b5692139&quot;<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta-webserver/recipes-httpd/nginx/<a href=3D"http:/=
/nginx_1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.30.0.bb</a> =
b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_1.30.0.bb" rel=
=3D"noreferrer" target=3D"_blank">nginx_1.30.0.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..139fe24dcd<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-webserver/recipes-httpd/nginx/<a href=3D"http://nginx_=
1.30.0.bb" rel=3D"noreferrer" target=3D"_blank">nginx_1.30.0.bb</a><br>
&gt; &gt; @@ -0,0 +1,6 @@<br>
&gt; &gt; +require nginx.inc<br>
&gt; &gt; +<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D79da1c70d587d3a1=
99af9255ad393f99&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;058188c64bf22baecaa72b809a6318a4f9b=
a623889c554feab03f7cb853ab31b&quot;<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126767): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126767" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126767</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119112437/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119112437/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000056b42706513dba29--


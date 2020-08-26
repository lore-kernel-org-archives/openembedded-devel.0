Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web11.3994.1598473734471872211
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 13:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Lxw0uz6V;
 spf=pass (domain: linaro.org, ip: 209.85.166.66, mailfrom: arthur.she@linaro.org)
Received: by mail-io1-f66.google.com with SMTP id j2so1272917ioj.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lcyp68JZcd54fiH3fVoJWeMQMLw9WE8ePlJVrNJUbXE=;
        b=Lxw0uz6VjrqR7hRwnOIa2wFRTynrDFbY2IzJwFd+peJnkPio+yWhTFZ5QXLaVTftde
         WW0mxrjlchuGLPwcRnWOvJB7w1GxKA3chGUaJechxXLC5tR3sFXlOOPAs+kjPMXDBB2U
         lM42qqg6jYEvro3CPVsEK9GK+MuqvwIlldu7zle+DvJMpaHUQocMqQLPyzdPDTNLH/aj
         8A9I4zinCEG2wrlpZGrpMmVRCByilRTOUOpYtqIWOuStJbPkqXOuy2XvLggtwWgE1BMi
         44q9RKZcorKmTo00RbloaN1W4mNWFnxtnuGZdUkMJzPi/QSYX3QicnD1XZ31MxqFDpv1
         Y5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lcyp68JZcd54fiH3fVoJWeMQMLw9WE8ePlJVrNJUbXE=;
        b=TVHKKEWXccf7pk2qDdexEJU0Mbad82rNNGanxISTFiQy33xssaBwnNrshidqDlKMka
         Sv6tKn0DKZv4wr/gigH/TG51fWAtelbh6tJhiu+Ep3wA2p5GfroiE1aTzifRSxzsS4+h
         F4rHd+cezNkC1wx/Mf6JOX7HrFNWXnlKQ4FUrEH5PDcyE3cf8MfRBY5Kvh4WMSwXaxNA
         AM+0u1gafphJo5coJYrigX+rVjQ29JK4KQjc6Ma9bL66P5AWHQwfcBMNKkX85CnBTYJf
         rV9wEr7vg+5Ni68Uav1Wuf8xHV2trefN45bhzwx24W18qDCCswtG6ZI73g8t8A0lESrO
         1Nag==
X-Gm-Message-State: AOAM531ZNrsTjdLNd9TAGSyGLaExayNYwr4YqNQ9AZwmEMtbOO62l1uj
	u4bBdxYi04DrOgF3ouBWMLe8cDG6RyTDeM1fKdin1Q==
X-Google-Smtp-Source: ABdhPJzb9qoPt2ilecvxIaN5vOvp7GqsUvMyRdkSpq9v8YleAG8HWCf1lknVGoi+NcKhOKXsuO3k0UkNjEBTwiWnIYA=
X-Received: by 2002:a6b:3a0b:: with SMTP id h11mr6329203ioa.109.1598473733757;
 Wed, 26 Aug 2020 13:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200825040803.837645-1-arthur.she@linaro.org>
 <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com>
 <CAJ8hLzFxzfX1vUasMcUmiSW=p_YTZvnCMp+wR_AcB9mLf4NrmA@mail.gmail.com> <CAMKF1sp=_fV84eJ7S2vCjCvEf=5Y9qmsGp8UL_-VYCEhhuE6og@mail.gmail.com>
In-Reply-To: <CAMKF1sp=_fV84eJ7S2vCjCvEf=5Y9qmsGp8UL_-VYCEhhuE6og@mail.gmail.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Wed, 26 Aug 2020 13:28:42 -0700
Message-ID: <CAJ8hLzH8A1aLVynEW1xyee=3YZG3_vdumq7D-OKt7pipnOZNzw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000015779305adcdabff"

--00000000000015779305adcdabff
Content-Type: text/plain; charset="UTF-8"

We built curl and xmlrpc-c for arm and aarch64 architectures.
Except for the Makefile macro error of xmlrpc-c-1.54.02, everything works
fine so far.

Could you give me an example of the config files with pkgconfig calls?

Thanks,
Arthur


On Tue, Aug 25, 2020 at 10:26 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 25, 2020 at 9:58 PM Arthur She <arthur.she@linaro.org> wrote:
> >
> > Hi Khem,
> > I am not sure I understand what you mean.
> > Could you share some more details?
> >
>
> We have replaced many of these config files with pkgconfig calls,
> since they do not work reliably in cross compile envs
> but I don't see this being done for curl-config yet so perhaps it does
> work ok in cross builds.
>
> > Thanks,
> > Arthur
> >
> > On Tue, Aug 25, 2020 at 11:34 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Mon, Aug 24, 2020 at 9:08 PM Arthur She <arthur.she@linaro.org>
> wrote:
> >> >
> >> > This error caused the curl library not to be linked.
> >> >
> >> > Signed-off-by: Arthur She <arthur.she@linaro.org>
> >> > ---
> >> >  .../0003-Fix-Makefile-macro-error.patch       | 26
> +++++++++++++++++++
> >> >  .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
> >> >  2 files changed, 27 insertions(+)
> >> >  create mode 100644
> meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> >> >
> >> > diff --git
> a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> >> > new file mode 100644
> >> > index 000000000..e0be24bf7
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> >> > @@ -0,0 +1,26 @@
> >> > +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00
> 2001
> >> > +From: Arthur She <arthur.she@linaro.org>
> >> > +Date: Mon, 24 Aug 2020 20:50:58 -0700
> >> > +Subject: [PATCH] Fix Makefile macro error
> >> > +
> >> > +The libcurl will not be liked due to this error.
> >> > +---
> >> > + src/Makefile | 2 +-
> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > +
> >> > +diff --git a/src/Makefile b/src/Makefile
> >> > +index 1cdf8b0..acd04dd 100644
> >> > +--- a/src/Makefile
> >> > ++++ b/src/Makefile
> >> > +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
> >> > +   TRANSPORT_MODS +=
> $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
> >> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
> >> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
> >> > +-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
> >> > ++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
> >>
> >> do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?
> >> I think it would be better to do so as well while here.
> >>
> >> > +   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
> >> > + endif
> >> > + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> >> > index c1f0b78ca..eec945824 100644
> >> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> >> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> >> > @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =
> "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
> >> >  SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
> >> >
>  file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
> >> >             file://0002-fix-formatting-issues.patch \
> >> > +           file://0003-Fix-Makefile-macro-error.patch \
> >> >             "
> >> >
> >> >  #Release 1.54.02
> >> > --
> >> > 2.25.1
> >> >
> >> > 
>

--00000000000015779305adcdabff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We built curl and xmlrpc-c for arm and aarch64 architectur=
es.<div>Except for the Makefile macro error of xmlrpc-c-1.54.02, everything=
 works fine so far.</div><div><br></div><div>Could you give me an example o=
f the config files with pkgconfig calls?</div><div><br></div><div>Thanks,</=
div><div>Arthur</div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 10:26 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug =
25, 2020 at 9:58 PM Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org"=
 target=3D"_blank">arthur.she@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Khem,<br>
&gt; I am not sure I understand what you mean.<br>
&gt; Could you share some more details?<br>
&gt;<br>
<br>
We have replaced many of these config files with pkgconfig calls,<br>
since they do not work reliably in cross compile envs<br>
but I don&#39;t see this being done for curl-config yet so perhaps it does=
<br>
work ok in cross builds.<br>
<br>
&gt; Thanks,<br>
&gt; Arthur<br>
&gt;<br>
&gt; On Tue, Aug 25, 2020 at 11:34 AM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Aug 24, 2020 at 9:08 PM Arthur She &lt;<a href=3D"mailto:=
arthur.she@linaro.org" target=3D"_blank">arthur.she@linaro.org</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This error caused the curl library not to be linked.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@l=
inaro.org" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../0003-Fix-Makefile-macro-error.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 26 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 .../xmlrpc-c/<a href=3D"http://xmlrpc-c_1.54.02.bb" re=
l=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a>=C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 27 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/x=
mlrpc-c/0003-Fix-Makefile-macro-error.patch<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003=
-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-=
c/0003-Fix-Makefile-macro-error.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000..e0be24bf7<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Ma=
kefile-macro-error.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,26 @@<br>
&gt;&gt; &gt; +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00=
:00:00 2001<br>
&gt;&gt; &gt; +From: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.or=
g" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt;&gt; &gt; +Date: Mon, 24 Aug 2020 20:50:58 -0700<br>
&gt;&gt; &gt; +Subject: [PATCH] Fix Makefile macro error<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +The libcurl will not be liked due to this error.<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + src/Makefile | 2 +-<br>
&gt;&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/src/Makefile b/src/Makefile<br>
&gt;&gt; &gt; +index 1cdf8b0..acd04dd 100644<br>
&gt;&gt; &gt; +--- a/src/Makefile<br>
&gt;&gt; &gt; ++++ b/src/Makefile<br>
&gt;&gt; &gt; +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transpo=
rt/xmlrpc_curl_transport<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transpo=
rt/curltransaction<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transpo=
rt/curlmulti<br>
&gt;&gt; &gt; +-=C2=A0 TRANSPORT_LIBDEP +=3D $(shell $CURL_CONFIG --libs)<=
br>
&gt;&gt; &gt; ++=C2=A0 TRANSPORT_LIBDEP +=3D $(shell $(CURL_CONFIG) --libs=
)<br>
&gt;&gt;<br>
&gt;&gt; do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?<br>
&gt;&gt; I think it would be better to do so as well while here.<br>
&gt;&gt;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0TRANSPORT_INCLUDES +=3D -Isrcdir/lib/curl_tran=
sport<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"ht=
tp://xmlrpc-c_1.54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.5=
4.02.bb</a> b/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_=
1.54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a><br=
>
&gt;&gt; &gt; index c1f0b78ca..eec945824 100644<br>
&gt;&gt; &gt; --- a/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xm=
lrpc-c_1.54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb=
</a><br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xm=
lrpc-c_1.54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb=
</a><br>
&gt;&gt; &gt; @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://doc/COPYIN=
G;md5=3Daefbf81ba0750f02176b6f86752ea951&quot;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/m=
irror/xmlrpc-c.git" rel=3D"noreferrer" target=3D"_blank">github.com/mirror/=
xmlrpc-c.git</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-t=
est-cpp-server_abyss-Fix-build-with-clang-libc.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-f=
ix-formatting-issues.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Fix-Ma=
kefile-macro-error.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 #Release 1.54.02<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
</blockquote></div>

--00000000000015779305adcdabff--

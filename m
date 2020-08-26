Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.6088.1598417881156656985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 21:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rC0tqIVr;
 spf=pass (domain: linaro.org, ip: 209.85.166.169, mailfrom: arthur.she@linaro.org)
Received: by mail-il1-f169.google.com with SMTP id w3so582748ilh.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j92iAGP0JBi+QavufBZnwnpv1O7Re5ixzIFA5SMzdAQ=;
        b=rC0tqIVrS6cuQR5/6hfalPM1Wl2oszjd7/IFleLkjxjEZsrbYGJ36AFBPljgINJGl7
         D1o/DHKAosljkxen7WKNsYH/KFQZ8y8crEmcUerpcBzblVwlgitMLI/ZZ2XLs3inUDbU
         L8Fi63xqS5rnz+4kNQMZQl5HCcoU1iu0ciVYjTHvzE43U5hI2oBh2ihuKA5T+j3cebIP
         dyJhknS3i9urlwmZGaJkb9ojoHuDb8y3Y/3JUj528VQl2U3KNK7uuz6nhDWRKQViEgUj
         0JdRQNRE/2t2lK1FJH92mo/OyZF13CvBtJSkugdoKOKUXDFv+db+0a9ccxSZ5Cbh0fqZ
         V2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j92iAGP0JBi+QavufBZnwnpv1O7Re5ixzIFA5SMzdAQ=;
        b=Cknu4k0E5TwM1+bqGPQ1EvYMI25vgdfpBiy6/4OK7Nlx4M0vg9fNS4+Xdy+6eyuP3J
         YZQbuDt8pNDh8PKNxA+CrnPHDbq0p+8VjlHqhUAwko5gikrPIEvkfIdVW+ujmvav391y
         UdfroE/ntp78euI44ULdDHDYW1Qhy3PDcjD4vxJEmuOFTZc0xO1qml7S14IStCWBcK52
         23ZqYiUPnIFSI4Mxxq5hBRm67PfAKeckfcHf0W5LPEvN8/VitG4/QdqmqcTvbmWBmDFn
         uv/Dpdm+XfUtPMSXpqAO5EUXJdGCkeKJkYGhGb4fcoxAMQMxsRwBT7m++HdxQB04aUqp
         9Eww==
X-Gm-Message-State: AOAM531xEMFpX+TH7zUuTEMZU+1zxyWOQNYoj9MT5W1SO93zZjFkL0rT
	5F/zWTxFCVQoyQ3P5AcdxnT3dEOCEccqtAdMZhgfpQ==
X-Google-Smtp-Source: ABdhPJzUeNLIO7FYQt4frYaC1j1jggbxZujeC3wJP60Pcs9wu2HvJiPUwNxcULUH3qpYv0CShHWvpXxLDr65E7ZP1Qo=
X-Received: by 2002:a92:d646:: with SMTP id x6mr12201377ilp.237.1598417880458;
 Tue, 25 Aug 2020 21:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200825040803.837645-1-arthur.she@linaro.org> <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Tue, 25 Aug 2020 21:57:49 -0700
Message-ID: <CAJ8hLzFxzfX1vUasMcUmiSW=p_YTZvnCMp+wR_AcB9mLf4NrmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f7c59105adc0a933"

--000000000000f7c59105adc0a933
Content-Type: text/plain; charset="UTF-8"

Hi Khem,
I am not sure I understand what you mean.
Could you share some more details?

Thanks,
Arthur

On Tue, Aug 25, 2020 at 11:34 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 24, 2020 at 9:08 PM Arthur She <arthur.she@linaro.org> wrote:
> >
> > This error caused the curl library not to be linked.
> >
> > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > ---
> >  .../0003-Fix-Makefile-macro-error.patch       | 26 +++++++++++++++++++
> >  .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
> >  2 files changed, 27 insertions(+)
> >  create mode 100644
> meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> >
> > diff --git
> a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> > new file mode 100644
> > index 000000000..e0be24bf7
> > --- /dev/null
> > +++
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
> > @@ -0,0 +1,26 @@
> > +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 2001
> > +From: Arthur She <arthur.she@linaro.org>
> > +Date: Mon, 24 Aug 2020 20:50:58 -0700
> > +Subject: [PATCH] Fix Makefile macro error
> > +
> > +The libcurl will not be liked due to this error.
> > +---
> > + src/Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/Makefile b/src/Makefile
> > +index 1cdf8b0..acd04dd 100644
> > +--- a/src/Makefile
> > ++++ b/src/Makefile
> > +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
> > +-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
> > ++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
>
> do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?
> I think it would be better to do so as well while here.
>
> > +   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
> > + endif
> > + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > index c1f0b78ca..eec945824 100644
> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
> > @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =
> "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
> >  SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
> >
>  file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
> >             file://0002-fix-formatting-issues.patch \
> > +           file://0003-Fix-Makefile-macro-error.patch \
> >             "
> >
> >  #Release 1.54.02
> > --
> > 2.25.1
> >
> > 
>

--000000000000f7c59105adc0a933
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Khem,<div>I am not sure I understand what you mean=
.</div><div>Could you share some more=C2=A0details?</div><div><br></div><di=
v>Thanks,</div><div>Arthur</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 25, 2020 at 11:34 AM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug 24, =
2020 at 9:08 PM Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org" tar=
get=3D"_blank">arthur.she@linaro.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This error caused the curl library not to be linked.<br>
&gt;<br>
&gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org=
" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0003-Fix-Makefile-macro-error.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 26 +++++++++++++++++++<br>
&gt;=C2=A0 .../xmlrpc-c/<a href=3D"http://xmlrpc-c_1.54.02.bb" rel=3D"nore=
ferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 27 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0=
003-Fix-Makefile-macro-error.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Make=
file-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fi=
x-Makefile-macro-error.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..e0be24bf7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-ma=
cro-error.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org" target=
=
=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; +Date: Mon, 24 Aug 2020 20:50:58 -0700<br>
&gt; +Subject: [PATCH] Fix Makefile macro error<br>
&gt; +<br>
&gt; +The libcurl will not be liked due to this error.<br>
&gt; +---<br>
&gt; + src/Makefile | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/Makefile b/src/Makefile<br>
&gt; +index 1cdf8b0..acd04dd 100644<br>
&gt; +--- a/src/Makefile<br>
&gt; ++++ b/src/Makefile<br>
&gt; +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)<br>
&gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transport/xmlrpc=
_curl_transport<br>
&gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transport/curltr=
ansaction<br>
&gt; +=C2=A0 =C2=A0TRANSPORT_MODS +=3D $(BLDDIR)/lib/curl_transport/curlmu=
lti<br>
&gt; +-=C2=A0 TRANSPORT_LIBDEP +=3D $(shell $CURL_CONFIG --libs)<br>
&gt; ++=C2=A0 TRANSPORT_LIBDEP +=3D $(shell $(CURL_CONFIG) --libs)<br>
<br>
do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?<br>
I think it would be better to do so as well while here.<br>
<br>
&gt; +=C2=A0 =C2=A0TRANSPORT_INCLUDES +=3D -Isrcdir/lib/curl_transport<br>
&gt; + endif<br>
&gt; + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlr=
pc-c_1.54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</=
a> b/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.54.02.b=
b" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a><br>
&gt; index c1f0b78ca..eec945824 100644<br>
&gt; --- a/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.=
54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/xmlrpc-c/<a href=3D"http://xmlrpc-c_1.=
54.02.bb" rel=3D"noreferrer" target=3D"_blank">xmlrpc-c_1.54.02.bb</a><br>
&gt; @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=3Da=
efbf81ba0750f02176b6f86752ea951&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/mirror/xml=
rpc-c.git" rel=3D"noreferrer" target=3D"_blank">github.com/mirror/xmlrpc-c.=
git</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-cpp-s=
erver_abyss-Fix-build-with-clang-libc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-fix-format=
ting-issues.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Fix-Makefile-ma=
cro-error.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 #Release 1.54.02<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--000000000000f7c59105adc0a933--

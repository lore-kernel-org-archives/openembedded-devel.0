Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 79AD37FDC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:43:44 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e12so3632472qto.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=35EZom+w4veeZXncJVaRzB6v3WpmSa2RCFZPzF1H+qo=;
	b=A4jyLYhaqCUbOl75uwXFOvJ0mNnNtmdBPrZbLNTCKjHHyH6caUPsldxtClrMBNksxe
	UzOZOq3DbjvuNYGym0rjszvBoq0fRNiJhPQ5Of1h6tP+5AtZyv4URv5LeHNI0Ol+/7VM
	Umslm0T+WQQck/QGx1gQaeG7zqfioKHlyTKs/IxEVQrGbV8BwQKTVFaz+s8R20iewpH7
	SmWy0pv4Rl8DNjIEYYuBsK2SgWC+AC6HWRwDOKJIZ0r7065Cf39V++jRENOqwki6TzIN
	JINngCLTirNGmCQzC156bR3uaWq+oq+wA0GODJvTkHPhr/1s0qebBb4QA93+QEKkjGwn
	icfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=35EZom+w4veeZXncJVaRzB6v3WpmSa2RCFZPzF1H+qo=;
	b=ZQl8UT6/kIHX0Mo2ok1Wz/pljGUv3q/8Nj4DtF5iVAnFZW+9v0GSXtynb08WvqmoOu
	XMyIxWcSUxVIpJowQ91BYeboH75tsbyuTUyNGD8c2efoeHUaW6iEZV6FrbjaJBS9csRy
	hTymrwHOT7N+70YfRL5Mc2zdauhaYxMLkj6CIMhw3ftYHyNFxawF1yBiGbhCYNMg2eae
	7nnVwfak5NEamFIHqAb4UQrdaWqcR1IYgoiSZ95OGMv/wZ3UBNxkjReP3C8jrtkOXcVs
	yMXIAhwvYg2YU3+hfoTyAQ/zYUEfNTEMJ9ibt9ju9TCnZeOXwmwOPQRrAnDx8HzxeKOv
	4hlw==
X-Gm-Message-State: APjAAAWMA/ZmUEnAnpARrzrNMbkQjsSqdNngo9cD9vbyK3J80df0Zt0w
	Os1PvrgP7OWXVH3f6UOo+YoTu77N8R5skTZsKFU=
X-Google-Smtp-Source: APXvYqwfk9NWv0VahFoWmncBJSfFaCt+qSYkEoIed3GiFAmlL7zSSfdgoLVUYWNRi3NKfZUWWsn8I2xg9TP89hkYbo8=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr26601qtj.80.1579812225105;
	Thu, 23 Jan 2020 12:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20200123183531.2066136-1-raj.khem@gmail.com>
	<e0c9b955-ce1d-0ef1-667c-914aa13db544@gmail.com>
In-Reply-To: <e0c9b955-ce1d-0ef1-667c-914aa13db544@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Jan 2020 12:43:34 -0800
Message-ID: <CAMKF1sorn=P+q0m3X2tZbJfUxhGt4UsLvpKKAgOu+JBcKmn1nA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ruby: Remove __has_include and __has_include_next from preprocessed header file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 20:43:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 12:27 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 1/23/20 10:35 AM, Khem Raj wrote:
> > one of the build steps ruby has is that it generated rb_mjit_header.h
> > during configure using gcc preprocessor using -dD which emits built-in
> > defines as well, problem happens when this header is later included in
> > subsequent compiles, where compiler errors out stating that an existing
> > internal define is redefined
> >
> > | /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot
> be used as a macro name
> > | 13849 | #define __has_include __has_include
> > |       |         ^~~~~~~~~~~~~
> > | compilation terminated due to -Wfatal-errors.
> >
> > Since compiler already will take care of it internally we can edit it
> > out from this header file
>
> Any idea what introduced this ? Hard to tell if this is backport worthy.
>

You need gcc trunk for this to exhibit with release we won=E2=80=99t see th=
is issue
so it technically is not required on releases

>
> -armin
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/ruby/ruby.inc | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/ruby/ruby.inc
> b/meta/recipes-devtools/ruby/ruby.inc
> > index ce1b02f012..d5cd329e65 100644
> > --- a/meta/recipes-devtools/ruby/ruby.inc
> > +++ b/meta/recipes-devtools/ruby/ruby.inc
> > @@ -38,3 +38,10 @@ do_configure_prepend() {
> >      sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#;
> s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
> >      rm -rf ${S}/ruby/
> >  }
> > +
> > +do_compile_prepend() {
> > +    if [ -e ${B}/rb_mjit_header.h ]; then
> > +        sed -i -e "/#define __has_include __has_include/d"
> ${B}/rb_mjit_header.h
> > +        sed -i -e "/#define __has_include_next __has_include_next/d"
> ${B}/rb_mjit_header.h
> > +    fi


> > +}
>
>


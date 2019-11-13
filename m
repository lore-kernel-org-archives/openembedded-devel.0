Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1BA9731C8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 16:12:53 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id y39so3191302qty.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MKBwysKqGr9wq9tw8sGRxpRzW3x3V4DuvjccHYZjZro=;
	b=ST98tDXtRch4NFN9bMCEar7TpSn0CnhVC9RzHiBw5xNXkEdywiAHA9S3ew+Hq2skdI
	rvjJjIByo8HHHZAJqGuEmv/t7Fv5ZIIYSAphrACnPUOnyFggHQy2823zLEHNOoyEm4za
	kUrNS1wU3u0dt4ywfcpgN8kPC5eixbF7tqeyFywrKDkeyZN1LBOVnx+j1PBRigA0alf6
	Eiyg6a54jciIqXcqUg5fSVQwfOsqOjqS6r4AiSm5tsPL4d0sWlJLwg4aX39DqeN0Ud4B
	ENheRZtM8ycurX9VPHWkUsA6V6VesSxQCDuoWh/VioNeop3idu+HXECP84+Vnuhvynrz
	h7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MKBwysKqGr9wq9tw8sGRxpRzW3x3V4DuvjccHYZjZro=;
	b=nb2BRgRsDEBJmHEjjdHXOqX1oJWe7TwuYK06mZfwxWQQcU6sNIL7SbKf0DAioEbtBk
	24sZjObrAnMtb/EcYcVw2s9U1DhSSU0KcvcNCeag8QfdQ109QAuNijbVsSBh+cB8Sput
	ABP6Y27KYVORQMPYTsl+2pVdNtZXQ4TAEhYTeqDKPS8oAk2sGCv5z3eev5cc9TMNSqHE
	4bWxD7USHHKZW5qvCCQZIB5yDgbQXruQCR0z1VbNkE0QzaYz4q579jm/g8lNOJr3ErxS
	FTLV1SLocds28XxtDUUwWGRp3cNNYmtdytBoCqAOUykztkS1QLHqDDyeiCCzA3TFt5ka
	moRw==
X-Gm-Message-State: APjAAAUtjHHKS0gQGD0IuOnEVccSfpVtSR33A9tVa9IZ+8on1PHf1zgD
	NVJ30WAJz7yu0pY9/gMTaxjenmWd8ETpi9i8iMVjY+Ur
X-Google-Smtp-Source: APXvYqxB2X70oBl9mlldzXvidHrNJTqcAT40riwQFcqjKWds55w71bMm5L2iC67S7qmvRIbx21D2caRmdJBDgjjWKtA=
X-Received: by 2002:ac8:66d7:: with SMTP id m23mr3389703qtp.53.1573661574138; 
	Wed, 13 Nov 2019 08:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20191110220510.10077-1-git@andred.net>
	<20191113095811.14815-1-git@andred.net>
	<ce628d72e8512b493003f72dac66237576dace19.camel@andred.net>
In-Reply-To: <ce628d72e8512b493003f72dac66237576dace19.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2019 08:12:23 -0800
Message-ID: <CAMKF1soqSmt+-iocU_HBaMC4tzpgR8xiSWoj6yA70+4d+A6aww@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: ensure to use correct compiler & flags always
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
X-List-Received-Date: Wed, 13 Nov 2019 16:12:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 4:19 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> Khem,
>
> This is a rev2, as v1 is still in master-next, only.
> I forgot to set the subject line right...
>

thanks for letting me know

> Cheers,
> Andre'
>
> On Wed, 2019-11-13 at 09:58 +0000, Andr=C3=A9 Draszik wrote:
> > NodeJS comes with an embedded, patched, version of gyp.
> >
> > Normally, gyp supports compiling for the build machine, e.g.
> > native tools that need to be compiled to run during the build,
> > and for the host, using different variables, e.g. CC and
> > CC.host, etc.
> > Most of this has been patched out in the NodeJS version of gyp,
> > and essentially it only supports compiling using one compiler -
> > ${CC}. This modification excludes LDFLAGS for native tools, and
> > those still evaluate LDFLAGS.host (only).
> >
> > While this modified behaviour is OK for the OE use-case of building
> > native and target tools separately, it means that this recipe can
> > not work as-is with standard gyp, and wrong LDFLAGS are being used
> > for some of the tools compiled (torque) in either case.
> >
> > By setting the make variables that gyp-generated makefiles inspect,
> > we support use of unpatched gyp, and we ensure that all tools
> > are compiled with correct LDFLAGS in either case.
> >
> > This now also allows us to drop the patch that had been applied to
> > work-around this problem.
> >
> > Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> >
> > ---
> > v2: _append not needed for EXTRA_OEMAKE
> > ---
> >  .../nodejs/0006-Use-target-ldflags.patch      | 24 -------------------
> >  .../recipes-devtools/nodejs/nodejs_10.17.0.bb | 13 +++++++++-
> >  2 files changed, 12 insertions(+), 25 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-tar=
get-ldflags.patch
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldf=
lags.patch b/meta-oe/recipes-
> > devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
> > deleted file mode 100644
> > index f6569cd57..000000000
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.pa=
tch
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -The target LDFLAGS have been ignored. Tools like torque
> > -have been loaded from system libraries, even if a native
> > -one was the target.
> > -|$ ldd torque
> > -|    libz.so.1 =3D> /lib/x86_64-linux-gnu/libz.so.1
> > -|    libcrypto.so.1.1 =3D> /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
> > -|    libssl.so.1.1 =3D> /usr/lib/x86_64-linux-gnu/libssl.so.1.1
> > -|    libicui18n.so.63 =3D> not found
> > -|    libicuuc.so.63 =3D> not found
> > -...
> > -
> > -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > -
> > -diff -Naur node-v10.15.1/deps/v8/gypfiles/toolchain.gypi node-v10.15.1=
/deps/v8/gypfiles/toolchain.gypi
> > ---- node-v10.15.1/deps/v8/gypfiles/toolchain.gypi    2019-03-18 15:01:=
39.000000000 +0100
> > -+++ node-v10.15.1/deps/v8/gypfiles/toolchain.gypi    2019-03-18 15:04:=
08.628361308 +0100
> > -@@ -1106,6 +1106,7 @@
> > -             'cflags': [ '-fno-strict-aliasing' ],
> > -           }],
> > -         ],  # conditions
> > -+        'ldflags+': [ '$(LDFLAGS)' ],
> > -       }],
> > -       ['OS=3D=3D"solaris"', {
> > -         'defines': [ '__C99FEATURES__=3D1' ],  # isinf() etc.
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > index 4013c6931..9af0d998c 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> > @@ -19,7 +19,6 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV=
}.tar.xz \
> >             file://0001-Disable-running-gyp-files-for-bundled-deps.patc=
h \
> >             file://0004-Make-compatibility-with-gcc-4.8.patch \
> >             file://0005-Link-atomic-library.patch \
> > -           file://0006-Use-target-ldflags.patch \
> >             "
> >  SRC_URI_append_class-target =3D " \
> >             file://0002-Using-native-torque.patch \
> > @@ -58,6 +57,18 @@ PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
> >  PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
> >  PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
> >
> > +# We don't want to cross-compile during target compile,
> > +# and we need to use the right flags during host compile,
> > +# too.
> > +EXTRA_OEMAKE =3D "\
> > +    CC.host=3D'${CC}' \
> > +    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
> > +    CXX.host=3D'${CXX}' \
> > +    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
> > +    LDFLAGS.host=3D'${LDFLAGS}' \
> > +    AR.host=3D'${AR}' \
> > +"
> > +
> >  # Node is way too cool to use proper autotools, so we install two wrap=
pers to forcefully inject proper arch cflags to
> > workaround gypi
> >  do_configure () {
> >      rm -rf ${S}/deps/openssl
>


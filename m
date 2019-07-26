Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 418D265CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 21:19:48 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 201so40097803qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qT33Psn3S4SKFATo/etk/n2UB5rIEARFF/t5op89Bpw=;
	b=DTL8amsjfTTB2djy4W7EnibllLZ2x1muGE+0BW6fUjZgF1oWWW9uVZt8uqqbbvbyEg
	IHE33a5UWToT6RLnLbIRFvNn6uFZKP4QV2XwxzNlJ7Aw0Wb/f16PTY5kgByiVLrAyf9k
	zBodH/QEbBnjZze7tQFWgTF0g5nLYIJrvYMrv9zz1V6a9WQ9B2O8gE94tIG3Etkkinx0
	2S32QvvJZEn6SFtpUKuRtzXkr0eegqKIeaILWZoTjscXBfUaTlLycI8C6rqGEHHLQeUa
	ASMCt/ywdIE73UjPmqxc4/eqzc/14Pd5PON40rpEZWKXkFvMhOO24b71dDmudxLZuQqD
	JC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qT33Psn3S4SKFATo/etk/n2UB5rIEARFF/t5op89Bpw=;
	b=HFVy0A1lhhonXGIGxJidDJH3BI4DNpo20d1yfLbx5YiI5UFbj1Rf3/K7RzgG60usS4
	h6/d/AKEkEsilDMF2nWDexs00w6rEDTWzYPo7xb6MY243ZObQ7bfJAfIk43kp2Uh68/F
	ZuUyPHcz6jWnwkueXn2r9y5XFcitCllX5nru7JmLPdfxn+HdwKMshV7DenOicX9Fu37D
	ndSvaNvt2WLpPuKLcG5+AILwJ68QAyC7exRzWa3Og1kSdnWqT7TpbhYhvMCGLiFSLxY7
	plmDhoASZGEaVWsRsZZ6/G0LGFXO+Ln70hNlR0KstxaSCLG42jVGVT2+MypYtMqsK5W7
	LFBw==
X-Gm-Message-State: APjAAAUJ5cVqRWfOU4O6w/S4kPGZGRa2KJ0kKmfFXjn0fHQaMP5mh00J
	5Z6JhJ17YpVRJHtkD2G+qZlSkfzrYSljSoat8i0=
X-Google-Smtp-Source: APXvYqxwbT3zmnBAM7wA4dOJ5mxkC75O+6zuCwzvUj0dP0sZVgNCxtVqWA0k1if63SALQ+uXV6SfWVNs4wliRxBpLLY=
X-Received: by 2002:a37:c81:: with SMTP id 123mr66326496qkm.474.1564175988865; 
	Fri, 26 Jul 2019 14:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190712065617.30992-1-windel.bouwman@gmail.com>
	<CAHMaQtBtf_BGSwzjDY9r8AX+=OoaqqJYd3zoznX_7kzgCsh0-w@mail.gmail.com>
In-Reply-To: <CAHMaQtBtf_BGSwzjDY9r8AX+=OoaqqJYd3zoznX_7kzgCsh0-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jul 2019 14:19:32 -0700
Message-ID: <CAMKF1spg0BxOmB2Cn3ny_5ZBjzWgzXVtfHzPHvOTWTMjU3c9ug@mail.gmail.com>
To: Windel Bouwman <windel.bouwman@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] Add coloredlogs python package.
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
X-List-Received-Date: Fri, 26 Jul 2019 21:19:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 12:50 AM Windel Bouwman
<windel.bouwman@gmail.com> wrote:
>
> Are there any issues with this recipe? Can this recipe be included in the
> meta-python layer?

they look fine with few nits below. But somehow this patch never
showed up on patchwork https://patchwork.openembedded.org/
so please send a v2 and maybe this time pw catches it
>
> On Fri, Jul 12, 2019 at 8:56 AM Windel Bouwman <windel.bouwman@gmail.com>
> wrote:
>
> > Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
> > ---
> >  .../python/python-coloredlogs.inc             | 24 +++++++++++++++++++
> >  .../python/python-coloredlogs_10.0.bb         |  2 ++
> >  .../python/python3-coloredlogs_10.0.bb        |  2 ++
> >  3 files changed, 28 insertions(+)
> >  create mode 100644
> > meta-python/recipes-devtools/python/python-coloredlogs.inc
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python-coloredlogs_10.0.bb
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python3-coloredlogs_10.0.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc
> > b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> > new file mode 100644
> > index 000000000..4a35806db
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION = "Colored terminal output for Python's logging module"
> > +HOMEPAGE = "https://coloredlogs.readthedocs.io"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
> > +
> > +SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
> > +SRC_URI[sha256sum] =
> > "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
> > +
> > +inherit pypi
> > +
> > +do_compile_prepend() {
> > +    sed -ie "s/find_pth_directory(),/'',/g" setup.py
> > +}
> > +
> > +do_install_append() {
> > +    rm -rf ${D}${prefix}/share

using bitbake variables as much as possible is better e.g.
${D}${prefix}${datadir}

> > +}
> > +
> > +RDEPENDS_${PN} += "\
> > +    ${PYTHON_PN}-humanfriendly \
> > +"
> > +
> > +BBCLASSEXTEND = "native"
> > diff --git a/meta-python/recipes-devtools/python/
> > python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/
> > python-coloredlogs_10.0.bb
> > new file mode 100644
> > index 000000000..0fc1b258c
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools
> > +require python-coloredlogs.inc
> > diff --git a/meta-python/recipes-devtools/python/
> > python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/
> > python3-coloredlogs_10.0.bb
> > new file mode 100644
> > index 000000000..387239966
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3
> > +require python-coloredlogs.inc
> > --
> > 2.17.1
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0437DBD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:17:55 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id w15so10526901wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uW8eKDsjnjv3rSfdqBLYnWeIINGGu/DO4NLjiSEPFZ8=;
	b=adZF0c0L5KyInplsIrhc/4ME/kC1K5FpDQH+nJY8lfBodZyy3IFUkv2JWvYEV/CpAw
	M1B4gkYhoHwgHUH7eA7BdUXk8MrKeoGf1trM8BR6oc5mDR9J42HFdhwElq4FBp5rkoz8
	blFmwmVv66q5bEOKyFUhPm5hidlL4RhBDbxkD/t3uXPEti+2kt2lUlI067NnL4Tos3RU
	UVPaKz1DxR4fQ9IjUB9PogIgRag/RHk4bFeMhTTqYlz5eXoHqnvi5rBlbLSb0If4/8iB
	qTCS/pJn6rvQ5Kwr8VD5muOS/82d0aPjvdtPZcashukN/nPD6EjTws7zPA1Qu9J7Tke6
	OUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uW8eKDsjnjv3rSfdqBLYnWeIINGGu/DO4NLjiSEPFZ8=;
	b=AbPVy4d5rGWwdNJFX8fQ3tvzqf6bwg8ZlfKfACVIwUe2PqW37ePf1w9CazA0Pm/5cZ
	CLOah/OEVWoDqqLJlQFzqRKOs35ZLMXJ7N122QDE8y8fdxJc/Z1aZE9/5H8DBKE31874
	a2yf+zC/gKs4xwo9AOqm45D+170qUjjLynjBMZiORn+Tpv0Y3dQzKPlGLFLVXahZuJZX
	EitbyPfEqflNglECkMTiNfBNasV+aAOc+Cjzc3i2J/80u5mrI4o2rxfPBA1o9XmE+S6Z
	h41RGX4hchV3p+HVVLwo+nBPcCw7hFjrQqi+43Yo8GzGFuoSoosxGFfWK1mX3fPqOzFU
	3+1Q==
X-Gm-Message-State: APjAAAX/dCjsGHXWDAnn7LAP4tjgpAeb6TPIiTuuMJmNeWYcRg3bvIaf
	hj6cmw6HgKGbs1g1NVYlslF1cZcNzlqelEj28BX9Ig==
X-Google-Smtp-Source: APXvYqzNPNLu6wynwaloJpUH9qdjUejH0UKyC4sKSrv4kMs+H+NCHHSRYrPh0qglG38CER2NbEm5Av5wHr9tfcwU7xU=
X-Received: by 2002:a1c:c504:: with SMTP id v4mr11040688wmf.45.1555067876301; 
	Fri, 12 Apr 2019 04:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <1551014332-1608-1-git-send-email-tuanha@viosoft.com>
In-Reply-To: <1551014332-1608-1-git-send-email-tuanha@viosoft.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Apr 2019 13:17:51 +0200
Message-ID: <CA+chaQdZd37tn4NHCKrjm0YtpB_YDQtjoPNBSMLw=51HicS15Q@mail.gmail.com>
To: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libforms: add version 1.2.3
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
X-List-Received-Date: Fri, 12 Apr 2019 11:17:56 -0000
Content-Type: text/plain; charset="UTF-8"

It depends on libx11, so it should have x11 in REQUIRED_DISTRO_FEATURES,
will send a fix shortly.

On Sun, Feb 24, 2019 at 2:19 PM Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
wrote:

> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
> ---
>  .../files/add-absolute-path-for-include-dir.patch  | 12 +++++++++++
>  .../libforms/files/fix-link-to-xforms-man.patch    | 12 +++++++++++
>  .../libforms/files/fix-path-fdesign_LDADD.patch    | 12 +++++++++++
>  .../recipes-graphics/libforms/libforms_1.2.3.bb    | 24
> ++++++++++++++++++++++
>  4 files changed, 60 insertions(+)
>  create mode 100644
> meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
>  create mode 100644
> meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
>  create mode 100644
> meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
>  create mode 100644 meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
>
> diff --git
> a/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
> b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
> new file mode 100644
> index 0000000..db400f7
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/libforms/files/add-absolute-path-for-include-dir.patch
> @@ -0,0 +1,12 @@
> +diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am
> xforms-1.2.3/fdesign/Makefile.am
> +--- xforms-1.2.3.orig/fdesign/Makefile.am      2019-02-24
> 12:58:51.968645873 +0000
> ++++ xforms-1.2.3/fdesign/Makefile.am   2019-02-24 13:00:48.500635163 +0000
> +@@ -11,7 +11,7 @@
> + fdesign.1:
> +       cp -p $(srcdir)/fdesign.man fdesign.1
> +
> +-INCLUDES = -I./xpm $(X_CFLAGS)
> ++INCLUDES = -I./xpm -I$(srcdir)/xpm $(X_CFLAGS)
> +
> + bin_PROGRAMS = fdesign
> +
> diff --git
> a/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
> b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
> new file mode 100644
> index 0000000..c95bd18
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libforms/files/fix-link-to-xforms-man.patch
> @@ -0,0 +1,12 @@
> +diff -Naur xforms-1.2.3.orig/lib/Makefile.am xforms-1.2.3/lib/Makefile.am
> +--- xforms-1.2.3.orig/lib/Makefile.am  2019-02-24 12:53:58.340678373 +0000
> ++++ xforms-1.2.3/lib/Makefile.am       2019-02-24 12:54:33.096674102 +0000
> +@@ -25,7 +25,7 @@
> + man_MANS = xforms.5
> +
> + xforms.5:
> +-      cp -p ./xforms.man xforms.5
> ++      cp -p $(srcdir)/xforms.man xforms.5
> +
> + libforms_la_SOURCES = \
> +       align.c \
> diff --git
> a/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
> b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
> new file mode 100644
> index 0000000..73956de
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libforms/files/fix-path-fdesign_LDADD.patch
> @@ -0,0 +1,12 @@
> +diff -Naur xforms-1.2.3.orig/fdesign/Makefile.am
> xforms-1.2.3/fdesign/Makefile.am
> +--- xforms-1.2.3.orig/fdesign/Makefile.am      2019-02-24
> 13:08:48.412603250 +0000
> ++++ xforms-1.2.3/fdesign/Makefile.am   2019-02-24 13:09:18.412601874 +0000
> +@@ -15,7 +15,7 @@
> +
> + bin_PROGRAMS = fdesign
> +
> +-fdesign_LDADD = $(top_srcdir)/lib/libforms.la $(X_LIBS) $(X_PRE_LIBS)
> $(XPM_LIB) -lX11 $(LIBS) $(X_EXTRA_LIBS)
> ++fdesign_LDADD = $(top_builddir)/lib/libforms.la $(X_LIBS) $(X_PRE_LIBS)
> $(XPM_LIB) -lX11 $(LIBS) $(X_EXTRA_LIBS)
> +
> + fdesign_SOURCES = \
> +       fd_attribs.c \
> diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> new file mode 100644
> index 0000000..8a214d1
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "The XForms graphical interface widget library   "
> +HOMEPAGE = "http://savannah.nongnu.org/projects/xforms/"
> +PR = "r0"
> +
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=ade9a053df81f5b9408d2f4f5546df86"
> +
> +SRC_URI = "
> http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.gz \
> +           file://fix-link-to-xforms-man.patch \
> +           file://add-absolute-path-for-include-dir.patch \
> +           file://fix-path-fdesign_LDADD.patch \
> +          "
> +
> +SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
> +SRC_URI[sha256sum] =
> "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
> +
> +inherit autotools
> +
> +S = "${WORKDIR}/xforms-${PV}"
> +
> +DEPENDS = "libxpm jpeg libx11 mesa"
> +RDEPENDS_${PN} = "bash"
> +
> +EXTRA_OECONF = "--with-extra-inc=${S}/lib"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


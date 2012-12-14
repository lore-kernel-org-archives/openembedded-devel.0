Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TjQpL-0002cV-44
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 09:41:07 +0100
Received: by mail-ia0-f175.google.com with SMTP id z3so2822480iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Dec 2012 00:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=j1xecE4N9ioIDkwLzx3glZrR7LemeKcry9pePMQBuh0=;
	b=fW0OV4f41WL+F8c9Fpv9GxyCznqIi9xToj1uKvM6f+pb/E+slRF7DydTRu26FZ4PT7
	G+q0K25zrkM1eAPrOlm+46fzNnU2SoZ8Hoo2dzfuQzqvymhbeTG7fqU7ZRwGKyW/rKv4
	vnds7P7C3GBqgZeRnfqoV6dpOf2ZkyVdzrlGZpsZzlZw+xMlCF/JLEZJdPzPy02jnR/C
	pkLK9fn5CHE67ItpHjqCkvjwtTy4UpJ5nBfLKfn2zZxJdQmhnZheEmVKYB7r11GCnXT3
	g1gRy45CXRVisv6fT0j4rSAHF4o61Z8tIVFARMrcVLcDzSTND26sXQSsxV+AuiDlceDz
	Q/1w==
MIME-Version: 1.0
Received: by 10.50.237.6 with SMTP id uy6mr907252igc.31.1355473586583; Fri, 14
	Dec 2012 00:26:26 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Fri, 14 Dec 2012 00:26:26 -0800 (PST)
In-Reply-To: <438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
	<438ebe8cfe643f3d82f3a825651693c4c90edb6f.1355438402.git.Martin.Jansa@gmail.com>
Date: Fri, 14 Dec 2012 09:26:26 +0100
Message-ID: <CALbNGRSq_81mqhJjNvGKSerOe2-CM+EoFB-UXsfBOL-6nan4vQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 09/11] glade3: disable html doc, fails to build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 08:41:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 13, 2012 at 11:41 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
> index 8cd6a0e..049f7e3 100644
> --- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
> +++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
>                      file://COPYING.LGPL;md5=3bf50002aefd002f49e7bb854063f7e7"
>  DEPENDS = "gtk+ gnome-doc-utils-native"
>
> +PR = "r1"
> +
>  inherit autotools pkgconfig pythonnative
>
>  SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
> @@ -14,6 +16,10 @@ SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d
>
>  EXTRA_OECONF += "--disable-scrollkeeper"
>
> +do_configure_prepend() {
> +  sed -i 's/HAVE_GNOME_DOC_UTILS/HAVE_GNOME_DOC_UTILS_IGNORED/g' ${S}/Makefile.am
> +}
> +
>  FILES_${PN} += "${datadir}/icons"
>  FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
>  FILES_${PN}-dev += "${libdir}/glade3/modules/*.la"
> --
> 1.8.0.2
>
I am using the documentation from time to time. Don't misunderstand
me: For now I have no problem disabling it but could you send the
error information so we know what fails - maybe later there is a
chance for fixing it.

Andreas



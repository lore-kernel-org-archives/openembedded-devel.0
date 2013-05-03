Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYDBm-0000ye-4P
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 12:26:08 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so1198983vbh.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 03:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=vMsDKynW+LG2ownPtjH7BWcvTgn4zGHvQn24ehRdcog=;
	b=tHTROA67iD8AcrMcLnbIjQ05G5uTLUWr/XZ1BEOnI9JkIZI5ILMls/h1e5+o5oo2pw
	kFPCRBkNaZochNOAy9Hoi5LsU2bt6NBl8bWBZA+KlJx86WfxDxlCzjQksvNbFDCJ2TBU
	gJ+iPopkd7wVVBJa6qMFyAEUaA61tFzzPAP31y0plMbwjhR70wuQTGW2KqIeBVxqgZzy
	+dtvoGMzx9oYjlc201qJ+JoIZh1MArOOKLiapvLywf8CdC9IwchAI2MDSd0JkTNkt8ii
	tt7I4HxH2jOzJGe1m0m2umC7nv21IDT9O8fcKfCQYBKgJAaPhYlrxmqE16ygWVzuSglq
	HMBw==
MIME-Version: 1.0
X-Received: by 10.58.232.98 with SMTP id tn2mr3347039vec.57.1367575690388;
	Fri, 03 May 2013 03:08:10 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Fri, 3 May 2013 03:08:10 -0700 (PDT)
In-Reply-To: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 3 May 2013 12:08:10 +0200
Message-ID: <CALbNGRT7OG1OxNhyvkjrcKxXPysOpX3QO1tqr-oy9SvAPGNy2Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: otavio@ossystems.com.br, eric@eukrea.com
Subject: Re: [PATCH] chromium: fix build with glib >= 2.35
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
X-List-Received-Date: Fri, 03 May 2013 10:26:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 12:03 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 ++++++++++++++=
++++++
>  recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 +-
>  2 files changed, 44 insertions(+), 1 deletions(-)
>  create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/0001-b=
rowser_main_loop.cc-fix-build-with-glib-2.35.patch
>
> diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_=
main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/chro=
mium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch
> new file mode 100644
> index 0000000..cdf8051
> --- /dev/null
> +++ b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main_lo=
op.cc-fix-build-with-glib-2.35.patch
> @@ -0,0 +1,42 @@
> +From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Thu, 2 May 2013 15:12:24 +0200
> +Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Applied [1]
> +
> +[1] http://code.ohloh.net/file?fid=3DpYuYekcDZUhiAoN5uY-KdIaKFTI&cid=3D0=
W4KUpSYxGo&s=3D&browser=3DDefault#L0
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + content/browser/browser_main_loop.cc |    5 +++++
> + 1 files changed, 5 insertions(+), 0 deletions(-)
> +
> +diff --git a/content/browser/browser_main_loop.cc b/content/browser/brow=
ser_main_loop.cc
> +index ad4b0c6..86deea3 100644
> +--- a/content/browser/browser_main_loop.cc
> ++++ b/content/browser/browser_main_loop.cc
> +@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
> +   // TODO(stevenjb): Move platform specific code into platform specific=
 Parts
> +   // (Need to add InitializeToolkit stage to BrowserParts).
> + #if defined(OS_LINUX) || defined(OS_OPENBSD)
> ++  // g_type_init will be deprecated in 2.36. 2.35 is the development
> ++  // version for 2.36, hence do not call g_type_init starting 2.35.
> ++  // http://developer.gnome.org/gobject/unstable/gobject-Type-Informati=
on.html#g-type-init
> ++#if !GLIB_CHECK_VERSION(2, 35, 0)
> +   // Glib type system initialization. Needed at least for gconf,
> +   // used in net/proxy/proxy_config_service_linux.cc. Most likely
> +   // this is superfluous as gtk_init() ought to do this. It's
> +   // definitely harmless, so retained as a reminder of this
> +   // requirement for gconf.
> +   g_type_init();
> ++#endif
> +
> + #if !defined(USE_AURA)
> +   gfx::GtkInitFromCommandLine(parsed_command_line_);
> +--
> +1.7.6.5
> +
> diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recipes-=
browser/chromium/chromium_24.0.1312.52.bb
> index 2827cc1..a9a2d28 100644
> --- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
> +++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
> @@ -11,9 +11,10 @@ SRC_URI =3D "http://commondatastorage.googleapis.com/c=
hromium-browser-official/${P
>          file://ui-gl-no-narrowing.patch \
>          file://google-chrome \
>          file://google-chrome.desktop \
> +        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.patch =
\
>  "
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  # include.gypi exists only for armv6 and armv7a and there isn't somethin=
g like COMPATIBLE_ARCH afaik
>  COMPATIBLE_MACHINE =3D "(-)"
> --
> 1.7.6.5
>
Aargh Sorry - I forgot meta-browser as subject prefix. Resend?

Andreas



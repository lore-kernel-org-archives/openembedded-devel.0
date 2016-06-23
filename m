Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id C4916731C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:32:58 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x7so5839240vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SQNf0EHKmiN9YPi+QWeg0Xh2Jm8o5/I9+X+nWYWZ3FA=;
	b=YrTIljRcMsZdvw/8tDHYxF2sUG0N1Odf3g54thjy2PV0uk+PY9yZKUXIRwe42Qbm5w
	Fx/ZmRbA2A0EAFV9i9NPS3ljlVQr9j2u4EP6aMiF9uSU9MhCtsyZRNB/4SYTnjonkyjI
	kH7I0X6vygSDh3+eTpy7R5mrhNTIni/gvwU9Lggs83fnSJQ85HloedNMUmT69hjaQVgB
	WVctuyWlJocKq5BZuKfqHP6LIp2mqK/gOHWaUWfabNEL19pz0Af+XFymMA1gQl7YaLtn
	8J+HnbKGfl7lz7i1pGQOD5dOioIOqlRTwgQb2oQvcYKkyj5t24ieTCrSJDyKhrv4Lyfr
	iKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SQNf0EHKmiN9YPi+QWeg0Xh2Jm8o5/I9+X+nWYWZ3FA=;
	b=Ir6L3HRHP/BE4IoHZaTmV2laQljJw8df1eh4cXaArQG3TqVoOpbmAKRjCUuaX31dKO
	7wer5fN43L0weJ41afvrRFcojILFoS+LwUDrlfHGSLp/y+gU0hmnP4t3NbP4dRQHmqDR
	Pc70MryC5D2xcZCpFOhN2oI8HqQp5I8bhNq4PU7LuuXfTTyhpxR3mN8VTKg5rNk61/kb
	7Nc5BtbZxiRskyn5unIf/f6EoZ+gvOhrNOZhiCf1PYRId/UHu5rhGvY/jM268lv9lKLm
	zlphG7giuRisYbyP9A2aX3s+OJRWZ8zsLgCRArixKCYM6tYKh/4F/6IOyk8uji5emhb6
	gX/g==
X-Gm-Message-State: ALyK8tJMOqZEO49kK7dX35Fj/5423lzmw0Oy1/qRxLtYfawyUHMIWX9fnQptTt5gO32CGOB63q5IEm59gT6Mxw==
X-Received: by 10.31.9.65 with SMTP id 62mr1589912vkj.89.1466677978765; Thu,
	23 Jun 2016 03:32:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.3.72 with HTTP; Thu, 23 Jun 2016 03:32:58 -0700 (PDT)
In-Reply-To: <1466670841-22706-2-git-send-email-jussi.kukkonen@intel.com>
References: <1466670841-22706-1-git-send-email-jussi.kukkonen@intel.com>
	<1466670841-22706-2-git-send-email-jussi.kukkonen@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 23 Jun 2016 12:32:58 +0200
Message-ID: <CALbNGRRAop9c=z-6i_sOKU3-1u+JCJ=4OOmzo_sn4jPgfRKG5A@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: mark.asselstine@windriver.com
Subject: Re: [meta-oe][PATCH 2/2] Update vte users to use vte9
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
X-List-Received-Date: Thu, 23 Jun 2016 10:32:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 23, 2016 at 10:34 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> geany-plugins seems to compile fine with new vte: that recipe was
> not modified. gnome-terminal and valaterminal are currently
> blacklisted for other reasons.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb       | 2 +-
>  meta-oe/recipes-support/toscoterm/toscoterm_git.bb            | 2 +-
>  meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb    | 2 +-
>  meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
> index ae28ffd..18e74da 100644
> --- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "GNOME Terminal"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
> -DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils intltool-native"
> +DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte9 gnome-doc-utils intltool-native"
>  PR = "r1"
>
>  inherit gnome
> diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> index 24f813b..6b31fd6 100644
> --- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> +++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "A very small and simple terminal emulator"
>  SECTION = "x11/applications"
> -DEPENDS = "vte"
> +DEPENDS = "vte9"
>
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
> diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
> index 07ff318..ef0cfaf 100644
> --- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
> +++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "A lightweight Terminal Emulator based on libvte, written in Vala"
>  SECTION = "x11/applications"
> -DEPENDS = "vte intltool-native"
> +DEPENDS = "vte9 intltool-native"
>  SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
> index 1049b27..22b81af 100644
> --- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
> +++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Terminal emulator for the Xfce desktop environment"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "glib-2.0 gtk+ vte libxfce4ui"
> +DEPENDS = "glib-2.0 gtk+ vte9 libxfce4ui"
>
>  inherit xfce-app
>
> --
> 2.1.4
>
Have not time for test but to say thanks :)

Andreas


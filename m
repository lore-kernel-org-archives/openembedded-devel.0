Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id D2B486FF80
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:07:53 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so24008734vkw.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=l55jxhXeqKlOngVFYMR0gDkrKriCC5aSO11ANrn0UW0=;
	b=jsH28Sfi6WeKEP/qjUwMIBwegbcRk3zJ3fi/Y+WDyZJ0Fcp9SyXBx4Q9rze5/3X2yH
	giIQ9Xdmxbyb16UT6eAXAbiykqAppfYbna6DNREunPe90qXCGcrBJJFoTD/fDl9TIWHr
	nuAAIRECUDyEffjdEHaQjkDoxkKy5yyFhDsmCnxJ4Lp3egwm1AxRlWtj5KZxB8jZTkIO
	JSY4hlcrWySsxjwgXob94qZpmlf7lkuVjMSGsS6EGvmlpU7MHeM9aGE98YAcoVq6K2NC
	ntLVXWT3zB4qhoq0dcbV9K7YX7kYafKbyKnzPmKMC6veD7SxeKBpppuM4fUlNAIlnnSI
	bUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=l55jxhXeqKlOngVFYMR0gDkrKriCC5aSO11ANrn0UW0=;
	b=LFtmuM+DVLIo4Eu15lJF9Hx/ndrOBmXJjQz3VREVkND+ZYqGETFVgAJUmL/XG/qzpL
	3veDYT4B+rp0ezL0mGi/CejBVFMfYEAcTw2wEU08LSx7FKzU2roPbZwi+TvUOqpNIDRt
	KoEgsfvkezH5B37q9dKcnPdb0rgvRmaXuicT2qPzua0/5yBnurz8csAutdGVeXyFsTkj
	mN6eZMCM5iqB5lhmGMo/S681BofU0Ru+cWwAu1gOac1evlUnaUHDLfqYBvM1NtzhhMj+
	8Z/YEHvBDwuPj+AlV+vV07t0EYOifcImvbHuyZ/yFLHuT0GEJPA9sxmAP9gpWb8NXTVL
	AgmA==
X-Gm-Message-State: AKaTC00494a9N61YI/X5HGaEfHxzZPPJFnNcurzi9IKzAV80duK9v5IPyeeBhM8IkDHslRaEyPGrP5BxQ/F63g==
X-Received: by 10.31.75.198 with SMTP id y189mr4517021vka.51.1479730074534;
	Mon, 21 Nov 2016 04:07:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 21 Nov 2016 04:07:54 -0800 (PST)
In-Reply-To: <1477688390-25172-2-git-send-email-schnitzeltony@googlemail.com>
References: <1477688390-25172-1-git-send-email-schnitzeltony@googlemail.com>
	<1477688390-25172-2-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 21 Nov 2016 13:07:54 +0100
Message-ID: <CALbNGRR+KVBjsFLgDYKM_bYCE6JZ8FaJmM0JbLzDiSjN71Xi2Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] exo: unbreak Thunar's detailed file view
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
X-List-Received-Date: Mon, 21 Nov 2016 12:07:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 10:59 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> see further details at [1]
>
> [1] https://bugzilla.xfce.org/show_bug.cgi?id=3D12916
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ++++++++++++++++=
++++++
>  meta-xfce/recipes-xfce/exo/exo_0.11.1.bb           |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-=
Thunar-detailed-view-Xfce-12916.patch
>
> diff --git a/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-=
detailed-view-Xfce-12916.patch b/meta-xfce/recipes-xfce/exo/exo/0001-Probab=
le-fix-for-Thunar-detailed-view-Xfce-12916.patch
> new file mode 100644
> index 0000000..16f12fe
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detaile=
d-view-Xfce-12916.patch
> @@ -0,0 +1,36 @@
> +From fea2619e6d07ac72b2eff6f408bb3daa2dbdf671 Mon Sep 17 00:00:00 2001
> +From: Sean Davis <smd.seandavis@gmail.com>
> +Date: Thu, 27 Oct 2016 20:31:36 -0400
> +Subject: [PATCH] Probable fix for Thunar detailed view (Xfce #12916)
> +
> +Upstream-Status: Pending [1-2]
> +
> +[1] https://git.xfce.org/xfce/exo/commit/?id=3Dfea2619e6d07ac72b2eff6f40=
8bb3daa2dbdf671
> +[2] https://bugzilla.xfce.org/show_bug.cgi?id=3D12916
> +
> +---
> + exo/exo-tree-view.c | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/exo/exo-tree-view.c b/exo/exo-tree-view.c
> +index 8c8564f..2d0fc04 100644
> +--- a/exo/exo-tree-view.c
> ++++ b/exo/exo-tree-view.c
> +@@ -385,13 +385,9 @@ exo_tree_view_button_press_event (GtkWidget      *w=
idget,
> +         }
> +     }
> +
> +-  /* see bug http://bugzilla.xfce.org/show_bug.cgi?id=3D6230 for more i=
nformation */
> +   if (G_LIKELY (gtk_tree_selection_get_select_function (selection) =3D=
=3D (GtkTreeSelectionFunc) exo_noop_false))
> +     {
> +-      /* just reset the select function (previously set to exo_noop_fal=
se),
> +-       * there's no clean way to do this, so what the heck.
> +-       */
> +-      gtk_tree_selection_set_select_function (selection, NULL, NULL, NU=
LL);
> ++      gtk_tree_selection_set_select_function (selection, (GtkTreeSelect=
ionFunc) exo_noop_true, NULL, NULL);
> +     }
> +
> +   /* release the path (if any) */
> +--
> +2.5.5
> +
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb b/meta-xfce/recipes=
-xfce/exo/exo_0.11.1.bb
> index 92155f2..0b0353b 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
> @@ -11,6 +11,7 @@ inherit xfce pythonnative perlnative gtk-doc
>  SRC_URI +=3D " \
>      file://exo-no-tests-0.8.patch \
>      file://configure.patch \
> +    file://0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch \
>  "
>
>  SRC_URI_append_class-native =3D " \
> --
> 2.5.5
>
ping


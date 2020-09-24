Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.11146.1600932879365318615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 00:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UIySHZ3u;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id f1so1193650plo.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2020 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yuAh1xYZLzf00w9dSe+MiEqVtGxlA+8Pah1Lla54PqU=;
        b=UIySHZ3uPdNdOadX6Bc0T+cxe7Oc6+FgDGUV5TwXJjL8Q9Q2DMmSnqo0wxmhB7IL21
         LZRxNcC7bybfGLRVmOcP07U02JELQOuoahzyz7Ep9PkhPRLHJwLFZzGvOWC/qs+EvEAd
         JQcR/d6xeBNQsuy1RcjFbP5W/WaGuFoSM+61Qrv64AuOiddmjomc85ybbODN96GAbVhe
         4vESQ69BgwKWSMqknfPusAjNxu/xAsU+CyRdXvVd4RgK9Y0EyfxvTv2LuSOb7AhyRPJI
         f2qNmHL+MwnbFKNDMyN3iSXRQhQSMa7r7jhu/x4wp53gWOoHs5Lp77Cib30PJbv9S9NT
         QWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yuAh1xYZLzf00w9dSe+MiEqVtGxlA+8Pah1Lla54PqU=;
        b=Pzz+OiyDWNAY1xS5Io/paQw0yUwNisCkIeVUnNyYcxL520SqVKc38/PAyX03aQMvba
         PXAY1apJCHtPA2Otytz6xJXyLGe7GnKfXvVeOLec3d/KmbN+TsPHFnOf9e0Y9wAY4Cuo
         hBFtQtB2umfqObCN8sEnOxyqh3JbJkf0uDWg1D8aMHqGgxWzHHM+ecw9bI2CsFZ062lS
         /LFWeutPs9Q5LWC3vrP9H/thDoML931TadG0vlyhIIb/RBLZgddqxyZFfxsMOv+zQc9Q
         CmPIL+MpyErrehMl81KVRdZWd0f2dvv4irU3REzuHrSE23ACgEnl+tu9blYjLbIusMb5
         tiMw==
X-Gm-Message-State: AOAM530+yUTpjopZObM+xkBcXqBt/sto9Nyedc4z5i5X9JgP1xXbtCwE
	uMmFODlIH3I9kwz+xX31Q6KJRQ+Og36cgTwvZhnqM2v4JBzdzQ==
X-Google-Smtp-Source: ABdhPJwzC7qlnWWiUT7KGcGYnsCo+6X68hPynbEIeNVuxMdZubGfN6CDJXyndkF0kPyfE5xND/ZLjj/OaTU6ZxqpLb4=
X-Received: by 2002:a17:90b:2388:: with SMTP id mr8mr2702878pjb.161.1600932878695;
 Thu, 24 Sep 2020 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200924044218.33009-1-alejandro@enedino.org>
In-Reply-To: <20200924044218.33009-1-alejandro@enedino.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 24 Sep 2020 09:34:27 +0200
Message-ID: <CALbNGRR+QJad7PQA3hQSw8JkD8X8HLHt_gemWZZz8DAqQCJBGA@mail.gmail.com>
Subject: Re: [oe] [PATCH] gedit: Add gsettings-desktop-schemas to RDEPENDS
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2020 at 6:42 AM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> gedit isn't able to start at all, showing the following error:
>
> (org.gnome.gedit:32150): GLib-GIO-ERROR **: 04:29:21.795: Settings schema \
> 'org.gnome.desktop.lockdown' is not installed
> Trace/breakpoint trap
>
> gedit tries to look for the lockdown schema which is part of the
> gsettings-desktop-schemas package.
>
> Add gsettings-desktop-schemas to RDEPENDS_gedit so when gedit is installed it
> finds the required files in the rootfs.
>
> Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> ---
>  meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> index afd9146ac..4da44b605 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_3.36.2.bb
> @@ -16,6 +16,8 @@ DEPENDS = " \
>      tepl \
>  "
>
> +RDEPENDS_${PN} = "gsettings-desktop-schemas"
Should be

RDEPENDS_${PN} += "gsettings-desktop-schemas"

Andreas
> +
>  inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext features_check upstream-version-is-even mime-xdg
>
>  REQUIRED_DISTRO_FEATURES = "x11"
> --
> 2.17.1
>
>
> 
>

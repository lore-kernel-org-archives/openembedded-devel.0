Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C17679C5E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 22:46:35 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id q25so9249417otn.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iUrL9GIEG+iJulsBywlLUQd1ci3raJiq/0OeGmWWUQo=;
	b=ESGpNgm7kj2IzZP6N1KhnN1lij75g0uD1reT6nQyqwglGJK5ay34BI5Mz9WfSmVtAg
	cZtErVBwFuVZP4UyDKcPDaFAfJAYsZy/Gcxi2NyPqULysRSTLy0/PlLTSmgiJKkWxxXa
	yG0TA18RnIaCL1rDjRrIwpUGOZSWP7y/S04rFCr5guheFrZcXyBraUEkP+z3ObBVc+MA
	IbFy6fTHVw7+SJpNc0axarC+cJ6TMIz//i8KEqEU0dKQoTaQ2HY/Urpds/aCBYyzsZuq
	4dr46+zRuYiVg1Pos795aMpzh8vspX7PA5UspHNvOSBgrOVkAk+h/yrRiQN2Jc17tzj5
	Qs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iUrL9GIEG+iJulsBywlLUQd1ci3raJiq/0OeGmWWUQo=;
	b=QvVn0eJ70kHdCgSBWZMH/QZ/EA+6BxriKDH+5KpQs6xB8EWZ68w4xhWXzIBbT8nAk/
	NFetpoCUV6si2/FF6wBYhqOCn6BZLV1YjB9x6/4Cgklw3IBNuns3+Zc1bQPDIrjOgj2b
	W87YO5ZYFtKU7JgxCK1taOtq+1P11PG/T1CqyCoe/yx1VijPdYPID0+Hiv4CJbxeWbBk
	aGFcaPAMDNa4lsIkJ5pxJAp+pOC/cOgP/W0/30N9Nye9dTuJahl+263slvOKSf2/66St
	YC7cmnSlvBT81HrDTT5ukABfkMxmmzZYGqo7InsS2KwXqerXSDBxStl1uk/9VBSxjqPM
	LJ+A==
X-Gm-Message-State: AGRZ1gIy3AIIliVIoUkcdkpJ8pFiUfBmUQQ73zARR8cpuYpUjDSSTd7N
	7LmH2I/zZq5GiTYJ2BAoaepdX6VqI4zILeN/1OA8Zw==
X-Google-Smtp-Source: AJdET5f5MMb/ukdNKXcwvx8cRUkLV05fdlZCtpi8JUN1Hg28VObM+AiKlQgT0v/oqMgPyeQMVDzS2TuC/xbecbLcTS4=
X-Received: by 2002:a9d:7006:: with SMTP id k6mr9110279otj.370.1540853196460; 
	Mon, 29 Oct 2018 15:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
In-Reply-To: <068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Oct 2018 23:46:22 +0100
Message-ID: <CALbNGRQ=BZUD+T+ADOWateSZZstLXibW504hZcbfL02M4UT3zw@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Mon, 29 Oct 2018 22:46:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
> new file mode 100644
> index 000000000..29947ae76
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Little Color Management System"
> +LICENSE = "MIT"
> +#DEPENDS = " glib-2.0 gettext-native "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
> +
> +SRC_URI = "https://sourceforge.net/projects/lcms/files/lcms/${PV}/${PN}-${PV}.tar.gz \
> +           "
> +
> +SRC_URI[md5sum] = "8de1b7724f578d2995c8fdfa35c3ad0e"
> +SRC_URI[sha256sum] = "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
> +
> +inherit autotools pkgconfig distro_features_check
> +
There is a lcms 2.7 in meta-oe - what about upddating that?


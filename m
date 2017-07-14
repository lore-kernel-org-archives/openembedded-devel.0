Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 20092781C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 06:45:10 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id z22so3527489uah.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 23:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a4CeKV83xa2zDvNjJUWmNfgo9F+DbWmxahvi70tubZY=;
	b=OSXI/66FhLLEj3JkBD9aJhTa6/rs2BUtEVmXLmxpzm/MQyX1+VlDtYdA8itrPkywbh
	rH/bVio08QSs1ba1rZO9uR6XF+eaDwBlbDMr4QQArU7CuriwOzINJ4G1jDtUOk3aeoux
	zfeZRPLu6Zl0cooUIIoxZ3XgGNbnL5ZYnuvF8Ebi3TzZB7GpJABuaqEBcovp2iajRwIm
	2FVKy+PyYA+k0lKKruFqZOGsEEIwqzJuD8TlUpUSJfVsOpdlyp3qH6FW21gfO+GuuYI5
	rretivPeo2vQ1vTJPv3LgXIXooXzluu1VLu+h4iHyZanR9lop7eE83NcSGeQVuN0tL0s
	RblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a4CeKV83xa2zDvNjJUWmNfgo9F+DbWmxahvi70tubZY=;
	b=PqMe4t1Fq+Zf4WGXih1wAH2Cn3yXd+o/+CXOR+A+P/FdlygmPuR+VVcsL9kTYzN7TN
	oKkxWVTnjMrMwNFOqQLBT60zGrBb+dXsSfMtcAfjsBVpEis/CA3aRUFXC5gGhWkxyQrj
	E4La74fFGNiPRNdWJhvhQLCcqo1nLPiq0GCWUDWH5OtZGBDV3X7lI+xXHiRh0HFLeH4O
	1uH1NGOebMh5m2bM9hgTeK4kG9vdJ1Fwx7S20o+nQ2sQOlHOBcoyZ6F/VQkoCSX9qnfA
	f6jvAmf9jN2FzATvvrOm1/ERy+eyJl4IPFdraeAz71WoNqzsRtFx1BRehNCrQXtssHPU
	ZYvw==
X-Gm-Message-State: AIVw111C9x/QbnjsgZd5izr5zAF2Ze2H1C9uU9IPSkfzHClIndpd8tL2
	jDah8X3wHS0vGCNgS38wPHxxP3FyRw==
X-Received: by 10.176.0.104 with SMTP id 95mr4159953uai.124.1500014711729;
	Thu, 13 Jul 2017 23:45:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Thu, 13 Jul 2017 23:45:11 -0700 (PDT)
In-Reply-To: <20170714054013.34458-8-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
	<20170714054013.34458-8-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 14 Jul 2017 08:45:11 +0200
Message-ID: <CALbNGRQcaHHbQ-nFwTXG0XcwvExeaA=7RUMHd4R7yLA2g407Ww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 08/18] xfce4-netload-plugin: Do not include sys/sysctl.h
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
X-List-Received-Date: Fri, 14 Jul 2017 06:45:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 7:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Its unused, moreover it helps it compile with musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ude-sys-sysctl.h-its-unused-on-linux-port.patch | 25 ++++++++++++++++=
++++++
>  .../netload/xfce4-netload-plugin_1.3.1.bb          |  3 +++
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload=
-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
>
> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin=
/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch b/meta-xfc=
e/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sy=
s-sysctl.h-its-unused-on-linux-port.patch
> new file mode 100644
> index 000000000..e35418192
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-D=
o-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
> @@ -0,0 +1,25 @@
> +From 7fcc7352ec11644ac8be4e9ec1584a5be3333684 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 12 Jul 2017 18:18:30 -0700
> +Subject: [PATCH] Do not include sys/sysctl.h its unused on linux port
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + panel-plugin/os.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/panel-plugin/os.h b/panel-plugin/os.h
> +index 473c2a4..9a5c544 100644
> +--- a/panel-plugin/os.h
> ++++ b/panel-plugin/os.h
> +@@ -170,7 +170,6 @@
> + #elif __linux__             /* L I N U X */
> + #  include <stdio.h>
> + #  include <sys/param.h>
> +-#  include <sys/sysctl.h>
> + #  include <stdlib.h>
> + #  include <stdarg.h>
> + #  include <unistd.h>
> +--
> +2.13.2
> +
> diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin=
_1.3.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.=
3.1.bb
> index 7d7778202..35c8861bc 100644
> --- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.=
bb
> +++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.=
bb
> @@ -5,5 +5,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D35a7203c41b86d=
15546dddc05995f97f"
>
>  inherit xfce-panel-plugin
>
> +SRC_URI =3D "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'=
[0:3]}/${BPN}-${PV}.tar.bz2 \
> +           file://0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-p=
ort.patch \
> +           "
>  SRC_URI[md5sum] =3D "f25aa3242e3119b49f259a3e4a1af08b"
>  SRC_URI[sha256sum] =3D "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c7604=
10d5d42d0766391c"
> --
> 2.13.2
>
Please add Upstream-Status (or even better - send the xfce patches upstream=
)

Andreas


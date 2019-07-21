Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BDB271B99
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:47:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15so26768125qkl.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=73p7RmOBnJTL/ejcP3fNLm8bRXUs8BIJQlcfa6ejJPQ=;
	b=M5GR3rhK1WGpKQBwBuqNrlmJzeZg8WGBaH6+7NaK+C68tMrD6I1rxtK7vSbhqMA8Yj
	2DW7LvzL5nGvPiCllHQvjiXbp2Ysw5BEEeCUTMW2YIhd1OdVAuHWJLFeYukZ05PKix3N
	vETANuozfTiO6Gm/vlpw+bJRYx5jJrZ0E/0XZ+I7Prg5RMy4Dg14GdlIiPyrEPYKxtJq
	subUBbK9ZVswCQGOaOztkXCS3IHsXKPULCRrwhzNfulk4bopYTtK/1PglrJlf2FNEbEL
	BlEnHlep2I0cwSrA7JZNm8MIMf9KJxYllQyBTVqusjxAG9qY+4N5WkN4nPYOEvHlK8TL
	X7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=73p7RmOBnJTL/ejcP3fNLm8bRXUs8BIJQlcfa6ejJPQ=;
	b=f2NyVjB8+l2fWXHUub1ZYxTXofXXBBeEg6VlMqjbLoa5b4Cc6tk5ar0VPcxjGEeQNT
	OK/WkiFdqhPaKnxaQ9YedhRR8o0gGkbbI/wZpNBCQGqwZA8YnDVTu86ETNjrZGCzBBrU
	gHTStBmQ9KcUkNfqViThaiyXSlJO0lZTpYf9SJCJ7WrQQqRQ7+8oxIYQ0AwwQEWV/l0n
	8q2YkW7lyZp4DEyXGUtkG3yEj13Ds7Wpz3W9C5GHXrtbEOhcrA0Ea1oHQN2VaFBM8ULd
	fpN6qfTWoGb61l3Fc1Ekm3lBEMsvVyys3QCZ8LUZFuiMJsxHMM4HAU3lQAljdHqc6W68
	zgJQ==
X-Gm-Message-State: APjAAAUtbkRQWVfyH7wJi/Re+zHXdzcXcFYFROOSGYQqRvioFtbVWKWW
	ZO8kpCwXEVrVheenoy6fLZ11QrATy9RYgUEAXWE=
X-Google-Smtp-Source: APXvYqxtFSxYUx22f0kWCtH25jzhiC9p1Ts5EGSoBRpbc09eZxA/yx+qOYPs5uUGNDbhd85Ms5CBCCrHgD6J3o0Z24A=
X-Received: by 2002:a37:7083:: with SMTP id l125mr41921310qkc.71.1563720479115;
	Sun, 21 Jul 2019 07:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563719996.git.akuster808@gmail.com>
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2019 07:47:32 -0700
Message-ID: <CAMKF1sqTednsK5Rvw+F-_wE_1x7GL=jP483T7HRsLNrwP6G-pQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior] 0/8] patch review
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
X-List-Received-Date: Sun, 21 Jul 2019 14:47:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2019 at 7:41 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Patch comments window closes on Wednesday.
>

series looks fine to me

> The following changes since commit 8d5dcd6522e9d15e68637b6d7dda0401f9bb91=
d0:
>
>   turbostat: copy bits.h from kernel to turbostat (2019-06-16 08:15:44 -0=
700)
>
> are available in the git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib stable/warrior-n=
mut
>   http://cgit.openembedded.org//log/?h=3Dstable/warrior-nmut
>
> Adrian Bunk (2):
>   ndctl: Remove the unnecessary dependency on virtual/kernel
>   wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
>
> Andreas M=C3=BCller (2):
>   gnome-desktop3: set correct meson gtk doc option
>   evince: add patch to fix build with recent gobject-introspection
>
> Martin Jansa (4):
>   ndctl: make MACHINE_ARCH and ignore from libblockdev
>   oprofile: make MACHINE_ARCH
>   oprofile: drop virtual/kernel dependency and switch back to
>     TUNE_PKGARCH
>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and util-linux for
>     phoronix-test-suite
>
>  ...ove-EvDocumentModel-get-type-function-dec.patch | 33 ++++++++++++++++=
++++++
>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb   | 12 ++++----
>  .../gnome-desktop/gnome-desktop3_3.32.0.bb         |  1 +
>  ..._2019.03.01.bb =3D> wireless-regdb_2019.06.03.bb} |  4 +--
>  meta-oe/conf/layer.conf                            |  3 ++
>  meta-oe/recipes-core/ndctl/ndctl_v63.bb            |  2 +-
>  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb  |  1 -
>  7 files changed, 47 insertions(+), 9 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-R=
emove-EvDocumentModel-get-type-function-dec.patch
>  rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-reg=
db_2019.03.01.bb =3D> wireless-regdb_2019.06.03.bb} (91%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFx98-00086h-Jt
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 02:03:06 +0200
Received: by yxo30 with SMTP id 30so47925yxo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=BhjtLCTrbgY0ArhgPVR3IFWNX5BABJX4zZ66+AfFzj4=;
	b=lYfXn5z8ce/Wyzmr8GyWit1c5Yvghu+gr9h2BM99PaBluzZcZOb8BivNjIGnJIU6y+
	jE3H7RcWXiP5wywzELdQFDUuRwDtyBza9FGkzm4Qs2tCF0L5EJVcbPiejNbg7qIiVfCp
	UPd02phayiZRNnaQRZ3Tx+Ul2xH+9aTPOBazE=
Received: by 10.68.71.234 with SMTP id y10mr390551pbu.132.1318895829091; Mon,
	17 Oct 2011 16:57:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Mon, 17 Oct 2011 16:56:39 -0700 (PDT)
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2011 16:56:39 -0700
Message-ID: <CAMKF1soubvVMqvXkUHo--Dkt96mVk1p1NjzWNG-pf-fW7Bv1JQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][meta-gnome 00/10] Small fixes
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
X-List-Received-Date: Tue, 18 Oct 2011 00:03:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 4:35 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> The following changes since commit 1b170fa28c9c52d4c8d87e9cbe07af1e664a96=
c3:
>
> =C2=A0digitemp: add 3.6.0 version (2011-10-17 16:32:18 +0200)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/meta-openembedded-contrib jansa/pull
> =C2=A0http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log=
/?h=3Djansa/pull
>
> Martin Jansa (10):
> =C2=A0syslog-ng: move conflicting file modules.conf to own packages and f=
ix
> =C2=A0 =C2=A0unpackaged files
> =C2=A0xf86-input-tslib: fix build with newer xserver
> =C2=A0e-wm-illume-dict-pl: fix licensing information
> =C2=A0e-tasks: fix licensing information
> =C2=A0ttf-droid: add LIC_FILES_CHKSUM, switch to github.com
> =C2=A0abiword: add LIC_FILES_CHKSUM
> =C2=A0abiword: add SRC_URI checksums
> =C2=A0abiword: fix install, newer versions doesn't allow to overwrite jus=
t
> =C2=A0 =C2=A0installed files
> =C2=A0wv: add SRC_URI checksums and drop deprecated patch=3D1 param
> =C2=A0efm-nav, efm-path, efm-pathbar: drop from meta-efl, now are part of
> =C2=A0 =C2=A0efm itself
>
> =C2=A0meta-efl/recipes-efl/e17/e-tasks_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0meta-efl/recipes-efl/e17/efm-nav_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 14 --
> =C2=A0meta-efl/recipes-efl/e17/efm-path_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 15 --
> =C2=A0meta-efl/recipes-efl/e17/efm-pathbar_svn.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 15 --
> =C2=A0.../recipes-efl/efl/e-wm-illume-dict-pl_git.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A05 +-
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword-2.5.inc =C2=A0 | =C2=A0 =
=C2=A07 +-
> =C2=A0.../abiword/abiword-2.5/fix.double.install.patch =C2=A0 | =C2=A0 34=
 ++++
> =C2=A0.../abiword/abiword-embedded_2.5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A0meta-gnome/recipes-gnome/abiword/abiword_2.5.2.bb =C2=A0| =C2=A0 =
=C2=A04 +-
> =C2=A0meta-gnome/recipes-gnome/wv/wv_1.2.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A0.../recipes-graphics/ttf-fonts/ttf-droid_git.bb =C2=A0 =C2=A0| =C2=
=A0 14 +-
> =C2=A0.../xf86-input-tslib-port-ABI-12-r48.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0196 ++++++++++++++++++++
> =C2=A0.../xorg-driver/xf86-input-tslib_0.0.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A0meta-oe/recipes-support/syslog-ng/syslog-ng.inc =C2=A0 =C2=A0| =C2=
=A0 11 +
> =C2=A0.../recipes-support/syslog-ng/syslog-ng_3.2.2.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A015 files changed, 268 insertions(+), 63 deletions(-)
> =C2=A0delete mode 100644 meta-efl/recipes-efl/e17/efm-nav_svn.bb
> =C2=A0delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb
> =C2=A0delete mode 100644 meta-efl/recipes-efl/e17/efm-pathbar_svn.bb
> =C2=A0create mode 100644 meta-gnome/recipes-gnome/abiword/abiword-2.5/fix=
.double.install.patch
> =C2=A0create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-=
tslib/xf86-input-tslib-port-ABI-12-r48.patch
>

seems good. Whole series

Acked-by: Khem Raj <raj.khem@gmail.com>

> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



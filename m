Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P24xD-0002e3-BM
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 18:28:57 +0200
Received: by iwn2 with SMTP id 2so5083755iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bk03+xK26lZltp+Q7QnzRHN0zd6gsEcqQrUMwHFhshI=;
	b=jJFDb2JknR199ZEERf7TQRO0/GWQi+lnm49M4E7aP88TU+XZiyByYee3Nagbwe01VV
	pmeFav7gSGRyNA7ELeKc7VllwjQXO7lOj24bK/vHoXhF8OvkDPuMjszXn4bWHhq5oiLQ
	2S7ZgpvMwTvDdBOooPhmnwUU5oB/nH20KD5Rc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JJphPmSSVEDWbMEdR4xfHCRESvCxM/4YadafjZmsWjHJypquZrmM0KutaLrCUMXL+a
	blZw8c2m5SajAenD8846zmJkeJtADihsUNAg1lPkkn6xWlQk6qVTXLHCU8gpC1oZPimZ
	gNtPlUIytQaEf2Jrr8YlatTfvrtSqAFjIuxsY=
MIME-Version: 1.0
Received: by 10.231.33.205 with SMTP id i13mr7433336ibd.59.1286036917830; Sat,
	02 Oct 2010 09:28:37 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 2 Oct 2010 09:28:37 -0700 (PDT)
In-Reply-To: <1285931854-17148-3-git-send-email-obi@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
	<1285931854-17148-3-git-send-email-obi@opendreambox.org>
Date: Sat, 2 Oct 2010 18:28:37 +0200
Message-ID: <AANLkTimSu5dVZJDbjSswaKf523NM9FfpNto=ZSq61g+M@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] cdfs-2.6.27: initial recipe
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
X-List-Received-Date: Sat, 02 Oct 2010 16:28:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/1 Andreas Oberritter <obi@opendreambox.org>:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/cdfs/cdfs_2.6.27.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 20 +++++++++++++
> =A0.../0001-Fix-compile-error-with-linux-2.6.32.patch | =A0 30 ++++++++++=
++++++++++
> =A02 files changed, 50 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/cdfs/cdfs_2.6.27.bb
> =A0create mode 100644 recipes/cdfs/files/0001-Fix-compile-error-with-linu=
x-2.6.32.patch
>
> diff --git a/recipes/cdfs/cdfs_2.6.27.bb b/recipes/cdfs/cdfs_2.6.27.bb
> new file mode 100644
> index 0000000..282bed7
> --- /dev/null
> +++ b/recipes/cdfs/cdfs_2.6.27.bb
> @@ -0,0 +1,20 @@
> +DESCRIPTION =3D "CDfs filesystem"
> +HOMEPAGE =3D "http://users.elis.ugent.be/~mronsse/cdfs/"
> +SECTION =3D "kernel/modules"
> +LICENSE =3D "GPL"
> +
> +SRC_URI =3D " \
> + =A0 =A0 =A0 =A0http://users.elis.ugent.be/~mronsse/cdfs/download/${P}.t=
ar.bz2 \
> + =A0 =A0 =A0 =A0file://0001-Fix-compile-error-with-linux-2.6.32.patch \
> +"
> +SRC_URI[md5sum] =3D "ac64c014a90e3c488394832ea29605b3"
> +SRC_URI[sha256sum] =3D "d034f6c6d9578fe2addfaeceaa101584a4a1fc9f27d825c3=
40baebd345d8d724"
> +
> +inherit module
> +
> +do_install() {
> + =A0 =A0 =A0 =A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> + =A0 =A0 =A0 =A0oe_runmake -C "${STAGING_KERNEL_DIR}" DEPMOD=3Decho INST=
ALL_MOD_PATH=3D"${D}" SUBDIRS=3D"${S}" ${MODULE_MAKE_FLAGS} modules_install
> +}
> +
> +PACKAGES =3D "${PN}"
> diff --git a/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.=
patch b/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch
> new file mode 100644
> index 0000000..742164d
> --- /dev/null
> +++ b/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch
> @@ -0,0 +1,30 @@
> +From 4aff257b7615a1b387797cd8dcc76aed3cc69ab8 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Mon, 7 Jun 2010 12:05:19 +0000
> +Subject: [PATCH] Fix compile error with linux-2.6.32
> +
> +root.c: In function 'cdfs_init':
> +root.c:646: error: 'CLONE_FS' undeclared (first use in this function)
> +root.c:646: error: (Each undeclared identifier is reported only once
> +root.c:646: error: for each function it appears in.)
> +root.c:646: error: 'CLONE_FILES' undeclared (first use in this function)
> +root.c:646: error: 'CLONE_SIGHAND' undeclared (first use in this functio=
n)
> +---
> + root.c | =A0 =A01 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/root.c b/root.c
> +index 966a855..0801051 100644
> +--- a/root.c
> ++++ b/root.c
> +@@ -25,6 +25,7 @@
> + #include "cdfs.h"
> +
> + #include <linux/module.h>
> ++#include <linux/sched.h>
> +
> +
> + /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++*
> +--
> +1.5.6.5
> +
> --
> 1.7.1
>
>

Looks interesting, but pity this is only for 2.6.27 (with no newer
version being available) so can't test/use this.

Frans



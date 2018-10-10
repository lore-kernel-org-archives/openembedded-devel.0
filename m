Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91F847547F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 02:01:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id q40-v6so4043597qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 19:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=InLxNsPocVLYyT/KMYu6D+Atn4cnqzLQfKfVOx15g5c=;
	b=E3sXO/4CcXYwA344QB4aS05vQVaOLfbZrnntwb6DRTc/vp2lRWXsbLOdkLi3qvsnW1
	/EvPHWxWsVamSSqkvcGKexbl3+Hhqwbq3whXKwAoVbzcnLFkmZBgfqr6xJY4L1Uv+CF0
	iM8ZTMkAc3fS6Cq69iG2Gjwn9IK9MfjLcW4xC9IFHvO5ruHHsuvbnJ3uzYH4Ju07Rode
	Fgolvzg9jh95cn2vbVv2QkZxkHTO76WqbokzzQbrF21i96/rBjiJWvOj14tdQiZiC+3P
	iqc/6xLwbyvo5Z642syka4RxzPfterq1nqve9R8ivJv4Dst+4riDkZ56mUqCRcv0esUt
	fofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=InLxNsPocVLYyT/KMYu6D+Atn4cnqzLQfKfVOx15g5c=;
	b=Y378YjOibL1E0VoLukvxsVe55BJMeuDE3t2189i4kWF6yjYTI66SxOUWXEVhWRV1z8
	JakgFt1l0x7nYoQvyL6UFDdK/g9j0mZg71cuDwGN6xp7VsIJ1+G3CkDClygKhJkvMx6c
	s2dv8wN4QOo52cSXliEYkRU3m002q/CY4JeaLHG9d2y40XYrWgca86PEXxD6m9hLgtdG
	3pHMwv5i/YxidPDo2ZL/lRAQc06PVVa/qzChWIMbRwFZByi1+Dp++YcnMvdJeucBeNbg
	lTHyvQ/9BDa8y8tu9OzwN2C0Hvuc5wdnKCUPz57a8SbJ0dY4Mu7eeSV9494tby9EndsW
	PBfg==
X-Gm-Message-State: ABuFfohH10f8ccc/NXWrVfrWuGthzwpfgtSNtJdcccfI/1B8q5OED7fD
	KEDcwIPzLCiuEW3LCjdjkGYHXb4gZQUsK1qxfgc=
X-Google-Smtp-Source: ACcGV62pkGfgt8H9KtECFJrc4fBze5v+IrK5cmm5lkW+tYCBhvD/W3Ew1N09I83I0d0O041E5M2PI47T3Kqp2jYiNQg=
X-Received: by 2002:a0c:c311:: with SMTP id
	f17-v6mr25655626qvi.228.1539136865103; 
	Tue, 09 Oct 2018 19:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqm2-6+mKtpLfk6jTwugc+vTy2U6mWrrKB8-iL-zV95qw@mail.gmail.com>
	<1539092429-3587-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
	<b927b1b3-1816-9685-4ed2-bf2bb0b6e8e6@gmail.com>
In-Reply-To: <b927b1b3-1816-9685-4ed2-bf2bb0b6e8e6@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Oct 2018 19:00:38 -0700
Message-ID: <CAMKF1sqXTGb0Y0E_BZh4q=STzPeCSJ8qi_ekREBK2xLXpDYbuw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] nvme-cli: add recipe
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
X-List-Received-Date: Wed, 10 Oct 2018 02:01:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 9, 2018 at 5:36 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/09/2018 06:40 AM, Stefan Wiehler wrote:
> > NVMe management command line interface.
> >
> > Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> > ---
> >
> > Change: Use bash-completion class and patch bash completion install path
> >
> >  ...Makefile-fix-bash-completion-install-path.patch | 33 ++++++++++++++++++++++
> >  meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb  | 21 ++++++++++++++
>
> Would it be more appropriate to have this in the recipes-bsp ?
>

i think thats a fair point, Or recipes-devtools is also a possible location
but recipes-bsp seems more appropriate. Please send a v3

>
> >  2 files changed, 54 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
> >  create mode 100644 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> >
> > diff --git a/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
> > new file mode 100644
> > index 0000000..ecd4f03
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
> > @@ -0,0 +1,33 @@
> > +From ef64032b34190079aab591c64a25f7535a977390 Mon Sep 17 00:00:00 2001
> > +From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> > +Date: Tue, 9 Oct 2018 11:26:34 +0200
> > +Subject: [PATCH] Makefile: fix bash completion install path
> > +
> > +Change path to bash-completion upstream recommendation used by most
> > +distributions.
> > +
> > +Upstream-Status: Submitted [https://github.com/linux-nvme/nvme-cli/pull/418]
> > +
> > +Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> > +---
> > + Makefile | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index fa587dd..433bc41 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -69,8 +69,8 @@ install-bin: default
> > +     $(INSTALL) -m 755 nvme $(DESTDIR)$(SBINDIR)
> > +
> > + install-bash-completion:
> > +-    $(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash_completion.d
> > +-    $(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash_completion.d/nvme
> > ++    $(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash-completion/completions
> > ++    $(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash-completion/completions/nvme
> > +
> > + install: install-bin install-man install-bash-completion
> > +
> > +--
> > +1.9.1
> > +
> > diff --git a/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> > new file mode 100644
> > index 0000000..9b7e6cd
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
> > @@ -0,0 +1,21 @@
> > +SUMMARY = "NVMe management command line interface"
> > +AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
> > +HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
> > +SECTION = "console/utils"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> > +DEPENDS = "util-linux"
> > +PV .= "+git${SRCPV}"
> > +
> > +SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
> > +           file://0001-Makefile-fix-bash-completion-install-path.patch \
> > +           "
> > +SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit bash-completion
> > +
> > +do_install() {
> > +    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> > +}
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


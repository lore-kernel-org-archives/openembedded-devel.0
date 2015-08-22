Return-Path: <andreas.baak@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCC573DF0;
	Sat, 22 Aug 2015 05:46:17 +0000 (UTC)
Received: by lahi9 with SMTP id i9so51763075lah.2;
	Fri, 21 Aug 2015 22:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8CEu2TgCjeN8TLSwF3NR7bKGRWrjjPeLJnDfSuVkBwg=;
	b=zwMXKPanOZcozOejYauWc6nekWnFsGf2e6eB1da5b9Qmn2I6hxHGrMUAL+rfV5KtWN
	YPvl/SgreUHOLtGt1rMgdG001T4rnQzek0r5U+27K47kdb9ojHasiqJVzEPwbj8wwm+3
	iE2wKcn840Ypdshcrd2k+jTPqi0u4CqcDVYTpheuGKn1MgG8bnuMAfKShAzdqUaE/WHo
	r1+iW+XcHg19RvK2Z+MjWS+NEukosS6fLXr1icA1/CZnW1/aQSbQ8nbotGS1T5wuUIeh
	wyW43x3d+cA/Tq6Z9WnDXsQnO2yV6tFTeVzU5RnTWVan3hW5O+fe7XdQmcSumPz1ENfh
	UY8Q==
MIME-Version: 1.0
X-Received: by 10.112.198.35 with SMTP id iz3mr9801224lbc.99.1440222375851;
	Fri, 21 Aug 2015 22:46:15 -0700 (PDT)
Received: by 10.25.170.9 with HTTP; Fri, 21 Aug 2015 22:46:15 -0700 (PDT)
Received: by 10.25.170.9 with HTTP; Fri, 21 Aug 2015 22:46:15 -0700 (PDT)
In-Reply-To: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
References: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
Date: Sat, 22 Aug 2015 07:46:15 +0200
Message-ID: <CABsPrv4XbrYsRARTBk_xunenuqw8ozi8nF4u-VkJ5ANWVtdVCA@mail.gmail.com>
From: Andreas Baak <andreas.baak@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Extensible SDK install errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Aug 2015 05:46:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Do you have superuser rights? Usually, you cannot write in /opt without.
Try to install the SDK with sudo or enter your home directory as target
when you are asked.
Regards,
Andreas
Am 22.08.2015 00:07 schrieb "Adam Lee" <adam.yh.lee@gmail.com>:

> Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal -c
> populate_sdk_ext).
>
> During the installation I get this permission error:
>
> $ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
> > Enter target directory for SDK (default: /opt/poky/1.8):
> > You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
> > Extracting SDK...done
> > Setting it up...
> > Extracting buildtools...
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: lin=
e
> > 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > denied
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: lin=
e
> > 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > denied
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh: lin=
e
> > 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi:
> Permission
> > denied
> > mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
> > =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=80=
=99: Permission
> denied
> > Preparing build system...
> > sh: 1: cannot create preparing_build_system.log: Permission denied
> > SDK preparation failed: see /opt/poky/1.8/preparing_build_system.log
>
>
>  It looks like `/opt/poky/1.8/layers/poky` directory belongs to the root
> user:
>
> $ ls -l /opt/poky/1.8/layers/
> > total 36
> > drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
> > drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
> > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
> > drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
> > drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
> > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
> > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
> > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
> > drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky
>
>
>  I may have missed something obvious. Has anyone seen this?
>
> Thanks!
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


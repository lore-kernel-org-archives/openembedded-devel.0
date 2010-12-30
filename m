Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PYSNU-0005fA-Lx
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 00:57:53 +0100
Received: by ywi6 with SMTP id 6so4879433ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 15:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=2OP044EGRwFUQQDaioPhu4J1Pr0BiQyMRUwS8JEyfUc=;
	b=wShnbMN/AATU4BJQb6CT2+Z+eYybtJgd5txaskuVV0njDmmpTeRCMbeE019BwwOrlA
	9hBOFELsUYWsgCpXmMB5a/kFaSEkSYsf+3JlkyLF2BctRO9upzX+Fup6fMxNC041y83e
	MQnqamLHXHhDZr3n2P8zFjBWlLeHsW4xYtqc8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=LmcdZh4DsQhtftwN2DoKSLeYXI8If8oJDlP5R/AEXPwCU+923BGzmmE3Lhk1qDI+C2
	uFSBZ22uxMsErmJLcnj5G2mMYnsP/v1ZO63e+K4yPrFrSg5kmRi8oRxlmFiNtDFt+KTz
	dqXjB2aOWF+4NUfim9pDLBty+K94id8ibqjkI=
Received: by 10.90.80.18 with SMTP id d18mr7937225agb.31.1293753453137; Thu,
	30 Dec 2010 15:57:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 30 Dec 2010 15:57:10 -0800 (PST)
In-Reply-To: <AANLkTikxUP2WpUeaX19vu8wMecM4MHDQHh0wKArdQ_o+@mail.gmail.com>
References: <AANLkTikxUP2WpUeaX19vu8wMecM4MHDQHh0wKArdQ_o+@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Dec 2010 15:57:10 -0800
Message-ID: <AANLkTinPxtGJCLRD8JgyPdjotigU_UMH4D-tduv04Kxo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Bitbake-de@lists.berlios.de
Subject: Re: bitbake oddity, wong kernel
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
X-List-Received-Date: Thu, 30 Dec 2010 23:57:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2010 at 10:29 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Got this today with OE git head of today and bitbake git head of today.
> Note that I am building for haowkboard, still somehow it wants to
> remove the linux-nios2 recipe.
> However virtual kernel is not using the nios2 kernel.
> from the conf/machine/include/davinci.inc =C2=A0file:
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-davinci"
>
> removing $TMPDIR/cache did not help.
> host is opensuse 11.3 (i686)
>
> Puzzled, Frans
>

hmmm I would say do a clean build for both the machines again
and retry this and see if it is reproducable

>
> frans@linux-suse:~/oe> bitbake -cclean virtual/kernel
> Loading cache: 100%
> |########################################################################=
######|
> ETA: =C2=A000:00:00
> Loaded 7218 entries from dependency cache.
> Parsing recipes: 100%
> |########################################################################=
####|
> Time: 00:00:24
> Parsing of 7273 .bb files complete (6526 cached, 747 parsed). 7977
> targets, 317 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.11.0"
> METADATA_BRANCH =C2=A0 =3D "org.openembedded.dev"
> METADATA_REVISION =3D "b04d637"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hawkboard"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "minimal"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "dev-snapshot-20101230"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "soft"
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'virtual/arm-oe-linux-gnueabi-depmod-None'
> ERROR: Nothing RPROVIDES 'virtual/arm-oe-linux-gnueabi-depmod-None'
> NOTE: Runtime target 'virtual/arm-oe-linux-gnueabi-depmod-None' is
> unbuildable, removing...
> Missing or unbuildable dependency chain was:
> ['virtual/arm-oe-linux-gnueabi-depmod-None']
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1 of 1 (ID: 0,
> /home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb,
> do_clean)
> NOTE: package linux-nios2-2.6.34-r50: task do_clean: Started
> NOTE: removing tmp_minimal/work/hawkboard-oe-linux-gnueabi/linux-nios2-2.=
6.34-r50
> NOTE: removing tmp_minimal/stamps/hawkboard-oe-linux-gnueabi/linux-nios2-=
2.6.34-r50.*
> NOTE: package linux-nios2-2.6.34-r50: task do_clean: Succeeded
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
> rerun and 0 failed.
> frans@linux-suse:~/oe> cd openembedded/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



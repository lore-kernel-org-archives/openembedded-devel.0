Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNFlP-0000qE-Rm
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 02:11:47 +0100
Received: by iwn32 with SMTP id 32so4310123iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2009 17:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UU2WnW2MNbKaUFVYh7gl6KukSJQfakCdrURypAiLRAA=;
	b=uceRrlyUC7G9hmS4Ad73XkecFwu5z9mXW6Dso46eGBSi1rz/85PGjDi31ZlnUy/htL
	2aorKs2E3l2yn5P4J23zCDJB4nDEJl8LWyY0gLCqVgoIQhThJTxDRTxdvJ8FKZKV2qSp
	rAqcGxOio7X+vzS5qXgFxeK5CN5H6HbaN2HXc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g1VDq6cP+S0ZIfXFDF2Wqg6J6A3jhBJ2JEvRCBcv+BwonMbA0GxyAGURBicxVSGm1w
	yMU15ZxhQifJEuWaEFb6NU7WjupAKSUNORTMOhw5DzIfiBMl+LKqhXS/ZWgrkgcFCOXj
	OSufV0+RpQEUzv98vdIlJamcFzS/JPWzOXxPg=
MIME-Version: 1.0
Received: by 10.231.167.204 with SMTP id r12mr486972iby.31.1261530590966; Tue, 
	22 Dec 2009 17:09:50 -0800 (PST)
In-Reply-To: <1261523056-27211-1-git-send-email-Martin.Jansa@gmail.com>
References: <1261523056-27211-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 22 Dec 2009 17:09:50 -0800
Message-ID: <19c1b8a90912221709sb14dd6aj5b53657b5c56af49@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] kernel, linux-kernel-base classes: update for 	2.6.33-rc1 and newer
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
X-List-Received-Date: Wed, 23 Dec 2009 01:11:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2009 at 3:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * include/asm link was killed in
> =C2=A0http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;=
a=3Dcommitdiff;h=3Df7f16b7799ed68654850ab340ef812895aebcf4c
> * utsrelease.h was moved in
> =C2=A0http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;=
a=3Dcommitdiff;h=3D273b281fa22c293963ee3e6eec418f5dda2dbc83
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0classes/kernel.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 19 +++++++++++++------
> =C2=A0classes/linux-kernel-base.bbclass | =C2=A0 =C2=A03 +++
> =C2=A02 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index edeaa66..069dceb 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -95,13 +95,18 @@ kernel_do_compile() {
> =C2=A0kernel_do_compile[depends] =3D "${INITRAMFS_TASK}"
>
> =C2=A0kernel_do_stage() {
> - =C2=A0 =C2=A0 =C2=A0 ASMDIR=3D`readlink include/asm`
> + =C2=A0 =C2=A0 =C2=A0 if [ -e include/asm ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This link is generat=
ed only in kernel before 2.6.33-rc1, don't stage it for newer kernels
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASMDIR=3D`readlink inc=
lude/asm`
>
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
> - =C2=A0 =C2=A0 =C2=A0 cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/inc=
lude/$ASMDIR/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGING_KER=
NEL_DIR}/include/$ASMDIR
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fR include/$ASMDIR=
/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> + =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Kernel 2.6.27 moved headers from includes/as=
m-${ARCH} to arch/${ARCH}/include/asm
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e arch/${ARCH}/include/asm/ ] ; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -fR arch/${ARCH}/in=
clude/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e include/asm ] =
; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASM=
DIR/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${STAGI=
NG_KERNEL_DIR}/arch/${ARCH}/include
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR arch/${ARCH=
}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/
>
> @@ -112,8 +117,10 @@ kernel_do_stage() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR arch/x86/* =
${STAGING_KERNEL_DIR}/arch/x86/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 rm -f ${STAGING_KERNEL_DIR}/include/asm
> - =C2=A0 =C2=A0 =C2=A0 ln -sf $ASMDIR ${STAGING_KERNEL_DIR}/include/asm
> + =C2=A0 =C2=A0 =C2=A0 if [ -e include/asm ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${STAGING_KERNEL=
_DIR}/include/asm
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf $ASMDIR ${STAGI=
NG_KERNEL_DIR}/include/asm
> + =C2=A0 =C2=A0 =C2=A0 fi
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${STAGING_KERNEL_DIR}/include/asm-gen=
eric
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR include/asm-generic/* ${STAGING_KERNEL_=
DIR}/include/asm-generic/
> diff --git a/classes/linux-kernel-base.bbclass b/classes/linux-kernel-bas=
e.bbclass
> index b3e0fda..510951a 100644
> --- a/classes/linux-kernel-base.bbclass
> +++ b/classes/linux-kernel-base.bbclass
> @@ -4,6 +4,9 @@ def get_kernelversion(p):
>
> =C2=A0 =C2=A0 fn =3D p + '/include/linux/utsrelease.h'
> =C2=A0 =C2=A0 if not os.path.isfile(fn):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# after 2.6.33-rc1
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0fn =3D p + '/include/generated/utsrelease.h'
> + =C2=A0 =C2=A0if not os.path.isfile(fn):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D p + '/include/linux/version.h'
>
> =C2=A0 =C2=A0 import re
> --
> 1.6.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



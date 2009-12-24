Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNrmB-0007yw-0W
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 18:47:06 +0100
Received: by iwn32 with SMTP id 32so5439343iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 09:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=J0UBaaJL1zOuZDJU35Psm9pppATbv0mfb2nPiRJ5jC8=;
	b=XnG7KYmcPJBsqSIPR2jntXXBBCfAQdCTz5p6OF+calDToO0KjlUXQMDsk/9G+ZPgYI
	p6mJjM2Z1bb0S0TpK1LRq4KBTfhSnczgbuV+kbBMNWiHbMQkDhhhBErsTn/BbnByKJWX
	s11a5Sbg1yZl914Tw3th56YlJex7TFWTIfwWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PD/XMag62EsNkWvTLrLsYZAUmEV0UxAMKB7re4m2vzQ6+gIiGURs2NKLT0jPrdm+Rs
	YV7/pAFRTJ5A4h0LCZZBpQ50X1i+M6qwBiO41xCYDJy7bie+tUU6IhwBp1Q/lOTGqAIH
	V8FAAnjeKE4Xqq7SBCIFtyBNpJxjQeEmMiPdU=
MIME-Version: 1.0
Received: by 10.231.25.199 with SMTP id a7mr255595ibc.51.1261676708372; Thu, 
	24 Dec 2009 09:45:08 -0800 (PST)
In-Reply-To: <1261642620-16347-1-git-send-email-camelguo@gmail.com>
References: <1261642620-16347-1-git-send-email-camelguo@gmail.com>
Date: Thu, 24 Dec 2009 09:45:08 -0800
Message-ID: <19c1b8a90912240945p53558860rd69b0ff980f076d@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix compilation error of events.c in ltrace on i386 target
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
X-List-Received-Date: Thu, 24 Dec 2009 17:47:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2009 at 12:17 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> on qemux86/minimal, the compilation of ltrace error reporting lack of som=
e macro started with PTRACE_EVENT, this patch fixes this problem.

All PTRACE_EVENT* defines should come from sys/ptrace.h
which it includes already. If these defines are not there then
there seems to be a problem either in the libc headers that
are installed or the way they are getting included.

Can you post the preprocessed output of event.c ?

> ---
> =C2=A0.../files/ltrace-fix-ptrace-event-macros.patch =C2=A0 =C2=A0 | =C2=
=A0 12 ++++++++++++
> =C2=A0recipes/ltrace/ltrace_0.5.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++++
> =C2=A02 files changed, 16 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/ltrace/files/ltrace-fix-ptrace-event-mac=
ros.patch
>
> diff --git a/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch b/=
recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
> new file mode 100644
> index 0000000..7232ca8
> --- /dev/null
> +++ b/recipes/ltrace/files/ltrace-fix-ptrace-event-macros.patch
> @@ -0,0 +1,12 @@
> +Index: ltrace-0.5.3/sysdeps/linux-gnu/events.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- ltrace-0.5.3.orig/sysdeps/linux-gnu/events.c =C2=A0 =C2=A0 =C2=A0 20=
09-12-24 15:58:24.000000000 +0800
> ++++ ltrace-0.5.3/sysdeps/linux-gnu/events.c =C2=A0 =C2=A02009-12-24 15:5=
8:41.000000000 +0800
> +@@ -8,6 +8,7 @@
> + #include <signal.h>
> + #include <string.h>
> + #include <sys/ptrace.h>
> ++#include <linux/ptrace.h>
> +
> + #include "common.h"
> +
> diff --git a/recipes/ltrace/ltrace_0.5.3.bb b/recipes/ltrace/ltrace_0.5.3=
.bb
> index 4130c29..1f70878 100644
> --- a/recipes/ltrace/ltrace_0.5.3.bb
> +++ b/recipes/ltrace/ltrace_0.5.3.bb
> @@ -4,6 +4,8 @@ SECTION =3D "devel"
> =C2=A0DEPENDS =3D "libelf"
> =C2=A0LICENSE =3D "GPLv2"
>
> +PR =3D "r2"
> +
> =C2=A0SRC_URI =3D "\
> =C2=A0 ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}.orig.tar.gz \
> =C2=A0 ${DEBIAN_MIRROR}/main/l/ltrace/ltrace_${PV}-2.diff.gz;patch=3D1 \
> @@ -12,7 +14,9 @@ SRC_URI =3D "\
> =C2=A0 file://ltrace-mips-remove-CP.patch;patch=3D1 \
> =C2=A0 file://ltrace-mips.patch;patch=3D1 \
> =C2=A0 file://ltrace-ppc.patch;patch=3D1 \
> + =C2=A0file://ltrace-fix-ptrace-event-macros.patch;patch=3D1 \
> =C2=A0"
> +
> =C2=A0inherit autotools
>
> =C2=A0export TARGET_CFLAGS =3D "${SELECTED_OPTIMIZATION} -isystem ${STAGI=
NG_INCDIR}"
> --
> 1.5.4.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



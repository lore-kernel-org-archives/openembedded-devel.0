Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5By5-0007lK-SG
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 08:34:42 +0200
Received: by iwn7 with SMTP id 7so2287807iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NewAP/+POHfa2iihupJE0DmRdiuHtZHOEfBX4QgEHlc=;
	b=mlxhfgBwiG8XeglWyBUg2dnkeS1MQQXYGcWcI15BkYDLwuJSKcKQNp8GPLvZX9AP9S
	jTmVQixr+oFfsEVNMAdSvrYADLlgBCOQmsgD7EK52gSseC4Q0pV5qsxdxVw0kyyHK5g5
	7rXON/zW/VUOsjeTcAS3ipcnLa12W8hyMciBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YBhgKyAN4mC2zRQH5qnYU+F5OXVabfgipiVk0ybMuRO/m1RQOpt4sN203Wp3EASDmV
	18UWKk43fqjLBbqHth+pBicY/hVJMR1dp1RXnziFV7+SGnNvURiorOAc2YBxVGCj2oeh
	XoGhMkvbsdKSVg8daEelm27HS2iHV/RC3gMKg=
MIME-Version: 1.0
Received: by 10.42.191.7 with SMTP id dk7mr1619364icb.274.1286778855518; Sun,
	10 Oct 2010 23:34:15 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 10 Oct 2010 23:34:15 -0700 (PDT)
In-Reply-To: <4CB2AD64.90800@gmail.com>
References: <4CB2AD64.90800@gmail.com>
Date: Mon, 11 Oct 2010 08:34:15 +0200
Message-ID: <AANLkTimPP5f4MtwXSh+JmWAPOK4ufj+u6tB=iv4su0KP@mail.gmail.com>
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
Subject: Re: [PATCH] prboom_2.5.0.bb: fix compilation failure due to undefined references.
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
X-List-Received-Date: Mon, 11 Oct 2010 06:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Graham Gower <graham.gower@gmail.com>:
> Need to #define _GNU_SOURCE for sched.h to define CPU_ZERO/CPU_SET.
>
> =A0SDL/libsdldoom.a(i_system.o): In function `I_SetAffinityMask':
> | i_system.c:(.text+0x7d4): undefined reference to `CPU_ZERO'
> | i_system.c:(.text+0x7e8): undefined reference to `CPU_SET'
> | collect2: ld returned 1 exit status
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0.../prboom-2.5.0/gnu_source_for_sched_h.patch =A0 =A0 =A0| =A0 12 ++++=
++++++++
> =A0recipes/prboom/prboom_2.5.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A03 ++-
> =A02 files changed, 14 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.=
patch
>
> diff --git a/recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch b/r=
ecipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch
> new file mode 100644
> index 0000000..e77917a
> --- /dev/null
> +++ b/recipes/prboom/prboom-2.5.0/gnu_source_for_sched_h.patch
> @@ -0,0 +1,12 @@
> +Upstream: http://sourceforge.net/mailarchive/forum.php?thread_name=3D4CB=
2549C.2030100%40gmail.com&forum_name=3Dprboom-devel
> +
> +--- prboom-2.5.0/src/SDL/i_system.c.orig =A0 =A0 =A0 2010-10-11 09:58:02=
.000000000 +1030
> ++++ prboom-2.5.0/src/SDL/i_system.c =A0 =A02010-10-11 09:59:16.000000000=
 +1030
> +@@ -33,6 +33,7 @@
> + =A0*-------------------------------------------------------------------=
----------
> + =A0*/
> +
> ++#define _GNU_SOURCE
> + #include <stdio.h>
> +
> + #include <stdarg.h>
> diff --git a/recipes/prboom/prboom_2.5.0.bb b/recipes/prboom/prboom_2.5.0=
.bb
> index 92a276d..13f3623 100644
> --- a/recipes/prboom/prboom_2.5.0.bb
> +++ b/recipes/prboom/prboom_2.5.0.bb
> @@ -4,10 +4,11 @@ PRIORITY =3D "optional"
> =A0DEPENDS =3D "virtual/libsdl libsdl-mixer libsdl-net"
> =A0LICENSE =3D "GPL"
>
> -PR =3D "r2"
> +PR =3D "r3"
> =A0RRECOMMENDS_${PN} =3D "freedoom"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/prboom/prboom-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0file://gnu_source_for_sched_h.patch \
> =A0 =A0 =A0 =A0 =A0 "
>
> =A0inherit autotools
> --
> 1.7.1
>

Do you feel this is the preferred way?
I would probably not have made the patch but add -D_GNU_SOURCE to
CFLAGS. (I like to compile all the sources with the same flags to
avoid inconsistencies)

Frans

Frans



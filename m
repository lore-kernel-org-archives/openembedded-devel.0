Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PV7SA-0007Ak-4w
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 20:00:54 +0100
Received: by yxd5 with SMTP id 5so1970860yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 11:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZVp1QUERN5kLFr+7hGsg5GKFya21Mp8adZtsc7ObOrk=;
	b=u1NfB+zWLtQjgknf+ElHlvlyeeZ+z42nNVqFSd3lsVLXIp6PwYdQ/+C0QVQUhcexNj
	B/QnqIhvWPxZIWA89PW6ojOKF3T/rpTB/80dS42oO9X5AlTEnMxFqpTUCkx8ayzHomPb
	ZKezvIfyG+OFZgKO5VM2qkOpeNys5BgAtGoo4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=q+AbBXltAbuEtfXDbutBcl0GofIcNXezUDU345ay9KdIuZ8bVmXGm/Ea+4b+13GSUa
	vEIZTAyvSWZ8So7suocnHLnYkXUJ40ata1dOBNPFZE9T/hpzMaj6C2lMh9QnukmrECM9
	Ky/uT7V2+XzaLk1KV+zH3EZMdkMr4/bidmzK4=
Received: by 10.91.163.27 with SMTP id q27mr7437085ago.139.1292958045945; Tue,
	21 Dec 2010 11:00:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 11:00:25 -0800 (PST)
In-Reply-To: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
References: <1292953146-22849-1-git-send-email-vjaquez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 11:00:25 -0800
Message-ID: <AANLkTi=36DFeN+iynjEnX5YabCw=01mmMs5h1S4UDK7V@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] strace: add netlink/netlink-compat.h in configure.ac
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
X-List-Received-Date: Tue, 21 Dec 2010 19:00:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/21 V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>:
> I found, compiling an console-image for omap4330-panda machine, that stra=
ce
> compilation broke because the netlink.h wasn't included. It was not inclu=
ded
> because the AC_CHECK_HEADERS failed. If failed because sa_family_t wasn't
> defined, even though linux/socket.h is supposed to define it.
>
> This patch modifies the configure.ac in order to include
> netlink/netlink-compat.h in the AC_CHECK_HEADER macro, so the header is
> detected correctly.
>

it happens after
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
itdiff;h=3D9c501935a3cdcf6b1d35aaee3aa11c7a7051a305
see this message
http://lkml.indiana.edu/hypermail/linux/kernel/1001.1/02281.html
I fixed it differently for kernel headers see

recipes/linux-libc-headers/linux-libc-headers-2.6.32/export_sa_family_t.pat=
ch

since this might break more packages than strace the fix in kernel
headers sounded better.

> Signed-off-by: V=C3=ADctor Manuel J=C3=A1quez Leal <vjaquez@igalia.com>
> ---
> =C2=A0recipes/strace/strace-4.5.14/netlink.patch | =C2=A0 16 ++++++++++++=
++++
> =C2=A0recipes/strace/strace_4.5.14.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A02 files changed, 18 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/strace/strace-4.5.14/netlink.patch
>
> diff --git a/recipes/strace/strace-4.5.14/netlink.patch b/recipes/strace/=
strace-4.5.14/netlink.patch
> new file mode 100644
> index 0000000..ba89a10
> --- /dev/null
> +++ b/recipes/strace/strace-4.5.14/netlink.patch
> @@ -0,0 +1,16 @@
> +Index: strace-4.5.14/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- strace-4.5.14.orig/configure.ac
> ++++ strace-4.5.14/configure.ac
> +@@ -194,7 +194,10 @@ fi
> + AC_CHECK_FUNCS(sigaction strerror strsignal pread sys_siglist _sys_sigl=
ist getdents mctl prctl sendmsg inet_ntop if_indextoname)
> + AC_CHECK_HEADERS([sys/reg.h sys/filio.h sys/acl.h sys/asynch.h sys/door=
.h stropts.h sys/conf.h sys/stream.h sys/tihdr.h sys/tiuser.h sys/sysconfig=
.h ioctls.h sys/ioctl.h sys/ptrace.h termio.h linux/ptrace.h asm/reg.h sys/=
uio.h sys/aio.h =C2=A0poll.h sys/poll.h sys/vfs.h asm/sysmips.h linux/utsna=
me.h sys/nscsys.h mqueue.h sys/epoll.h libaio.h], [], [])
> + AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_pac=
ket.h],
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [], [], [#incl=
ude <linux/socket.h>])
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [], [], [
> ++#include <netlink/netlink-compat.h>
> ++#include <linux/socket.h>
> ++])
> + AC_CHECK_HEADERS([asm/sigcontext.h], [], [], [#include <signal.h>])
> + AC_CHECK_HEADERS([netinet/tcp.h netinet/udp.h],,, [#include <netinet/in=
.h>])
> +
> diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.=
14.bb
> index 33a44ad..a4a0981 100644
> --- a/recipes/strace/strace_4.5.14.bb
> +++ b/recipes/strace/strace_4.5.14.bb
> @@ -1,7 +1,7 @@
> =C2=A0DESCRIPTION =3D "strace is a system call tracing tool."
> =C2=A0SECTION =3D "console/utils"
> =C2=A0LICENSE =3D "BSD"
> -PR =3D "r9"
> +PR =3D "r10"
>
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://glibc-2.5.patch \
> @@ -13,6 +13,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.=
tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://strace-arm-no-cachectl.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://strace-dont-include-linux=
-dirent-h.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mips-sigcontext.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://netlink.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>
> =C2=A0# The strace-4.5.14-avr32.patch conflicts with some other patches.
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



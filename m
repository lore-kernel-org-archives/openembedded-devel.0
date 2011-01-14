Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pda9O-00076w-Lt
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:16:30 +0100
Received: by pvd12 with SMTP id 12so363628pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=/dpBkMmpSsVGVMl/ZFlC+pnrY7G4cDaQRLB5TAH+Ff8=;
	b=cjVV9PDoJJHELOiHbW/56ijuVM149XBiGGrWvi0UgNxLycXoxOzTFisqf49h9zMOkd
	O9zL3y92j7W8H+9rQrGL+1xlJT3RoJTgI2j3d+J84+w1+RSbomj2F+KtSbEvgWg9OOsZ
	s4pSswsiKWLgVrbbLUG35fhY1+ml0x4+N0UjU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=MCqIRal8pvge8XeLPTWnB/czqfeGedQobLE/eQY00RSm20pimYqOq2JjVpl1rCHlqz
	yH7dKY4NhJbbfmNX/xctFsg8gQvQpeTzIvNGsorVQ5Yi/XUjxDG8on9aKO8bLDIlK0AS
	FZZdVnG72leJmtqtym0S8ciLdbQzr5KnCLM3I=
Received: by 10.142.139.8 with SMTP id m8mr284863wfd.181.1294974956406;
	Thu, 13 Jan 2011 19:15:56 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id e14sm978510wfg.20.2011.01.13.19.15.55
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:15:55 -0800 (PST)
Message-ID: <4D2FBFE7.5040904@gmail.com>
Date: Thu, 13 Jan 2011 19:15:51 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E9269.2020409@gmail.com>
	<1294926304-22239-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294926304-22239-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH v2] strace: add patch allowing compilation with kernel headers >= 2.6.32
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
X-List-Received-Date: Fri, 14 Jan 2011 03:16:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/2011 5:45 AM, Eric Bénard wrote:
> tested with kernel headers 2.6.31&  2.6.37 : both compile fine.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
> v2 : with the patch this time ;-)


Acked-by: Khem Raj <raj.khem@gmail.com>

>
>   .../strace/strace-4.5.14/strace-linux-2.6.32.patch |   13 +++++++++++++
>   recipes/strace/strace_4.5.14.bb                    |    3 ++-
>   2 files changed, 15 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
>
> diff --git a/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
> new file mode 100644
> index 0000000..cb0ffbf
> --- /dev/null
> +++ b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
> @@ -0,0 +1,13 @@
> +diff --git a/configure.ac b/configure.ac
> +index 03069c0..7a134bd 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -194,7 +194,7 @@ fi
> + AC_CHECK_FUNCS(sigaction strerror strsignal pread sys_siglist _sys_siglist getdents mctl prctl sendmsg inet_ntop if_indextoname)
> + AC_CHECK_HEADERS([sys/reg.h sys/filio.h sys/acl.h sys/asynch.h sys/door.h stropts.h sys/conf.h sys/stream.h sys/tihdr.h sys/tiuser.h sys/sysconfig.h ioctls.h sys/ioctl.h sys/ptrace.h termio.h linux/ptrace.h asm/reg.h sys/uio.h sys/aio.h  poll.h sys/poll.h sys/vfs.h asm/sysmips.h linux/utsname.h sys/nscsys.h mqueue.h sys/epoll.h libaio.h], [], [])
> + AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h linux/if_packet.h],
> +-                 [], [], [#include<linux/socket.h>])
> ++                 [], [], [#include<sys/socket.h>])
> + AC_CHECK_HEADERS([asm/sigcontext.h], [], [], [#include<signal.h>])
> + AC_CHECK_HEADERS([netinet/tcp.h netinet/udp.h],,, [#include<netinet/in.h>])
> +
> diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
> index 33a44ad..395e4ee 100644
> --- a/recipes/strace/strace_4.5.14.bb
> +++ b/recipes/strace/strace_4.5.14.bb
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "strace is a system call tracing tool."
>   SECTION = "console/utils"
>   LICENSE = "BSD"
> -PR = "r9"
> +PR = "r10"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>              file://glibc-2.5.patch \
> @@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>              file://strace-arm-no-cachectl.patch \
>              file://strace-dont-include-linux-dirent-h.patch \
>              file://mips-sigcontext.patch \
> +           file://strace-linux-2.6.32.patch \
>             "
>
>   # The strace-4.5.14-avr32.patch conflicts with some other patches.




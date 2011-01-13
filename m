Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PdOul-0005Rp-Dv
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 16:16:39 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PdOu7-00069o-0s from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 07:15:59 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 13 Jan 2011 07:15:58 -0800
Received: from [172.30.80.229] ([172.30.80.229]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 Jan 2011 08:15:57 -0700
Message-ID: <4D2F1728.3050308@mentor.com>
Date: Thu, 13 Jan 2011 08:15:52 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E9269.2020409@gmail.com>
	<1294926304-22239-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1294926304-22239-1-git-send-email-eric@eukrea.com>
X-OriginalArrivalTime: 13 Jan 2011 15:15:58.0101 (UTC)
	FILETIME=[C7BE7450:01CBB334]
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
X-List-Received-Date: Thu, 13 Jan 2011 15:16:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/13/2011 06:45 AM, Eric Bénard wrote:
> tested with kernel headers 2.6.31&  2.6.37 : both compile fine.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

I still say (and on top of my last, just sent email) that we basically 
only need strace 4.5.14 for avr32 and everyone else should be fine with 
4.5.20.

> ---
> v2 : with the patch this time ;-)
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


-- 
Tom Rini
Mentor Graphics Corporation



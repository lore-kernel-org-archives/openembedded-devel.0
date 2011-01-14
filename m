Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdaLX-0007bu-KW
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 04:29:04 +0100
Received: by pxi17 with SMTP id 17so353033pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 19:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=nDmVIt0VbRNe+LPY55wsLIaEMffZexLGFUqI7Hpc4Ro=;
	b=UoZC5QK6MPb0o41mhJWK/b1NmLKhWmaZt0vZO1RYODNVVekYYPVP4gwQEDbJIYkIql
	mp7wj13dgqMhA8jVfxKeZqYsUd8tcDqRTCTOrwVhxm7S5Zrd3CYqg+9jgtoLNcqXwyzs
	hpiM3eF9TqhvfnUQsiXgZ0wSSxHSsZSVyj278=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=wiXbSViqT7MnLx3R1VmyDD/aVWVAAg2QRDRaJpqOgUlS5WHrLz2Bm3gsMpqv2iOlBK
	TBchRK7wSEPpLSgI4+iLEzcqHSafBtNheTdnv3dSjPCpTl01Bn30uUJ0A8oDAtUujFHT
	70cveMAJJDtO7dzmSLyrDDR+Zu7nlfDVWf4J8=
Received: by 10.142.156.6 with SMTP id d6mr293802wfe.212.1294975708079;
	Thu, 13 Jan 2011 19:28:28 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o1sm1007330wfl.2.2011.01.13.19.28.26
	(version=SSLv3 cipher=RC4-MD5); Thu, 13 Jan 2011 19:28:27 -0800 (PST)
Message-ID: <4D2FC2D7.5060803@gmail.com>
Date: Thu, 13 Jan 2011 19:28:23 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E9269.2020409@gmail.com>	<1294926304-22239-1-git-send-email-eric@eukrea.com>
	<4D2F1728.3050308@mentor.com>
In-Reply-To: <4D2F1728.3050308@mentor.com>
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
X-List-Received-Date: Fri, 14 Jan 2011 03:29:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/2011 7:15 AM, Tom Rini wrote:
> On 01/13/2011 06:45 AM, Eric Bénard wrote:
>> tested with kernel headers 2.6.31& 2.6.37 : both compile fine.
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
> I still say (and on top of my last, just sent email) that we basically
> only need strace 4.5.14 for avr32 and everyone else should be fine with
> 4.5.20.

OK then just keep those two versions around.

>
>> ---
>> v2 : with the patch this time ;-)
>>
>> .../strace/strace-4.5.14/strace-linux-2.6.32.patch | 13 +++++++++++++
>> recipes/strace/strace_4.5.14.bb | 3 ++-
>> 2 files changed, 15 insertions(+), 1 deletions(-)
>> create mode 100644 recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
>>
>> diff --git a/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
>> b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
>> new file mode 100644
>> index 0000000..cb0ffbf
>> --- /dev/null
>> +++ b/recipes/strace/strace-4.5.14/strace-linux-2.6.32.patch
>> @@ -0,0 +1,13 @@
>> +diff --git a/configure.ac b/configure.ac
>> +index 03069c0..7a134bd 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -194,7 +194,7 @@ fi
>> + AC_CHECK_FUNCS(sigaction strerror strsignal pread sys_siglist
>> _sys_siglist getdents mctl prctl sendmsg inet_ntop if_indextoname)
>> + AC_CHECK_HEADERS([sys/reg.h sys/filio.h sys/acl.h sys/asynch.h
>> sys/door.h stropts.h sys/conf.h sys/stream.h sys/tihdr.h sys/tiuser.h
>> sys/sysconfig.h ioctls.h sys/ioctl.h sys/ptrace.h termio.h
>> linux/ptrace.h asm/reg.h sys/uio.h sys/aio.h poll.h sys/poll.h
>> sys/vfs.h asm/sysmips.h linux/utsname.h sys/nscsys.h mqueue.h
>> sys/epoll.h libaio.h], [], [])
>> + AC_CHECK_HEADERS([linux/icmp.h linux/in6.h linux/netlink.h
>> linux/if_packet.h],
>> +- [], [], [#include<linux/socket.h>])
>> ++ [], [], [#include<sys/socket.h>])
>> + AC_CHECK_HEADERS([asm/sigcontext.h], [], [], [#include<signal.h>])
>> + AC_CHECK_HEADERS([netinet/tcp.h netinet/udp.h],,,
>> [#include<netinet/in.h>])
>> +
>> diff --git a/recipes/strace/strace_4.5.14.bb
>> b/recipes/strace/strace_4.5.14.bb
>> index 33a44ad..395e4ee 100644
>> --- a/recipes/strace/strace_4.5.14.bb
>> +++ b/recipes/strace/strace_4.5.14.bb
>> @@ -1,7 +1,7 @@
>> DESCRIPTION = "strace is a system call tracing tool."
>> SECTION = "console/utils"
>> LICENSE = "BSD"
>> -PR = "r9"
>> +PR = "r10"
>>
>> SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>> file://glibc-2.5.patch \
>> @@ -13,6 +13,7 @@ SRC_URI =
>> "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
>> file://strace-arm-no-cachectl.patch \
>> file://strace-dont-include-linux-dirent-h.patch \
>> file://mips-sigcontext.patch \
>> + file://strace-linux-2.6.32.patch \
>> "
>>
>> # The strace-4.5.14-avr32.patch conflicts with some other patches.
>
>




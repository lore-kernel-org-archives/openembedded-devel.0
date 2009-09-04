Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MjbEc-0002ix-U9 for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 18:01:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MjawD-0001uX-VD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 17:42:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 17:42:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 17:42:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Sep 2009 17:42:32 +0200
Message-ID: <h7rch9$u4f$1@ger.gmane.org>
References: <1252075968-14536-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1252075968-14536-1-git-send-email-raj.khem@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] angstrom: Use linux-uclibceabi instead of linux-uclibcgnueabi
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
X-List-Received-Date: Fri, 04 Sep 2009 16:01:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-09-09 16:52, Khem Raj wrote:
> * For uclibc based ARM EABI systems switch to using linux-uclibceabi
>    as TARGET_OS
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>

I wasn't happy with the other linux-gnu stuff, but since that's in now:

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   conf/distro/include/angstrom-2007-for-openmoko.inc |    4 ++--
>   conf/distro/include/angstrom-uclibc.inc            |    2 +-
>   conf/distro/include/angstrom-uclinux-uclibc.inc    |    2 +-
>   .../include/sane-toolchain-uclinux-uclibc.inc      |    2 --
>   4 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-2007-for-openmoko.inc b/conf/distro/include/angstrom-2007-for-openmoko.inc
> index 1deb85d..6741bae 100644
> --- a/conf/distro/include/angstrom-2007-for-openmoko.inc
> +++ b/conf/distro/include/angstrom-2007-for-openmoko.inc
> @@ -143,8 +143,8 @@ PREFERRED_PROVIDER_virtual/powerpc-angstrom-linux-libc-for-gcc        = "glibc"
>   PREFERRED_PROVIDER_virtual/mipsel-angstrom-linux-libc-for-gcc         = "glibc"
>   PREFERRED_PROVIDER_virtual/sparc-angstrom-linux-libc-for-gcc          = "glibc"
>
> -PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibcgnueabi-libc-for-gcc    = "uclibc-initial"
> -PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibcgnueabi-libc-for-gcc  = "uclibc-initial"
> +PREFERRED_PROVIDER_virtual/arm-angstrom-linux-uclibceabi-libc-for-gcc    = "uclibc-initial"
> +PREFERRED_PROVIDER_virtual/armeb-angstrom-linux-uclibceabi-libc-for-gcc  = "uclibc-initial"
>
>   # hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
>   PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
> diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
> index a60952f..004d904 100644
> --- a/conf/distro/include/angstrom-uclibc.inc
> +++ b/conf/distro/include/angstrom-uclibc.inc
> @@ -9,7 +9,7 @@ USE_NLS_glib-2.0 = "yes"
>   USE_NLS_glib-2.0-native = "yes"
>   USE_NLS_gcc-cross = "no"
>
> -TARGET_OS_UC = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
> +TARGET_OS_UC = "linux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
>   TARGET_OS = "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"
>
>   #mess with compiler flags to use -Os instead of -O2
> diff --git a/conf/distro/include/angstrom-uclinux-uclibc.inc b/conf/distro/include/angstrom-uclinux-uclibc.inc
> index 019f814..ad499f7 100644
> --- a/conf/distro/include/angstrom-uclinux-uclibc.inc
> +++ b/conf/distro/include/angstrom-uclinux-uclibc.inc
> @@ -6,7 +6,7 @@ USE_NLS_glib-2.0 = "yes"
>   USE_NLS_glib-2.0-native = "yes"
>   USE_NLS_gcc-cross = "no"
>
> -TARGET_OS_UC = "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
> +TARGET_OS_UC = "uclinux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
>
>   #mess with compiler flags to use -Os instead of -O2
>   #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
> diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> index b757efb..fbb239a 100644
> --- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> +++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
> @@ -7,8 +7,6 @@ USE_NLS_glib-2.0 = "yes"
>   USE_NLS_glib-2.0-native = "yes"
>   USE_NLS_gcc-cross = "no"
>
> -TARGET_OS_UC = "uclinux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
> -
>   #mess with compiler flags to use -Os instead of -O2
>   #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
>   FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"





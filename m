Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdG73-0001S8-DZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 06:52:45 +0100
Received: by pzk12 with SMTP id 12so143262pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jan 2011 21:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZU8eTkRRHm/4aFXv3OBxyAzf/OVcS9GXcrzLF+4unT0=;
	b=T02joIcpLTP3Zy0/Ggwggja3pQR+uqyWQ1gih8iNxXGd+akUJeL3t4U09xbpMODoRl
	Jop5zPGncnPGFAnRQVGtnLwuez8hPEF4iN+xuQp5yo3TRzpeSQg4mXhOsA6M2iDlINgd
	C9j+c59ohM/zrgJIBQmoAgsSbE8vIkeoOhJ+4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=UjEhLFEH0kEKl4p8gSzEyd5dlJSl1RD7AmIGUr73mtaw3wTNhKKU51DJuj+J9BfdZR
	Yz6lnOQuvqG+TS87GlrDsuopiGoaTx4f4eI/cjoV6Zuh+q2ltZWfOl3VRZDk3SN18Wdf
	Q3glYpxoylEyIstK1alEDKHA6YuVb8GIqLQs8=
Received: by 10.142.43.13 with SMTP id q13mr537238wfq.391.1294897932087;
	Wed, 12 Jan 2011 21:52:12 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm1872370wfd.13.2011.01.12.21.52.10
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Jan 2011 21:52:11 -0800 (PST)
Message-ID: <4D2E9306.5090700@gmail.com>
Date: Wed, 12 Jan 2011 21:52:06 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>	<1294867230-7827-2-git-send-email-eric@eukrea.com>
	<1294867230-7827-3-git-send-email-eric@eukrea.com>
In-Reply-To: <1294867230-7827-3-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 3/3] mtd-utils: add 1.4.1
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
X-List-Received-Date: Thu, 13 Jan 2011 05:52:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/12/2011 1:20 PM, Eric Bénard wrote:
> latest stable version + a fix to mkubifs.
>
> tested to generate ubi rootfs on the host.
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

why is it compiled ARM only ? is there any issue with thumb mode

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   .../mtd/mtd-utils-1.4.1/fix_heap_corruption.patch  |   95 ++++++++++++++++++++
>   recipes/mtd/mtd-utils-native_1.4.1.bb              |    3 +
>   recipes/mtd/mtd-utils_1.4.1.bb                     |   27 ++++++
>   3 files changed, 125 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
>   create mode 100644 recipes/mtd/mtd-utils-native_1.4.1.bb
>   create mode 100644 recipes/mtd/mtd-utils_1.4.1.bb
>
> diff --git a/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch b/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
> new file mode 100644
> index 0000000..5ce3a53
> --- /dev/null
> +++ b/recipes/mtd/mtd-utils-1.4.1/fix_heap_corruption.patch
> @@ -0,0 +1,95 @@
> +From d8f0ae2f26898f652ad3af4536b5d0e4db37714f Mon Sep 17 00:00:00 2001
> +From: Kevin Cernekee<cernekee@gmail.com>
> +Date: Wed, 22 Sep 2010 16:01:59 -0700
> +Subject: [PATCH] mkfs.ubifs: Fix heap corruption on LEB overrun
> +
> +If max_leb_cnt (-c option) is set too low, set_lprops() will corrupt
> +the heap and may result in a scary looking crash:
> +
> +$ bin/mkfs.ubifs -U -r romfs -o ubifs.img -m 512 -e 15360 -c 39
> +Error: max_leb_cnt too low (241 needed)
> +*** glibc detected *** bin/mkfs.ubifs: double free or corruption (!prev): 0x088fe070 ***
> +======= Backtrace: =========
> +/lib32/libc.so.6(+0x6c231)[0xf75fb231]
> +/lib32/libc.so.6(+0x6dab8)[0xf75fcab8]
> +/lib32/libc.so.6(cfree+0x6d)[0xf75ffb9d]
> +bin/mkfs.ubifs[0x804e801]
> +bin/mkfs.ubifs[0x804e94b]
> +bin/mkfs.ubifs[0x804e99d]
> +/lib32/libc.so.6(__libc_start_main+0xe6)[0xf75a5bd6]
> +bin/mkfs.ubifs(__fxstat64+0x55)[0x80491e1]
> +======= Memory map: ========
> +08048000-0805d000 r-xp 00000000 08:08 10012045                           /work/bin/mkfs.ubifs
> +0805d000-0805e000 rwxp 00015000 08:08 10012045                           /work/bin/mkfs.ubifs
> +088fe000-08945000 rwxp 00000000 00:00 0                                  [heap]
> +f73e1000-f73fe000 r-xp 00000000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
> +f73fe000-f73ff000 r-xp 0001c000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
> +f73ff000-f7400000 rwxp 0001d000 08:05 2228842                            /usr/lib32/libgcc_s.so.1
> +f7400000-f7421000 rwxp 00000000 00:00 0
> +f7421000-f7500000 ---p 00000000 00:00 0
> +f751c000-f758f000 rwxp 00000000 00:00 0
> +f758f000-f76e2000 r-xp 00000000 08:05 426288                             /lib32/libc-2.11.1.so
> +f76e2000-f76e3000 ---p 00153000 08:05 426288                             /lib32/libc-2.11.1.so
> +f76e3000-f76e5000 r-xp 00153000 08:05 426288                             /lib32/libc-2.11.1.so
> +f76e5000-f76e6000 rwxp 00155000 08:05 426288                             /lib32/libc-2.11.1.so
> +f76e6000-f76e9000 rwxp 00000000 00:00 0
> +f76e9000-f770d000 r-xp 00000000 08:05 426296                             /lib32/libm-2.11.1.so
> +f770d000-f770e000 r-xp 00023000 08:05 426296                             /lib32/libm-2.11.1.so
> +f770e000-f770f000 rwxp 00024000 08:05 426296                             /lib32/libm-2.11.1.so
> +f772a000-f772c000 rwxp 00000000 00:00 0
> +f772c000-f772d000 r-xp 00000000 00:00 0                                  [vdso]
> +f772d000-f7749000 r-xp 00000000 08:05 6062081                            /lib32/ld-2.11.1.so
> +f7749000-f774a000 r-xp 0001b000 08:05 6062081                            /lib32/ld-2.11.1.so
> +f774a000-f774b000 rwxp 0001c000 08:05 6062081                            /lib32/ld-2.11.1.so
> +ffb58000-ffb6d000 rwxp 00000000 00:00 0                                  [stack]
> +Aborted
> +
> +New code aborts cleanly, and still calculates the number of LEBs
> +required:
> +
> +$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 39
> +Error: max_leb_cnt too low (241 needed)
> +$ echo $?
> +255
> +$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 240
> +Error: max_leb_cnt too low (241 needed)
> +$ bin/mkfs.ubifs -U -r romfs -o tmp/ubifs.img -m 512 -e 15360 -c 241
> +$
> +
> +Signed-off-by: Kevin Cernekee<cernekee@gmail.com>
> +Signed-off-by: Artem Bityutskiy<Artem.Bityutskiy@nokia.com>
> +---
> + mkfs.ubifs/mkfs.ubifs.c |   10 +++++-----
> + 1 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
> +index eeb5e42..ec38f0e 100644
> +--- a/mkfs.ubifs/mkfs.ubifs.c
> ++++ b/mkfs.ubifs/mkfs.ubifs.c
> +@@ -929,9 +929,11 @@ static void set_lprops(int lnum, int offs, int flags)
> + 	dirty = c->leb_size - free - ALIGN(offs, 8);
> + 	dbg_msg(3, "LEB %d free %d dirty %d flags %d", lnum, free, dirty,
> + 		flags);
> +-	c->lpt[i].free = free;
> +-	c->lpt[i].dirty = dirty;
> +-	c->lpt[i].flags = flags;
> ++	if (i<  c->main_lebs) {
> ++		c->lpt[i].free = free;
> ++		c->lpt[i].dirty = dirty;
> ++		c->lpt[i].flags = flags;
> ++	}
> + 	c->lst.total_free += free;
> + 	c->lst.total_dirty += dirty;
> + 	if (flags&  LPROPS_INDEX)
> +@@ -1943,8 +1945,6 @@ static int finalize_leb_cnt(void)
> + {
> + 	c->leb_cnt = head_lnum;
> + 	if (c->leb_cnt>  c->max_leb_cnt)
> +-		/* TODO: in this case it segfaults because buffer overruns - we
> +-		 * somewhere allocate smaller buffers - fix */
> + 		return err_msg("max_leb_cnt too low (%d needed)", c->leb_cnt);
> + 	c->main_lebs = c->leb_cnt - c->main_first;
> + 	if (verbose) {
> +--
> +1.7.2.3
> +
> diff --git a/recipes/mtd/mtd-utils-native_1.4.1.bb b/recipes/mtd/mtd-utils-native_1.4.1.bb
> new file mode 100644
> index 0000000..74ba439
> --- /dev/null
> +++ b/recipes/mtd/mtd-utils-native_1.4.1.bb
> @@ -0,0 +1,3 @@
> +require mtd-utils_${PV}.bb
> +require mtd-utils-native.inc
> +DEPENDS += "util-linux-ng-native"
> diff --git a/recipes/mtd/mtd-utils_1.4.1.bb b/recipes/mtd/mtd-utils_1.4.1.bb
> new file mode 100644
> index 0000000..d67ea5f
> --- /dev/null
> +++ b/recipes/mtd/mtd-utils_1.4.1.bb
> @@ -0,0 +1,27 @@
> +require mtd-utils.inc
> +
> +DEPENDS += "util-linux-ng"
> +
> +PARALLEL_MAKE = ""
> +ARM_INSTRUCTION_SET = "arm"
> +
> +# This is the default package, thus we lock to a specific git version so
> +# upstream changes will not break builds.
> +
> +TAG = "v${PV}"
> +
> +SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=${TAG} \
> +	   file://add-exclusion-to-mkfs-jffs2-git-2.patch \
> +	   file://fix_heap_corruption.patch \
> +	   file://lzo_1x-git.patch"
> +
> +S = "${WORKDIR}/git/"
> +
> +do_configure_prepend() {
> +	for i in $(find . -name "Makefile") ; do
> +		sed -i -e s:lzo2:lzo:g $i
> +	done
> +	if [ -e mkfs.ubifs/compr.c ]; then
> +		sed -i -e s:lzo/::g mkfs.ubifs/compr.c
> +	fi
> +}




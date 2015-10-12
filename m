Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48E68760F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 06:20:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9C6KtXp003339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 11 Oct 2015 23:20:55 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 11 Oct 2015 23:20:54 -0700
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
References: <1444447891-13579-1-git-send-email-kai.kang@windriver.com>
	<1444447891-13579-2-git-send-email-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <561B5145.2040609@windriver.com>
Date: Mon, 12 Oct 2015 14:20:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1444447891-13579-2-git-send-email-kai.kang@windriver.com>
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Oct 2015 06:20:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年10月10日 11:31, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade efivar from 0.7 to 0.21.
>
> * update HOMEPAGE and git repo.
> * update license file checksum. It made FSF addresses in COPYING be URLs.
>    Ref: https://github.com/rhinstaller/efivar/commit/ca88012
> * add -native recipe to provide command makeguids
>    and add patch for target package to use this native makeguids command
> * add patch to build efivar-native with lower version gcc which doesn't
>    support options '-Wmaybe-uninitialized' and '-std=gnu11'
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 ++++++++++
>   ...ptions-not-supported-by-lower-version-gcc.patch | 71 ++++++++++++++++++++++
>   .../efivar/{efivar_git.bb => efivar_0.21.bb}       | 23 +++++--
>   3 files changed, 119 insertions(+), 6 deletions(-)
>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
>   create mode 100644 meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
>   rename meta-oe/recipes-extended/efivar/{efivar_git.bb => efivar_0.21.bb} (27%)
>
> diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
> new file mode 100644
> index 0000000..4bd7d95
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
> @@ -0,0 +1,31 @@
> +From 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 2001
> +From: Kai Kang <kai.kang@windriver.com>
> +Date: Fri, 25 Sep 2015 18:14:31 +0800
> +Subject: [PATCH] efivar: fix for cross compile
> +
> +It builds and calls elf file makeguids to generate a header file which
> +doesn't work for cross compile. Fix it.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + src/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 6eac858..ef4eb1d 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
> + makeguids : makeguids.o fakeguid.o
> + 	$(CC) $(cflags) -o $@ $^ -ldl
> +
> +-include/efivar/efivar-guids.h : makeguids guids.txt
> +-	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> ++include/efivar/efivar-guids.h : guids.txt
> ++	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
> +
> + guidlist.o : guids.S include/efivar/efivar-guids.h
> + 	$(CC) $(cflags) -c -o guidlist.o guids.S
> +--
> +2.6.0.rc2.10.gf4d9753
> +
> diff --git a/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch b/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
> new file mode 100644
> index 0000000..7f04b19
> --- /dev/null
> +++ b/meta-oe/recipes-extended/efivar/efivar/efivar-drop-options-not-supported-by-lower-version-gcc.patch
> @@ -0,0 +1,71 @@
> +gcc options '-Wmaybe-uninitialized' and '-std=gnu11' are not recognized by gcc
> +whose version is lower than 4.6, such as on Ubuntu 12.04. Drop them for backward
> +compatible.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +diff --git a/Make.defaults b/Make.defaults
> +index cc2baa9..118ae56 100644
> +--- a/Make.defaults
> ++++ b/Make.defaults
> +@@ -10,10 +10,9 @@ CFLAGS	?= -O2 -g
> +
> + ARCH = $(shell uname -m)
> + clang_cflags =
> +-gcc_cflags = -Wmaybe-uninitialized
> + cflags	:= $(CFLAGS) \
> + 	-Werror -Wall -Wsign-compare -Wstrict-aliasing \
> +-	-std=gnu11 -fshort-wchar -fPIC \
> ++	-fshort-wchar -fPIC \
> + 	-fvisibility=hidden \
> + 	-D_GNU_SOURCE -I${TOPDIR}/src/include/efivar/ \
> + 	$(if $(filter $(CC),clang),$(clang_cflags),) \
> +diff --git a/src/guid.h b/src/guid.h
> +index 9542ee1..0817991 100644
> +--- a/src/guid.h
> ++++ b/src/guid.h
> +@@ -31,7 +31,8 @@ static inline int
> + real_isspace(char c)
> + {
> + 	char spaces[] = " \f\n\r\t\v";
> +-	for (int i = 0; spaces[i] != '\0'; i++)
> ++	int i;
> ++	for (i = 0; spaces[i] != '\0'; i++)
> + 		if (c == spaces[i])
> + 			return 1;
> + 	return 0;
> +@@ -59,7 +60,8 @@ check_sanity(const char *text, size_t len)
> + static inline int
> + check_segment_sanity(const char *text, size_t len)
> + {
> +-	for(unsigned int i = 0; i < len; i++) {
> ++	unsigned int i;
> ++	for(i = 0; i < len; i++) {
> + 		if (text[i] >= '0' && text[i] <= '9')
> + 			continue;
> + 		/* "| 0x20" is tolower() without having to worry about
> +diff --git a/src/makeguids.c b/src/makeguids.c
> +index e9acf15..7e16cb2 100644
> +--- a/src/makeguids.c
> ++++ b/src/makeguids.c
> +@@ -150,7 +150,8 @@ main(int argc, char *argv[])
> +
> + 	fprintf(header, "#ifndef EFIVAR_GUIDS_H\n#define EFIVAR_GUIDS_H 1\n\n");
> +
> +-	for (unsigned int i = 0; i < line-1; i++) {
> ++	unsigned int i, j;
> ++	for (i = 0; i < line-1; i++) {
> + 		if (!strcmp(outbuf[i].symbol, "efi_guid_zero"))
> + 			fprintf(symout, "\t.globl %s\n"
> + 					"\t.data\n"
> +@@ -176,7 +177,7 @@ main(int argc, char *argv[])
> + 			fprintf(symout, "efi_guid_empty:\n");
> +
> + 		uint8_t *guid_data = (uint8_t *) &outbuf[i].guid;
> +-		for (unsigned int j = 0; j < sizeof (efi_guid_t); j++)
> ++		for (j = 0; j < sizeof (efi_guid_t); j++)
> + 			fprintf(symout,"\t.byte 0x%02x\n", guid_data[j]);
> +
> + 		fprintf(symout, "%s_end:\n", outbuf[i].symbol);
> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> similarity index 27%
> rename from meta-oe/recipes-extended/efivar/efivar_git.bb
> rename to meta-oe/recipes-extended/efivar/efivar_0.21.bb
> index 18446a0..c1b649f 100644
> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> @@ -1,18 +1,29 @@
>   SUMMARY = "Tools to manipulate UEFI variables"
>   DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
> -HOMEPAGE = "https://github.com/vathpela/efivar"
> +HOMEPAGE = "https://github.com/rhinstaller/efivar"
>   
>   LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
>   
> -DEPENDS = "popt"
> +DEPENDS_class-target = "popt efivar-native"
>   
> -SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
> -PV = "0.7+git${SRCPV}"
> -SRC_URI = "git://github.com/vathpela/efivar.git"
> +SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> +SRC_URI = "git://github.com/rhinstaller/efivar.git"
> +SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch"
> +SRC_URI_append_class-native = " file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
>   
>   S = "${WORKDIR}/git"
>   
>   do_install() {
>       oe_runmake install DESTDIR=${D}
>   }
> +
> +do_compile_class-native() {
> +    oe_runmake -C src makeguids
> +}
> +
> +do_install_class-native() {
> +    install -D ${B}/src/makeguids ${D}${bindir}/makeguids

I am suggested to add option '-m xxx' here. So please ignore this thread 
and I'll fix it and send a new version.


--Kai

> +}
> +
> +BBCLASSEXTEND = "native"


-- 
Regards,
Neil | Kai Kang



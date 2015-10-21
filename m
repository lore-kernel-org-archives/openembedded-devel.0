Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2C615758DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 15:39:51 +0000 (UTC)
Received: by igdg1 with SMTP id g1so89198736igd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 08:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EOMdHJnghjpr51mvrIkwZ1zW4Yz5lzTyRAn+xF9Dq3Q=;
	b=KR1pyD4MpyJwcX8vKTbbPQEfMdv3a7F3sGyxnFRNWHstbx2yvEwt9ZfqEYk+w+ZDwm
	8lAW11HIgq14IWaRIsBicaqsD7p2xvHcVl45uRQM+YxevxrRck+0j5Blfk9qwyT3lfo/
	piJncuWGesGn50yEUY4q66iqsKLSkfOqozys5Koo88HxIFZQszYwKgW6+s6WD9DJOMXc
	cpRglX73LzaUzY3Vu/Lw8GQW+Yy9wYWL6X4iaa32yByvhFNPNVZYyf5ufyHGt6ORg1kq
	9gjfw0ImqG5VHc0+da757s7CNJDEV+b15RlqqmXEvZRkO5+sFve0iZsAAgk3XwD/4pwI
	XwYQ==
X-Received: by 10.50.55.42 with SMTP id o10mr16754585igp.11.1445441992006;
	Wed, 21 Oct 2015 08:39:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Wed, 21 Oct 2015 08:39:22 -0700 (PDT)
In-Reply-To: <1445426326-25819-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1445426326-25819-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Oct 2015 08:39:22 -0700
Message-ID: <CAMKF1spnorJStzBcAUyZDAqDLiN-80qfUeum+_P=Nv+4nQjMiw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libuio: fix build issue with gcc-5
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
X-List-Received-Date: Wed, 21 Oct 2015 15:39:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 21, 2015 at 4:18 AM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> 1. Remove  PNBLACKLIST[libuio] line, since libuio compiles fine with gcc-5
>    with this patch.
>
> 2. By default, gcc-5 uses C99 inline semantics, this semantics doesn't
> generate externally visible function for inline functions. This results in
> below error, when an another translation unit (TU) tries to link with the
> inline function,
>
> -- snip --
> | lsuio.o: In function `main':
> | <...>/libuio/0.2.1-r0/git/tools/lsuio.c:85: undefined reference to `uio_mmap'
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [lsuio] Error 1
> -- CUT --
>
> To solve this error and make libuio to compile with both 4.x and 5.x,
>
> 1. We can remove 'uio_mmap' inline function definition in uio_mmap.c, and move
>    that definition into uio_helper.h file (which is included by lsuio.c) and
>    replace inline with "static inline". Similarly it can be done to
>    uio_single_munmap and uio_munmap inline functions
>
> 2. Add 'extern' keyword in front of uio_mmap inline function declaration , to
>    make uio_mmap as a externally visible function, and so that it can be
>    linked with other TUs.
>
> Going with option 1.

you need to see the impact on code size increase with option 1. Its
good in general otherwise
option 2 would do just what was already happening

>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  .../libuio/replace_inline_with_static-inline.patch | 121 +++++++++++++++++++++
>  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb    |   6 +-
>  2 files changed, 123 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
>
> diff --git a/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch b/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> new file mode 100644
> index 0000000..fd314bf
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> @@ -0,0 +1,121 @@
> +By default, gcc-5 uses C99 inline semantics, this semantics doesn't
> +generate externally visible function for inline functions. This results in
> +below error, when an another translation unit (TU) tries to link with the
> +inline function,
> +
> +-- snip --
> +| lsuio.o: In function `main':
> +| <...>/libuio/0.2.1-r0/git/tools/lsuio.c:85: undefined reference to `uio_mmap'
> +| collect2: error: ld returned 1 exit status
> +| make[2]: *** [lsuio] Error 1
> +-- CUT --
> +
> +To solve this error and make libuio to compile with both 4.x and 5.x,
> +
> +1. We can remove 'uio_mmap' inline function definition in uio_mmap.c, and move
> +   that definition into uio_helper.h file (which is included by lsuio.c) and
> +   replace inline with "static inline". Similarly it can be done to other
> +   uio_single_munmap and uio_munmap inline functions
> +
> +2. Add 'extern' keyword in front of inline functions declaration, to make
> +   inlined function as externally visible function, and to link with other TUs.
> +
> +Going with option 1.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> +
> +--- git_org/src/uio_helper.h   2015-10-20 02:37:04.183075855 -0400
> ++++ git/src/uio_helper.h       2015-10-20 03:34:24.659970136 -0400
> +@@ -61,11 +61,11 @@ struct uio_info_t {
> +
> + /* function prototypes */
> +
> +-inline char* uio_lib_name(void);
> +-inline char* uio_lib_version(void);
> +-inline int uio_lib_ifcurrent(void);
> +-inline int uio_lib_ifrevision(void);
> +-inline int uio_lib_ifage(void);
> ++static inline char* uio_lib_name(void);
> ++static inline char* uio_lib_version(void);
> ++static inline int uio_lib_ifcurrent(void);
> ++static inline int uio_lib_ifrevision(void);
> ++static inline int uio_lib_ifage(void);
> +
> + int uio_get_mem_size(struct uio_info_t* info, int map_num);
> + int uio_get_mem_addr(struct uio_info_t* info, int map_num);
> +@@ -76,10 +76,30 @@ int uio_get_all_info(struct uio_info_t*
> + int uio_get_device_attributes(struct uio_info_t* info);
> +
> + void* uio_single_mmap(struct uio_info_t* info, int map_num, int fd);
> +-inline void uio_mmap(struct uio_info_t* info, int fd);
> +
> +-inline void uio_single_munmap(struct uio_info_t* info, int map_num);
> +-inline void uio_munmap(struct uio_info_t* info);
> ++static inline void uio_mmap(struct uio_info_t* info, int fd);
> ++static inline void uio_mmap(struct uio_info_t* info, int fd)
> ++{
> ++        int map_num;
> ++        if (!fd) return;
> ++        for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
> ++                uio_single_mmap(info, map_num, fd);
> ++}
> ++
> ++static inline void uio_single_munmap(struct uio_info_t* info, int map_num);
> ++static inline void uio_single_munmap(struct uio_info_t* info, int map_num)
> ++{
> ++        munmap(info->maps[map_num].internal_addr, info->maps[map_num].size);
> ++        info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
> ++}
> ++
> ++static inline void uio_munmap(struct uio_info_t* info);
> ++static inline void uio_munmap(struct uio_info_t* info)
> ++{
> ++        int i;
> ++        for (i = 0; i < MAX_UIO_MAPS; i++)
> ++                uio_single_munmap(info, i);
> ++}
> +
> + void uio_free_dev_attrs(struct uio_info_t* info);
> + void uio_free_info(struct uio_info_t* info);
> +--- git_org/src/uio_mmap.c     2015-10-20 02:37:04.183075855 -0400
> ++++ git/src/uio_mmap.c 2015-10-20 03:34:45.060003208 -0400
> +@@ -22,11 +22,3 @@
> + #include <stdlib.h>
> +
> + #include "uio_helper.h"
> +-
> +-inline void uio_mmap(struct uio_info_t* info, int fd)
> +-{
> +-      int map_num;
> +-      if (!fd) return;
> +-      for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
> +-              uio_single_mmap(info, map_num, fd);
> +-}
> +--- git_org/src/uio_munmap.c   2015-10-20 02:37:04.183075855 -0400
> ++++ git/src/uio_munmap.c       2015-10-20 03:34:59.636026835 -0400
> +@@ -22,10 +22,3 @@
> + #include <stdlib.h>
> +
> + #include "uio_helper.h"
> +-
> +-inline void uio_munmap(struct uio_info_t* info)
> +-{
> +-      int i;
> +-      for (i = 0; i < MAX_UIO_MAPS; i++)
> +-              uio_single_munmap(info, i);
> +-}
> +\ No newline at end of file
> +--- git_org/src/uio_single_munmap.c    2015-10-20 02:37:04.183075855 -0400
> ++++ git/src/uio_single_munmap.c        2015-10-20 03:52:55.005763023 -0400
> +@@ -24,9 +24,3 @@
> + #include <sys/mman.h>
> +
> + #include "uio_helper.h"
> +-
> +-inline void uio_single_munmap(struct uio_info_t* info, int map_num)
> +-{
> +-      munmap(info->maps[map_num].internal_addr, info->maps[map_num].size);
> +-      info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
> +-}
> diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> index 0f63e60..f405197 100644
> --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> @@ -3,7 +3,8 @@ SECTION = "base"
>  LICENSE = "GPL-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>
> -SRC_URI = "git://git.code.sf.net/p/libuio/code"
> +SRC_URI = "git://git.code.sf.net/p/libuio/code \
> +           file://replace_inline_with_static-inline.patch"
>
>  inherit autotools
>
> @@ -15,6 +16,3 @@ PACKAGES += "${PN}-tools"
>
>  FILES_${PN} = "${libdir}"
>  FILES_${PN}-tools = "${bindir}"
> -
> -# 0.2.1-r0/git/tools/lsuio.c:85: error: undefined reference to 'uio_mmap'
> -PNBLACKLIST[libuio] ?= "BROKEN, fails to build with gcc-5"
> --
> 1.8.2.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


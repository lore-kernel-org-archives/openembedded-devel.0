Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C294375D4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 17:56:57 +0000 (UTC)
Received: by lffy185 with SMTP id y185so24907374lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 10:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=lZWofEH26LndybBWADJZVV0T/uILWQIlyPDkyvq4IW8=;
	b=ECMlOiVL+9mp66NyQFyDKD34Tx7JLLhfMEY7zDyfqQKCQRAwRRprXw4kfn2JqFLlz3
	m71rlPpN/JElkzf6XfCoIUCL/DwRZXYDy1m5FKKH0MCUWLElGXRblX+8lhwh1oVmvzY5
	tkaz+/Vx7YjB++fFMDEOYseRNv1KMo2OH09M6KZ9A8bgdFMWGDv4lFes4tuhFgFt58YJ
	rinLztxXOy9YJwuo8WcZj0F2GRd6KsdLCPWlagmrZyopeO0hs0WJ7V6p2Si05IHqnAh3
	nvsR7jNCUCCSu/E7VdHyLueVV5GdztYhg4+P1FXbXe0vFydB/6Vm0m89Mg4OKZFKnDvn
	b5Lw==
X-Gm-Message-State: ALoCoQkyUgVBtab9sQU2KjqhuzvMzVFrcEi8fyQPHiE+s5pA5DT+/EhT+jtJkHvWvZVe5duQ7skn
MIME-Version: 1.0
X-Received: by 10.25.15.42 with SMTP id e42mr4028910lfi.49.1445450216693; Wed,
	21 Oct 2015 10:56:56 -0700 (PDT)
Received: by 10.114.184.199 with HTTP; Wed, 21 Oct 2015 10:56:56 -0700 (PDT)
In-Reply-To: <CAMKF1spnorJStzBcAUyZDAqDLiN-80qfUeum+_P=Nv+4nQjMiw@mail.gmail.com>
References: <1445426326-25819-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAMKF1spnorJStzBcAUyZDAqDLiN-80qfUeum+_P=Nv+4nQjMiw@mail.gmail.com>
Date: Wed, 21 Oct 2015 23:26:56 +0530
Message-ID: <CAD3vsf6YmPqEHxUgMCYMHvVGd0FiCDUaNfeMHP+nYgCnp+NhEQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 21 Oct 2015 17:57:06 -0000
Content-Type: text/plain; charset=UTF-8

>
>
> you need to see the impact on code size increase with option 1. Its
> good in general otherwise
> option 2 would do just what was already happening
>
> There is a slight increase in the code size of lsuio,
lsuio.o with option 1, but there is also decrease in
the code size of uio_mmap.o, libuio.so.0.1.0
binary with option 1, as inline function has been migrated to uio_helper.h.
The decrease sizes are more compared to increase sizes, as indicated below;
so option 1 seems to be preferred choice,


------------------------------------------------------------------
Binary code                          |   (size in bytes)       |
                                             |   option 1 |  option 2|
--------------------------------------|--------------|------------|
uio_find_devices_byname.o |   11368    |   11368  |
uio_find_devices.o                |   10640    |   10640  |
uio_free.o                              |     8888    |    8888   |
uio_get_all_info.o                  |     8480    |    8480   |
uio_get_device_attributes.o  |   13152    |   13152  |
uio_get_event_count.o          |    8768     |    8768   |
uio_get_mem_addr.o            |     9288     |    9288  |
uio_get_mem_size.o             |    9288      |    9288  |
uio_get_name.o                    |    7912      |    7912  |
uio_get_version.o                 |    7936      |    7936  |
uio_line_from_file.o              |    7720      |    7720  |
*uio_mmap.o                         |    5120     |    7680  |*
uio_munmap.o                      |    5120     |    5120  |
uio_num_from_filename.o    |    7280     |    7280  |
uio_single_mmap.o              |    8312     |    8312   |
uio_single_munmap.o          |    5136     |    5136   |
*lsuio.o                                  |   27800    |    27128 |*
rwuio.o                                  |   32672    |    32672 |
*libuio.so.0.1.0                      |   58480    |    60304 |*
*lsuio                                     |   24192   |    23896|*
rwuio                                     |   26416    |    26416 |
--------------------------------------|--------------|-------------|

Regards,
Jagadeesh


> >
> > Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > ---
> >  .../libuio/replace_inline_with_static-inline.patch | 121
> +++++++++++++++++++++
> >  meta-oe/recipes-extended/libuio/libuio_0.2.1.bb    |   6 +-
> >  2 files changed, 123 insertions(+), 4 deletions(-)
> >  create mode 100644
> meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> >
> > diff --git
> a/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> b/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> > new file mode 100644
> > index 0000000..fd314bf
> > --- /dev/null
> > +++
> b/meta-oe/recipes-extended/libuio/libuio/replace_inline_with_static-inline.patch
> > @@ -0,0 +1,121 @@
> > +By default, gcc-5 uses C99 inline semantics, this semantics doesn't
> > +generate externally visible function for inline functions. This results
> in
> > +below error, when an another translation unit (TU) tries to link with
> the
> > +inline function,
> > +
> > +-- snip --
> > +| lsuio.o: In function `main':
> > +| <...>/libuio/0.2.1-r0/git/tools/lsuio.c:85: undefined reference to
> `uio_mmap'
> > +| collect2: error: ld returned 1 exit status
> > +| make[2]: *** [lsuio] Error 1
> > +-- CUT --
> > +
> > +To solve this error and make libuio to compile with both 4.x and 5.x,
> > +
> > +1. We can remove 'uio_mmap' inline function definition in uio_mmap.c,
> and move
> > +   that definition into uio_helper.h file (which is included by
> lsuio.c) and
> > +   replace inline with "static inline". Similarly it can be done to
> other
> > +   uio_single_munmap and uio_munmap inline functions
> > +
> > +2. Add 'extern' keyword in front of inline functions declaration, to
> make
> > +   inlined function as externally visible function, and to link with
> other TUs.
> > +
> > +Going with option 1.
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> > +
> > +--- git_org/src/uio_helper.h   2015-10-20 02:37:04.183075855 -0400
> > ++++ git/src/uio_helper.h       2015-10-20 03:34:24.659970136 -0400
> > +@@ -61,11 +61,11 @@ struct uio_info_t {
> > +
> > + /* function prototypes */
> > +
> > +-inline char* uio_lib_name(void);
> > +-inline char* uio_lib_version(void);
> > +-inline int uio_lib_ifcurrent(void);
> > +-inline int uio_lib_ifrevision(void);
> > +-inline int uio_lib_ifage(void);
> > ++static inline char* uio_lib_name(void);
> > ++static inline char* uio_lib_version(void);
> > ++static inline int uio_lib_ifcurrent(void);
> > ++static inline int uio_lib_ifrevision(void);
> > ++static inline int uio_lib_ifage(void);
> > +
> > + int uio_get_mem_size(struct uio_info_t* info, int map_num);
> > + int uio_get_mem_addr(struct uio_info_t* info, int map_num);
> > +@@ -76,10 +76,30 @@ int uio_get_all_info(struct uio_info_t*
> > + int uio_get_device_attributes(struct uio_info_t* info);
> > +
> > + void* uio_single_mmap(struct uio_info_t* info, int map_num, int fd);
> > +-inline void uio_mmap(struct uio_info_t* info, int fd);
> > +
> > +-inline void uio_single_munmap(struct uio_info_t* info, int map_num);
> > +-inline void uio_munmap(struct uio_info_t* info);
> > ++static inline void uio_mmap(struct uio_info_t* info, int fd);
> > ++static inline void uio_mmap(struct uio_info_t* info, int fd)
> > ++{
> > ++        int map_num;
> > ++        if (!fd) return;
> > ++        for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
> > ++                uio_single_mmap(info, map_num, fd);
> > ++}
> > ++
> > ++static inline void uio_single_munmap(struct uio_info_t* info, int
> map_num);
> > ++static inline void uio_single_munmap(struct uio_info_t* info, int
> map_num)
> > ++{
> > ++        munmap(info->maps[map_num].internal_addr,
> info->maps[map_num].size);
> > ++        info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
> > ++}
> > ++
> > ++static inline void uio_munmap(struct uio_info_t* info);
> > ++static inline void uio_munmap(struct uio_info_t* info)
> > ++{
> > ++        int i;
> > ++        for (i = 0; i < MAX_UIO_MAPS; i++)
> > ++                uio_single_munmap(info, i);
> > ++}
> > +
> > + void uio_free_dev_attrs(struct uio_info_t* info);
> > + void uio_free_info(struct uio_info_t* info);
> > +--- git_org/src/uio_mmap.c     2015-10-20 02:37:04.183075855 -0400
> > ++++ git/src/uio_mmap.c 2015-10-20 03:34:45.060003208 -0400
> > +@@ -22,11 +22,3 @@
> > + #include <stdlib.h>
> > +
> > + #include "uio_helper.h"
> > +-
> > +-inline void uio_mmap(struct uio_info_t* info, int fd)
> > +-{
> > +-      int map_num;
> > +-      if (!fd) return;
> > +-      for (map_num= 0; map_num < MAX_UIO_MAPS; map_num++)
> > +-              uio_single_mmap(info, map_num, fd);
> > +-}
> > +--- git_org/src/uio_munmap.c   2015-10-20 02:37:04.183075855 -0400
> > ++++ git/src/uio_munmap.c       2015-10-20 03:34:59.636026835 -0400
> > +@@ -22,10 +22,3 @@
> > + #include <stdlib.h>
> > +
> > + #include "uio_helper.h"
> > +-
> > +-inline void uio_munmap(struct uio_info_t* info)
> > +-{
> > +-      int i;
> > +-      for (i = 0; i < MAX_UIO_MAPS; i++)
> > +-              uio_single_munmap(info, i);
> > +-}
> > +\ No newline at end of file
> > +--- git_org/src/uio_single_munmap.c    2015-10-20 02:37:04.183075855
> -0400
> > ++++ git/src/uio_single_munmap.c        2015-10-20 03:52:55.005763023
> -0400
> > +@@ -24,9 +24,3 @@
> > + #include <sys/mman.h>
> > +
> > + #include "uio_helper.h"
> > +-
> > +-inline void uio_single_munmap(struct uio_info_t* info, int map_num)
> > +-{
> > +-      munmap(info->maps[map_num].internal_addr,
> info->maps[map_num].size);
> > +-      info->maps[map_num].mmap_result = UIO_MMAP_NOT_DONE;
> > +-}
> > diff --git a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > index 0f63e60..f405197 100644
> > --- a/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > +++ b/meta-oe/recipes-extended/libuio/libuio_0.2.1.bb
> > @@ -3,7 +3,8 @@ SECTION = "base"
> >  LICENSE = "GPL-2.0"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
> >
> > -SRC_URI = "git://git.code.sf.net/p/libuio/code"
> > +SRC_URI = "git://git.code.sf.net/p/libuio/code \
> > +           file://replace_inline_with_static-inline.patch"
> >
> >  inherit autotools
> >
> > @@ -15,6 +16,3 @@ PACKAGES += "${PN}-tools"
> >
> >  FILES_${PN} = "${libdir}"
> >  FILES_${PN}-tools = "${bindir}"
> > -
> > -# 0.2.1-r0/git/tools/lsuio.c:85: error: undefined reference to
> 'uio_mmap'
> > -PNBLACKLIST[libuio] ?= "BROKEN, fails to build with gcc-5"
> > --
> > 1.8.2.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


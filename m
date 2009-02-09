Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LWYxk-0003x1-87
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Feb 2009 17:26:25 +0100
Received: by rv-out-0708.google.com with SMTP id f25so2264791rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Feb 2009 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4xP7kbLbksvyUe1rGzjqFV6lBKIHy9wcEGKh7CIuZDY=;
	b=khAgJ5bfwbu9+Z1+PAb7c9J2tslzMnHAal4IYl7R2RfI4U4fP85VRfejl0LaJ0znSn
	A4bk34vyk4TeJzZjE4czKE2XphGqkVHUTC4tok2jguIjtvvghhBwfjW6Larlpmd33Lwr
	+GB13w2YMyouM7J6IcgRZNZkHktOkVkfRLR/I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AcA3aF5qTifUPIgD7lIWJVQUjIQP0sfSaunGixiAWBk5tvbUlcnYndjMdQId2HU0jc
	P/E548CIOLSsf1sS2CeFWTSy4N5F9VnmA4Cz8Tw6JyjkLsy7LHac4zZCezYarvcDEi/E
	Be+fVzocj4llfL+hUwsjLom9ju+PCbki6xjpU=
MIME-Version: 1.0
Received: by 10.140.166.16 with SMTP id o16mr3932282rve.25.1234196732096; Mon, 
	09 Feb 2009 08:25:32 -0800 (PST)
In-Reply-To: <a7f8874a0902042227w54cf3700p75006bd994f3ade7@mail.gmail.com>
References: <a7f8874a0902042227w54cf3700p75006bd994f3ade7@mail.gmail.com>
Date: Mon, 9 Feb 2009 08:25:32 -0800
Message-ID: <a7f8874a0902090825p736d23bep91fcdc72afbe7c99@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: oe-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] sg3-utils: Updated Makefile patch to deal with cross-compiling
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
X-List-Received-Date: Mon, 09 Feb 2009 16:26:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

---Bump---

On Wed, Feb 4, 2009 at 10:27 PM, Hans Henry von Tresckow
<hvontres@gmail.com> wrote:
> Please review and if ok, push
>
>
> From a9216efa1e2f56a53d6e5c210655c0c4a7256169 Mon Sep 17 00:00:00 2001
> From: Henry von Tresckow <hvontres@gmail.com>
> Date: Wed, 4 Feb 2009 16:50:15 -0800
> Subject: [PATCH] sg3-utils: Updated Makefile patch to deal with cross-compiling
>
> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> ---
>  packages/sg3-utils/files/Makefile-r1.patch |  263 ++++++++++++++++++++++++++++
>  packages/sg3-utils/files/Makefile.patch    |  246 --------------------------
>  packages/sg3-utils/sg3-utils_1.24.bb       |    7 +-
>  3 files changed, 268 insertions(+), 248 deletions(-)
>  create mode 100644 packages/sg3-utils/files/Makefile-r1.patch
>  delete mode 100644 packages/sg3-utils/files/Makefile.patch
>
> diff --git a/packages/sg3-utils/files/Makefile-r1.patch
> b/packages/sg3-utils/files/Makefile-r1.patch
> new file mode 100644
> index 0000000..d43b51d
> --- /dev/null
> +++ b/packages/sg3-utils/files/Makefile-r1.patch
> @@ -0,0 +1,263 @@
> +Index: sg3-utils-1.24/Makefile
> +===================================================================
> +--- sg3-utils-1.24.orig/Makefile       2007-05-07 11:59:19.000000000 -0700
> ++++ sg3-utils-1.24/Makefile    2009-02-02 16:37:35.000000000 -0800
> +@@ -1,13 +1,15 @@
> + SHELL = /bin/sh
> +
> +-PREFIX=/usr/local
> ++PREFIX=/usr
> + LIBDIR=$(DESTDIR)/$(PREFIX)/lib
> + INSTDIR=$(DESTDIR)/$(PREFIX)/bin
> + MANDIR=$(DESTDIR)/$(PREFIX)/share/man
> + INCLUDEDIR=$(DESTDIR)/$(PREFIX)/include
> +
> +-CC = gcc
> +-LD = gcc
> ++CC ?= gcc
> ++LD = ${CC}
> ++LIBTOOL ?= libtool
> ++LT_EXTRA = --tag=CC
> +
> + EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
> +       sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
> +@@ -37,12 +39,12 @@
> + S_CFLAGS = $(OS_FLAGS) $(LARGE_FILE_FLAGS)
> +
> + # CFLAGS = -O2 -Wall -W
> +-CFLAGS = -g -O2 -Wall -W
> ++CFLAGS ?= -g -O2 -Wall -W
> + # CFLAGS = -g -O2 -Wall -W -pedantic -std=c99
> +
> + CFLAGS_PTHREADS = -D_REENTRANT
> +
> +-LDFLAGS =
> ++LDFLAGS ?=
> + # LDFLAGS = -v -lm
> +
> + LIB_VINFO = 1:0:0
> +@@ -64,164 +66,164 @@
> +       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
> +
> + sg_lib.lo: sg_lib.o
> +-      libtool --mode=compile $(CC) -c sg_lib.c
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
> +
> + sg_cmds_basic.lo: sg_cmds_basic.o
> +-      libtool --mode=compile $(CC) -c sg_cmds_basic.c
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
> +
> + sg_cmds_extra.lo: sg_cmds_extra.o
> +-      libtool --mode=compile $(CC) -c sg_cmds_extra.c
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
> +
> + sg_pt_linux.lo: sg_pt_linux.o
> +-      libtool --mode=compile $(CC) -c sg_pt_linux.c
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
> +
> + libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo sg_pt_linux.lo
> +-      libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la sg_lib.lo
> sg_cmds_basic.lo \
> +       sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
> +       -version-info $(LIB_VINFO)
> +
> + # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
> +-#     libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
> ++#     $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
> sg_lib.lo sg_cmds_basic.lo \
> + #     sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
> +
> + sg_inq: sg_inq.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sginfo: sginfo.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_start: sg_start.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_readcap: sg_readcap.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sgp_dd.o: sgp_dd.c
> +       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
> +       -c -o sgp_dd.o $<
> +
> + sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
> +
> + sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_map: sg_map.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_turs: sg_turs.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_read: sg_read.o sg_io_linux.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_reset: sg_reset.o
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_modes: sg_modes.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_logs: sg_logs.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_senddiag: sg_senddiag.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_opcodes: sg_opcodes.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_persist: sg_persist.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_write_long: sg_write_long.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_read_long: sg_read_long.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_requests: sg_requests.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_ses: sg_ses.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_verify: sg_verify.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_emc_trespass: sg_emc_trespass.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_luns: sg_luns.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_sync: sg_sync.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_prevent: sg_prevent.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_get_config: sg_get_config.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_wr_mode: sg_wr_mode.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_rtpg: sg_rtpg.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_reassign: sg_reassign.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_format: sg_format.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_rmsn: sg_rmsn.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_ident: sg_ident.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_map26: sg_map26.o
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_rdac: sg_rdac.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_sat_identify: sg_sat_identify.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_read_buffer: sg_read_buffer.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_write_buffer: sg_write_buffer.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> + sg_raw: sg_raw.o libsgutils.la
> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> +
> +
> + install: $(EXECS)
> +       install -d $(INSTDIR)
> +       install -d $(LIBDIR)
> +-      libtool --mode=install install -c libsgutils.la $(LIBDIR)/libsgutils.la
> +-      libtool --finish $(LIBDIR)
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
> $(LIBDIR)/libsgutils.la
> ++      $(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
> +       for name in $^; \
> +-       do libtool --mode=install install -m 755 \
> ++       do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
> +               $$name $(INSTDIR); \
> +       done
> +       install -d $(MANDIR)/$(MAN_PREF)
> +@@ -235,7 +237,7 @@
> +       done
> +
> + uninstall:
> +-      libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
> ++      $(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
> +       dists="$(EXECS)"; \
> +       for name in $$dists; do \
> +        rm -f $(INSTDIR)/$$name; \
> diff --git a/packages/sg3-utils/files/Makefile.patch
> b/packages/sg3-utils/files/Makefile.patch
> deleted file mode 100644
> index cc5babf..0000000
> --- a/packages/sg3-utils/files/Makefile.patch
> +++ /dev/null
> @@ -1,246 +0,0 @@
> -Index: sg3-utils-1.24/Makefile
> -===================================================================
> ---- sg3-utils-1.24.orig/Makefile       2009-01-27 16:29:26.000000000 -0800
> -+++ sg3-utils-1.24/Makefile    2009-01-27 22:31:04.000000000 -0800
> -@@ -1,6 +1,6 @@
> - SHELL = /bin/sh
> -
> --PREFIX=/usr/local
> -+PREFIX=/usr
> - LIBDIR=$(DESTDIR)/$(PREFIX)/lib
> - INSTDIR=$(DESTDIR)/$(PREFIX)/bin
> - MANDIR=$(DESTDIR)/$(PREFIX)/share/man
> -@@ -8,6 +8,8 @@
> -
> - CC = gcc
> - LD = gcc
> -+LIBTOOL = libtool
> -+LT_EXTRA = --tag=CC
> -
> - EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
> -       sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
> -@@ -64,164 +66,164 @@
> -       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
> -
> - sg_lib.lo: sg_lib.o
> --      libtool --mode=compile $(CC) -c sg_lib.c
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
> -
> - sg_cmds_basic.lo: sg_cmds_basic.o
> --      libtool --mode=compile $(CC) -c sg_cmds_basic.c
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
> -
> - sg_cmds_extra.lo: sg_cmds_extra.o
> --      libtool --mode=compile $(CC) -c sg_cmds_extra.c
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
> -
> - sg_pt_linux.lo: sg_pt_linux.o
> --      libtool --mode=compile $(CC) -c sg_pt_linux.c
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
> -
> - libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo sg_pt_linux.lo
> --      libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la sg_lib.lo
> sg_cmds_basic.lo \
> -       sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
> -       -version-info $(LIB_VINFO)
> -
> - # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
> --#     libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo sg_cmds_basic.lo \
> -+#     $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
> sg_lib.lo sg_cmds_basic.lo \
> - #     sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
> -
> - sg_inq: sg_inq.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sginfo: sginfo.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_start: sg_start.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_readcap: sg_readcap.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sgp_dd.o: sgp_dd.c
> -       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
> -       -c -o sgp_dd.o $<
> -
> - sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
> -
> - sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_map: sg_map.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_turs: sg_turs.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_read: sg_read.o sg_io_linux.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_reset: sg_reset.o
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_modes: sg_modes.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_logs: sg_logs.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_senddiag: sg_senddiag.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_opcodes: sg_opcodes.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_persist: sg_persist.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_write_long: sg_write_long.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_read_long: sg_read_long.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_requests: sg_requests.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_ses: sg_ses.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_verify: sg_verify.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_emc_trespass: sg_emc_trespass.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_luns: sg_luns.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_sync: sg_sync.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_prevent: sg_prevent.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_get_config: sg_get_config.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_wr_mode: sg_wr_mode.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_rtpg: sg_rtpg.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_reassign: sg_reassign.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_format: sg_format.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_rmsn: sg_rmsn.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_ident: sg_ident.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_map26: sg_map26.o
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_rdac: sg_rdac.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_sat_identify: sg_sat_identify.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_read_buffer: sg_read_buffer.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_write_buffer: sg_write_buffer.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> - sg_raw: sg_raw.o libsgutils.la
> --      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
> -
> -
> - install: $(EXECS)
> -       install -d $(INSTDIR)
> -       install -d $(LIBDIR)
> --      libtool --mode=install install -c libsgutils.la $(LIBDIR)/libsgutils.la
> --      libtool --finish $(LIBDIR)
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
> $(LIBDIR)/libsgutils.la
> -+      $(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
> -       for name in $^; \
> --       do libtool --mode=install install -m 755 \
> -+       do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
> -               $$name $(INSTDIR); \
> -       done
> -       install -d $(MANDIR)/$(MAN_PREF)
> -@@ -235,7 +237,7 @@
> -       done
> -
> - uninstall:
> --      libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
> -+      $(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
> -       dists="$(EXECS)"; \
> -       for name in $$dists; do \
> -        rm -f $(INSTDIR)/$$name; \
> diff --git a/packages/sg3-utils/sg3-utils_1.24.bb
> b/packages/sg3-utils/sg3-utils_1.24.bb
> index 135ba0f..4a2c378 100644
> --- a/packages/sg3-utils/sg3-utils_1.24.bb
> +++ b/packages/sg3-utils/sg3-utils_1.24.bb
> @@ -3,11 +3,14 @@ AUTHOR = "Eric Schwartz (Skif) <emschwar@debian.org>"
>  HOMEPAGE = "http://packages.qa.debian.org/s/sg3-utils.html"
>  SECTION = "console/admin"
>  LICENSE = "GPLv2"
> -PR = "r0"
> +AUTHOR = "Eric Schwartz (Skif) <emschwar@debian.org>"
> +PR = "r1"
>
>  SRC_URI = "${DEBIAN_MIRROR}/main/s/sg3-utils/sg3-utils_${PV}.orig.tar.gz \
> -           file://Makefile.patch;patch=1"
> +       file://Makefile-r1.patch;patch=1"
>
>  S = "${WORKDIR}/sg3-utils-${PV}"
>
>  inherit autotools
> +
> +EXTRA_OEMAKE='"LIBTOOL=${STAGING_BINDIR_NATIVE}/${HOST_SYS}-libtool"'
> --
> 1.5.4.3
>
>
>
> --
> Henry von Tresckow (hvontres)
> Lucille Ball  - "The secret of staying young is to live honestly, eat
> slowly, and lie about your age."
>



-- 
Henry von Tresckow (hvontres)
Bob Hope  - "I have a wonderful make-up crew. They're the same people
restoring the Statue of Liberty."



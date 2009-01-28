Received: from [209.85.198.248] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1LS6HY-0000DM-RN
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jan 2009 10:00:25 +0100
Received: by rv-out-0708.google.com with SMTP id f25so7511902rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 00:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wt7S4c6fia5fPRYymFObuePH+Mvt294/1/GzbsgG34E=;
	b=nqbJxToc0hdUt9aVtcssGxjATnasT0D2lkA3CAI/qI82KSlXU64GlLjyRnQV1jJ+jn
	cJfZdce3DN4yxG+a7mrzH6YQeYJnn+VuwI1hVmFfpsJl9Xx14kZwhsPQI4A+Qw1kykNs
	EOhZpxS9wOaKxBOadLrti3Z1iioE1goSEY1yc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KbwGOMisKzGXwChuUs6GAypRzaUtclvmLebkgoso52TWscDG/ir/M13cSgFWAIveS5
	WLnRJ1fgzCy6444G5jrA3say+LPMWZXMQsRWwDTjsEzYHJTF3jD9+p10X0ZuW6R+JMcc
	75TN7JEhDVQWBujXexV82HKQf6qAjec8sfG5k=
MIME-Version: 1.0
Received: by 10.140.174.11 with SMTP id w11mr2060112rve.83.1233132767848; Wed, 
	28 Jan 2009 00:52:47 -0800 (PST)
In-Reply-To: <glp4sh$3aq$1@ger.gmane.org>
References: <a7f8874a0901280005p5c21c00ay5647c21df9fce86d@mail.gmail.com>
	<glp4sh$3aq$1@ger.gmane.org>
Date: Wed, 28 Jan 2009 00:52:47 -0800
Message-ID: <a7f8874a0901280052s363c9ea5y5148fa29cb4839e6@mail.gmail.com>
From: Hans Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Added sg3-utils
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
X-List-Received-Date: Wed, 28 Jan 2009 09:00:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Jan 28, 2009 at 12:26 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 28-01-09 09:05, Hans Henry von Tresckow wrote:
>>
>>  From 6f470d6b859e78dff1a168fc24bcb8d3ddcef575 Mon Sep 17 00:00:00 2001
>> From: Henry von Tresckow<hvontres@gmail.com>
>> Date: Tue, 27 Jan 2009 23:44:26 -0800
>> Subject: [PATCH] Added sg3-utils
>
>
> Looks good to me.
>
> regards,
>
> Koen

Could somebody push this please?

Thanks



>
>> ---
>>  conf/checksums.ini                      |    4 +
>>  packages/sg3-utils/files/Makefile.patch |  246
>> +++++++++++++++++++++++++++++++
>>  packages/sg3-utils/sg3-utils_1.24.bb    |   14 ++
>>  3 files changed, 264 insertions(+), 0 deletions(-)
>>  create mode 100644 packages/sg3-utils/files/Makefile.patch
>>  create mode 100644 packages/sg3-utils/sg3-utils_1.24.bb
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index f98fa55..e3a8253 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -19150,6 +19150,10 @@
>> sha256=4d710b17c5440518b43d3d1f7cbcb78a62c72f25e48a1b385a0ae3872ec8b40b
>>  md5=350180a6e4132a2b1262c7a15162c007
>>  sha256=4323581ddb6150677a36bcb87e3960100a7ea7c80906f0c7b7a27d1e43b055d9
>>
>>
>> +[ftp://ftp.debian.org/debian/pool/main/s/sg3-utils/sg3-utils_1.24.orig.tar.gz]
>> +md5=9e1b8811b013d8f97d8ea2e0942cebad
>> +sha256=0a06dae84a8f7f464c0c29c78a8f73f24a62894a2d3fc10b5f74a993f7b5abfe
>> +
>>
>>  [ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/sgml-common-0.6.3.tgz]
>>  md5=103c9828f24820df86e55e7862e28974
>>  sha256=7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959
>> diff --git a/packages/sg3-utils/files/Makefile.patch
>> b/packages/sg3-utils/files/Makefile.patch
>> new file mode 100644
>> index 0000000..cc5babf
>> --- /dev/null
>> +++ b/packages/sg3-utils/files/Makefile.patch
>> @@ -0,0 +1,246 @@
>> +Index: sg3-utils-1.24/Makefile
>> +===================================================================
>> +--- sg3-utils-1.24.orig/Makefile       2009-01-27 16:29:26.000000000
>> -0800
>> ++++ sg3-utils-1.24/Makefile    2009-01-27 22:31:04.000000000 -0800
>> +@@ -1,6 +1,6 @@
>> + SHELL = /bin/sh
>> +
>> +-PREFIX=/usr/local
>> ++PREFIX=/usr
>> + LIBDIR=$(DESTDIR)/$(PREFIX)/lib
>> + INSTDIR=$(DESTDIR)/$(PREFIX)/bin
>> + MANDIR=$(DESTDIR)/$(PREFIX)/share/man
>> +@@ -8,6 +8,8 @@
>> +
>> + CC = gcc
>> + LD = gcc
>> ++LIBTOOL = libtool
>> ++LT_EXTRA = --tag=CC
>> +
>> + EXECS = sg_dd sgp_dd sgm_dd sg_read sg_map sg_scan sg_rbuf \
>> +       sginfo sg_readcap sg_turs sg_inq sg_test_rwbuf \
>> +@@ -64,164 +66,164 @@
>> +       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) -c -o $@ $<
>> +
>> + sg_lib.lo: sg_lib.o
>> +-      libtool --mode=compile $(CC) -c sg_lib.c
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_lib.c
>> +
>> + sg_cmds_basic.lo: sg_cmds_basic.o
>> +-      libtool --mode=compile $(CC) -c sg_cmds_basic.c
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_basic.c
>> +
>> + sg_cmds_extra.lo: sg_cmds_extra.o
>> +-      libtool --mode=compile $(CC) -c sg_cmds_extra.c
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_cmds_extra.c
>> +
>> + sg_pt_linux.lo: sg_pt_linux.o
>> +-      libtool --mode=compile $(CC) -c sg_pt_linux.c
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=compile $(CC) -c sg_pt_linux.c
>> +
>> + libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
>> sg_pt_linux.lo
>> +-      libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo
>> sg_cmds_basic.lo \
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
>> sg_lib.lo
>> sg_cmds_basic.lo \
>> +       sg_cmds_extra.lo sg_pt_linux.lo -rpath $(LIBDIR) \
>> +       -version-info $(LIB_VINFO)
>> +
>> + # libsgutils.la: sg_lib.lo sg_cmds_basic.lo sg_cmds_extra.lo
>> +-#     libtool --mode=link $(LD) -o libsgutils.la sg_lib.lo
>> sg_cmds_basic.lo \
>> ++#     $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o libsgutils.la
>> sg_lib.lo sg_cmds_basic.lo \
>> + #     sg_cmds_extra.lo -rpath $(LIBDIR) -release $(RELEASE)
>> +
>> + sg_inq: sg_inq.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_dd: sg_dd.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_scan: sg_scan.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sginfo: sginfo.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_start: sg_start.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_rbuf: sg_rbuf.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_readcap: sg_readcap.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sgp_dd.o: sgp_dd.c
>> +       $(CC) $(INCLUDES) $(CFLAGS) $(S_CFLAGS) $(CFLAGS_PTHREADS) \
>> +       -c -o sgp_dd.o $<
>> +
>> + sgp_dd: sgp_dd.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^ -lpthread
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> -lpthread
>> +
>> + sgm_dd: sgm_dd.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_map: sg_map.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_turs: sg_turs.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_test_rwbuf: sg_test_rwbuf.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_read: sg_read.o sg_io_linux.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_reset: sg_reset.o
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_modes: sg_modes.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_logs: sg_logs.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_senddiag: sg_senddiag.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_opcodes: sg_opcodes.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_persist: sg_persist.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_write_long: sg_write_long.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_read_long: sg_read_long.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_requests: sg_requests.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_ses: sg_ses.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_verify: sg_verify.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_emc_trespass: sg_emc_trespass.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_luns: sg_luns.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_sync: sg_sync.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_prevent: sg_prevent.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_get_config: sg_get_config.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_wr_mode: sg_wr_mode.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_rtpg: sg_rtpg.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_reassign: sg_reassign.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_format: sg_format.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_rmsn: sg_rmsn.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_ident: sg_ident.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_map26: sg_map26.o
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_rdac: sg_rdac.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_vpd: sg_vpd.o sg_vpd_vendor.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_sat_identify: sg_sat_identify.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_read_buffer: sg_read_buffer.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_write_buffer: sg_write_buffer.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> + sg_raw: sg_raw.o libsgutils.la
>> +-      libtool --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=link $(LD) -o $@ $(LDFLAGS) $^
>> +
>> +
>> + install: $(EXECS)
>> +       install -d $(INSTDIR)
>> +       install -d $(LIBDIR)
>> +-      libtool --mode=install install -c libsgutils.la
>> $(LIBDIR)/libsgutils.la
>> +-      libtool --finish $(LIBDIR)
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=install install -c libsgutils.la
>> $(LIBDIR)/libsgutils.la
>> ++      $(LIBTOOL) $(LT_EXTRA) --finish $(LIBDIR)
>> +       for name in $^; \
>> +-       do libtool --mode=install install -m 755 \
>> ++       do $(LIBTOOL) $(LT_EXTRA) --mode=install install -m 755 \
>> +               $$name $(INSTDIR); \
>> +       done
>> +       install -d $(MANDIR)/$(MAN_PREF)
>> +@@ -235,7 +237,7 @@
>> +       done
>> +
>> + uninstall:
>> +-      libtool --mode=uninstall rm -f $(LIBDIR)/libsgutils.la
>> ++      $(LIBTOOL) $(LT_EXTRA) --mode=uninstall rm -f
>> $(LIBDIR)/libsgutils.la
>> +       dists="$(EXECS)"; \
>> +       for name in $$dists; do \
>> +        rm -f $(INSTDIR)/$$name; \
>> diff --git a/packages/sg3-utils/sg3-utils_1.24.bb
>> b/packages/sg3-utils/sg3-utils_1.24.bb
>> new file mode 100644
>> index 0000000..d5f9071
>> --- /dev/null
>> +++ b/packages/sg3-utils/sg3-utils_1.24.bb
>> @@ -0,0 +1,14 @@
>> +DESCRIPTION = "Utilities for working with generic SCSI devices"
>> +SECTION = "console/admin"
>> +LICENSE = "GPLv2"
>> +HOMEPAGE = "http://packages.qa.debian.org/s/sg3-utils.html"
>> +AUTHOR = "Eric Schwartz (Skif)<emschwar@debian.org>"
>> +PR = "r0"
>> +
>> +SRC_URI = "${DEBIAN_MIRROR}/main/s/sg3-utils/sg3-utils_${PV}.orig.tar.gz
>> \
>> +       file://Makefile.patch;patch=1"
>> +
>> +S = "${WORKDIR}/sg3-utils-${PV}"
>> +
>> +inherit autotools
>> +
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Henry von Tresckow (hvontres)
P. J. O'Rourke  - "You can't get rid of poverty by giving people money."



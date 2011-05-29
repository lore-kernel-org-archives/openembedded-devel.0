Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQo1N-00039A-MH
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 23:59:41 +0200
Received: by fxm19 with SMTP id 19so2550305fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 14:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Vj1k3Ifih9yBiDDIduhO1T8zhM698xCUmiD6IWzzYg0=;
	b=K+N+KVQ58q9ZIR2aod9tkBlRY63tARZKzCab0PXuOgFH+rWrDNDtp0mx8qF1wGIdLl
	MRQzzPqyBlvaY57KVC8xSEL9LvCRaAJIcOkLhAZahU0LKE0mmb9yGyQ4pDcmU21F09s9
	+358Lw6pJAjSK4PPl/s2HlyUYy27AjiLTdLR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=naTyDAPPCRkoUI1E+g1kHOHiOJLnIjwbcX1IheBkTJgm9++fPrTle9y5E8mmQLF92M
	ubL9Gb8NyRZ2Fc0csjOxr5P3PByPow45vQb+sZwxffRBV8UY2Cj4Nbhl2iSLZvFYfgJD
	MShaKalyhqRqq6P/WbpvsZGdhFU8AhMAK9MPQ=
Received: by 10.223.94.78 with SMTP id y14mr4797628fam.24.1306706192614;
	Sun, 29 May 2011 14:56:32 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id h1sm527536fag.11.2011.05.29.14.56.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 14:56:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 23:56:24 +0200
Message-Id: <cover.1306706130.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 00/14] Pull request #13
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
X-List-Received-Date: Sun, 29 May 2011 21:59:41 -0000

Hi,

please consider merging this patches, after this I can build 
task-cli-tools again.

The following changes since commit 7d6edbf446e338643542beab81fecb23340ad65b:

  policykit: drop recipes, oe-core has newer versions named right polkit (2011-05-28 16:42:55 +0200)

are available in the git repository at:
  git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe2
  http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe2

Martin Jansa (14):
  dbus-daemon-proxy: add LIC_FILES_CHKSUM and disable as-needed
  s3c24xx-gpio,s3c64xx-gpio: add LIC_FILES_CHKSUM
  devmem2: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  socat: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  mbuffer: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  nmon: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  ltrace: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  pxaregs: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
  serial-utils: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  tcp-wrappers: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  nfs-utils: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  i2c-tools: import from OE rev
    d4f0211e2078d5033ae0dee74664de5520d8392d
  tcpdump: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d

 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb |    3 +
 meta-oe/recipes-support/devmem2/devmem2.bb         |   22 +
 .../devmem2/devmem2/devmem2-fixups-2.patch         |   91 ++
 .../i2c-tools/i2c-tools-3.0.3/Module.mk            |   72 ++
 .../recipes-support/i2c-tools/i2c-tools_3.0.3.bb   |   24 +
 meta-oe/recipes-support/libelf/libelf_0.8.13.bb    |   38 +
 .../recipes-support/ltrace/files/add-sysdep.patch  |   13 +
 .../ltrace/files/ltrace-compile.patch              |   80 ++
 .../files/ltrace-fix-sysdep_h-dependency.patch     |   33 +
 .../ltrace/files/ltrace-mips-remove-CP.patch       |   12 +
 .../recipes-support/ltrace/files/ltrace-mips.patch |   36 +
 .../recipes-support/ltrace/files/ltrace-ppc.patch  |   11 +
 meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb     |   81 ++
 .../recipes-support/mbuffer/mbuffer_20091227.bb    |   18 +
 .../nfs-utils-S_ISREG-missing-include.patch        |   33 +
 .../nfs-utils-tools-unset-cflags.patch             |   92 ++
 .../nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch |   49 +
 .../nfs-utils/nfs-utils-1.1.2/nfsserver            |  149 +++
 .../recipes-support/nfs-utils/nfs-utils_1.1.2.bb   |   54 +
 meta-oe/recipes-support/nmon/nmon_13g.bb           |   29 +
 .../recipes-support/pxaregs/pxaregs-1.14/Makefile  |    3 +
 .../recipes-support/pxaregs/pxaregs-1.14/i2c.patch |   15 +
 .../pxaregs/pxaregs-1.14/munmap.patch              |   22 +
 .../pxaregs/pxaregs-1.14/serial.patch              |   14 +
 .../recipes-support/pxaregs/pxaregs-1.14/usb.patch |   17 +
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb    |   25 +
 .../samsung-soc-utils/s3c24xx-gpio_svn.bb          |    3 +-
 .../samsung-soc-utils/s3c64xx-gpio_svn.bb          |    3 +-
 .../serial-utils/pty-forward-native.bb             |   21 +
 .../serial-utils/serial-forward_git.bb             |   13 +
 .../socat/socat-1.7.1.2/compile.patch              |  939 +++++++++++++++
 meta-oe/recipes-support/socat/socat_1.7.1.2.bb     |   21 +
 .../tcp-wrappers-7.6/00_man_quoting.diff           |   75 ++
 .../tcp-wrappers-7.6/01_man_portability.patch      |  248 ++++
 .../tcp-wrappers-7.6/05_wildcard_matching.patch    |  103 ++
 .../tcp-wrappers-7.6/06_fix_gethostbyname.patch    |   30 +
 .../tcp-wrappers-7.6/10_usagi-ipv6.patch           | 1253 ++++++++++++++++++++
 .../tcp-wrappers-7.6/11_tcpd_blacklist.patch       |  151 +++
 .../tcp-wrappers-7.6/11_usagi_fix.patch            |   45 +
 .../tcp-wrappers-7.6/12_makefile_config.patch      |   81 ++
 .../tcp-wrappers-7.6/13_shlib_weaksym.patch        |  253 ++++
 .../tcp-wrappers-7.6/14_cidr_support.patch         |   66 +
 .../tcp-wrappers-7.6/15_match_clarify.patch        |   12 +
 .../tcp-wrappers-7.6/expand_remote_port.patch      |   71 ++
 .../tcp-wrappers-7.6/have_strerror.patch           |   19 +
 .../tcp-wrappers/tcp-wrappers-7.6/ldflags.patch    |   55 +
 .../tcp-wrappers-7.6/man_fromhost.patch            |   21 +
 .../tcp-wrappers-7.6/restore_sigalarm.patch        |   37 +
 .../tcp-wrappers/tcp-wrappers-7.6/rfc931.diff      |   39 +
 .../tcp-wrappers/tcp-wrappers-7.6/safe_finger.8    |   34 +
 .../tcp-wrappers-7.6/safe_finger.patch             |   29 +
 .../tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch    |   34 +
 .../tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch |   30 +
 .../tcp-wrappers/tcp-wrappers-7.6/size_t.patch     |   42 +
 .../tcp-wrappers-7.6/tcpdchk_libwrapped.patch      |   39 +
 .../tcp-wrappers/tcp-wrappers-7.6/try-from.8       |   28 +
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |  111 ++
 .../0001-minimal-IEEE802.15.4-allowed.patch        |   22 +
 .../tcpdump/tcpdump-4.1.1/configure.patch          |   29 +
 .../tcpdump/tcpdump-4.1.1/ipv6-cross.patch         |   41 +
 .../tcpdump-4.1.1/tcpdump_configure_no_-O2.patch   |   42 +
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb   |   42 +
 62 files changed, 5116 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2.bb
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools-3.0.3/Module.mk
 create mode 100644 meta-oe/recipes-support/i2c-tools/i2c-tools_3.0.3.bb
 create mode 100644 meta-oe/recipes-support/libelf/libelf_0.8.13.bb
 create mode 100644 meta-oe/recipes-support/ltrace/files/add-sysdep.patch
 create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-compile.patch
 create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-fix-sysdep_h-dependency.patch
 create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-mips-remove-CP.patch
 create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-mips.patch
 create mode 100644 meta-oe/recipes-support/ltrace/files/ltrace-ppc.patch
 create mode 100644 meta-oe/recipes-support/ltrace/ltrace_0.5.3.bb
 create mode 100644 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-S_ISREG-missing-include.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-tools-unset-cflags.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfs-utils-uclibc-compile.patch
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils-1.1.2/nfsserver
 create mode 100644 meta-oe/recipes-support/nfs-utils/nfs-utils_1.1.2.bb
 create mode 100644 meta-oe/recipes-support/nmon/nmon_13g.bb
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/Makefile
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/i2c.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/munmap.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/serial.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs-1.14/usb.patch
 create mode 100644 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
 create mode 100644 meta-oe/recipes-support/serial-utils/pty-forward-native.bb
 create mode 100644 meta-oe/recipes-support/serial-utils/serial-forward_git.bb
 create mode 100644 meta-oe/recipes-support/socat/socat-1.7.1.2/compile.patch
 create mode 100644 meta-oe/recipes-support/socat/socat_1.7.1.2.bb
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/00_man_quoting.diff
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/01_man_portability.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/05_wildcard_matching.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/06_fix_gethostbyname.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/10_usagi-ipv6.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/11_tcpd_blacklist.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/11_usagi_fix.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/12_makefile_config.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/13_shlib_weaksym.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/14_cidr_support.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/15_match_clarify.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/expand_remote_port.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/have_strerror.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/ldflags.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/man_fromhost.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/restore_sigalarm.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/rfc931.diff
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/safe_finger.8
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/safe_finger.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/sig_fix.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/siglongjmp.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/size_t.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/tcpdchk_libwrapped.patch
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers-7.6/try-from.8
 create mode 100644 meta-oe/recipes-support/tcp-wrappers/tcp-wrappers_7.6.bb
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/0001-minimal-IEEE802.15.4-allowed.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/configure.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/ipv6-cross.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump-4.1.1/tcpdump_configure_no_-O2.patch
 create mode 100644 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb

-- 
1.7.5.rc3




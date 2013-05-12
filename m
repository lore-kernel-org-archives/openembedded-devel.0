Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Ubfsn-0007g2-SA
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 May 2013 01:40:51 +0200
Received: by mail-ea0-f174.google.com with SMTP id z7so2294867eaf.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=4WvVSfn9U/ychqma2wa9Y6iWzAHquQ6nDJ+/o28kRts=;
	b=IV5hdK2KPBgtAhrUgGk+eJ22MWF+lLLADmLoOqggSEuv0hgTSO/5U5EYJEdF54YvwQ
	D2XmX1HoOk0KNRbTbIEklGLD35gmL1w5q/F+TZRQeaccNgEpRVDmFQD/10X58YdSGhY+
	cLcY13YhSzMaK7qLZS8DPcCSxvlxGMVt3SVWmKgXaVDNclovYBwGr2WsEff6C2lusM2d
	3hZnBuB05Dii9YDioRT+Lb5wees5PIEAUlbOlGBJl5B6+ws1WpRljBaCQshppCU8bcie
	15LWs1qzlLLFhfn+VzGQ7GH8VMQh7tCfguj8g7G1Eu5kOgj86Nfgp0Lx/UKrdYYg6Ej9
	K6KA==
X-Received: by 10.15.23.69 with SMTP id g45mr71513502eeu.25.1368400960707;
	Sun, 12 May 2013 16:22:40 -0700 (PDT)
Received: from mizar.localdomain
	(host170-249-dynamic.17-79-r.retail.telecomitalia.it.
	[79.17.249.170]) by mx.google.com with ESMTPSA id
	w43sm19120109eeg.14.2013.05.12.16.22.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 16:22:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 May 2013 01:22:19 +0200
Message-Id: <cover.1368400320.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 0/4] cleanings and fixes
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
X-List-Received-Date: Sun, 12 May 2013 23:40:52 -0000

* minor editing to the images,
* kexecboot runtime deps fixes,
* klibc and kexec-tools-klibc refinements needed to unbreak the build
* for x86 and x86-64

Andrea Adami (4):
  initramfs-kexecboot(-klibc)-image: Drop legacy export of
    IMAGE_BASENAME
  kexecboot(-klibc): remove runtime dependency on kexec(-klibc)
  klibc: fix KLIBCARCH for x86-64, powerpc and powerpc64
  kexec-tools-klibc_2.0.2: refactor and extend patches for building

 .../images/initramfs-kexecboot-image.bb            |  2 -
 .../images/initramfs-kexecboot-klibc-image.bb      |  2 -
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |  1 -
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |  1 -
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  3 +
 .../kexec-tools-klibc-2.0.2/arm_crashdump.patch    | 12 +++
 .../kexec-tools-klibc-2.0.2/cflags_static.patch    | 11 +++
 .../kexec/kexec-tools-klibc-2.0.2/elf.patch        | 94 ---------------------
 .../kexec/kexec-tools-klibc-2.0.2/errno.patch      | 13 ---
 .../kexec-tools-klibc-2.0.2/ifdown_errno.patch     | 11 +++
 .../kexec-tools-klibc-2.0.2/kexec-elf-rel.patch    | 61 ++++++++++++++
 .../kexec-tools-klibc-2.0.2/kexec-syscall.patch    | 44 ++++++++++
 .../kexec/kexec-tools-klibc-2.0.2/other.patch      | 97 ----------------------
 .../kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch     | 18 ++++
 .../kexec-tools-klibc-2.0.2/purgatory_flags.patch  | 21 +++++
 .../kexec-tools-klibc-2.0.2/purgatory_string.patch |  9 ++
 .../kexec/kexec-tools-klibc-2.0.2/sha256.patch     | 13 +++
 .../kexec/kexec-tools-klibc-2.0.2/string.patch     | 11 ---
 .../kexec/kexec-tools-klibc-2.0.2/syscall.patch    | 46 ----------
 .../sysconf_nrprocessors.patch                     | 13 +++
 .../kexec-tools-klibc-2.0.2/x86_basename.patch     | 14 ++++
 .../kexec-tools-klibc-2.0.2/x86_kexec_test.patch   | 13 +++
 .../kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch | 21 +++++
 .../kexec-tools-klibc-2.0.2/x86_vfscanf.patch      | 27 ++++++
 .../kexec/kexec-tools-klibc_2.0.2.bb               | 28 +++++--
 25 files changed, 310 insertions(+), 276 deletions(-)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/arm_crashdump.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/cflags_static.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/elf.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ifdown_errno.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-elf-rel.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/kexec-syscall.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/other.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/ppc__lshrdi3.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_flags.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/purgatory_string.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sha256.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/string.patch
 delete mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/syscall.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/sysconf_nrprocessors.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_basename.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_kexec_test.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_sys_io.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc-2.0.2/x86_vfscanf.patch

-- 
1.8.1.5




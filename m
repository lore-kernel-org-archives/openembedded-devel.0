Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAA77F26C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:15 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id e1so799655pgj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=35neWPRoG8cGu0znUcDArFzGoTyv5DsNaQITrrHGOyE=;
	b=iG5rnkUUyxJw30cgrNgro4x2i3xIUah2ztZTP01Z/Sy5FC1KVS3RikVF8NxZAeH5OU
	gs8RCS4pVLXXW+CbeLf+PjYaz+0rUoKaVfUtZ5b6tJlDAikeTIyvLz2W5u2d5Fv8f6OS
	EkYfQbhLPmNWA/rQaX6nMrlD4j83F/ow5ACdCyfSdWRBtjzqXDq0fv1tsmaLcgkkZ64C
	L42D9IkLzJ+0UkSMjxXWLT6a6nBW+O5tErIu+qSifvjBanEq2D4vBPB+jbpks9Uxbbb8
	DqGd1YZDGYvk59CW6cSHTUcGfWDv1lim+CZWfvvY+Qt8E2zcIf6XerMy+jbdPul88JIr
	hLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=35neWPRoG8cGu0znUcDArFzGoTyv5DsNaQITrrHGOyE=;
	b=Zr0E/Hnsr3NNYi8Cstf1BtowfOlv4+eZGK/FrfPOLfT1WW9p8OA/9bfTPJi9je7Gc+
	vAwFi9JTZ56qEWHB93TEamnswVl7CQQBRyLWyytJd/vKOpr7nHs7lsi4U5Xb7QYbzew9
	zICJXGqmRg70ocrFdu5r1GjAXywWKStnXeeqhXmBl+xqxY2r7Fbc3NB9j8LVVwReBXzu
	w1fbI2omZMEzmXQeU/DiVIBtnYzToY4Cc/T7PL09/b15QU/6K2qsVWSMmEgZMotJT8NK
	WklWM8mYbAu04GNODAdbdky3z7Zg4u4xu7sB2A4E8f/cZ0ZZBsaKIpg137SL55p7ZItS
	ToAw==
X-Gm-Message-State: APjAAAW6t5xOJCN+KIIsnPqeGwo1U93d9QmAABtwrhR+tp3Jqwg8D/xM
	h4hpXdP6HE7fhPiUMcOtTJfVHYnqwXA=
X-Google-Smtp-Source: APXvYqzNbiqc6cY2orarZV/BxZ99POkW9jF0fvZlnSUN/2GNxL72NgOhXue2g6eNo152r9FocUkBIA==
X-Received: by 2002:a17:90a:214c:: with SMTP id
	a70mr11814752pje.143.1569801316754; 
	Sun, 29 Sep 2019 16:55:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:54:58 -0700
Message-Id: <cover.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior-next 00/10] patch review
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Sep 2019 23:55:16 -0000

Please have comment submitted by Tuesday

The following changes since commit 3bdbf72e3a4bf18a4a2c7afbde4f7ab773aeded9:

  oprofile: drop kernel-vmlinux from RRECOMMENDS (2019-09-07 15:30:50 -0700)

are available in the git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/warrior-nmut
  http://cgit.openembedded.org//log/?h=stable/warrior-nmut

Bruce Ashfield (1):
  dnsmasq: fix build against 5.2 headers

Kai Kang (1):
  apache2: fix multilib file conflicts

Khem Raj (7):
  redis: Fix build with clang/x86
  klibc: Pass -fno-builtin-bcmp with musl/clang combo
  klibc: Disable bcmp builtin for clang on glibc as well
  klibc: Fix build with 5.2+ kernel headers
  bpftool.bb: Disable SECURITY_CFLAGS
  linux-atm: Fix build with kernel headers 5.2+
  can-utils: Fix build with kernel headers >= 5.2

Peiran Hong (1):
  tcpdump: Fix CVE-2017-16808

 .../0001-Fix-missing-include-in-sys-mman.h.patch   |  36 +++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   6 +-
 ...001-dnsmasq-fix-build-against-5.2-headers.patch |  31 ++++++
 .../recipes-support/dnsmasq/dnsmasq_2.80.bb        |   1 +
 ...mdump-Include-linux-sockios.h-for-SIOCGST.patch |  59 ++++++++++++
 .../recipes-support/linux-atm/linux-atm_2.5.2.bb   |   1 +
 ...2017-16808-AoE-Add-a-missing-bounds-check.patch |  61 ++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.9.2.bb       |   1 +
 .../redis/0001-src-Do-not-reset-FINAL_LIBS.patch   |  32 +++++++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb     |   5 +-
 ...ude-to-find-SIOCGSTAMP-with-latest-kernel.patch | 106 +++++++++++++++++++++
 .../recipes-extended/socketcan/can-utils_git.bb    |   4 +-
 meta-oe/recipes-kernel/bpftool/bpftool.bb          |   4 +-
 .../recipes-httpd/apache2/apache2_2.4.41.bb        |   6 +-
 14 files changed, 346 insertions(+), 7 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Fix-missing-include-in-sys-mman.h.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/0001-dnsmasq-fix-build-against-5.2-headers.patch
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/0001-CVE-2017-16808-AoE-Add-a-missing-bounds-check.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

-- 
2.7.4



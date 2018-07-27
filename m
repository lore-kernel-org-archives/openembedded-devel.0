Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D005A78D34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:12:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s12-v6so5812823wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0dLgL8Qii0LILQWQsqlXp7VdzwzYiKU0t8W9eGmOgS8=;
	b=v24CvvZ14wfKI+Tqwe8caoS55rDiWxeKx9LIl8DH77fCokeEJiB1Jodx+HWKjjLgDb
	k8os/uguhd9MzSLRM81yrE5ZaczDhKU0sowUqkGtNGovLGGxexcggLG7/HWmFn1yTJK9
	5y1t62cZGgKElbvxwUZ1t7ePmp2SV/yOCaRsIuo66/763u2nnIKKFC+cFnasUaIr2kn6
	5cFZcu+yMsB6MpOi32NQRnUMSbMWg8C1uRcps3FHqCNXInn6Imm/k9vKsUEIyNEv/TMh
	VikxRSnDYMpHkbu6CGaFJAgf5hyudEK2x/nFls2I+eNqKFgw71G7thvSFok/N/efVJap
	QuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0dLgL8Qii0LILQWQsqlXp7VdzwzYiKU0t8W9eGmOgS8=;
	b=CNnXCUQbewRgRXmyZF/93MXup0cG0ZGVkb5M50YQaRfU/PMUbRRddAxSIVNo3rwoSh
	HbR5KV2KWzZcVRq5bPJKeTZ3Xp/v0dNn97dQZ9b8mhpNR3B9eofvYZfLTFMMvS9oKU7g
	2JvP0Ibs/v85t30EgWb4R2bweixy3o/xxbD4M+Ym77TW+Aee9Ut0xF40GlxaSbkCgAPu
	dCvqXkOhC9Jif8ZAtirYKeuqFQSVG6oJo3zVG+lbCzydEvq9099oedPIyj72A0MSAy8q
	x0O/9aQynEIvT9sQb052Aq6mXc5mv+QpvUn+XvRPBwlLcmC/gs78HxrlnSFfbvyEue1k
	//0A==
X-Gm-Message-State: AOUpUlEmSNp3eHAGmDPHjUrGOcxS/pA8/wJsa0s/yzV/sHOyyDo5ZwPT
	BgFO25+Hulk2T4xDgX4i0PRgKiFMLF0=
X-Google-Smtp-Source: AAOMgpecqdMhmu002WkKgySkqB2CNZMXIXfCWywU43pUGLkYxFQaF6W0kbhca2oStvWcJC3B9qGyFQ==
X-Received: by 2002:a1c:a009:: with SMTP id
	j9-v6mr4479198wme.132.1532707966104; 
	Fri, 27 Jul 2018 09:12:46 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b11-v6sm3287130wrv.82.2018.07.27.09.12.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 09:12:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 17:12:42 +0100
Message-Id: <20180727161242.5515-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pax-utils: add (from oe-core)
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
X-List-Received-Date: Fri, 27 Jul 2018 16:12:46 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/pax-utils/pax-utils_1.2.2.bb  | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb

diff --git a/meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
new file mode 100644
index 0000000000..9635a5e708
--- /dev/null
+++ b/meta-oe/recipes-devtools/pax-utils/pax-utils_1.2.2.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Security-focused ELF files checking tool"
+DESCRIPTION = "This is a small set of various PaX aware and related \
+utilities for ELF binaries. It can check ELF binary files and running \
+processes for issues that might be relevant when using ELF binaries \
+along with PaX, such as non-PIC code or executable stack and heap."
+HOMEPAGE = "http://www.gentoo.org/proj/en/hardened/pax-utils.xml"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
+
+SRC_URI = "https://dev.gentoo.org/~vapier/dist/pax-utils-${PV}.tar.xz"
+SRC_URI[md5sum] = "a580468318f0ff42edf4a8cd314cc942"
+SRC_URI[sha256sum] = "7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9"
+
+RDEPENDS_${PN} += "bash"
+
+export GNULIB_OVERRIDES_WINT_T = "0"
+
+do_configure_prepend() {
+    touch ${S}/NEWS ${S}/AUTHORS ${S}/ChangeLog ${S}/README
+}
+
+do_install() {
+    oe_runmake PREFIX=${D}${prefix} DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[libcap] = "--with-caps, --without-caps, libcap"
+PACKAGECONFIG[libseccomp] = "--with-seccomp, --without-seccomp, libseccomp"
+PACKAGECONFIG[pyelftools] = "--with-python, --without-python,, pyelftools"
+
+EXTRA_OECONF += "--enable-largefile"
-- 
2.11.0



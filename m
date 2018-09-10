Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7D966011A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:55:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l9-v6so9966539pff.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=rHchlrcDAMfaXrTPkFdY7AYPakyK+J4tD3aPbfWd8B4=;
	b=Q6Uee5vuHA/E4u1xcbtEmMccRV1pXqyhfm3trMs/zKqLFZHu3zBJdZFJX98Xec7YEw
	tzhl7a4suZgr8/3dQpmciR9qZSbq91QYoFxoHFvVppd6/BWI2gtIFhxfTNHDlHm0OL8Z
	YnNsjsXSMlv6FLlorA42csMsYVKsZS/QyOrLQYtryY6p6ZuArd5eQOA1heRtoQN3Edbu
	U6QQoE6biXbdRcgpHOeArXO7alBaCFAKSvV/aPNoFLiwJE6lmATeou1tQsCjhO86ZHrf
	4NzlaxGk4jZZR/ZfrotpBDntShSq+g9Nqw/RpMUXMfqhZdMYofZTbp6CCEY5vgnIYnFR
	eKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rHchlrcDAMfaXrTPkFdY7AYPakyK+J4tD3aPbfWd8B4=;
	b=Q0yHaBupSAJTNa4D8If6BjTUNE9YiqKAgRFI9DlnwcuexSBdptDpW+UyGumWEEo0Ql
	dY2n2SZhwKtoX7S5TaxDZtiI7hZOKRFpgV7TkpmpG1WaI1h7geAMcSmeSxHutLis4NAn
	6us8jxKo4/GVDv5RKzuvz9KFUdha1rWmONtSSQI7ElcCe6pjsQSA/XIqCJD7hSBiw9q/
	XlhcPhLGzDwZ4MiryXDFSDue5Sq+0rKyfneSSbMTjKuNKtQh18/1Rs8hGL63bR3OHVrR
	KPRSEbdc+RTKosYaETbTcWvqzGdFW8tCET2em2AdCPY3KIfKY+Uso29TQhLrWJC0Nr00
	ESdQ==
X-Gm-Message-State: APzg51DAqZY9rS4qepN3aSTkZpHwaSCUzNFG53Y/r/VRwstEZvmd4UUZ
	a+suWU26OWs0SALlOVMwS/ILnwec
X-Google-Smtp-Source: ANB0VdavJg/gtVgx6ooiTVZEvoM0IaWo0p+hmWkwUD2mcHFeS221z6OQAsxLqQyLvFiPmLAVsd1KBA==
X-Received: by 2002:a63:6d4f:: with SMTP id
	i76-v6mr20788671pgc.215.1536562548197; 
	Sun, 09 Sep 2018 23:55:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	b3-v6sm29610816pgm.74.2018.09.09.23.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 23:55:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 23:55:36 -0700
Message-Id: <20180910065537.18612-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-initramfs][PATCH 1/2] klcc-cross: Recognise clang options
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
X-List-Received-Date: Mon, 10 Sep 2018 06:55:47 -0000

Let klcc understand '-no-integrated-as' which is a clang option used by
meta-clang for compiler defaults

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 .../klcc-cross-accept-clang-options.patch     | 19 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch
new file mode 100644
index 0000000000..07703aa536
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-cross-accept-clang-options.patch
@@ -0,0 +1,19 @@
+meta-clang passes this option to compiler defaults
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/klcc/klcc.in
+===================================================================
+--- git.orig/klcc/klcc.in
++++ git/klcc/klcc.in
+@@ -207,6 +207,9 @@ while ( defined($a = shift(@ARGV)) ) {
+     } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
+ 	# Override gcc encoded sysroot
+ 	push(@ccopt, $a);
++    } elsif ( $a eq '-no-integrated-as' ) {
++	# Allow clang options
++	push(@ccopt, $a);
+     } else {
+ 	die "$0: unknown option: $a\n";
+     }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 8616f89f2c..f0b20bc7fd 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -12,6 +12,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://klibc-linux-libc-dev.patch \
            file://staging.patch \
            file://klcc-consider-sysroot.patch \
+           file://klcc-cross-accept-clang-options.patch \
            file://0001-dash-Specify-format-string-in-fmtstr.patch \
            file://0001-Define-in_-structs-for-non-glibc-system-libs.patch \
            file://0001-include-linux-sysinfo.h-directly.patch \
-- 
2.18.0



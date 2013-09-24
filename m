Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7706CA54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 12:44:15 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l13so3046088qcy.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 05:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GrvGSCMkeMu0rIox+9pVPbuqq715DGXJxhVl0Ww+Ikg=;
	b=tJI9C9i3Zlbt1jxPdOIlR4M5+NBllJnYzYgSt9JHKMuvF3JgRi/ALT5JrNFrkkD/44
	VyRwbPidz3qDojkrSlWhrMXmk2uIsMhtvBSQbe0tDfDm3rcmb4ZU1hVV2ca77720oAep
	6LZIM8L0/Ixgjx2Q0A5DSQETBjl6k53ZUkblK3D1Ee5qN5GrVqTGmFWefBTGD8/G2AoE
	FH5n7Jur7aeOjX7pSS7ST1G8KdEuCWEMID6BrIJlE6IbKhzR3H/F60V/i7R/JjNavPvF
	O/dZIY89ZbaUOHtKBgVXvjhR2Lx/Cmm2muqZCeL6i6jIk5LYbIjaWxwQM7Mkn1+2jMST
	hePg==
X-Received: by 10.224.112.69 with SMTP id v5mr8775909qap.66.1380026656864;
	Tue, 24 Sep 2013 05:44:16 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id e7sm45657372qag.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 05:44:16 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Sep 2013 09:43:57 -0300
Message-Id: <1380026637-6511-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
References: <1380026637-6511-1-git-send-email-mario@ossystems.com.br>
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 2/2] wvdial: add recipe for version 1.61
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
X-List-Received-Date: Tue, 24 Sep 2013 12:44:15 -0000

Recipe based on OE classic's recipe for version 1.60, as of
ff0d06489db2e50353d72d24aada74c60bddb016.

Summary of changes against OE classic's recipe:

* Apply typo_pon.wvdial.1.patch patch from Debian's
  http://patch-tracker.debian.org/package/wvdial/1.61-4.1

* Fix Makefile in do_configure task

* Add wvstreams' include dir to BUILD_CPPFLAGS

* Minor adjustments for the current build system (add
  LIC_FILES_CHKSUM, md5 and sha256 sums for SRC_URI, fix LICENSE, remove
  PR)

* Disable parallel make, since it was causing errors like

Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
| * Generating CC
| ./CXX -c wvdialer
| * Generating CXX
| ./CXX -c wvmodemscan
| /bin/bash: ./CXX: No such file or directory
| make: *** [wvdialer.o] Error 127
| make: *** Waiting for unfinished jobs....
| make: *** wait: No child processes.  Stop.
| ERROR: oe_runmake failed
| WARNING: .../tmp/work/armv7a-vfp-neon-oel-linux-gnueabi/wvdial/1.61-r0/temp/run.do_compile.18676:1 exit 1 from
|   exit 1

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../wvdial/wvdial/typo_pon.wvdial.1.patch          |   20 +++++++++++++
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb |   30 ++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
 create mode 100644 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb

diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch b/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
new file mode 100644
index 0000000..eec5a5d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial/typo_pon.wvdial.1.patch
@@ -0,0 +1,20 @@
+Remove warnings found by lintian
+Last-Update: 2011-01-09
+Index: wvdial-1.61/pon.wvdial.1
+===================================================================
+--- wvdial-1.61.orig/pon.wvdial.1	2011-01-09 21:33:03.000000000 +0300
++++ wvdial-1.61/pon.wvdial.1	2011-01-09 21:33:15.000000000 +0300
+@@ -8,13 +8,11 @@
+ .SH DESCRIPTION
+ .B pon.wvdial
+ .br
+-.TR
+ .B poff.wvdial
+ .br
+ .RS
+ Replacement scripts for pon and poff.
+ .RE
+-\."
+ .SH SEE ALSO
+ .BR wvdial (1),
+ .BR pon (1),
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
new file mode 100644
index 0000000..af1ebf3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -0,0 +1,30 @@
+HOMEPAGE = "http://www.alumnit.ca/wiki/?WvDial"
+DESCRIPTION = "WvDial is a program that makes it easy to connect your Linux workstation to the Internet."
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "wvstreams"
+RDEPENDS_${PN} = "ppp"
+
+SRC_URI = "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.bz2 \
+           file://typo_pon.wvdial.1.patch \
+          "
+
+SRC_URI[md5sum] = "37e9a2d664effe4efd44c0e1a20136de"
+SRC_URI[sha256sum] = "99906d9560cbdbc97e1855e7b0a7169f1e11983be3ac539140423f09debced82"
+
+EXTRA_OEMAKE = ""
+export WVLINK="${LD}"
+
+PARALLEL_MAKE = ""
+
+BUILD_CPPFLAGS += "-I${STAGING_INCDIR}/wvstreams"
+
+do_configure() {
+    sed -i 's/LDFLAGS+=-luniconf/LIBS+=-luniconf/' ${S}/Makefile
+}
+
+do_install() {
+    oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
+}
-- 
1.7.10.4



Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 00AD26C268
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 05:08:51 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id A2EF8220333;
	Tue, 13 Nov 2018 18:08:52 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 18:08:35 +1300
Message-Id: <20181113050835.3129-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113050835.3129-1-douglas.royds@taitradio.com>
References: <20181113050835.3129-1-douglas.royds@taitradio.com>
Subject: [meta-networking][PATCH 2/2] ntp: Reproducible build: Use fixed path to posix shell
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
X-List-Received-Date: Tue, 13 Nov 2018 05:08:52 -0000

At configure time, the ntp build goes looking on the build machine for a posix
shell, using `which` to find it. Under OE, it settles on hosttools/bash,
resulting in this build host path being written into several binaries.
This did not affect the Debian reproducibility project, presumably because it
consistently found bash at /bin/bash.

Don't go looking, just use a fixed path to /bin/sh instead.

Upstream-Status: Submitted http://bugs.ntp.org/show_bug.cgi?id=3551
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ...eproducibility-fixed-path-to-posix-shell.patch | 15 +++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p12.bb           |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
new file mode 100644
index 000000000..571db75f7
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/reproducibility-fixed-path-to-posix-shell.patch
@@ -0,0 +1,15 @@
+--- ntp-4.2.8p12.original/sntp/libopts/m4/libopts.m4	2018-11-12 17:54:57.747220846 +1300
++++ ntp-4.2.8p12/sntp/libopts/m4/libopts.m4	2018-11-12 18:00:50.626211641 +1300
+@@ -114,12 +114,6 @@
+   AC_PROG_SED
+   [while :
+   do
+-      POSIX_SHELL=`which bash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=`which dash`
+-      test -x "$POSIX_SHELL" && break
+-      POSIX_SHELL=/usr/xpg4/bin/sh
+-      test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`/bin/sh -c '
+           exec 2>/dev/null
+           if ! true ; then exit 1 ; fi
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
index 536679f4d..53e41297a 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
@@ -12,6 +12,7 @@ DEPENDS = "libevent"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://ntp-4.2.4_p6-nano.patch \
+           file://reproducibility-fixed-path-to-posix-shell.patch \
            file://reproducibility-respect-source-date-epoch.patch \
            file://ntpd \
            file://ntp.conf \
-- 
2.17.1



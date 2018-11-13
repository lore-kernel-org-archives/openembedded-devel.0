Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id F3E936C264
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2018 05:08:51 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 00D12220319;
	Tue, 13 Nov 2018 18:08:52 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Nov 2018 18:08:34 +1300
Message-Id: <20181113050835.3129-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113050835.3129-1-douglas.royds@taitradio.com>
References: <20181113050835.3129-1-douglas.royds@taitradio.com>
Subject: [meta-networking][PATCH 1/2] ntp: Reproducible build: Respect SOURCE_DATE_EPOCH
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

If a SOURCE_DATE_EPOCH is set in the environment, use that date in the build
version string, otherwise use the current build date.
See https://reproducible-builds.org/docs/source-date-epoch/

Should GNU date options fail, try BSD date options as a fall-back.
This patch can potentially be pushed upstream for use on Mac OSX or OpenBSD,
though it has not been tested on OSX or any BSD platform.

Upstream-Status: Submitted http://bugs.ntp.org/show_bug.cgi?id=3550
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ...producibility-respect-source-date-epoch.patch | 16 ++++++++++++++++
 .../recipes-support/ntp/ntp_4.2.8p12.bb          |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch

diff --git a/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch b/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
new file mode 100644
index 000000000..58e71c3b8
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/reproducibility-respect-source-date-epoch.patch
@@ -0,0 +1,16 @@
+--- ntp-4.2.8p12.original/scripts/build/mkver.in	2018-11-12 14:06:49.333020430 +1300
++++ ntp-4.2.8p12/scripts/build/mkver.in	2018-11-12 14:15:04.947480167 +1300
+@@ -15,7 +15,12 @@
+  *) ConfStr="${ConfStr}-@VER_SUFFIX@" ;;
+ esac
+ 
+-ConfStr="$ConfStr `LC_TIME=C TZ=UTC date`"
++if [ -n "$SOURCE_DATE_EPOCH" ]; then
++   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date -d@$SOURCE_DATE_EPOCH 2>/dev/null`" ||
++   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date -r $SOURCE_DATE_EPOCH`"
++else
++   ConfStr="$ConfStr `LC_TIME=C TZ=UTC date`"
++fi
+ 
+ if [ ! -f .version ]; then
+   echo 0 > .version
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
index 425430115..536679f4d 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p12.bb
@@ -12,6 +12,7 @@ DEPENDS = "libevent"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://ntp-4.2.4_p6-nano.patch \
+           file://reproducibility-respect-source-date-epoch.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
-- 
2.17.1



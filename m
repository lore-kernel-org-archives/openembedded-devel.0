Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oou3H-0004Sw-5e
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 10:12:45 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so1019481pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 01:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0jW8h1KJoghYrBCZdVVTr/+bKBp7NdV4Hfpyac0iNQ4=;
	b=p5wJWxwR3wbiP/waVEZah0J7Es3UOoFgcBYceaDdGGA7Ey5Kaiv0WwsWniDCxOUAPH
	n+CSIZYCf/Y/1X4F41lAdHkpW0nJ9RENQqWotyY3pt7sY4XZ5FTGQo77tJDfLW3VuVm+
	HizfTtdxowkazZDXBLNE6CBMrIErmKtdBbag8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cqg8+A8b+/4yS8PqL1LDDohi/0D+kRzzM2uA9Do3lXa3Mfio3Wi85AYPDV7HHJw/BY
	qCeJ9p4+djU+V1QVR7I87xCXkl4pDQT0YF32P8G0oUZf6u2Ny4Gmo+1yDY8WkljTTVhx
	MN/eIbWlg/OZkLyYH7xIP92zGVaWURNgPAT+U=
Received: by 10.142.201.5 with SMTP id y5mr929735wff.130.1282896736614;
	Fri, 27 Aug 2010 01:12:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y16sm4056848wff.14.2010.08.27.01.12.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 27 Aug 2010 01:12:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 01:11:53 -0700
Message-Id: <1282896714-3167-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Rodrigo Vivi <rodrigo.vivi@openbossa.org>,
	Francisco Alecrim <francisco.alecrim@openbossa.org>
Subject: [PATCH 1/2] dspgw-utils: Adding DSP Gateway Utilities package
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
X-List-Received-Date: Fri, 27 Aug 2010 08:12:45 -0000

From: Willer Moreira <willer.moreira@openbossa.org>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@openbossa.org>
Signed-off-by: Francisco Alecrim <francisco.alecrim@openbossa.org>
Signed-off-by: Willer Moreira <willer.moreira@openbossa.org>
---
 recipes/dspgw-utils/dspgw-utils_3.3.1.bb   |   43 ++++++++++++
 recipes/dspgw-utils/files/dsp              |   96 ++++++++++++++++++++++++++++
 recipes/dspgw-utils/files/dsp.rules        |    6 ++
 recipes/dspgw-utils/files/yytext_ptr.patch |   11 +++
 4 files changed, 156 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dspgw-utils/dspgw-utils_3.3.1.bb
 create mode 100644 recipes/dspgw-utils/files/dsp
 create mode 100644 recipes/dspgw-utils/files/dsp.rules
 create mode 100644 recipes/dspgw-utils/files/yytext_ptr.patch

diff --git a/recipes/dspgw-utils/dspgw-utils_3.3.1.bb b/recipes/dspgw-utils/dspgw-utils_3.3.1.bb
new file mode 100644
index 0000000..08e11b6
--- /dev/null
+++ b/recipes/dspgw-utils/dspgw-utils_3.3.1.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "DSP Gateway Utilities"
+HOMEPAGE = "http://dspgateway.sourceforge.net"
+LICENSE = "GPL"
+DEPENDS = "bison flex udev"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/dspgateway/dspgw-${PV}-arm.tar.bz2 \
+           file://yytext_ptr.patch;patch=1 \
+           file://dsp \
+           file://dsp.rules "
+
+S = "${WORKDIR}/dspgw-${PV}-arm/src/utils"
+
+CFLAGS += "-g -Wall -I${WORKDIR}/dspgw-${PV}-arm/include"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "dsp"
+INITSCRIPT_PARAMS = "defaults"
+
+# Skipping...
+do_configure () {
+}
+
+# Skipping...
+do_stage () {
+}
+
+do_compile () {
+        cd ${S}/dsp_dld/arm && oe_runmake
+        cd ${S}/dspctl && oe_runmake
+}
+
+do_install () {
+        install -d ${D}${sbindir}
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}${sysconfdir}/udev/rules.d
+        install -m 0655 ${S}/dspctl/dspctl ${D}${sbindir}
+        install -m 0655 ${S}/dsp_dld/arm/dsp_dld ${D}${sbindir}
+        install -m 0655 ${S}/dsp_dld/arm/dld_client ${D}${sbindir}
+        install -m 0755 ${WORKDIR}/dsp ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/dsp.rules ${D}${sysconfdir}/udev/rules.d/
+}
diff --git a/recipes/dspgw-utils/files/dsp b/recipes/dspgw-utils/files/dsp
new file mode 100644
index 0000000..4387d60
--- /dev/null
+++ b/recipes/dspgw-utils/files/dsp
@@ -0,0 +1,96 @@
+#!/bin/sh
+# DSP Gateway init script
+# Copyright (C) 2007 INdT.
+# @author Abner Jose de Faria Silva <abner.silva@indt.org.br>
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, write to the Free Software
+# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+
+set -e
+
+DESC="DSP Gateway"
+
+DAEMON=/usr/sbin/dsp_dld
+DSPCTL=/usr/sbin/dspctl
+DSPCONF=/lib/dsp/dsp_dld_avs.conf
+
+DAEMONPARAM="-p --disable-restart -c $DSPCONF"
+
+KMEMRESERVE=360000
+
+PIDDIR=/var/run/dsp
+PIDFILE=$PIDDIR/pid
+
+test -x "$DAEMON" || exit 0
+test -x "$DSPCTL" || exit 0
+test -e "$DSPCONF" || exit 0
+
+start_dsp()
+{
+    if [ ! -d "$PIDDIR" ]; then
+        mkdir -p "$PIDDIR"
+    fi
+
+    if [ -e "$PIDFILE" ]; then
+        TMP=/proc/$(cat $PIDFILE)
+        if [ -d "$TMP" -a "$(readlink -f $TMP/exe)" = "$DAEMON" ]; then
+            echo "$DESC is already running."
+            return
+        else
+            echo "Removing old PID file $PIDFILE."
+            rm -f "$PIDFILE"
+        fi
+    fi
+
+    echo -n "Starting $DESC: "
+
+    $DSPCTL kmem_reserve $KMEMRESERVE
+    start-stop-daemon --start --quiet -b --make-pidfile --pidfile "$PIDFILE" \
+    --exec "$DAEMON" -- $DAEMONPARAM
+
+    echo "done."
+}
+
+stop_dsp()
+{
+    echo -n "Stopping $DESC: "
+
+    $DSPCTL kmem_release
+    start-stop-daemon --stop --quiet --name $(basename "$DAEMON") \
+    --pidfile "$PIDFILE"
+    rm -f "$PIDFILE"
+
+    echo "done."
+}
+
+case "$1" in
+    start)
+        start_dsp
+        ;;
+    stop)
+        stop_dsp
+        ;;
+    restart|force-reload)
+        stop_dsp
+        start_dsp
+        ;;
+    *)
+        echo "Usage: $(basename $0) {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
+
+echo ""
+
+exit 0
diff --git a/recipes/dspgw-utils/files/dsp.rules b/recipes/dspgw-utils/files/dsp.rules
new file mode 100644
index 0000000..ae01361
--- /dev/null
+++ b/recipes/dspgw-utils/files/dsp.rules
@@ -0,0 +1,6 @@
+# dsp dev
+KERNEL=="dspctl",    NAME="dspctl/ctl"
+KERNEL=="dspmem",    NAME="dspctl/mem", MODE="0640", GROUP="kmem"
+KERNEL=="dsptwch",   NAME="dspctl/twch", MODE="0640"
+KERNEL=="dsperr",    NAME="dspctl/err", MODE="0440"
+KERNEL=="dsptask[0-9]*", MODE="0666"
diff --git a/recipes/dspgw-utils/files/yytext_ptr.patch b/recipes/dspgw-utils/files/yytext_ptr.patch
new file mode 100644
index 0000000..cf17c1d
--- /dev/null
+++ b/recipes/dspgw-utils/files/yytext_ptr.patch
@@ -0,0 +1,11 @@
+--- utils/dsp_dld/arm/dld_cmd_spec.l	2006-09-08 02:57:22.000000000 -0300
++++ utils/dsp_dld/arm/dld_cmd_spec.l.fixed	2007-10-09 16:46:28.000000000 -0300
+@@ -180,6 +180,8 @@
+ 	return(1);
+ }
+ 
++#define yytext_ptr yytext
++
+ void comment(void)
+ {
+ 	char c, c1;
-- 
1.7.1




Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TE3m3-0000pb-Ik
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 21:47:59 +0200
Received: by pbcwy7 with SMTP id wy7so639231pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 12:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=I3DrHEj6GxXZKIA9SoVEB/CwjQhXEagI3vDlRb371Fk=;
	b=E4Tn/OV1GR5W4AvBwozyd2HUeg3gxo9QIZxSo8MDawnGXzdrrZb8Op2akI2xliJMqz
	vcWsEBNrbtERld0BFIes/1+6EvgWDwvhmzRDyRiBEzUbT8rTJJSMOgEUTsMDvKaktwc3
	KnXtQ7ShrleS8RumOIcKpMwd/X7f5ySeydQuaZ6JegfDT961GL8y2zCVUaqoOaBhL1JE
	aG9OQ0xMLzzEx9HaZ8wc9HgM6m3FstvGfiHUll+NcZzqJUrOTUD0wmW+LJwGk2J7H70B
	Rp10LXTYuA1oxZJhaWKMkDx+w7n1dLY7xKx+WQKPWkBfh/rofXf7OVNBIJDJxiT/f6vT
	g1gw==
Received: by 10.68.116.228 with SMTP id jz4mr1234939pbb.166.1347996918439;
	Tue, 18 Sep 2012 12:35:18 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id b4sm439356pbw.28.2012.09.18.12.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 12:35:17 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 22:35:07 +0300
Message-Id: <1347996907-22852-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkKsfvlaY/74RUyoM1wHPqJjK5V0aXv8xYTC946YQxAEBQgFf1F3OGxz346RUTQy2qnfoKj
Subject: [meta-oe][PATCH][V2] zram: Integrate an init script
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
X-List-Received-Date: Tue, 18 Sep 2012 19:47:59 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-extended/zram/zram/init         |   28 +++++++++++++++++
 meta-oe/recipes-extended/zram/zram/zram-load.sh |   37 +++++++++++++++++++++++
 meta-oe/recipes-extended/zram/zram_0.1.bb       |   24 +++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zram/zram/init
 create mode 100644 meta-oe/recipes-extended/zram/zram/zram-load.sh
 create mode 100644 meta-oe/recipes-extended/zram/zram_0.1.bb

diff --git a/meta-oe/recipes-extended/zram/zram/init b/meta-oe/recipes-extended/zram/zram/init
new file mode 100644
index 0000000..7bd8bcc
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/init
@@ -0,0 +1,28 @@
+#!/bin/bash
+### BEGIN INIT INFO
+# Provides: zram
+# Required-Start:
+# Required-Stop:
+# Default-Start: 2 3 4 5
+# Default-Stop: 0 1 6
+# Short-Description: Increased Performance In Linux With zRam (Virtual Swap Compressed in RAM)
+### END INIT INFO
+set -e
+
+case "$1" in
+    start)
+        zram-load.sh --load
+        ;;
+    stop)
+        zram-load.sh --unload
+        ;;
+    restart)
+        zram-load.sh --unload
+        sleep 3
+        zram-load.sh --load
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        RETVAL=1
+esac
+exit $RETVAL
diff --git a/meta-oe/recipes-extended/zram/zram/zram-load.sh b/meta-oe/recipes-extended/zram/zram/zram-load.sh
new file mode 100644
index 0000000..786cd0c
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram/zram-load.sh
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+num_cpus=$(grep -c processor /proc/cpuinfo)
+[ "$num_cpus" != 0 ] || num_cpus=1
+
+last_cpu=$((num_cpus - 1))
+
+mem_by_cpu=$(awk -v cpus=$num_cpus '/MemTotal/ { print (($2 * 1024) / cpus) }' /proc/meminfo)
+
+if [ "$1" = "--load" ] ; then
+	echo zram: Trying to load kernel module.
+
+	# Linux 3.2 workaround - value name changed :o.
+	modprobe -q zram zram_num_devices=$num_cpus
+
+	# Linux < 3.2.
+	#modprobe -q zram num_devices=$num_cpus
+
+	echo zram: Enable in-memory compressed swap of $mem_by_cpu bytes.
+	for i in $(seq 0 $last_cpu); do
+		echo 1 > /sys/block/zram$i/reset
+		echo $mem_by_cpu > /sys/block/zram$i/disksize
+		mkswap /dev/zram$i
+		swapon -p 100 /dev/zram$i
+	done
+fi
+
+if [ "$1" = "--unload" ] ; then
+	echo zram: Disable in-memory compressed swap.
+	for i in $(seq 0 $last_cpu); do
+		grep -q "/dev/zram$i" /proc/swaps && swapoff /dev/zram$i
+	done
+
+	sleep 1
+	echo zram: Unload kernel module.
+	rmmod zram
+fi
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
new file mode 100644
index 0000000..dd59784
--- /dev/null
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Linux zram compressed in-memory swap"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit allarch update-rc.d
+
+RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
+
+PR = "r0"
+
+SRC_URI = " \
+           file://init \
+           file://zram-load.sh \
+          "
+
+do_install () {
+	install -d ${D}/${bindir}
+	install -m 0755 ${WORKDIR}/zram-load.sh ${D}/${bindir}
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
+}
+
+INITSCRIPT_NAME = "zram"
+INITSCRIPT_PARAMS = "start 05 2 3 4 5 . stop 22 0 1 6 ."
-- 
1.7.9.5




Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMNkA-0008JD-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 18:39:55 +0100
Received: by ggnj1 with SMTP id j1so2607777ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 10:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=SCf9+tBQ1f/Y3lXU8zT31EJbQAScyFrMnhQIvgG1qVM=;
	b=oAsJbmVPIiKAy5eD80LXwEyK52/2g3dr3fgmUcHwumYtVQF4YP/9/vs/eeb+6S1Bsp
	M6u+mFs9ce2t1ry5y5tDnU3TO4xonUhxrrOOCjZkRjEN2oqUMiZnZoFaAQeTi1Ezx43Z
	EgH/FI0MfRCBVKwQwws1e1m1t2/dHw6CBOQ6A=
Received: by 10.236.200.201 with SMTP id z49mr22206410yhn.20.1320427574810;
	Fri, 04 Nov 2011 10:26:14 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y58sm6548572yhi.17.2011.11.04.10.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 10:26:13 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:25:58 +0000
Message-Id: <4e8bc6392a67fb5bb6a600d3972ee892cb357c89.1320427498.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320427498.git.otavio@ossystems.com.br>
References: <cover.1320427498.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/3] systemd-systemctl-native: add a systemctl wrapper
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
X-List-Received-Date: Fri, 04 Nov 2011 17:39:55 -0000

The wrapper allows for enabling services at rootfs generation thus
allowing systemd to be used in ready-only filesystems.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../systemd/systemd-systemctl-native.bb            |   13 +++++
 .../systemd/systemd-systemctl-native/systemctl     |   51 ++++++++++++++++++++
 2 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl

diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
new file mode 100644
index 0000000..3ee757e
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Wrapper to enable of systemd services"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+inherit native
+
+SRC_URI = "file://systemctl"
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 ${WORKDIR}/systemctl ${D}${bindir}
+}
diff --git a/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
new file mode 100755
index 0000000..1fc77fd
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-systemctl-native/systemctl
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+ROOT=
+
+# parse command line params
+while [ $# != 0 ]; do
+	opt="$1"
+
+	case "$opt" in
+		enable)
+			shift
+
+			service="$1"
+			shift
+			;;
+		--root=*)
+			ROOT=${opt##--root=}
+			shift
+			;;
+		*)
+			echo "'$opt' is an unkown option; exiting with error"
+			exit 1
+			;;
+	esac
+done
+
+# find service file
+for p in $ROOT/etc/systemd/system \
+         $ROOT/lib/systemd/system \
+         $ROOT/usr/lib/systemd/system; do
+	if [ -e $p/$service ]; then
+		service_file=$p/$service
+		service_file=${service_file##$ROOT}
+	fi
+done
+if [ -z "$service_file" ]; then
+	echo "'$service' couldn't be found; exiting with error"
+	exit 1
+fi
+
+# create the required symbolic links
+wanted_by=$(grep WantedBy $ROOT/$service_file \
+                | sed 's,WantedBy=,,g' \
+                | tr ',' '\n' \
+                | grep '\.target$')
+
+for r in $wanted_by; do
+	mkdir -p $ROOT/etc/systemd/system/$r.wants
+	ln -s $service_file $ROOT/etc/systemd/system/$r.wants
+	echo "Enabled $service for $wanted_by."
+done
-- 
1.7.2.5




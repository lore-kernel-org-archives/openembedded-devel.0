Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF4ECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 09:01:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4014.1761642081310838548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 02:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IRf8afIb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761642082; x=1793178082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XVHBgoAPx2JF+TSI7cJpkdB78pme/1itwe5Zd6A5n7E=;
  b=IRf8afIboE6U9QZ5I9219zR3FD2lKGnpEqNk5tbSOUfycZ/3Fi/HPVvS
   b8KKKkiSAM4IqZ1zCAkQGjDoQuaz9WsiX5GfGoXA/9gk2bYZpvqYbTN2c
   WAaBUG3qsOc1zSNADl+rBUwPJQEHGdTCwEy21YqEHnofn7fXLeOJjZr6g
   pDLmRptU2VrsSRi6c1Zrlqwx/xWy1CFLAEqD4KoC5qC0nXblgm0UvuwC8
   gASdqI7m1De1p0aZIFjOPblNLimQP0GAGWmq6LSY6J669E4bPQT9jh5US
   pC3k3KXJ+0mD02z/sYhLhKWsFP4ZLNFY/NzWSZYZ4g2rzxMmiBER88FEW
   g==;
X-CSE-ConnectionGUID: HExDHJnQRlKtflw8wRwtUw==
X-CSE-MsgGUID: 1vMWCv/tTE2SdE/GazLrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217315481"
X-IronPort-AV: E=Sophos;i="6.19,261,1754924400"; 
   d="scan'208";a="217315481"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 18:01:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C390E100034D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:19 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7C9EE1800EA4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DFB9E405522;
	Tue, 28 Oct 2025 09:01:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 4/5] modify install script for new version of fuego
Date: Tue, 28 Oct 2025 17:00:35 +0800
Message-ID: <20251028090037.143-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251028090037.143-1-wangmy@fujitsu.com>
References: <20251028090037.143-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 09:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121071

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 install-ubinux.sh | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/install-ubinux.sh b/install-ubinux.sh
index 1790abe..28fb5dd 100755
--- a/install-ubinux.sh
+++ b/install-ubinux.sh
@@ -1,13 +1,13 @@
 #!/bin/bash
 #
-# install.sh [--help] [--priv] [--no-cache] [--nojenkins] [<image_name>] [<port>]
+# install.sh [--help] [--priv] [--no-cache] [--nojenkins] [<image_name>] [<port>] [<debian version>]
 #
 
 # $1 is the exit code after usage is shown
 usage() {
     exit_code="$1"
     cat <<HERE
-Usage: install.sh [--help] [--priv] [--no-cache] [--nojenkins] [<image_name>] [<port>]
+Usage: install.sh [--help] [--priv] [--no-cache] [--nojenkins] [<image_name>] [<port>] [<debian version>]
 
 Create the docker image and container with the Fuego test distribution.
 If no <image_name> is provided, the image will be named 'fuego'.
@@ -34,7 +34,7 @@ fi
 
 priv=0
 NOCACHE=""
-dockerfile="Dockerfile"
+nojenkins=""
 
 POSITIONAL=()
 while [[ $# -gt 0 ]] ; do
@@ -48,7 +48,7 @@ while [[ $# -gt 0 ]] ; do
       shift
       ;;
     --nojenkins)
-      dockerfile="Dockerfile.nojenkins"
+      nojenkins="--nojenkins"
       shift
       ;;
     *)
@@ -60,6 +60,7 @@ set -- "${POSITIONAL[@]}" # restore positional arguments
 
 image_name=${1:-fuego}
 jenkins_port=${2:-8090}
+debian_version=${3:-stretch}
 
 container_name="${image_name}-container"
 
@@ -103,16 +104,20 @@ remove_log_of_journal() {
 EOF
 
 cp fuego-core-ubinux/scripts/test_script/* fuego-rw/ -rf
+cp fuego-core-ubinux/scripts/boards/* fuego-ro/boards/ -rf
 
 set -e
 
-source fuego-host-scripts/docker-build-image.sh $NOCACHE ${image_name} ${jenkins_port} ${dockerfile}
+source fuego-host-scripts/docker-build-image.sh $NOCACHE ${image_name} ${jenkins_port} ${debian_version} ${nojenkins}
 if [ "$priv" == "0" ]; then
     fuego-host-scripts/docker-create-container.sh ${image_name} ${container_name}
 else
     fuego-host-scripts/docker-create-usb-privileged-container.sh ${image_name} ${container_name}
 fi
 
+[ "$nojenkins" == "--nojenkins" ] && val=0 || val=1
+sed -i "s/\(^jenkins_enabled=\).*/\1$val/" fuego-ro/conf/fuego.conf
+
 # copy host's ttc.conf file (if present) into the fuego configuration directory
 sudo /bin/sh -c "if [ -f /etc/ttc.conf -a ! -f fuego-ro/conf/ttc.conf ] ; then cp /etc/ttc.conf fuego-ro/conf/ttc.conf ; fi"
 
-- 
2.34.1



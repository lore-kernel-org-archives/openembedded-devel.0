Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1UCgVM-0000LX-9z
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 02:17:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2510qDR005944
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Mar 2013 17:00:52 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 4 Mar 2013 17:00:50 -0800
From: <rongqing.li@windriver.com>
To: <yao.zhao@windriver.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Mar 2013 09:00:49 +0800
Message-ID: <1362445249-12669-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Joe.macdonald@windriver.com
Subject: [meta-networking][PATCH] tftp-hpa: make init script work
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
X-List-Received-Date: Tue, 05 Mar 2013 01:17:28 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

1. fix the daemon name, it should be in.tftpd-hpa
2. root directory should be /var/lib/tftpboot, since /var/lib/tftpboot has been
installed, but /srv/tftpboot not

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-daemons/tftp-hpa/files/default   |    2 +-
 meta-networking/recipes-daemons/tftp-hpa/files/init      |    2 +-
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/default b/meta-networking/recipes-daemons/tftp-hpa/files/default
index de2ed18..1dce7fd 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/default
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/default
@@ -1,3 +1,3 @@
 #Defaults for tftpd-hpa
 RUN_DAEMON="yes"
-OPTIONS="-l -s /srv/tftpboot"
+OPTIONS="-l -s /var/lib/tftpboot"
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta-networking/recipes-daemons/tftp-hpa/files/init
index 5ad8c52..0561ff6 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/init
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
@@ -18,7 +18,7 @@ set -e
 
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 DESC="HPA's tftpd"
-NAME=in.tftpd
+NAME=in.tftpd-hpa
 DAEMON=/usr/sbin/$NAME
 PIDFILE=/var/run/$NAME.pid
 SCRIPTNAME=/etc/init.d/tftpd-hpa
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index af48455..c116121 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -11,7 +11,7 @@ LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://MCONFIG.in;beginline=1;endline=9;md5=c28ba5adb43041fae4629db05c83cbdd \
                     file://tftp/tftp.c;beginline=1;endline=32;md5=988c1cba99d70858a26cd877209857f4"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.tar.bz2 \
            file://tftp-0.40-remap.patch \
-- 
1.7.10.4




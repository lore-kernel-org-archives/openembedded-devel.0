Return-Path: <eduardo@monkey.io>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 732F86FA7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 17:00:19 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ij19so1487843vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jun 2014 10:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q/nu77ODs1nvLZY0j1BsZV/fc2JIsqKEK0w5Nzka8zY=;
	b=f8EfPP2CAkei7MJ+J+Y4++qveKSbt5GJ613tcZzdv8O1vRvx1IEvHcG3gHRe7iD2yw
	K808QPnKCfbNWW7ggCpnLy3VLjr2MrVlnIAWKMJhJFBv/ArjnRRiH/fiEmrpxzhXJinh
	nCgraEBFzQ6N+U4ahfKuqcpE7mBDl6w78JNiBJdyzDNDYw+h/1HeO418XR9H/i2biY97
	u2uEbz0oUkH081NaZahgSdb889Y4AvwETw2e06CxBvMfUNxg6GVt4egLAKiJA3tPiT/y
	TXOU0+FOBPjzGMpK1LNNsNlRH6MD6uTsUpNBgx7MDMcM1K/xTUVagfwDIir1AHkcRJ26
	GgcA==
X-Gm-Message-State: ALoCoQnMTCIl/uic4bQEhChMHJuucZEuWDPxYzAQ1g60Imd1yvL+7gp4/c8GLjnf5V8xIEDFg1Ih
X-Received: by 10.58.196.231 with SMTP id ip7mr3596731vec.47.1401987620577;
	Thu, 05 Jun 2014 10:00:20 -0700 (PDT)
Received: from localhost.localdomain ([186.32.221.184])
	by mx.google.com with ESMTPSA id
	rl15sm10785507vdb.25.2014.06.05.10.00.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jun 2014 10:00:19 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jun 2014 11:00:07 -0600
Message-Id: <1401987607-32495-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Thu, 05 Jun 2014 17:00:24 -0000

This patch adds the Monkey HTTP Server v1.5.0 recipes. The content
on this patch includes the modifications suggested by people in the
Maling List.

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
new file mode 100644
index 0000000..07a202f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Fast and Lightweight HTTP Server for Linux"
+HOMEPAGE = "http://monkey-project.com"
+BUGTRACKER = "https://github.com/monkey/monkey/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+SECTION = "net"
+
+SRC_URI = "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
+SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3"
+SRC_URI[sha256sum] = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7"
+
+EXTRA_OECONF = " \
+             --plugdir=${libdir}/monkey/ \
+             --logdir=${localstatedir}/log/monkey/ \
+             --pidfile=${localstatedir}/run/monkey.pid \
+             --default-user=www-data \
+             --datadir= ${localstatedir}/www/monkey/ \
+             --sysconfdir=${sysconfdir}/monkey/ \
+             --enable-plugins=* \
+             --disable-plugins=polarssl \
+             --debug \
+             --malloc-libc \
+"
+
+inherit autotools pkgconfig update-rc.d systemd
+
+INITSCRIPT_NAME = "monkey"
+INITSCRIPT_PARAMS = "defaults 70"
+
+SYSTEMD_SERVICE_${PN} = "monkey.service"
+
+FILES_${PN} += "${localstatedir}/www/monkey/"
+
+CONFFILES_${PN} = "${sysconfdir}/monkey/"
-- 
1.9.1



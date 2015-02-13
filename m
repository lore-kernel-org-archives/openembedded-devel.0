Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B51027341E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:28 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u56so14686138wes.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=E/IL2t83+6cAhFJ35a0YALFqP3GedFSrH1ZEjuJ6Tno=;
	b=tyciQ1pCPlsBkTLu4O2Rzfj1FLc3qFPTs8/jvFt7SUXZz1OWSgOd7QUOGER+dKOQGE
	7bwRce3JsmNOATGxqmg5pd2+PTF4HBVg9T/M7PDP/tB8SjW5T+A8/7K0R3ExOM7a0VXM
	M6ulnsFU3rvDBYt1Iav0APfVNzTM0b+R1PXGVjtkwBCO6oc5Sg5K5sMmZGh3c6wxNRlD
	Ghp6kuypQP7JYqUwX+uz27eu6vWgHDROoPA8Cy/iDxr1SAOlE/prDh7oP9BSyB+qkR1T
	gFyjfN0wMPwQ2a5F38+ulINFg9ol3nhADq7rfWTXgcSBb5z2EaBj4lNDyyytmKareuRv
	c9zw==
X-Received: by 10.180.21.210 with SMTP id x18mr12920737wie.78.1423810949483;
	Thu, 12 Feb 2015 23:02:29 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:51 +0100
Message-Id: <1423810919-9857-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 11/19] xfce4-cpufreq-plugin: update to 1.1.1
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../cpufreq/xfce4-cpufreq-plugin_1.1.0.bb                 | 15 ---------------
 .../cpufreq/xfce4-cpufreq-plugin_1.1.1.bb                 |  9 +++++++++
 2 files changed, 9 insertions(+), 15 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
deleted file mode 100644
index 7a99b4f..0000000
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Panel plugin to display frequency of all cpus"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
-
-inherit xfce-panel-plugin
-
-SRC_URI[md5sum] = "dcc56af0e19266956c297d124ba551f4"
-SRC_URI[sha256sum] = "eafa261bf984231ed8487c08decea6d916339d82b52f4bbe748e5c6a95c7f6b6"
-
-# defaults in xfce4-panel-plugin.bbclass don't match so override here
-FILES_${PN} = "${datadir}/icons ${datadir}/xfce4 ${libdir}/xfce4/panel/plugins/*.so*"
-
-# *.so are required for plugin detection
-INSANE_SKIP_${PN} = "dev-so"
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb
new file mode 100644
index 0000000..224f85f
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Panel plugin to display frequency of all cpus"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "cc3447ee6663f2946fce86308ba3566b"
+SRC_URI[sha256sum] = "474c45c007e65bfc107d6bcc902330c5e964906e6da120af48f7e2dba7f5cae7"
-- 
1.9.3



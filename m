Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLP-000286-Ty
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:11 +0200
Received: by werg55 with SMTP id g55so1925828wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=I6IRtsvJ05m8imA0ApeMH5gTn4kARNW5Gk10ift1uZg=;
	b=zsGiEFMx6VpJPtpQip/oG1qlIUcQeqBqKTYuWbRM9uk39LlnFDtRobze43TNj9B8Ls
	2601PtexSCS9SAnm50ASH9YDMTcOi3XuFqMBVmMh839lcraA65PI7iGNiIg2OV3hrQhp
	BtCQbF4wK3Ax6JAkL4OxBjhVI/3zZQy6c5W871FbSDVdSmvOuj612IrKKvzgiN66/pgi
	WqCjP6xvSEti3d5qgbR1KI6g0MRWP3PyMLnFWlRLCNQqcpa3hsPlQWiif1UmFOzp/1Ai
	tSA/fb6KZUzDGwwKw+Zp4hs4GHBHkm5TYaJgBO2ygbfbNWtZj6xARElmhIkt3fa1/Oxf
	a6sw==
Received: by 10.216.143.147 with SMTP id l19mr1252906wej.59.1338639109768;
	Sat, 02 Jun 2012 05:11:49 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:48 +0200
Message-Id: <1338639361-23775-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 02/15] xfce4-xkb-plugin 0.5.4.3 inital add
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on angstrom/overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/xfce4-xkb-plugin_0.5.4.3.bb                |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
new file mode 100644
index 0000000..8ec7fd2
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.5.4.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "XKB layout switching panel plug-in for the Xfce desktop environment"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-xkb-plugin"
+SECTION = "x11/application"
+LICENSE = "Alexander_Iliev"
+LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "libxklavier libwnck librsvg"
+
+SRC_URI[md5sum] = "b31144bd50875ec73f0b3101456c97fd"
+SRC_URI[sha256sum] = "ca4801bb2edfe04eeceb71879b3cf79a0674e8311c39117efdb9d3521307396d"
+
+FILES_${PN} += "${datadir}/xfce4/xkb"
-- 
1.7.4.4




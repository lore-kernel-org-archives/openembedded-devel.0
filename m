Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyle-0001l8-HA
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:14 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=HaT47ZH1VeSrr6mnh4hxQ20jFlQuvZ1q5SvfTmgemS0=;
	b=XaDfayIOrLiTYIsjzU5PBAvmeBon2cDsI1tlzLLJqcCYtLKpzQMHWtMVJE4bvWjPFr
	mE0jnulljJ9Hz18oNTQPF4i4DK0kSQV+aoOft97VWfBLjcyZAn9YLUlokhYE5wp/0CT5
	Wvab6fxF8/IPLfcsCFQa7I2tsJ+SWZL1N8EScu83mEYts+XbxQpEDLXn8SXwC5j7+8L1
	RMgWZr/CkEY4tH7deO2ZCTro1C6Erg8ke5qv4U+SsRttnWbxvLCkzrkUmdl8JvG5bmks
	J34fRtg1JajDwlTJLfXiLgP4LHhUqKeMNSZ6YddSvIMhBCEgnxOTEPcm8VAUrMCytmF5
	Bzsw==
Received: by 10.205.135.146 with SMTP id ig18mr156013bkc.80.1347977676811;
	Tue, 18 Sep 2012 07:14:36 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:56 +0200
Message-Id: <1347977601-28665-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 15/40] xfwm4-themes: initial add 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb

diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
new file mode 100644
index 0000000..c018cb5
--- /dev/null
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Additional (old) themes for Xfwm4"
+SECTION = "x11/wm"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+inherit xfce
+
+SRC_URI = "http://archive.xfce.org/src/art/${PN}/${@'${PV}'[0:4]}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "eaa58362053a3549c8be0b32efd3c54f"
+SRC_URI[sha256sum] = "3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada66fd575"
+
+# using xfwm4-theme as in xfwm4 might cause warnings of packages supplied by
+# multiple providers. So we use xfwm4-old-theme here.
+python populate_packages_prepend () {
+    themedir = bb.data.expand('${datadir}/themes', d)
+    do_split_packages(d, themedir, '^(.*)', 'xfwm4-old-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
+}
+
+PACKAGES_DYNAMIC += "xfwm4-old-theme-*"
-- 
1.7.6.5




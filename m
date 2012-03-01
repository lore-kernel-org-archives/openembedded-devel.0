Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S36RH-0006fj-Td
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Mar 2012 14:53:00 +0100
Received: by ghbz2 with SMTP id z2so170795ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 05:44:29 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.186.1 as permitted sender) client-ip=10.236.186.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.186.1 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.186.1])
	by 10.236.186.1 with SMTP id v1mr7275819yhm.4.1330609469929 (num_hops =
	1); Thu, 01 Mar 2012 05:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Vg2+83tIp7t9REgsaWep3UqnrDdmFrL0zrYi0BhxMXY=;
	b=hkzHP2PLA6phhorOUrCaf8edOnLXiFb2X3CF38ca/wgIX/uMYEKkWUVHlqfuoF/Qyq
	4A5DF2oO/bCw0i9k6YQAWjPswDjoTOFWXKsSgTzz25CDm3awyLYcu21H31qSeSrwGQgB
	ULr99TiNDUQGTl9wwZCJKG0YSyq600VG0iejg=
Received: by 10.236.186.1 with SMTP id v1mr5670803yhm.4.1330609469884;
	Thu, 01 Mar 2012 05:44:29 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id 32sm3085547anu.14.2012.03.01.05.44.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 05:44:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2012 13:44:21 +0000
Message-Id: <f11d949f4308dfac11d367a72761c155f1c69d01.1330609446.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330609446.git.otavio@ossystems.com.br>
References: <cover.1330609446.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/1] numlockx: add 1.2
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
X-List-Received-Date: Thu, 01 Mar 2012 13:53:00 -0000

---
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb

diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
new file mode 100644
index 0000000..0d4d9ff
--- /dev/null
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Enable NumLock in X11 sessions"
+HOMEPAGE = "http://home.kde.org/~seli/numlockx/"
+SECTION = "x11/apps"
+DEPENDS = "imake-native virtual/libx11 libxtst"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dcb1cc75e21540a4a66b54e38d95b047"
+
+SRC_URI = "http://home.kde.org/~seli/numlockx/numlockx-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
+SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
+
+inherit autotools
+
+EXTRA_OECONF = "--x-includes=${STAGING_INCDIR} \
+                --x-libraries=${STAGING_LIBDIR}"
+
+do_configure_prepend() {
+    # remove this from acinclude.m4 or build fails
+    sed -i '/_AC_PATH_X_XMKMF/d' ${S}/acinclude.m4
+}
-- 
1.7.2.5




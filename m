Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S3FmD-0006o8-LC
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 00:51:13 +0100
Received: by ghbz2 with SMTP id z2so560775ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2012 15:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.192.230 as permitted sender) client-ip=10.236.192.230; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.192.230 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.192.230])
	by 10.236.192.230 with SMTP id i66mr10117997yhn.116.1330645362968
	(num_hops = 1); Thu, 01 Mar 2012 15:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1QWhIN5WMmUMC8Q0lolMdplAvXNoQSnBm87+KAzDJvA=;
	b=YE2lPmzHPs6LO0XXdXFkeae5yj4eos6Kn8QTzK6TPmjrNkW0arIQqlainfc08PTs0O
	LQReqaLLMsbRhAt1LDYTmwTZjKIrtRYkptqbW2/YoXuwAyOQ3lRjUnBI0dqXYBl4UNIc
	OTEPEI7ri6P4O/3avgBdsMgfpuSYnr06kqNB0e6KZupTQXCmUVhkPsWiwDegNM/PIjWE
	x9XAA0VWfU8RpntnqV/AZrIIQQYpgCTV+nAtoVATXcGuKq5xzR6F8RgjqTqswOILOn1l
	kzlFqZEQ+VzH1TtY3fVAznIHN+e+yMPx5NfKVI5Pnq4rf2u8AJQ1s9t2pbe0QRxuDXHi
	LAXA==
Received: by 10.236.192.230 with SMTP id i66mr8026093yhn.116.1330645362916;
	Thu, 01 Mar 2012 15:42:42 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b6sm5845638anc.3.2012.03.01.15.42.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 15:42:25 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Mar 2012 23:42:18 +0000
Message-Id: <46abda05bc9fd0b2156cb7f6fffaf8acb0d180f1.1330645326.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330645326.git.otavio@ossystems.com.br>
References: <cover.1330645326.git.otavio@ossystems.com.br>
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
X-List-Received-Date: Thu, 01 Mar 2012 23:51:13 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb

diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
new file mode 100644
index 0000000..daa2c52
--- /dev/null
+++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Enable NumLock in X11 sessions"
+HOMEPAGE = "http://home.kde.org/~seli/numlockx/"
+SECTION = "x11/apps"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dcb1cc75e21540a4a66b54e38d95b047"
+DEPENDS = "imake-native virtual/libx11 libxtst"
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




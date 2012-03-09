Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wy3-0004Fp-Ap
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:35 +0100
Received: by wera1 with SMTP id a1so1016539wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=DG5SO33VsVi9OoGNOQPHlyjnOiAoTSNUNmZHZNCyNBM=;
	b=GlTGyyiA4PXkMCcGPkJnTjWAXcp6ZexkMGc51HGX78o4uOBMQiRw5dL+1UhyFmnGQi
	zbU/GX2W1vdBakjYf00BUsh0R/lJa6b2gTXtjVBnx81eTGBPOYbD3uV1mj2kMgUSMJLr
	Tbm4VV8K566GzDKSeFQb+1B21pvzrVwFiQf6HSb2ew6AyIuaeJ2YPf0BCduKuIxMH8ZR
	j9GBulGLEd4VlELz9tQUR5YPyvg/8A/HlllVS2GW1xs2oM4sOlp4HhY5wSrZPGXf0wxp
	v0Zds+bC+Uu7dhKTIF1RNo6MSxdwJlZlZdsM87OMPRWDQKchKdOTTsnYrGRQKtUv53Aq
	waWQ==
Received: by 10.180.97.41 with SMTP id dx9mr3319760wib.9.1331288036295;
	Fri, 09 Mar 2012 02:13:56 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.13.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:13:55 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:50 +0100
Message-Id: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Subject: [meta-oe 1/6] cherokee.inc: add DEPENDS to mysql5
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error in do_configure.log was:
checking for mysql_config... /usr/bin/mysql_config
checking for MySQL libraries... yes
checking for mysql.h (using mysql_config --cflags)... no
checking if MySQL version is >= 5.0.0... yes
...

ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/home/andreas/tmp/oe-core-eglibc/work/armv7a-angstrom-linux-gnueabi/cherokee-1.2.98-r0.0/cherokee-1.2.98'
ERROR: Function failed: do_qa_configure

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/cherokee/cherokee.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee.inc b/meta-oe/recipes-connectivity/cherokee/cherokee.inc
index 114dbba..1e09dbf 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee.inc
+++ b/meta-oe/recipes-connectivity/cherokee/cherokee.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 INC_PR = "r0"
 
-DEPENDS = "libpcre openssl ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://www.cherokee-project.com/download/1.2/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init \
-- 
1.7.6.4




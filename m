Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nagos1@gmail.com>) id 1SG2FH-00056y-QH
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 08:02:05 +0200
Received: by bkcjg15 with SMTP id jg15so1914164bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=bLB1GBXexExOSY350sSixdaSX299nA4wPw5QzMrvIAs=;
	b=c3M4RK3B71ZYgX80ZXz2Fgt/aR1qy2FDWz2yeELzDGidxt9jJLoy2Umy7dO9EsO98u
	HxOM5w/LX4kq++I52MI5iLSKg2jJDBtnWC5mcgg4vL2ZaTiAcy2AUGRt5xOAzdwsLDeJ
	8NABPMkMSoEWywWZt/NuDiQnMSNNsoaSGr889i8vFjqrGdOUxxJ+HaetNFV2u0PP6rXO
	X3mu+YRbcDpCCu1cbsIDy1mnR8yAbAvBb77e+7cU+6owt6dMmNTyMPQIIEpQDak4u5Hj
	COV4oODOXayfG/g0RjZNwjue3enabRW+Nj4LRS0cE7bhUA3qBM6x2G7H2pYp/y7wD1Wq
	+IvQ==
Received: by 10.204.153.215 with SMTP id l23mr2572948bkw.11.1333691571251;
	Thu, 05 Apr 2012 22:52:51 -0700 (PDT)
Received: from localhost.localdomain ([188.134.85.103])
	by mx.google.com with ESMTPS id f11sm1814294bkw.6.2012.04.05.22.52.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 22:52:50 -0700 (PDT)
Sender: =?UTF-8?B?0JLQu9Cw0LTQuNC80LjRgCDQr9C60L7QstC70LXQsg==?=
	<nagos1@gmail.com>
From: Vladimir Yakovlev <nagos@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2012 09:52:43 +0400
Message-Id: <1333691563-4317-1-git-send-email-nagos@inbox.ru>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] New version of picocom-1.7 with corrected URI
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
X-List-Received-Date: Fri, 06 Apr 2012 06:02:05 -0000

Used URI from project on googlecode.

Signed-off-by: Vladimir Yakovlev <nagos@inbox.ru>
---
 recipes/picocom/picocom_1.7.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/picocom/picocom_1.7.bb

diff --git a/recipes/picocom/picocom_1.7.bb b/recipes/picocom/picocom_1.7.bb
new file mode 100644
index 0000000..5633584
--- /dev/null
+++ b/recipes/picocom/picocom_1.7.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Lightweight and minimal (~20K) dumb-terminal emulation program."
+SECTION = "console/utils"
+PRIORITY = "optional"
+LICENSE = "GPL"
+PR = "r2"
+
+SRC_URI = "http://picocom.googlecode.com/files/picocom-${PV}.tar.gz \
+           file://gcc4.patch"
+
+CFLAGS_append = ' -DVERSION_STR=\\"${PV}\\"'
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${PN} pcasc pcxm pcym pczm ${D}${bindir}/
+}
+
+SRC_URI[md5sum] = "8eaba1d31407e8408674d6e57af447ef"
+SRC_URI[sha256sum] = "d0f31c8f7a215a76922d30c81a52b9a2348c89e02a84935517002b3bc2c1129e"
-- 
1.7.1




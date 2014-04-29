Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 738DE60E24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 13:32:40 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so430962wiv.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N+iiKnuhJgY7/vwuzbwsfDTh1vjkx1Wi/+AgHQ9JPDI=;
	b=f6fIWu+pDktWND+IIpqpX6VU838cgP3xPaVOiSs2nRcp5EcJvpFU6YZ5M3RQfDPGPo
	jWKjQNCla/JqqqLdmMkq4sd8QENOVNWiFPSbfZiARYNDI4mmIjm5u39uFG9PHxK3YKrK
	tW55kqTmmywDS96xqG7EABvyJ+lYqzdhSbb4bwN3i8ko2MbGn9XFAghLEb5+NhfZ0wFz
	nmjDcscBN5ADI7cA7shci2HaljFpYTQ2sC5qzLaTlnX/ZjBWD5s0GkInJxMZBlClIfQv
	5/F/Aj7Wh67itMc22g0pXTbFJ8FCXG2GWcbozB5/G8N3W632JzRjxfhIAVJ/rLREs3UI
	HJXA==
X-Gm-Message-State: ALoCoQkHb6PAqYQq1FcLAiLpKupLLcNWwbQfE57Yt9Hm4YwZjZtLY4E5lqSWM+PkOJ4w7wSATv3n
X-Received: by 10.180.76.116 with SMTP id j20mr20355734wiw.21.1398778361767;
	Tue, 29 Apr 2014 06:32:41 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id b1sm31121789wjb.37.2014.04.29.06.32.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Apr 2014 06:32:40 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 15:32:36 +0200
Message-Id: <1398778356-14565-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2] mariadb: handle seperate builddir
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
X-List-Received-Date: Tue, 29 Apr 2014 13:32:44 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 37a0f0c..df0b1b5 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -28,7 +28,7 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit autotools binconfig update-rc.d useradd
+inherit autotools-brokensep binconfig update-rc.d useradd
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
@@ -59,7 +59,7 @@ EXTRA_OECONF = "--with-atomic-ops=up \
                 "
 
 do_configure_append() {
-    sed -i /comp_err/d ${S}/sql/share/Makefile
+    sed -i /comp_err/d ${B}/sql/share/Makefile
 
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
-- 
1.9.0



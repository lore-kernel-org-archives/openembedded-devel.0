Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 243BF65E98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 13:15:00 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x12so834255wgg.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 06:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IiONX2vuSJwN17rSUydBNOSyQWUMoivr5SX0Y23RjG0=;
	b=SNHieI9b1P+EPzzo9Tqmdb9KqhBcDmZKNdFIV8ah7N2f1xJ4sXMed0P75eJIL6nFZu
	wuTu1+ghKzd/gpImrOmiNY9xm0kpN4PbkuL7MN9qG8qob6UDxTLoulFshiMqgMhSyVlW
	vz3VcocMWB+wDoDhUkm3QpFvW2ahA42/Qyuxg+Tp6gPA8nRT/U2HZTfrgX4UfMtEPcID
	YhN3jDCDuxd9rfpYjjhLcDyrwFPUUGz9KPvVkzNm4M+5N8fsahglSrIS+OzkmYbVjazx
	0NztlUHNO5rGOURQNjE2dF5biu0Y8QK9r3qzm7lS3ks9tD5UIn5qu5xuhQAKuxeAB+jv
	dpjg==
X-Gm-Message-State: ALoCoQmaQP2mae03r1VYvJw35rGk3HveS74HBo4fJ22XIGN6KmNROzE47OM68qRN/O1zeOaqraG+
X-Received: by 10.180.78.5 with SMTP id x5mr15550754wiw.12.1398690900651;
	Mon, 28 Apr 2014 06:15:00 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id b2sm17721606wiz.15.2014.04.28.06.14.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Apr 2014 06:15:00 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2014 15:14:55 +0200
Message-Id: <1398690895-16245-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] mariadb: handle seperate builddir
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
X-List-Received-Date: Mon, 28 Apr 2014 13:15:06 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index 37a0f0c..2b0825a 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -59,7 +59,7 @@ EXTRA_OECONF = "--with-atomic-ops=up \
                 "
 
 do_configure_append() {
-    sed -i /comp_err/d ${S}/sql/share/Makefile
+    sed -i /comp_err/d ${B}/sql/share/Makefile
 
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
-- 
1.9.0



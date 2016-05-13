Return-Path: <yesipov@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0B05A6FFD8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 17:30:06 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id ww9so20054899lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 10:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uWECVjrW+cL9RJDTxSBbhcwKPESd+PXXHnIPEMXrbMk=;
	b=BPOrutx0rbufE5l2fncptOtO6tyzDwPn1O7UaT1ej2Xhq5Oi5m90vjEK9lTy8hjUpr
	ongoBLQe2QACkxDoRCsD/ZtZEOtWhwmcqkb8yDVGn7MYuryP+UYhIK6pRlLfoTgq/6Gm
	h2GXJU24772ysUOyQC/P2SJRPViCJoTXiGq6btH0bU+SaRxfy3q0JNv71qLxRMjW9+s7
	znzTRf6fUTZc2VAAPFnLhQ5IaCC21n8CBtyA+0loS8C4Hb22yXGM+YPN4Yba7vPXHoml
	dxCnp8yIGToEMYxaRs4IMumLhd8MCIZ26F8A07CpUGHhfICELoz8TvYCl/GeuyfNqZjz
	ZfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uWECVjrW+cL9RJDTxSBbhcwKPESd+PXXHnIPEMXrbMk=;
	b=G/QWzeMn+VAmIql6UhtKgDgofbrhYlgmMQJo5sBwMuLLptfAvWQt0sQDJuZYlzTGI3
	tfg4nrA8M07n0UOX3C4N4CwXJmipLuD3ltJPE6sTPKKPIzx11pg1PzSjuYHa5KaDOkin
	Cdbh3lwOVym5WWGXwUMik3GjaU3OelNK91lRN9vkmxEgRliDQyNODofNZP2zVfWqSx5Z
	/w3cTEjgvAS91K7PFR288ara0sitYIzDZxhxC3PHDVBaFcQnOB/hNJQR/I7H+E8xU1FL
	YHr6f401MpzByn9nS7tGxmbnjsJ4q3FGVkMIVhYXcrcyYwEIUoltb3z2NNGG6uJlv3T1
	awnQ==
X-Gm-Message-State: AOPr4FXrh3/1Vd+pqKbo2QBeAbRnYeGpv0dlj7nHvG7D0/YPojKShLYpF7hBXx0tmAbYCg==
X-Received: by 10.112.144.105 with SMTP id sl9mr7261949lbb.108.1463160606067; 
	Fri, 13 May 2016 10:30:06 -0700 (PDT)
Received: from nw.d-systems.local (mserver.d-systems.su. [109.236.68.122])
	by smtp.gmail.com with ESMTPSA id 28sm3133475lfx.43.2016.05.13.10.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 10:30:04 -0700 (PDT)
From: Kirill Esipov <yesipov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 20:29:34 +0300
Message-Id: <1463160574-8096-1-git-send-email-yesipov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] apache2: fix libtool's path in apxs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2016 17:30:07 -0000

libtool-cross recipe install it as ${HOST_SYS}-libtool

Signed-off-by: Kirill Esipov <yesipov@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
index 81151d1..ae2ec86 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.20.bb
@@ -116,7 +116,7 @@ apache_sysroot_preprocess () {
     install -d ${SYSROOT_DESTDIR}${sbindir}/
     install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}/
     sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
-    sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${TARGET_PREFIX}libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
+    sed -i 's!my $libtool = .*!my $libtool = "${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
 
     sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
     sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
-- 
2.7.4



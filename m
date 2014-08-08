Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id C97CC609B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 00:48:38 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so4979917wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Aug 2014 17:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zuTvEeNjtuEGlv/2QeZVb7iiP6ak7dWEAToRQxkelzw=;
	b=wEIHBG07Sl8qrNaWhUMcZn9O7QcgrOUbzxh0hMO4fF1A/p2Wc3Du3/De50zYXUC7WD
	1lceDiYbpeQupQ/dAG0bwnvuqGlQ3zsiQ7M1K7N0GiwU7BdEnFPYgE9v7yzboXt5ZYGl
	xXRKoHV/Q4+zFaIFBKDh+HpkOSKIMsnM6Pbi+rM4zxFXuJ0Z7QNjm8dLGlkztLdt5DNc
	cn0MOVGpR6GD6AUAWY4QKq8fmuDXkYxqj1ThXBasI5lcwaH2tGSOwXj2nO5WWsixi7xn
	uoEId2YaWab/7SAB0AErW9+t4ADajW7jD2893bSvzxG43D+ZG/KvqUXZziSsSPLKGGnQ
	ujqg==
X-Received: by 10.194.89.168 with SMTP id bp8mr28297988wjb.73.1407458919146;
	Thu, 07 Aug 2014 17:48:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm13459734wjq.39.2014.08.07.17.48.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 17:48:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Aug 2014 02:49:08 +0200
Message-Id: <1407458948-12306-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH] mariadb: fix build after groff-native was built
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
X-List-Received-Date: Fri, 08 Aug 2014 00:48:47 -0000

* when groff or nroff are detected, the build fails with:
| Scanning dependencies of target ps
| make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make -f dbug/CMakeFiles/ps.dir/build.make dbug/CMakeFiles/ps.dir/build
| make[2]: Entering directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i586-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
| [ 84%] Generating example3.r
| cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && sed -e 's!\\!\\\\!g' </work/i586-oe-linux/mariadb/5.5.38-r0/mariadb-5.5.38/dbug/example3.c
>example3.r
| /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i586-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
| [ 84%] Generating output1.r, output2.r, output3.r, output4.r, output5.r
| cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && ./factorial 1 2 3 4 5 > output1.r
| ./factorial: /lib/i386-linux-gnu/libc.so.6: version `GLIBC_2.17' not found (required by ./factorial)
| make[2]: *** [dbug/output1.r] Error 1
| make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make[1]: *** [dbug/CMakeFiles/ps.dir/all] Error 2
| make[1]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
| make: *** [all] Error 2
| ERROR: oe_runmake failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb_5.5.38.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
index 11b4046..1052a23 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
@@ -59,7 +59,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SUPPORTFILESDIR:PATH=${datadir_noprefix}/mysql-support-files \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
-                 -DCMAKE_AR:FILEPATH=${AR}"
+                 -DCMAKE_AR:FILEPATH=${AR} \
+                 -DGROFF=False -DNROFF=False \
+"
 
 do_configure_append() {
     # handle distros with different values of ${libexecdir}
-- 
2.0.4



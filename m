Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OS7sY-0006Qk-1J
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 14:19:41 +0200
Received: by fg-out-1718.google.com with SMTP id 22so2263047fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jun 2010 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=raZbJDoflOULSoQ76p3rLwy2OUPwV/pxQxbG6VPjh4g=;
	b=nfXZI5qwJ6qLwG5GEwUmNDZrTu1mP8JJIVqeyp+Hsdtje4m0p2/HF3CJZZ7wf+Wm8S
	o1zXNdJW3pBbByBKXdtnLJIq2pLzqsyF4aAVt1wA5SMP3q/FSAMKxZvzEuTAsqkuQjhT
	nUZuIbxe5yWp6/1sq8QO20gCVlDioKVAg12DA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UA9+CuZOmsRbbwu+oL0cv1j0cVIc/ks6QozKiLwXHGMCcXrdWJkzttcIs6UR2b5QIV
	e0F9ijkx4CF53K1GaopMFjpeeH+r1lk+BC1PFQof56EpKe0V54FQcCQtNURyjujH4XGP
	bod3G01+0iKBwVEA7RjzuY9Y0r/e09plBoN2M=
Received: by 10.223.123.211 with SMTP id q19mr257127far.63.1277468088328;
	Fri, 25 Jun 2010 05:14:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id d1sm14320564faa.22.2010.06.25.05.14.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 25 Jun 2010 05:14:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jun 2010 14:14:31 +0200
Message-Id: <1277468071-16312-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <E1OQm3w-00086b-S9@melo.openembedded.org>
References: <E1OQm3w-00086b-S9@melo.openembedded.org>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-package-sdk: skip stripping *.py files
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
X-List-Received-Date: Fri, 25 Jun 2010 12:19:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gcc/gcc-package-sdk.inc |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes/gcc/gcc-package-sdk.inc b/recipes/gcc/gcc-package-sdk.inc
index dd32ec7..014897a 100644
--- a/recipes/gcc/gcc-package-sdk.inc
+++ b/recipes/gcc/gcc-package-sdk.inc
@@ -55,8 +55,14 @@ do_install () {
 	# Manually run the target stripper since we won't get it run by
 	# the packaging.
 	if [ "x${OLD_PACKAGE_STRIP}" != "xno" ]; then
-		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libstdc++.so.*
-		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libg2c.so.* || true
-		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libgcc_s.so.*
+		for soFile in ${D}${prefix}/${TARGET_SYS}/lib/libstdc++.so.* ${D}${prefix}/${TARGET_SYS}/lib/libg2c.so.* ${D}${prefix}/${TARGET_SYS}/lib/libgcc_s.so.*; do
+			if echo ${soFile} | grep '.py$' ; then 
+				echo "Not stripping .py file ${soFile}"
+			elif echo ${soFile} | grep '*' ; then 
+				echo "Not stripping non-existent mask ${soFile}"
+			else
+				${TARGET_PREFIX}strip ${soFile}
+			fi
+		done
 	fi
 }
-- 
1.7.0.2




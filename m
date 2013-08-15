Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 773826B898
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:12 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so184626eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9pQkrWGqSB0WIunylSmbiexALTlhGU9f2l2sMNxEuXU=;
	b=S2Z3SGeR3l96tbv32AxojaD0KU4BwPjCw87Mbx2uebJeyp2yfiyUqwqdztqTcV83o8
	mSGbFS2St081nId7kkvufdCdeKPdTz6l449rWGZr8f8AznoDpqoT5X1SyMSVP2PtcgU+
	cxFClnF//CM74fuRpoiZF/NtywCxKmR9gE3eBe4nm5+f90b+bPE4nJzM54RZzG3g8FOG
	bjNusAkvpM8gRJAR2N0artKiIJyXjBYKiQWEDdyHvKNNXQRDtRw7s3hHGRg4DZG7OyaO
	iVZ7SQ7Xa3qW9BAQtd4n85VWOhUG2RK3GZr471fkgfwC7M4HkpZF5CshgCrObD1CoQSb
	W1RA==
X-Received: by 10.15.22.69 with SMTP id e45mr2429504eeu.59.1376551212874;
	Thu, 15 Aug 2013 00:20:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm81939549eem.1.2013.08.15.00.20.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:40 +0200
Message-Id: <57cca280c5facc4beaa09220179a714abe5a32a7.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 60/60] cifs-utils: inherit pkgconfig
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:13 -0000

* it fails in do_configure without it
  configure.ac:99: error: possibly undefined macro: AC_MSG_ERROR
       If this token and others are legitimate, please use m4_pattern_allow.
       See the Autoconf documentation.
  configure.ac:140: error: possibly undefined macro: AC_MSG_WARN
  autoreconf: sysroots/x86_64-linux/usr/bin/autoconf failed with exit status: 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index dde1cc7..3d15ff3 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
 
-inherit autotools
+inherit autotools pkgconfig
 
 do_install_append() {
     # Remove empty /usr/bin and /usr/sbin directories since the mount helper
-- 
1.8.3.2



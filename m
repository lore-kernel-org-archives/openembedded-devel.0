Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7CA70731A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 15:48:17 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id a17so38503577wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tNkxUfToTOTruU/WPDJSoqb9bBqMsjwIiG3zCqI0UpI=;
	b=ihT6GinOVgGEZM1G7nTEruK8Y4lCzt2KMMc4v4kAUc2d74P2MIVVGMV54EIfAxHXio
	DF6ZY1DB+tR18nPSZFiJ48pOSLelP5yGvsKvjejRux+vHllJFptqHKa1wBT58zw/V0LZ
	z3GuLKmqxfzXFrt5FBG6v7NMI+gL6S+JLXWJzF4CWsbacAVH1GyPp+g+JfO+ZNWpbxPw
	bHhTtTk9XxPKdxQKecWc+6E3CNh051oNRTgGf7jlGkYxclpMqV67QGD5ra6y2o1w2px9
	6owjvMMVmf8p8YX15zfUuCrtmto9EqM9wqZruD/Kdzyvj/6qmYRMQHsE13SDknnvAVXm
	jguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tNkxUfToTOTruU/WPDJSoqb9bBqMsjwIiG3zCqI0UpI=;
	b=DJv+jyx1iG2hzj6BQRaOd8BbUTv7J7nQTpKhQemtee9jpSiH67wZK5+OVh0nLDx8SI
	gZAS3YBLyTcQQYQhmYW++ao/x5XcAopmb2YgnilK3VSIn4hV9FWiaUwONnsR0wHHNQNd
	ThcSMR5mKRvQeJClpFdG6THM0pVW9lV86ykYnNWJUmb3vqP7h+Jj+MQI73SEUCvS0qZ+
	ydYpcufqOuriyBXz5CMgFpjX/cILyt0Op6LNJJSPLC1qV13dH+ie1xXMntO8/xMXWnYP
	8ht8e1Es+zhjHtq6pXvwGCnfWNgHNKerfrz7vxGui0n5FwIHI2Z6yVZAarLKpJCoRHY8
	pK4A==
X-Gm-Message-State: AOPr4FWlrN1+CgxHrqkjf+D1Eyo63/a7vkjG67/Yk3sJVjQg4AUJc8zjhPFDHoakMbZ2CVX+
X-Received: by 10.28.8.213 with SMTP id 204mr26300546wmi.93.1463500097131;
	Tue, 17 May 2016 08:48:17 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	xz3sm3811837wjb.10.2016.05.17.08.48.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 08:48:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 16:48:14 +0100
Message-Id: <1463500094-11749-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] llvm: make llvm-config wrapper error message more understandable
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
X-List-Received-Date: Tue, 17 May 2016 15:48:17 -0000

The llvm-config wrapper has an error message that is quite abrupt, expand it so
it helps the user.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-core/llvm/llvm-common/llvm-config | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/llvm/llvm-common/llvm-config b/meta-oe/recipes-core/llvm/llvm-common/llvm-config
index a9a416d..b0f33c8 100644
--- a/meta-oe/recipes-core/llvm/llvm-common/llvm-config
+++ b/meta-oe/recipes-core/llvm/llvm-common/llvm-config
@@ -4,7 +4,8 @@
 if [ $WANT_LLVM_RELEASE ]; then
 	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE ${@}
 else
-  echo "The variable WANT_LLVM_RELEASE is not defined and exported"
-	echo "by your build recipe. Go figure."
-  exit 1
+	echo "To use llvm-common WANT_LLVM_RELEASE needs to be exported."
+	echo "For example if this is being called through a recipe:"
+	echo "export WANT_LLVM_RELEASE=\"3.3\""
+	exit 1
 fi
-- 
2.8.0.rc3



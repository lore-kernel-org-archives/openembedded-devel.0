Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 11DDA733B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEiuWr025022; Fri, 13 Feb 2015 14:44:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3G0qTCiTSn2O; Fri, 13 Feb 2015 14:44:57 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEipBv024980
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:52 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU6-000270-Fj; Fri, 13 Feb 2015 14:44:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:30 +0000
Message-Id: <1423838674-8066-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] lttng-tools: 2.5.3 -> 2.6.0
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
X-List-Received-Date: Fri, 13 Feb 2015 14:44:59 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/{lttng-tools_2.5.3.bb => lttng-tools_2.6.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.5.3.bb => lttng-tools_2.6.0.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
index 87052eb..23eeb45 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 DEPENDS = "liburcu popt lttng-ust libxml2"
 RDEPENDS_${PN}-ptest += "make perl bash"
 
-SRCREV = "75d966798cf8cbe8ca12773c2bf2822983bd78a3"
+SRCREV = "d522c1f14285e2e8b10b7c0cd011847696ffe779"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
                  am_cv_python_pythondir='${libdir}/python${PYTHON_BASEVERSION}/site-packages' \
@@ -22,7 +22,7 @@ PACKAGECONFIG ??= "lttng-ust"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python swig-native"
 PACKAGECONFIG[lttng-ust] = ", --disable-lttng-ust, lttng-ust"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.5 \
+SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.6 \
            file://runtest-2.4.0.patch \
            file://run-ptest \
 	  "
-- 
2.1.0



Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4C626FF84
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 05:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBS5sYqp021106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 27 Dec 2017 21:54:34 -0800
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 27 Dec 2017 21:54:33 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 28 Dec 2017 13:53:00 +0800
Message-ID: <1514440380-21337-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-oe][PATCH] leveldb: fix checking for SSE flag
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
X-List-Received-Date: Thu, 28 Dec 2017 05:54:35 -0000
Content-Type: text/plain

The build_detect_platform-Check-for-__SSE4_2__.patch tries to use fgrep
with pipe to get the SSE flag. But actually it would fail with error:
fgrep: /tmp/leveldb_build_detect_platform-cxx.25886: No such file or
directory

That means it can not get the correct SSE flag.
We should make sure the fgrep command runs after g++ command has
finished and redirect the stdout and stderr to /dev/null to avoid make
error:
Makefile:18: *** missing separator. Stop.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
index bbabf68..8f93cb3 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
+++ b/meta-oe/recipes-extended/leveldb/leveldb/0001-build_detect_platform-Check-for-__SSE4_2__.patch
@@ -19,14 +19,15 @@ Index: git/build_detect_platform
 ===================================================================
 --- git.orig/build_detect_platform
 +++ git/build_detect_platform
-@@ -230,13 +230,12 @@ EOF
+@@ -224,13 +224,13 @@ EOF
      rm -f $CXXOUTPUT 2>/dev/null
  
      # Test if gcc SSE 4.2 is supported
 -    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -msse4.2 2>/dev/null  <<EOF
-+    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null | fgrep __SSE4_2__ $CXXOUTPUT 2>/dev/null  <<EOF
++    $CXX $CXXFLAGS -Werror -x c++ - -o $CXXOUTPUT -msse4.2 -dD -E 2>/dev/null  <<EOF
        int main() {}
  EOF
++    eval fgrep __SSE4_2__ $CXXOUTPUT >/dev/null 2>&1
      if [ "$?" = 0 ]; then
          PLATFORM_SSEFLAGS="-msse4.2"
      fi
-- 
2.7.4



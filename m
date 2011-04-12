Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1Q9hJu-00006t-VS
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 19:24:07 +0200
Received: by qyk27 with SMTP id 27so5346079qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=MW81NSHF+AWJjweX8ju8BP+XJ7cVY1T5PfSo6QrPy3k=;
	b=UIZpski8IJRNgnKRAi9AiwQAejuFGxwUKmwtOmD4+uEd/Gixm4gL157OZCM8KpaCoX
	yVO8f7/41GCqn4FBw61ZT7NYmfkJKxSByoYYXhPGLiRhyTeQMxFADbq/6d+92S4oISsP
	N/+4c/ndW+HCxdUekG9gjevBlY81WFGNvmOGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vCb/+PbNGKp5Y2+WNYgcDR0nkWWtE2CdGdvd8f6BlEVHI64/fLXe9DvF72w3bDcJsg
	Ud36vzFO8U4ksnjcxVI6EKcrQ61tCBWASrycPrVrcXEwbRmWOFdSlnmczqtYguXTu75N
	TSB3fiU5ptb8bwXni4w7mIBPDkAmeiW+UumB0=
Received: by 10.224.210.197 with SMTP id gl5mr4412178qab.248.1302628912206;
	Tue, 12 Apr 2011 10:21:52 -0700 (PDT)
Received: from localhost.localdomain (gamari.physics.umass.edu
	[128.119.56.223])
	by mx.google.com with ESMTPS id m15sm3689017qck.33.2011.04.12.10.21.50
	(version=SSLv3 cipher=OTHER); Tue, 12 Apr 2011 10:21:51 -0700 (PDT)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2011 13:21:43 -0400
Message-Id: <1302628903-1500-1-git-send-email-bgamari.foss@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] boost: Change HOST_* to BUILD_*
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
X-List-Received-Date: Tue, 12 Apr 2011 17:24:07 -0000

It seems the HOST_* variables no longer exist?
---
 recipes/boost/boost-with-bjam.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/boost/boost-with-bjam.inc b/recipes/boost/boost-with-bjam.inc
index 68d9e74..dd0a3a3 100644
--- a/recipes/boost/boost-with-bjam.inc
+++ b/recipes/boost/boost-with-bjam.inc
@@ -129,7 +129,7 @@ BJAM_OPTS    = '${BJAM_TOOLS} \
 
 do_configure_prepend() {
 	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
-        echo "using gcc : host : ${HOST_CXX} : <cxxflags>${HOST_CFLAGS} ${HOST_CXXFLAGS} <linkflags>${HOST_LDFLAGS} ;" >> tools/build/v2/user-config.jam
+        echo "using gcc : host : ${BUILD_CXX} : <cxxflags>${BUILD_CFLAGS} ${BUILD_CXXFLAGS} <linkflags>${BUILD_LDFLAGS} ;" >> tools/build/v2/user-config.jam
         echo "using gcc : target : ${CXX} : <cxxflags>${CFLAGS} ${CXXFLAGS} <linkflags>${LDFLAGS} ;" >> tools/build/v2/user-config.jam
         echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> tools/build/v2/user-config.jam
 
-- 
1.7.0.4




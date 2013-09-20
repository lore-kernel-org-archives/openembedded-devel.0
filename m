Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F265360EE1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2013 02:35:28 +0000 (UTC)
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8K2ZTX0023060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 19 Sep 2013 19:35:30 -0700 (PDT)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1VMqZ7-0007Qx-BJ; Thu, 19 Sep 2013 22:35:29 -0400
Date: Thu, 19 Sep 2013 22:35:29 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130920023529.GA28484@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: distutils: Replacing path to native path only to be done to non-native python packages
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
X-List-Received-Date: Fri, 20 Sep 2013 02:35:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

distutils: Replacing path to native path only to be done to non-native python packages

distutils: Replacing path to native python by path to python in the
image to support python packages with console-script setup resulted in
a "bad interpreter" error message because coreutils-native is not
a specified dependency of a number of native python packages.

We modify the change to apply specifically to non-native packages.

Signed-off-by: Amy Fong <Amy.Fong@windriver.com>
---
 meta/classes/distutils.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 60cf9ee..fbe0ec8 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -47,14 +47,18 @@ distutils_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+                if [ ${PN} != "${BPN}-native" ]; then
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+                if [ ${PN} != "${BPN}-native" ]; then
+                	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
+		fi
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
1.7.12.4



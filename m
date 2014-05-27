Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57C1B6FAC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 16:54:30 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4RGsUUE003613
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 27 May 2014 09:54:31 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1WpKdy-00075U-2w; Tue, 27 May 2014 12:54:30 -0400
Date: Tue, 27 May 2014 12:54:29 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140527165429.GA26798@windriver.com>
References: <20140520190315.GA32657@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20140520190315.GA32657@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH] [v2] nodejs needs python-native (Was: Re: [meta-oe] [PATCH] nodejs needs python-native)
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
X-List-Received-Date: Tue, 27 May 2014 16:54:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 1f1029bff98bd52a52a5bf81f4f36ca86d28f8cd Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Tue, 27 May 2014 12:52:00 -0400
Subject: [PATCH] nodejs needs python-native

nodejs should use python from python-native package. On some hosts, the
default python is missing bz2 support.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
index 996d68e..28cf0d6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
 
 DEPENDS = "openssl"
 
+inherit pythonnative
+
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
 "
@@ -40,3 +42,6 @@ RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
 BBCLASSEXTEND = "native"
+
+FILES_${PN} += "${libdir}/*"
+
-- 
2.0.0.rc0



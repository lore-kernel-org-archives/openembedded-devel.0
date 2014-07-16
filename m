Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D23E170332
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:59:35 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6GExZ0Y027490
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 16 Jul 2014 07:59:36 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>)
	id 1X7Qg5-0002Pa-B5; Wed, 16 Jul 2014 10:59:30 -0400
Date: Wed, 16 Jul 2014 10:59:28 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716145924.GA13352@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [meta-oe] [PATCH] postgresql configure error
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
X-List-Received-Date: Wed, 16 Jul 2014 14:59:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Author: Amy Fong <amy.fong@windriver.com>
Date:   Wed Jul 16 10:57:38 2014 -0400

    postgresql: libxml2 configure error
    
    postgresql is looking for libxml2 in the wrong location .../usr/include
    libxml2 installs its header files under .../usr/include/libxml2
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgre
index 4e5ec02..47aa3a6 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -47,7 +47,7 @@ PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
 PACKAGECONFIG[tcl] = \
     "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
-PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
+PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libx
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
 
 EXTRA_OECONF += "--enable-thread-safety --disable-rpath \



Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 942616CEE2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 11:33:56 +0000 (UTC)
Received: from [173.34.6.101] (port=60661 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VUxSI-0006Y2-97 for openembedded-devel@lists.openembedded.org;
	Sat, 12 Oct 2013 07:33:58 -0400
Date: Sat, 12 Oct 2013 07:33:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1310120729440.21801@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] core-image.bbclass: Fix comment to refer to packagegroup-base-extended.
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
X-List-Received-Date: Sat, 12 Oct 2013 11:33:56 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Fix the comment to match the actual inclusion further down in that
file, which is:

CORE_IMAGE_BASE_INSTALL = '\
    packagegroup-core-boot \
    packagegroup-base-extended \

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  feel free to ignore this if there are any other changes i can add to
this to make a larger single patch out of it.

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index e7c34e2..2982ff6 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3

 # IMAGE_FEATURES control content of the core reference images
 #
-# By default we install packagegroup-core-boot and packagegroup-base packages - this gives us
-# working (console only) rootfs.
+# By default we install packagegroup-core-boot and packagegroup-base-extended packages -
+# this gives us working (console only) rootfs.
 #
 # Available IMAGE_FEATURES:
 #

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id E63646B737
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 22:23:29 +0000 (UTC)
Received: from [99.240.204.5] (port=48503 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X5jE2-00064W-E6 for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jul 2014 18:23:30 -0400
Date: Fri, 11 Jul 2014 18:23:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1407111821080.6262@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Subject: [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Fri, 11 Jul 2014 22:23:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
intuitively obvious.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  compile and run-time tested, building a core-image-minimal for
qemuarm.

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 1b36cba..d2b9d69 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
 CORE_IMAGE_BASE_INSTALL = '\
     packagegroup-core-boot \
     packagegroup-base-extended \
-    \
-    ${CORE_IMAGE_EXTRA_INSTALL} \
     '

 CORE_IMAGE_EXTRA_INSTALL ?= ""

-IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
+IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"

 inherit image


-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


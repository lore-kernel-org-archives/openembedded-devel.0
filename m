Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9oAQ-0002yu-9K
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:06:01 +0100
Received: from cpe00222d3a26f0-cm00222d3a26ec.cpe.net.cable.rogers.com
	([174.113.186.52] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9Lcf-0005yh-Mx for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 11:37:16 -0500
Date: Sat, 14 Nov 2009 11:36:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911141135050.4243@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
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
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] i2c-tools: Remove i2c-tools 3.0.1, superseded by 3.0.2.
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
X-List-Received-Date: Sun, 15 Nov 2009 23:06:01 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  as near as i can tell, there is no compelling reason to keep
i2c-tools 3.0.1.  the rebuild works just fine after deleting that
file, and nothing seems to explicitly require 3.0.1.

diff --git a/recipes/i2c-tools/i2c-tools_3.0.1.bb b/recipes/i2c-tools/i2c-tools_3.0.1.bb
deleted file mode 100644
index c8ea32a..0000000
--- a/recipes/i2c-tools/i2c-tools_3.0.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Set of i2c tools for linux"
-SECTION = "base"
-LICENSE = "GPL"
-
-SRC_URI = "http://dl.lm-sensors.org/i2c-tools/releases/i2c-tools-${PV}.tar.bz2"
-
-inherit autotools
-
-do_compile_prepend() {
-        sed -i 's_/usr/local_/usr_' Makefile
-        sed -i 's_CC\t:= gcc_CC\t:= ${CC}_' Makefile
-}

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================



Received: from [195.64.66.119] (helo=mx1.grimmerink.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1N3W87-0002oM-J3
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 15:37:38 +0100
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 43CC86A0D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 15:36:28 +0100 (CET)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2009 15:36:25 +0100
MIME-Version: 1.0
Message-Id: <200910291536.26049.pieterg@gmx.com>
X-SA-Exim-Connect-IP: 195.64.66.119
X-SA-Exim-Mail-From: pieterg@gmx.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] netkit-base: fix building with gcc4
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
X-List-Received-Date: Thu, 29 Oct 2009 14:37:38 -0000
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

---

I guess nobody has been using netkit-base for a while, it needs the 
following patch to allow it to be built with gcc 4.x.x.

 recipes/netkit-base/netkit-base-0.17/gcc4.patch |   12 ++++++++++++
 recipes/netkit-base/netkit-base_0.17.bb         |    3 ++-
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4.patch

diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4.patch 
b/recipes/netkit-base/netkit-base-0.17/gcc4.patch
new file mode 100644
index 0000000..0a332a8
--- /dev/null
+++ b/recipes/netkit-base/netkit-base-0.17/gcc4.patch
@@ -0,0 +1,12 @@
+diff -dur netkit-base-0.17-p/inetd/servtab.c 
netkit-base-0.17/inetd/servtab.c
+--- netkit-base-0.17-p/inetd/servtab.c	2000-07-22 22:20:50.000000000 +0200
++++ netkit-base-0.17/inetd/servtab.c	2005-10-19 04:04:33.000000000 +0200
+@@ -771,7 +771,7 @@
+ 			return;
+ 		}
+ 		
+-#define SWAP(type, a, b) {type c=(type)a; (type)a=(type)b; 
(type)b=(type)c;}
++#define SWAP(type, a, b) {type c=(type)a; a=(type)b; b=(type)c;}
+ 
+ 		/*
+ 		 * sep->se_wait may be holding the pid of a daemon
diff --git a/recipes/netkit-base/netkit-base_0.17.bb 
b/recipes/netkit-base/netkit-base_0.17.bb
index 88016ea..c910b29 100644
--- a/recipes/netkit-base/netkit-base_0.17.bb
+++ b/recipes/netkit-base/netkit-base_0.17.bb
@@ -1,11 +1,12 @@
 SECTION = "base"
 DESCRIPTION = "netkit-base includes the inetd daemon."
 LICENSE = "BSD"
-PR = "r1"
+PR = "r2"
 
 SRC_URI 
= "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-base-${PV}.tar.gz 
\
            file://configure.patch;patch=1 \
            file://mconfig.patch;patch=1 \
+           file://gcc4.patch;patch=1 \
            file://init \
            file://inetd.conf"
 
-- 
1.6.5.rc1.44.ga1675



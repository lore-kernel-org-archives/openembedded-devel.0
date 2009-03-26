Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LmdD0-0006C5-GT
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 01:12:34 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 26 Mar 2009 01:10:55 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Thu, 26 Mar 2009 01:10:54 +0100
Received: from localhost.localdomain ([87.15.248.48]) by FBCMCL01B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 26 Mar 2009 01:06:10 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Mar 2009 01:10:53 +0100
Message-Id: <eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <cover.1238025789.git.andrea.adami@gmail.com>
References: <cover.1238025789.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1238025789.git.andrea.adami@gmail.com>
References: <cover.1238025789.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 26 Mar 2009 00:06:10.0234 (UTC)
	FILETIME=[AB0779A0:01C9ADA6]
Subject: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Thu, 26 Mar 2009 00:12:35 -0000

---
 conf/distro/angstrom-2008.1.conf |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index cde01e1..d8f53af 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -141,6 +141,9 @@ PREFERRED_PROVIDER_virtual/libx11       ?= "libx11"
 PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
 PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
 
+#Silence warning during parsing
+PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"
+
 # Others:
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
@@ -176,6 +179,8 @@ PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  ?= "gtk+"
 #Silence a warning during parsing
 PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
 
+
+
 #This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
 ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 require conf/distro/include/angstrom${ARM_ABI}.inc
-- 
1.6.0.6




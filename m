Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1yc-0006C0-Pi
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:07:38 +0200
Received: (qmail 32454 invoked by uid 813007); 23 Jun 2009 08:56:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:56:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:55:50 +0200
Message-Id: <1245747353-27218-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230939.34062.marcin@juszkiewicz.com.pl>
References: <200906230939.34062.marcin@juszkiewicz.com.pl>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [STABLE][PATCH 048/125] s/IPKG_INSTALL/PACKAGE_INSTALL/
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
X-List-Received-Date: Tue, 23 Jun 2009 09:07:39 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

According to the git log (e.g.,
7302c6263934c237da66719bd42505b6c05d10cc), there was a change in the
variable naming.  IPKG_INSTALL was renamed to PACKAGE_INSTALL some time
ago. classes/rootfs_ipk.bbclass currently uses PACKAGE_INSTALL instead
of IPKG_INSTALL.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 docs/usermanual/reference/class_rootfs_ipkg.xml |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/usermanual/reference/class_rootfs_ipkg.xml b/docs/usermanual/reference/class_rootfs_ipkg.xml
index b60adf8..98e6e25 100644
--- a/docs/usermanual/reference/class_rootfs_ipkg.xml
+++ b/docs/usermanual/reference/class_rootfs_ipkg.xml
@@ -41,7 +41,7 @@
 
     <listitem>
       <para>Installs the list of requested <command>.ipkg</command> packages,
-      <command>${IPKG_INSTALL}</command>;</para>
+      <command>${PACKAGE_INSTALL}</command>;</para>
     </listitem>
 
     <listitem>
@@ -89,7 +89,7 @@
 
   <variablelist>
     <varlistentry>
-      <term>IPKG_INSTALL</term>
+      <term>PACKAGE_INSTALL</term>
 
       <listitem>
         <para>The list of packages which will be installed into the root
@@ -212,4 +212,4 @@
   which is executed without <xref linkend="fakeroot" /> and therefore can be
   used from other classes, such as <xref linkend="image_class" />, that
   are already running under the control of <xref linkend="fakeroot" />.</para>
-</section>
\ No newline at end of file
+</section>
-- 
1.6.3.1






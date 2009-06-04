Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MCJqK-0007mW-SP
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 22:47:20 +0200
Received: from 212-139-89-247.dynamic.dsl.as9105.com ([212.139.89.247]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MCJhX-0000hU-0r
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 21:38:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 04 Jun 2009 21:38:04 +0100
Message-Id: <1244147884.5049.68.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [patch] eliminate some bloat from micro distribution
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
X-List-Received-Date: Thu, 04 Jun 2009 20:47:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Here's a small patch to make the micro distribution slightly more micro.

p.

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index bf4e5e1..a6fb64e 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -98,3 +98,12 @@ USE_NLS_gcc-cross = "no"
 # Disable binary locale generation
 ENABLE_BINARY_LOCALE_GENERATION = "0"
 
+# Don't install useless symlinks to libraries
+PACKAGE_SNAP_LIB_SYMLINKS = "1"
+
+# Collapse /usr into /
+layout_prefix = ""
+layout_exec_prefix = ""
+
+# Don't install ldconfig and associated gubbins
+USE_LDCONFIG = "0"





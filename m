Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MFB53-0006cH-VJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 20:02:22 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MFAvS-00030e-Bs
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 18:52:26 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jun 2009 18:52:24 +0100
Message-Id: <1244829144.4151.109.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [patch] disable ONLINE_PACKAGE_MANAGEMENT for micro
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
X-List-Received-Date: Fri, 12 Jun 2009 18:02:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I guess this patch is fairly self-explanatory.

p.

--

diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index a6fb64e..f8b293d 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -107,3 +107,6 @@ layout_exec_prefix = ""
 
 # Don't install ldconfig and associated gubbins
 USE_LDCONFIG = "0"
+
+# Disable online package management
+ONLINE_PACKAGE_MANAGEMENT = "none"





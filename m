Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PA7P0-0002Bd-5t
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 22:42:52 +0200
Received: (qmail 32387 invoked by uid 503); 24 Oct 2010 21:10:34 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 24 Oct 2010 21:10:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Oct 2010 22:42:11 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 24 Oct 2010 22:42:09 +0200
Message-ID: <4CC49A20.5080001@eukrea.com>
Date: Sun, 24 Oct 2010 22:42:08 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.11) Gecko/20101013 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Ovh-Tracer-Id: 11106158156471315785
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt4.7.0 : QA problem : Architecture did not match
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
X-List-Received-Date: Sun, 24 Oct 2010 20:42:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

building qt4.7.0 using angstrom 2010.x for and armv5te leads to :
ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3) 
on 
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/rcc
ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3) 
on 
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/moc
ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3) 
on 
/work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/uic
ERROR: Task 498 
(/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb, 
do_package) failed with exit code '1'
ERROR: '/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb' 
failed

The patch below (not cleaned if OK, I'll clean and push it) fix this problem, 
but why these installs were added to the 4.7.0.inc file (they are not present 
in 4.6.* and the recipe builds fine without) ?

thanks,
Eric

diff --git a/recipes/qt4/qt-4.7.0.inc b/recipes/qt4/qt-4.7.0.inc
index cf4b0d8..3004b92 100644
--- a/recipes/qt4/qt-4.7.0.inc
+++ b/recipes/qt4/qt-4.7.0.inc
@@ -47,10 +47,10 @@ do_compile() {
      fi

      unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
+#    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
+#    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
+#    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
+#    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease

      oe_runmake ${EXTRA_ENV}
  }



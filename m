Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NY28l-0001JE-13 for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 19:52:26 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NY26W-0001cf-5f
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 19:50:04 +0100
Received: from s207-6-220-230.bc.hsia.telus.net ([207.6.220.230])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 19:50:04 +0100
Received: from dfoley by s207-6-220-230.bc.hsia.telus.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 19:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Dallas Foley <dfoley@techsol.ca>
Date: Thu, 21 Jan 2010 10:49:43 -0800
Message-ID: <hja7k7$bvj$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s207-6-220-230.bc.hsia.telus.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: libdrm_2.4.17 fails to build on arm
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
X-List-Received-Date: Thu, 21 Jan 2010 18:52:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Older version 2.4.11 builds Ok on arm, but not 2.4.17
I modified it to build on armv7a. However, I'm not sure if it's the correct way.


diff --git a/recipes/dri/libdrm_2.4.17.bb b/recipes/dri/libdrm_2.4.17.bb
index 4f2af1e..fd1ab3a 100644
--- a/recipes/dri/libdrm_2.4.17.bb
+++ b/recipes/dri/libdrm_2.4.17.bb
@@ -3,14 +3,16 @@ DEPENDS = "libpthread-stubs"
 LICENSE = "MIT"
 SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF_append = " ${@base_contains('MACHINE_FEATURES', 'x86', '', '--disable-intel',d)}"
+
 do_stage() {
 	autotools_stage_all
 }
 
-PACKAGES =+ "${PN}-intel"
+PACKAGES =+ "${@base_contains('MACHINE_FEATURES', 'x86', '${PN}-intel', '',d)}"
 
 FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"




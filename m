Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1N0tu4-0003uN-12
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 11:24:19 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 98A9E4C84BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 05:23:28 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOvpxdFNcZMg
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 05:23:22 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id F2A3D4C8ADD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 05:23:21 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Oct 2009 10:22:48 +0100
Message-ID: <019901ca52f9$3e6ee5f0$bb4cb1d0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpS+Tha87AwoO0/R2i7Y44XPBXpzg==
X-SA-Exim-Connect-IP: 65.182.109.77
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] gdm_2.28.0: Add missing libcanberra dependency to allow building on a clean system.
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
X-List-Received-Date: Thu, 22 Oct 2009 09:24:19 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

* Also bump PR.

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/gnome/gdm_2.28.0.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/recipes/gnome/gdm_2.28.0.bb b/recipes/gnome/gdm_2.28.0.bb
index 3f5c69e..d6cc5c0 100644
--- a/recipes/gnome/gdm_2.28.0.bb
+++ b/recipes/gnome/gdm_2.28.0.bb
@@ -1,7 +1,9 @@
 DESCRIPTION = "Graphical login manager"
 LICENSE = "GPL"
 
-DEPENDS = "libxklavier grep consolekit libpam gnome-doc-utils gtk+ libglade
libgnomecanvas librsvg libxml2 libart-lgpl xrdb"
+DEPENDS = "libxklavier grep consolekit libpam gnome-doc-utils gtk+ libglade
libgnomecanvas librsvg libxml2 libart-lgpl libcanberra xrdb"
+
+PR = "r1"
 
 inherit gnome update-rc.d
 
@@ -67,7 +69,3 @@ pkg_postrm_${PN} () {
     delgroup gdm || true
 	sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
 }
-
-
-
-
-- 
1.6.3.1






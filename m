Received: from [65.182.109.83] (helo=mta4.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1MyMPz-00033E-8c
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Oct 2009 11:14:46 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id 958072805EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 05:13:43 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXJfvtda7OpX
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 05:13:36 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id 400E02801D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2009 05:13:36 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Oct 2009 10:12:49 +0100
Message-ID: <019a01ca4d77$b4dba160$1e92e420$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpNd6pmm6/MUdNsRSeSloU+dTVqzA==
X-SA-Exim-Connect-IP: 65.182.109.83
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] devicekit: Update to remove host dependency on Docbook XSLT files.
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
X-List-Received-Date: Thu, 15 Oct 2009 09:14:46 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Content-Language: en-us


* Bump PR
* Update recipe to sed out the -nonet in the documentation XSLT conversion
removing the reliance of the Docbook XSLT templates being installed on the
host system (it will grab them from the net).
* Note: Another (maybe better) fix would be to package up docbook-xsl but
that is overkill for this one recipe.

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 recipes/devicekit/devicekit_003.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 recipes/devicekit/devicekit_003.bb

diff --git a/recipes/devicekit/devicekit_003.bb
b/recipes/devicekit/devicekit_003.bb
old mode 100644
new mode 100755
index a57ca88..3439290
--- a/recipes/devicekit/devicekit_003.bb
+++ b/recipes/devicekit/devicekit_003.bb
@@ -2,13 +2,16 @@ DESCRIPTION = "DeviceKit is a simple system service that
a) can enumerate device
 LICENSE = "GPLv2"
 DEPENDS = "udev dbus-glib glib-2.0"
 
+PR = "r1"
+
 SRC_URI = "http://hal.freedesktop.org/releases/DeviceKit-${PV}.tar.gz"
 S = "${WORKDIR}/DeviceKit-${PV}"
 
+do_configure_prepend() {
+	sed -i -e s:-nonet:\:g ${S}/doc/man/Makefile.am
+}	
+
 inherit autotools_stage
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 FILES_${PN} += "${datadir}/dbus-1/"
-
-
-
-- 
1.6.3.1





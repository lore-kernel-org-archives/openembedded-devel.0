Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NYn6D-0002x5-4K for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:00:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NYn3y-000348-S3
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:58:34 +0100
Received: from p5b3b35f1.dip.t-dialin.net ([91.59.53.241])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 21:58:34 +0100
Received: from no2spam by p5b3b35f1.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 21:58:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 23 Jan 2010 21:58:04 +0100
Message-ID: <hjfnt5$2sh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b35f1.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] classes/distutils-common-base.bbclass redefines FILES_${PN}-dbg
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
X-List-Received-Date: Sat, 23 Jan 2010 21:00:56 -0000
Content-Type: multipart/mixed; boundary="------------090509010509060100020304"

--------------090509010509060100020304
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

classes/distutils-common-base.bbclass redefines instead of appends to
the list of files to include in the debug packages.  I have verified the
problem and the proper fix taking the rpm recipe as an example.

The attached patch possibly changes the contents of dependant packages.
 There are a number of them, so I don't think it's practical to bump PR
for all of them.  Distro maintainers should bump distro PR or something.
 I'm not aware of an elegant solution in OE to deal with this.

$ rgrep distutils recipes/ -l|wc -l
233

Regards

Rolf

--------------090509010509060100020304
Content-Type: text/x-patch;
 name="0001-distutils-common-base-fix-definition-of-FILES_-PN.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-distutils-common-base-fix-definition-of-FILES_-PN.patch"

From 025e057f58edd7f1ba9854b38cf15b4967d64910 Mon Sep 17 00:00:00 2001
From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Date: Sat, 23 Jan 2010 21:24:39 +0100
Subject: [PATCH] distutils-common-base: fix definition of FILES_${PN}-dbg

* use += instead of =
  this appends new file paths to include instead of replacing the
  current definition
---
 classes/distutils-common-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/distutils-common-base.bbclass b/classes/distutils-common-base.bbclass
index 01bf9ea..87578b7 100644
--- a/classes/distutils-common-base.bbclass
+++ b/classes/distutils-common-base.bbclass
@@ -23,7 +23,7 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${libdir}/${PYTHON_DIR}/site-packages/*.la \
 "
-FILES_${PN}-dbg = "\
+FILES_${PN}-dbg += "\
   ${libdir}/${PYTHON_DIR}/site-packages/.debug \
   ${libdir}/${PYTHON_DIR}/site-packages/*/.debug \
   ${libdir}/${PYTHON_DIR}/site-packages/*/*/.debug \
-- 
1.5.4.3


--------------090509010509060100020304--

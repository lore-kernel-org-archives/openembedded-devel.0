Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 734 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Aug 2014 12:32:35 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id CAD45601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 12:32:35 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1XK4sI-0006eo-AJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2014 14:20:22 +0200
Received: from host-87-242-0-11.prtelecom.hu ([87.242.0.11]
	helo=webmail.prtelecom.hu) by mail.pr.hu with esmtp (Exim 4.80)
	(envelope-from <zboszor@pr.hu>) id 1XK4sA-0001qk-SK
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2014 14:20:20 +0200
Received: from 87.242.22.241 (SquirrelMail authenticated user zboszor@pr.hu)
	by webmail.prtelecom.hu with HTTP; Wed, 20 Aug 2014 14:20:14 +0200
Message-ID: <427f459422d9e4de6ecc38bf875ff32f.squirrel@webmail.prtelecom.hu>
Date: Wed, 20 Aug 2014 14:20:14 +0200
From: zboszor@pr.hu
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.23 [SVN]
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Spam-Score: 0.9 (/)
X-Scan-Signature: dda648b1d3e643e91fd1a0320e0a0c7d
X-Spam-Tracer: backend.mail.pr.hu 0.9 20140820122020Z
Subject: [PATCH] Allow using a more recent php
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 12:32:44 -0000
X-Groupsio-MsgNum: 51792
Content-Type: multipart/mixed;boundary="----=_20140820142014_50513"

------=_20140820142014_50513
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

the attached patch allows more recent versions of PHP to be downloaded
from the official site instead of very old versions from the attic. For
the 5.4 series, currently this means 5.4.22 and up. The change uses two
features from bitbake 1.22, which (extending FETCHCMD_wget and the
";downloadfilename=" extension to SRC_URI) are already used by other
recipes. PHP 5.4.14 is outdated already.

Best regards,
Zoltán Böszörményi

------=_20140820142014_50513
Content-Type: text/x-patch; name="php.inc.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="php.inc.patch"

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 030c090..b80daea 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -13,7 +13,8 @@ INC_PR = "r5"
 # the major version of the PHP recipe.
 PHP_MAJVER = "${@d.getVar('PV',1).split('.')[0]}"
 
-SRC_URI = "http://museum.php.net/php${PHP_MAJVER}/php-${PV}.tar.bz2"
+FETCHCMD_wget += "--trust-server-names"
+SRC_URI = "http://php.net/get/php-${PV}.tar.bz2/from/this/mirror;downloadfilename=php-${PV}.tar.bz2"
 
 S = "${WORKDIR}/php-${PV}"
 

------=_20140820142014_50513--

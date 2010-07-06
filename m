Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OWHIB-00060k-Lm
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 01:11:23 +0200
Received: by pxi12 with SMTP id 12so3190252pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 16:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=8MJe33QVY0N2TI7nUDfYs8VukeoF+yqGgP1CZg24gBw=;
	b=awtro9Jma296t0m4hlvGrUTggBRgxFQUY72FP6CV+nKNyzbzzK6mfHi6rmYtyCWxit
	hylKUWeunFKTi2EVn8/P3uuz15mh21f1zGoXmk554MLecQ5kiUl3JrZ4stLPd04gBLTs
	T5XhRIWTeGG22RNK/wkzzC0XCc8VJErxC5Xi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=W2cUWzHEQTTK+iQ2JHgTpHgZpCWWCZ9pZ/AW0bjNVuovIracEkjfP4Gwy4OzEEZ/6z
	Xxlyd8C8G3eEEK3NVv3S3Pewj++7nL83Eqz2wH9+vPM1NhIEpdcDZt39o9+NQO+lNq94
	dsM08RJWpFki3jQw2y6LxPZKWE3Mgj2mga+iw=
Received: by 10.114.120.4 with SMTP id s4mr6199754wac.203.1278457574159;
	Tue, 06 Jul 2010 16:06:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c10sm89462292wam.13.2010.07.06.16.06.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 16:06:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jul 2010 16:06:10 -0700
Message-Id: <1278457570-1713-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] base.bbclass: re-adding backward compatibility with bitbake w.r.t decodeurl
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
X-List-Received-Date: Tue, 06 Jul 2010 23:11:23 -0000

I am testing this patch to restore the behavior while using unpatched 
bitbake. Please lend a hand in testing this fix.

Thanks
-Khem

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/base.bbclass |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 2da0b7a..d6058f0 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -219,7 +219,15 @@ def oe_unpack_file(file, data, url = None):
 			# The "destdir" handling was specifically done for FILESPATH
 			# items.  So, only do so for file:// entries.
 			if type == "file":
-				dest = os.path.dirname(path) or "."
+				if not host:
+				# this case is for backward compatiblity with older version
+				# of bitbake which do not have the fix
+				# http://cgit.openembedded.org/cgit.cgi/bitbake/commit/?id=ca257adc587bb0937ea76d8b32b654fdbf4192b8
+				# this should not be needed once all releases of bitbake has this fix
+				# applied/backported
+					dest = os.path.join(host, os.path.dirname(path)) or "."
+				else:
+					dest = os.path.dirname(path) or "."
 			else:
 				dest = "."
 			bb.mkdirhier("%s" % os.path.join(os.getcwd(),dest))
-- 
1.7.1




Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9PrF-0006G3-Rj
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 00:13:07 +0200
Received: by pva4 with SMTP id 4so24126pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DdFz2WMdBh8VseaHbCbquzgRslQUv4Dd4/ldKr0gQdY=;
	b=kXCLvU/XeVw11ibCcQtTrRsxcaBtSasLuN8rgLvO7ccD5WVIwYlL/cLApo3PcTi2WS
	OQ4/Jtcqh99AeJDb+EYsWOUMR0hc0lVcIiKydikKl8lI5IBKbQp3kSb4Le86vFl96Why
	/OlMbHN+o8pvHWgzLJ54FMQ/pUxZ1pIv76bdg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kyc9/4/6OgzBK0dRfcMNT/rDNZz6Iu0owIrl60U2NKNfqLfYeJQwh+Js4LKOHGtV9G
	cYROtFYrcoIlWT0P4bdVNcielCaaHixP0dvi2x/6N5zS3soZfzARPajxRErfXUHqMuub
	7dh0vNzO4m+gYd0ZjUsjirVuDV2R0JMk+cGDk=
Received: by 10.142.216.7 with SMTP id o7mr3041097wfg.55.1287785543430;
	Fri, 22 Oct 2010 15:12:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e36sm5222395wfj.2.2010.10.22.15.12.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Oct 2010 15:12:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 15:12:18 -0700
Message-Id: <1287785538-8812-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] autotools.bbclass: Specify a value of sysroot instead of asking the compiler
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
X-List-Received-Date: Fri, 22 Oct 2010 22:13:07 -0000

If we just use --with-libtool-sysroot then it asks the compiler at
configure time to supply the sysroot which will not work with external
toolchains because they may have different default sysroot encoded into
them. Therefore we specify the sysroot so the configure can use that
value and not depend upon compiler to supply one.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index 97bc47c..21e0c9a 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -76,7 +76,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --oldincludedir=${oldincludedir} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
-		  ${@["","--with-libtool-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
+		  ${@["","--with-libtool-sysroot=${STAGING_DIR}/${MULTIMACH_HOST_SYS}"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
 		"
 
 oe_runconf () {
-- 
1.7.1




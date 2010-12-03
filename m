Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1POKMu-0003zu-VI
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 02:23:26 +0100
Received: by pvd12 with SMTP id 12so1409123pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Dec 2010 17:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=RpCRSzL/GHKJ68c9A68Av9rEIBA7LlM3R7V29+4czJc=;
	b=mAi3k4vLBi2kyNPCdH4W89Nu+ev1QfcEead0n9qn6rniGBdJDWda+H92VY+xvlY9Id
	vL9aK80vWT+wEV0L4Ticv6DfLGOXRc1+F4gz76YrGllPgfbTIj5I7A3HKaYtrxc0SG+F
	+WCxCUP1Ol3fKzipuGZooSJ32lNVDcSqB0U/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TQBd9HxIVCSreyZIMbck/gFW95O+XRkgbfrQuq7pVQEFj6/5p+FDZbkCHwqZqDvaMd
	4xoJyDgAucO8tEu6ht9ami6PEIYWy4W355i8JF3F3yuyZ0DLM/Ue0sUd81et14UD6YPD
	CJmPn4RZI05EEC4Np3xwsPAmmvn2oZT2s1wvo=
Received: by 10.142.133.21 with SMTP id g21mr1234286wfd.163.1291339313993;
	Thu, 02 Dec 2010 17:21:53 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm1497041wff.4.2010.12.02.17.21.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 02 Dec 2010 17:21:53 -0800 (PST)
Message-ID: <4CF8462C.1010104@gmail.com>
Date: Fri, 03 Dec 2010 11:51:48 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bind: Fix for DISTRO=micro: s|/usr/bin|${bindir}|
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
X-List-Received-Date: Fri, 03 Dec 2010 01:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This is a conservative change to fix micro. Bind needs more attention
as the latest in tree version is from 2008 and several vulnerabilities
have been found and fixed since then. If you are doing anything
except using bind as a resolver, please don't use these recipes.


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/bind/bind_9.3.1.bb    |    2 +-
 recipes/bind/bind_9.3.4-P1.bb |    2 +-
 recipes/bind/bind_9.3.5-P1.bb |    2 +-
 recipes/bind/bind_9.3.6.bb    |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/bind/bind_9.3.1.bb b/recipes/bind/bind_9.3.1.bb
index 33b1de2..268253e 100644
--- a/recipes/bind/bind_9.3.1.bb
+++ b/recipes/bind/bind_9.3.1.bb
@@ -17,7 +17,7 @@ INITSCRIPT_PARAMS = "defaults"
 
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
+	rm "${D}${bindir}/nslookup"
 	install -d "${D}/etc/bind"
 	install -d "${D}/etc/init.d"
 	install -m 644 ${S}/conf/* "${D}/etc/bind"
diff --git a/recipes/bind/bind_9.3.4-P1.bb b/recipes/bind/bind_9.3.4-P1.bb
index 45bf608..70c261e 100644
--- a/recipes/bind/bind_9.3.4-P1.bb
+++ b/recipes/bind/bind_9.3.4-P1.bb
@@ -19,7 +19,7 @@ INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
+	rm "${D}${bindir}/nslookup"
 	install -d "${D}/etc/bind"
 	install -d "${D}/etc/init.d"
 	install -m 644 ${S}/conf/* "${D}/etc/bind"
diff --git a/recipes/bind/bind_9.3.5-P1.bb b/recipes/bind/bind_9.3.5-P1.bb
index d105dfc..bb98261 100644
--- a/recipes/bind/bind_9.3.5-P1.bb
+++ b/recipes/bind/bind_9.3.5-P1.bb
@@ -19,7 +19,7 @@ INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
+	rm "${D}${bindir}/nslookup"
 	install -d "${D}/etc/bind"
 	install -d "${D}/etc/init.d"
 	install -m 644 ${S}/conf/* "${D}/etc/bind"
diff --git a/recipes/bind/bind_9.3.6.bb b/recipes/bind/bind_9.3.6.bb
index 1412a68..b10d6e8 100644
--- a/recipes/bind/bind_9.3.6.bb
+++ b/recipes/bind/bind_9.3.6.bb
@@ -24,7 +24,7 @@ FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/nslookup"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 
 do_install_append() {
-	rm "${D}/usr/bin/nslookup"
+	rm "${D}${bindir}/nslookup"
 	install -d "${D}/etc/bind"
 	install -d "${D}/etc/init.d"
 	install -m 644 ${S}/conf/* "${D}/etc/bind"
-- 
1.7.1




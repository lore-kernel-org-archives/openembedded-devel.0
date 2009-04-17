Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcos@2mi.com.br>) id 1LuhNc-0001uz-RU
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 08:17:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 378505010907
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:21:00 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRspIRTiVcWc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:20:56 -0300 (BRT)
Received: from [192.168.0.108] (201-43-205-94.dsl.telesp.net.br
	[201.43.205.94])
	by mail.2mi.com.br (Postfix) with ESMTP id C1FAA50277D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 03:20:54 -0300 (BRT)
From: Marcos Amorim <marcos@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: 2MI Tecnologia
Date: Fri, 17 Apr 2009 03:12:55 -0300
Message-Id: <1239948775.4599.12.camel@faraday>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: marcos@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Add missing file to ipkg-utils
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
X-List-Received-Date: Fri, 17 Apr 2009 06:18:04 -0000
X-Groupsio-MsgNum: 9478
Content-Type: multipart/mixed; boundary="=-mFIHRVrRSdglby7ELBmW"

--=-mFIHRVrRSdglby7ELBmW
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The arfile.py is required by ipkg.py but not was install



Thanks

Marcos Amorim
2MI Tecnologia














--=-mFIHRVrRSdglby7ELBmW
Content-Disposition: attachment; filename=0001-Add-missing-arfile.py-to-install.patch
Content-Type: application/mbox; name=0001-Add-missing-arfile.py-to-install.patch
Content-Transfer-Encoding: 7bit

From 3013527d004712d9d4cf69ec430cd81d9f50bca6 Mon Sep 17 00:00:00 2001
From: Marcos Amorim <marcos@2mi.com.br>
Date: Fri, 17 Apr 2009 03:05:33 -0300
Subject: [PATCH] Add missing arfile.py to install

---
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index 8baffd2..f0c72fa 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 CONFLICTS = "ipkg-link"
 RDEPENDS = "python"
 SRCDATE = "20050404"
-PR = "r23"
+PR = "r24"
 
 SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
            file://ipkg-utils-fix.patch;patch=1 \
@@ -19,7 +19,7 @@ SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
 
 S = "${WORKDIR}/ipkg-utils"
 
-INSTALL = "ipkg-build ipkg-deb-unbuild ipkg-unbuild ipkg-compare-versions ipkg-upload ipkg-make-index ipkg-link ipkg.py ipkg-list-fields"
+INSTALL = "ipkg-build ipkg-deb-unbuild ipkg-unbuild ipkg-compare-versions ipkg-upload ipkg-make-index ipkg-link ipkg.py arfile.py ipkg-list-fields"
 
 do_compile() {
 	oe_runmake ipkg-compare-versions
-- 
1.5.6.5


--=-mFIHRVrRSdglby7ELBmW--

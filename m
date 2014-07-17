Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A84F17019B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 13:45:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HDjo9W023835 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:45:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1aBdJ4H3woK8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:45:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HDjiX0023825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 14:45:46 +0100
Message-ID: <1405604739.26348.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jul 2014 14:45:39 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] hexedit: Disable separate build since its broken
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
X-List-Received-Date: Thu, 17 Jul 2014 13:46:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
index afc947f..c2f0630 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
@@ -12,6 +12,6 @@ SRC_URI = "http://rigaux.org/${BP}.src.tgz \
 SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
 SRC_URI[sha256sum] = "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7"
 
-inherit autotools
+inherit autotools-brokensep
 
 S = "${WORKDIR}/${PN}"




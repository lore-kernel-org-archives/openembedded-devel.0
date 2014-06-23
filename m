Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 22D866600B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 19:58:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5NJw2aY008960 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fJsN0L06qx83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5NJvw3c008957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:58:00 +0100
Message-ID: <1403553472.2104.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Jun 2014 20:57:52 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [meta-oe][PATCH] phonet-utils: Fix build with B!=S
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
X-List-Received-Date: Mon, 23 Jun 2014 19:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This recipes doesn't use autotools so mark as brokensep.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 206023e..5589963 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -8,6 +8,6 @@ S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
 PV = "0.0.0+gitr${SRCPV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"




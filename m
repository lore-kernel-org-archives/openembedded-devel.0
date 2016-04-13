Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 25BD97318F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2016 13:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DDNEt7010717; Wed, 13 Apr 2016 14:23:14 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x52xbrFakiqm; Wed, 13 Apr 2016 14:23:14 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3DDNAKa010712
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 13 Apr 2016 14:23:11 +0100
Message-ID: <1460553790.9308.89.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Apr 2016 14:23:10 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] cyrus-sasl: Drop unneeded group addition
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Apr 2016 13:23:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The mail group is provided by base-passwd so would always be present. Therefore
drop the uneeded group addition from this recipe.

This works around the recent user cleanup code improvements which meant
this started causing failures for people.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 33468a1..5da3d96 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -72,7 +72,6 @@ do_install_append() {
 }
 
 USERADD_PACKAGES = "${PN}-bin"
-GROUPADD_PARAM_${PN}-bin = "--system mail"
 USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
 SYSTEMD_PACKAGES = "${PN}"



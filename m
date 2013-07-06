Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 27E886AE18
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Jul 2013 11:15:16 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so2948955pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jul 2013 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5norpeSqpVfQnPkh/ObDx/mZMk58hAfNrXa/jdWV1ns=;
	b=l6rdJs8qJWvINnfN7Fr2avJEaY1qBQoVwwLBO5kKpBUoIKkGO81NTjpSsRBaa5z9Lx
	NpKwrSbF6jUam9fzmbh0yr2cSmhqxkQbxUGPnGeTFqamCrIzpEo3QsWCjXtf0IvAoaZB
	wK6DV1rEYTAQ1gJq7Ml44yDqyJW0AT/rON4s2f/DZc66Wc7J9+9LamOIbsKI5vh7L1oC
	tKKnGyhk2LZobFL6OFQyjiPU0NICczNPNPMXgLNfLrcJ1UO6oCld2W7sDeeTjwQkDP7a
	/lnU0e4jAJKXM+iRA4CJH9+AvWpe9sqi2kPrqg8ZHPGhK7HrAphIM31za3Z8GIOxwyBB
	SXtQ==
X-Received: by 10.66.118.104 with SMTP id kl8mr14936181pab.182.1373109317078; 
	Sat, 06 Jul 2013 04:15:17 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id we2sm12941249pab.0.2013.07.06.04.15.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Jul 2013 04:15:16 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jul 2013 21:30:50 +1000
Message-Id: <1373110250-736-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] openldap: remove empty /var/run directory
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
X-List-Received-Date: Sat, 06 Jul 2013 11:15:16 -0000

The /var/run directory is already created by base-files.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 9a7c118..c545b5c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -235,6 +235,8 @@ do_install_append() {
     chmod 755 ${D}${sysconfdir}/init.d/openldap
     # This is duplicated in /etc/openldap and is for slapd
     rm -f ${D}${localstatedir}/openldap-data/DB_CONFIG.example
+    rmdir "${D}${localstatedir}/run"
+    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 }
 
 pkg_postinst_${PN}-slapd () {
-- 
1.8.3.2



Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OZ9eO-0003xn-7t
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 23:37:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 9700543CF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:54 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 9700543CF3
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1279143474; i=@fjfi.cvut.cz; bh=XDxnJOIgIPnLcklZdqSNorQK0Mo=;
	h=From:Date:Subject:To:Message-Id;
	b=OAWzOHvunbgHt4+dbfWk/MiYFwQlw23kk6I61i1/G5apC7eGN1mJPSQ2XmWQ3+pLd
	VPc0AweoC7aS1BxrziZ9g==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id iwnsEHuXRi4X
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id AD74543D5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz AD74543D5C
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz AD74543D5C
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 8A36F46774; Wed, 14 Jul 2010 23:37:50 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Wed, 14 Jul 2010 23:16:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100714213750.8A36F46774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] cluttermm_0.9: Add recipe for cluttermm.
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
X-List-Received-Date: Wed, 14 Jul 2010 21:38:00 -0000

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 recipes/clutter/cluttermm_0.9.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/clutter/cluttermm_0.9.bb

diff --git a/recipes/clutter/cluttermm_0.9.bb b/recipes/clutter/cluttermm_0.9.bb
new file mode 100644
index 0000000..80e367d
--- /dev/null
+++ b/recipes/clutter/cluttermm_0.9.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "C++ bindings for Clutter"
+HOMEPAGE = "http://git.gnome.org/browse/cluttermm/"
+SECTION = "libs"
+LICENSE = "LGPL"
+DEPENDS = "clutter-1.0 pangomm"
+
+inherit autotools pkgconfig flow-lossage
+
+PV = "0.9.6"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${PN}/0.9/${P}.tar.bz2"
+SRC_URI[md5sum] = "43989722e0c86ef246e95f8a0fa842c3"
+SRC_URI[sha256sum] = "cae313e83d40c5b92b598ac19b3b6fc57b5f237b505b71a34588fb76618f1e1e"
-- 
1.7.1




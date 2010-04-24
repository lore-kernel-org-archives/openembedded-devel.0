Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1O5nj8-0006qM-Gj
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 00:21:37 +0200
Received: by fxm11 with SMTP id 11so23894fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 15:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kDtc0eR7X65PaUzm7WDmXlpavdHi4d5kUN7YI/Yh5LE=;
	b=NoIR4nyf2fnNiChoL/KrtIhfLb7nALwi6/xXQHPjCrgpKSG8hTXVxuF14quXjgv1Of
	MKDYfu1gqQiVi3JqndcXIcyjdG7HNq2hRbb4/rF8BLj0F+j8klxfzK5vBl5Y/QrdXyJh
	Eid5xtZ+KwCy5bGuWQxBIU3Iu0oXJiOKGdvMk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sU04xHlguv0MW2Zu/WnR6eKPnrsRafv2IUrlxawV+iWcA9HR3kYNa0IpgOBJd2HO22
	tIxiRRIMmW1+lXrVr3q3i37f9v4clmUey3UiEPiaKpuyWR+vg2lUCc54CKiDyvMZMfv6
	KhQUgVu60Q0NQYKKiZNR1bf0BjWu9UDII5/BM=
Received: by 10.87.68.36 with SMTP id v36mr3388994fgk.43.1272147471162;
	Sat, 24 Apr 2010 15:17:51 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id e11sm1803131fga.23.2010.04.24.15.17.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Apr 2010 15:17:50 -0700 (PDT)
From: =?utf-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Apr 2010 00:16:58 +0200
Message-Id: <1272147418-31196-4-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1272147418-31196-3-git-send-email-matgnt@gmail.com>
References: <1272147418-31196-1-git-send-email-matgnt@gmail.com>
	<1272147418-31196-2-git-send-email-matgnt@gmail.com>
	<1272147418-31196-3-git-send-email-matgnt@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] topas910: linux_2.6.26 fix line break
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
X-List-Received-Date: Sat, 24 Apr 2010 22:21:37 -0000

---
 recipes/linux/linux_2.6.26.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/linux/linux_2.6.26.bb b/recipes/linux/linux_2.6.26.bb
index 8eccea3..4c66c11 100644
--- a/recipes/linux/linux_2.6.26.bb
+++ b/recipes/linux/linux_2.6.26.bb
@@ -1,6 +1,6 @@
 require linux.inc
 
-PR = "r10"
+PR = "r11"
 
 # Mark archs/machines that this kernel supports
 DEFAULT_PREFERENCE = "-1"
@@ -37,7 +37,9 @@ SRC_URI_append_mpc8313e-rdb = "\
 	file://mpc8313e-rdb-eth-fixed.patch;patch=1 \
 	"
 
-SRC_URI_append_topas910 = "http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1;name=topaspatch"
+SRC_URI_append_topas910 = " \
+	http://www.bplan-gmbh.org/data/toshiba/topas/linux/2.6.26.5/patch_2.6.26.5_topas910.bz2;patch=1;name=topaspatch \
+	"
 
 # see http://bugzilla.kernel.org/show_bug.cgi?id=11143
 do_install_append() {
-- 
1.6.3.3




Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nl32U-00077B-Ey
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 17:27:48 +0100
Received: by bwz5 with SMTP id 5so214787bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=x40f77id0mJakDdT0nRFmQ7+njheIjbjwTFKezDHylg=;
	b=DDJCOM+w3jOrDShVHapLvQRfMzuT2Xx1wmraf2QebncUf9J4+AUH5zYI5hW82MXihI
	WuirmqMA4KWHgJLnK/fhthBCpyNXIqxVRxKJktt/cSUIaZoNhgLhwBWNferYLpcJJbO6
	HVj1UXpjGVxLH3N4/xEO7B9KugPGvh5AphHUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iIa/tzK/kBq1l+XGj6SSrCRYMYhAA6Eq8/OinDaxG6QlfUXmRMuTVpUtkYQbWTf0/6
	cRo9cPs2MrUxQwxs5AR3uoDn7s6QvVYNw6ogBdBZZ2HqjR9UC0V/F7RMyK2JgEDVMN2A
	i2CvlcGGQCk1YI21vp6E9VOhCexDaYTD29A1Y=
Received: by 10.204.29.21 with SMTP id o21mr443604bkc.145.1267201494942;
	Fri, 26 Feb 2010 08:24:54 -0800 (PST)
Received: from localhost.localdomain
	(85-127-150-205.dynamic.xdsl-line.inode.at [85.127.150.205])
	by mx.google.com with ESMTPS id 14sm148285bwz.14.2010.02.26.08.24.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 08:24:54 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2010 17:25:14 +0100
Message-Id: <1267201514-17775-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fastcgi: Move to new staging
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
X-List-Received-Date: Fri, 26 Feb 2010 16:27:48 -0000

---
 recipes/fastcgi/fastcgi_2.4.0.bb |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/recipes/fastcgi/fastcgi_2.4.0.bb b/recipes/fastcgi/fastcgi_2.4.0.bb
index a575da1..1476342 100644
--- a/recipes/fastcgi/fastcgi_2.4.0.bb
+++ b/recipes/fastcgi/fastcgi_2.4.0.bb
@@ -1,6 +1,6 @@
 LICENSE = "Open Market"
 DESCRIPTION = "Fast CGI backend (web server to CGI handler) library"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.fastcgi.com/dist/fcgi-${PV}.tar.gz \
 file://link-against-math.patch;patch=1 \
@@ -13,8 +13,3 @@ LEAD_SONAME = "libfcgi.so*"
 PARALLEL_MAKE=""
 
 inherit autotools pkgconfig
-
-do_stage() {
-	autotools_stage_all
-}
-
-- 
1.6.4.4




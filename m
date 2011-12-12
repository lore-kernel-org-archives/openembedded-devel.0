Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1Ra7dQ-0007cF-OJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 16:17:45 +0100
Received: by lahd3 with SMTP id d3so1896981lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 07:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wjxe/ACFAqM9OmABjHW5xxKuQ8eoNvQfL0Kp1gOibME=;
	b=Hh1l9GDXav2m49QVpc3lTgi/vVOSpPQ/yh6OJYznqYoax9nxDLo+lcOE7UhxcZF7nB
	KYFqb9RhixzhJ1YJaJjWPSzE5YkK7OLj5gmS8+EaL8WcOEreMYWbbSQdd0eKhLjZj+Ns
	ZDJBgLqlohcef8f93LYinT5E+WHcba2vl/OeM=
Received: by 10.152.112.42 with SMTP id in10mr12366945lab.21.1323702645813;
	Mon, 12 Dec 2011 07:10:45 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39])
	by mx.google.com with ESMTPS id pf2sm15016672lab.1.2011.12.12.07.10.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 07:10:44 -0800 (PST)
From: adrianopallavicino@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 16:10:23 +0100
Message-Id: <1323702623-25987-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <adrianopallavicino@gmail.com>
References: <adrianopallavicino@gmail.com>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCHv4 4/4] Signed-off-by: Adriano Pallavicino <adriano.pallavicino@gmail.com>
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
X-List-Received-Date: Mon, 12 Dec 2011 15:17:45 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

Fixed URL of sources. Solve problem of "No such directory `pub/gnutls/libtasn1'."
---
 recipes/gnutls/libtasn1_1.7.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 44da659..791e8e4 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPL"
 
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
 inherit autotools binconfig
 
-- 
1.7.4.1




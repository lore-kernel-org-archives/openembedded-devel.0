Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1Ra7uR-0004UK-Oy
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 16:35:19 +0100
Received: by lahd3 with SMTP id d3so1908149lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 07:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jqIMrbMXhXwjc/5fUbmrqVKpOa/eszUdRgtUR7gpEBw=;
	b=hbR3kAXrWcsG85jNuHDsOeIJPDniB9TRr/qdEWhHekdGkCUcwz1Rly9EpQKh4Giy+x
	cGyBDw/7P7TWGJUepkN6MDbwgIoC2gwxSRBBaHkF/N9TI12q10apTPVeeIBuZT70fXOL
	MVC1Dup5BJHV/X2Nd+wN/4xJDgVhPjgn+Ckv8=
Received: by 10.152.134.50 with SMTP id ph18mr12425061lab.1.1323703704871;
	Mon, 12 Dec 2011 07:28:24 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39])
	by mx.google.com with ESMTPS id pf2sm15064952lab.1.2011.12.12.07.28.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 07:28:24 -0800 (PST)
From: adrianopallavicino@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 16:28:02 +0100
Message-Id: <1323703682-26156-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <adrianopallavicino@gmail.com>
References: <adrianopallavicino@gmail.com>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCHv6] libtasn1_1.17: fix sources URL
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
X-List-Received-Date: Mon, 12 Dec 2011 15:35:19 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

Fixed URL of sources. Solve problem of "No such directory `pub/gnutls/libtasn1'."

Signed-off-by: Adriano Pallavicino. <adrianopallavicino@gmail.com>
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




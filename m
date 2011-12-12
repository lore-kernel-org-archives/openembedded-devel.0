Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1Ra6qN-0006mV-Bd
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 15:27:03 +0100
Received: by vbbfc21 with SMTP id fc21so3842515vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 06:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=8ylnXgg8iWT+UIAS/pBGiohjv3ZTzNGUfZjDoEccGMU=;
	b=NDGwLGP1L0gZzFZCHhDhq0gcTEcmFyEHdn32OVIeom58n1gWcasTznCrE6FoHI8481
	JgDNaDJF7O/tyd36Sz5gUyu1Zd/5b4dIDuTVCobmNhcIqkCs9l46agb2XyBAUDq2k6qE
	oNyfoHY/lurHz7ixQpTrdGn7j+9EbsAzPegNs=
Received: by 10.52.65.52 with SMTP id u20mr9794660vds.68.1323699605324;
	Mon, 12 Dec 2011 06:20:05 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39])
	by mx.google.com with ESMTPS id hj10sm14340041vdb.0.2011.12.12.06.20.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 06:20:04 -0800 (PST)
From: adrianopallavicino@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 15:19:39 +0100
Message-Id: <1323699579-25337-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <adrianopallavicino@gmail.com>
References: <adrianopallavicino@gmail.com>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [PATCHv3]libtans1_1.17: fix sources URL and md5/sha sum
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
X-List-Received-Date: Mon, 12 Dec 2011 14:27:03 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

 URL sources was wrong. md5sum  and sha256sum now refers to new archive
---
 recipes/gnutls/libtasn1_1.7.bb        |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 44da659..92302b5 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -3,9 +3,11 @@  LICENSE = "LGPL"
 
 PR = "r1"
 
-SRC_URI = "ftp://ftp.gnutls.org/pub/gnutls/libtasn1/libtasn1-${PV}.tar.gz"
+SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
 
 inherit autotools binconfig
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
+
+



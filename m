Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1Ra6Wk-0006Bq-H3
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 15:06:46 +0100
Received: by vcbfo13 with SMTP id fo13so3820943vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=XIQcBcSPysuZfzfZNRS0xdRzLabgiAMf3y54eUjl8nQ=;
	b=UW3ch3QtbITWPdF34ON/H8HSkctBuwteXihUVZ8l6VFIjELd48lFNHIwZsUijJkfqq
	DAFu/VEEw6zrWrd0wHKMrIfPOwegORXKal2LK/Ejq2UhiZAgcyPtV61bknDzOrXaY4Mv
	Ex4yY5Yoz/vSMvEn5UutG6eFfArtSHHCvhniQ=
Received: by 10.220.6.13 with SMTP id 13mr1948035vcx.232.1323698391420;
	Mon, 12 Dec 2011 05:59:51 -0800 (PST)
Received: from localhost.localdomain
	(host39-232-static.225-95-b.business.telecomitalia.it.
	[95.225.232.39])
	by mx.google.com with ESMTPS id hj10sm14282578vdb.0.2011.12.12.05.59.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Dec 2011 05:59:50 -0800 (PST)
From: adrianopallavicino@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 14:59:10 +0100
Message-Id: <1323698350-25272-1-git-send-email-adrianopallavicino@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <adrianopallavicino@gmail.com>
References: <adrianopallavicino@gmail.com>
Cc: Adriano Pallavicino <adriano.pallavicino@gmail.com>
Subject: [v2]libtans1_1.17: fix sources URL and md5/sha sum
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
X-List-Received-Date: Mon, 12 Dec 2011 14:06:46 -0000

From: Adriano Pallavicino <adriano.pallavicino@gmail.com>

 URL sources was wrong. md5sum  and sha256sum now refers to new archive
---
 recipes/gnutls/libtasn1-native_1.7.bb |    1 +
 recipes/gnutls/libtasn1_1.7.bb        |    4 +++-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/gnutls/libtasn1-native_1.7.bb b/recipes/gnutls/libtasn1-native_1.7.bb
index a91bd4f..2d41274 100644
--- a/recipes/gnutls/libtasn1-native_1.7.bb
+++ b/recipes/gnutls/libtasn1-native_1.7.bb
@@ -5,3 +5,4 @@  inherit native
 
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
+
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



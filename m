Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlRu-0001qF-4I
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:46:48 +0200
Received: by gxk1 with SMTP id 1so144426gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=XH8dhW84SjipbBFja0OXewRS45A3Uzc5GHh8Z93nIJo=;
	b=NlKaVKOo7wL33Zgge/FRBWzako8FoXBrfoqqjxFar8wLyZFIkZcwHIVUhvIAPRV+yh
	1893zaGbxodcFb4JW7v+IY9ktLIWH4dsxI1E3zHa1Sh8lllcneMmOajwgdH6Q6nqwzPZ
	9Qsf364J5opUpRpXyw1tLBIxmvJSC2hogihZ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JJkfn4RTvFxyd3HtzaFdyKlg2b9gzOdc4QneWJiAPAlToS7EWPEmzkD/s3JdnwoeVK
	fSOnlX60vgwN3E5eOem6yKWGTQK9dnZqgpzGQtQeba6qy5xu7iQN1ax+s6C6Y6X4AzUJ
	4ynQrX/v+RejkjNxKshryyA98y2SEAV3ZzhmE=
Received: by 10.101.2.7 with SMTP id e7mr9476360ani.79.1277858522374;
	Tue, 29 Jun 2010 17:42:02 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id r42sm345299yba.0.2010.06.29.17.42.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:42:01 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:41:41 -0300
Message-Id: <1277858503-27321-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
References: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] Remove mistake configs
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
X-List-Received-Date: Wed, 30 Jun 2010 00:46:48 -0000

---
 recipes/lksctp-tools/lksctp-tools.inc      |    3 +--
 recipes/lksctp-tools/lksctp-tools_1.0.7.bb |    4 ----
 2 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/recipes/lksctp-tools/lksctp-tools.inc b/recipes/lksctp-tools/lksctp-tools.inc
index 678531e..02ec988 100644
--- a/recipes/lksctp-tools/lksctp-tools.inc
+++ b/recipes/lksctp-tools/lksctp-tools.inc
@@ -1,8 +1,7 @@
 DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
 SECTION = "libs"
 PRIORITY = "optional"
-LICENSE = "GPLv2"
-#DEPENDS_virtclass-native = "python-native"
+LICENSE = "LGPLv2"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
diff --git a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
index 34c2ce5..1d4faa3 100644
--- a/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
+++ b/recipes/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -3,9 +3,5 @@ PR = "${INC_PR}.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
 
-PARALLEL_MAKE = ""
-CCACHE = ""
-
-
 SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
 SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
-- 
1.7.0.2




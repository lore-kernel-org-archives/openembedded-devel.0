Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJujA-00031V-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:57 +0200
Received: by pzk31 with SMTP id 31so3241572pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FrZW7a/xugttjGzw+dcGfRWnY2qtvMDARBmzBRbKGd8=;
	b=ihYi9ZH5WPZqLDK3q8y14w1HOEVBIDv8z/beI/n8SBtDhJkj7eTXCHwp5g6z7o5OdJ
	d9t5vN6wOZKm+I2glLaLVqAr4DAikEI/t2zhnWqtay2rAESeYy1NjIqL9cG3/AvLZf6p
	1HjMnME/L7P6Y8S601BwNfFAVPOmg1wAq4/F8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iRIyb5O0gZ/0BoVByzYr875y4Z9FP6H4pEqqGTn4lxpkr/Dl9s5gRLsJ3jExNxIx29
	7NGNYjW0YwT2nxwZK4PjBLPo2Bnf2Om5J5P4UeURB651PzLKUNNAGi2eVuM9bgL5Xadh
	nvSQYwdntOK/JUcUtuSZ7yTiTegbXwUYdnNUE=
Received: by 10.140.82.6 with SMTP id f6mr7055591rvb.74.1275510935810;
	Wed, 02 Jun 2010 13:35:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:48 -0700
Message-Id: <1275510896-30845-9-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 08/16] glib-2.0_2.24.0.bb: Remove virtual/libiconv virtual/libintl from DEPENDS
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/glib-2.0/glib-2.0_2.24.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/glib-2.0/glib-2.0_2.24.0.bb b/recipes/glib-2.0/glib-2.0_2.24.0.bb
index 56fe567..3a90dc6 100644
--- a/recipes/glib-2.0/glib-2.0_2.24.0.bb
+++ b/recipes/glib-2.0/glib-2.0_2.24.0.bb
@@ -6,9 +6,9 @@ UNIX-like platforms, Windows, OS/2 and BeOS."
 LICENSE = "LGPL"
 SECTION = "libs"
 PRIORITY = "optional"
-DEPENDS = "glib-2.0-native gtk-doc virtual/libiconv virtual/libintl zlib"
+DEPENDS = "glib-2.0-native gtk-doc zlib"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "\
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.24/glib-${PV}.tar.bz2;name=archive \
-- 
1.7.0.4




Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 173E8706AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8h2Rq030272; Fri, 18 Jul 2014 09:43:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uIgTFCiwWatg; Fri, 18 Jul 2014 09:43:02 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gvbn030242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:42:59 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83ki-0006iR-SU; Fri, 18 Jul 2014 09:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:23 +0100
Message-Id: <1405672966-25729-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/27] pidgin-otr: Add missing intltool-native DEPENDS
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
X-List-Received-Date: Fri, 18 Jul 2014 08:57:02 -0000

---
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index 94ab363..18dbe09 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "(OTR) Messaging allows you to have private conversations over instant
 HOMEPAGE = "http://www.cypherpunks.ca/otr/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
-DEPENDS = "libgcrypt libotr pidgin"
+DEPENDS = "libgcrypt libotr pidgin intltool-native"
 
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://ignore_extra-portability_warnings.patch \
-- 
2.0.2



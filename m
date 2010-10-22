Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9BaY-00028J-Rk
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:58:56 +0200
Received: by iwn35 with SMTP id 35so593381iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nLqgVMVjxOHiVxdfYFwImReiSsHYRJWCASC3KAAxOsE=;
	b=W49ceCHlu2isWVmtUOxeV0eaVpyLbYNeKrhY9p8PUlsqhtiNyR2oXoyXg3tSLEV3pK
	UMDqFQI4ZHbLEopUVIjOTdd7cSy6dSOcgV5uzZACf8EnLr7RpK3g3EqHFRJFDSlzytSC
	1DOM1yVA6EaHXIP2yLprPepgUOGIE/ZCHT8Ag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OnETlsDmT8u4RiWJO1Xr75/hmO2Lchgv1tHIJ9nVSMGEFv71pF55+uHZaqIbOSg0hE
	nTRpQ5gm9V9aOr4NHUanJy9g77AJlxNTGESqF9d1Lz/aBM7H/6dSzt5lrWy6Khs5NoH/
	+7OmIPHmkng459QChVgzhVr++h9quh64blQag=
Received: by 10.42.30.14 with SMTP id t14mr1645016icc.311.1287730697648;
	Thu, 21 Oct 2010 23:58:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w9sm2787396ibc.7.2010.10.21.23.58.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:58:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 23:58:01 -0700
Message-Id: <1287730684-14143-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] openldap_2.4.23.bb: Fetch ltmain.sh from the new location in staging
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
X-List-Received-Date: Fri, 22 Oct 2010 06:58:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/openldap/openldap_2.4.23.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/openldap/openldap_2.4.23.bb b/recipes/openldap/openldap_2.4.23.bb
index 94ed5eb..3ac15f6 100644
--- a/recipes/openldap/openldap_2.4.23.bb
+++ b/recipes/openldap/openldap_2.4.23.bb
@@ -188,7 +188,7 @@ DEPENDS      += "${OPENLDAP_DEPENDS}"
 CPPFLAGS_append = " -D_GNU_SOURCE"
 
 do_configure() {
-	cp ${STAGING_DATADIR}/libtool/ltmain.sh ${S}/build
+	cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/build
 	rm -f ${S}/libtool
 	aclocal
 	libtoolize --force --copy
-- 
1.7.1




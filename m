Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9Bae-00028Z-Gw
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 08:59:05 +0200
Received: by gwaa11 with SMTP id a11so750034gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 23:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qIwDSUWAxMFbDEgJ/fGthfnFdm3H2DqsRcJ6GX9/n7w=;
	b=wHs4+hxtJxAEDCLuM3XXCmT/W1gNa5dMjtVaaawTTKoeE/JHQzBhX04HV7FXtNE7MU
	Ax6i2EgNDGV5ZZ6g1YHbYUoZb9ZcrXiHzg457ccRpd2Ng3E313dKb6TFPV0GgkxCxfmR
	Q199SHncIH7ZjkkyYeDWDhdth2N40QqAoo3qY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=S9hL47Pwu+HC4QZ4ZZ4X9w9k65NGhzJMgIAgC8toAGOIwYpQYWaBz7ma8npNvd61is
	vcEKitLAkn47+zWru4V/gJXx6tgkdb9zRsXuxNu5Kt/sKR2DGRJibzEwDRnw9lu2nFLX
	6T47JayovCZiF2xnobRI6Lppjz/uTjC0WTIxg=
Received: by 10.42.194.131 with SMTP id dy3mr1878413icb.312.1287730699261;
	Thu, 21 Oct 2010 23:58:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w9sm2787396ibc.7.2010.10.21.23.58.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 23:58:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 23:58:02 -0700
Message-Id: <1287730684-14143-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
References: <1287730684-14143-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/5] autotools.bbclass: Use --with-libtool-sysroot instead of --with-sysroot
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
X-List-Received-Date: Fri, 22 Oct 2010 06:59:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index a634201..97bc47c 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -76,7 +76,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --oldincludedir=${oldincludedir} \
 		  --infodir=${infodir} \
 		  --mandir=${mandir} \
-		  ${@["","--with-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
+		  ${@["","--with-libtool-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
 		"
 
 oe_runconf () {
-- 
1.7.1




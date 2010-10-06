Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3bF5-00026M-NL
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:09:39 +0200
Received: by ewy7 with SMTP id 7so4161ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=tF/YYcnweikOF/4UTYN27Qg0qjbrQ2Q51vTQN9F4x0s=;
	b=JSx4SMwIoSBgk3yhIiLuK7sFKxiEyDWIRfoCxpUTD0FljmyGfGf+nTz7yZSWeHDlnR
	CHO1ekBtjWwDHgRNLodtoWKYQLZqH2WOHw/jEq43zsZB8VTtq9e/iuTkd/z6IUiDRPOO
	fzsmyub1/c81P9SQ1D6+UTLs68kMqPVpE7NIA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=flNPhXryt3tEbVvtKYXtVNAHsCfZ3cNKLP37SxTm9HsZ3yp/zLUzQapm4VkMRLJbxR
	PUP7VMHtpinwC0y3q4BFqpMDlsdPLMXxGnUYaK3qjElm/5oAiKIELiQ5U2TJf7mMMAdP
	SPoMm1ute5g+FcesXZM/r2iKgqgeEMmc/bKzM=
Received: by 10.213.14.84 with SMTP id f20mr1024334eba.75.1286399355252;
	Wed, 06 Oct 2010 14:09:15 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2171654eei.1.2010.10.06.14.09.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 14:09:13 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 23:08:57 +0200
Message-Id: <1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:09:40 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/cpan-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/cpan-base.bbclass b/classes/cpan-base.bbclass
index 379defa..a04f61c 100644
--- a/classes/cpan-base.bbclass
+++ b/classes/cpan-base.bbclass
@@ -5,7 +5,7 @@
 FILES_${PN} += "${libdir}/perl5 ${datadir}/perl5"
 
 DEPENDS  += "${@["perl", "perl-native"][(bb.data.inherits_class('native', d))]}"
-RDEPENDS  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
+RDEPENDS_${PN}  += "${@["perl", ""][(bb.data.inherits_class('native', d))]}"
 
 # Determine the staged version of perl from the perl configuration file
 def get_perl_version(d):
-- 
1.6.4.2




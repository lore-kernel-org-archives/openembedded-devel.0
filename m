Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2M-0006OF-8B
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:06 +0200
Received: by ewy20 with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HvaCSQs3EEsN1RsS5QYJL+SvOnkSlPb3t/zH4cGZ6Ys=;
	b=FxJvHmnOjnzm1mytHKuIjxbV5wwhgYFTwJUV3Y0XnRzADYOuO3Zbu7ETR/FoDDHYGa
	I5+9at+e4t2tw2ueLUl3UFmUyCGO0Ga2t36DDd2Osb7EBapC8bXpUKIZG52Y37PxcUXw
	azdxp7NFszONPoSZXfjl0Rak7+T5/gg9ra6T4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E+jGrBB57VlJ7Hz+PWfoebps/koVwzqrXCkijIp0uf9pPxZVuhfuwWYH3btlpt7n8l
	f2uZxjPq5TNlqT8YHw3u86s77tUdlTi0hyTzlasiD0J79MzS0P7kPcvjT25VzZWPJI7k
	PHoR9aSnx7DmRv1Eep1oPofbrrEeK1wey2Pqo=
Received: by 10.210.79.3 with SMTP id c3mr878629ebb.96.1242207561282;
	Wed, 13 May 2009 02:39:21 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2202274eyh.0.2009.05.13.02.39.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:20 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:40 +0200
Message-Id: <1242207556-15601-2-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 01/37] ipaq-sleep: don't strip during install - using coreutils this now breaks (strip: unable to recognise the format of the input file)
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
X-List-Received-Date: Wed, 13 May 2009 09:46:06 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ipaq-sleep/files/install-fix.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/ipaq-sleep/files/install-fix.patch b/recipes/ipaq-sleep/files/install-fix.patch
index 59eb17b..68e57af 100644
--- a/recipes/ipaq-sleep/files/install-fix.patch
+++ b/recipes/ipaq-sleep/files/install-fix.patch
@@ -5,7 +5,7 @@
  
  install-program: all
 -	install -Ds $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
-+	install -D -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -D $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
  	mkdir -p $(DESTDIR)/etc/init.d
  	install $(PACKAGE).init $(DESTDIR)/etc/init.d/$(PACKAGE)
  	install $(PACKAGE).conf $(DESTDIR)/etc/$(PACKAGE).conf
-- 
1.6.1




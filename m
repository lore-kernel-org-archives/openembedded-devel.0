Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PS3aA-0005R7-Dl
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Dec 2010 09:16:32 +0100
Received: by fxm11 with SMTP id 11so5308813fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 00:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=BQxow2zp4GfJorbKXyuy1idCCW34Kud4JryiH2ehy1Q=;
	b=AgQvN9UcghXhO/SkbxVTZqa5THUHl1WuEfJzS3Wm5hepsALqsg+UMrgfrfzJcXH9TQ
	GHwbc9Mwjf7jYqL/6YLYZqGX2eKYmGDgYvYlZHA+mZoLs+5RWhV7LeCxxHyrKcByK0HH
	r6AzyJVI1qz5Ag32VlBvvIgXSsM3ShpPVf0+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=A4o5OikxE6yvQKKawKcqf+11V7EXzubb44tenZPf3ku5oIWOQAIH6683ibJwxQEJ15
	j+OlhEOXkVMQp0ZYZvRMz71EusCTROmHg5FNxhfavh2Ske0ZyjSx2oeDayxqeD4Qo0kY
	JqVAMoObuCdC5psWSbVVbgU9ewUKx+3NnrBVc=
Received: by 10.223.98.197 with SMTP id r5mr3990868fan.68.1292228095689;
	Mon, 13 Dec 2010 00:14:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm1564276fav.2.2010.12.13.00.14.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Dec 2010 00:14:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Dec 2010 09:15:16 +0100
Message-Id: <1292228116-6248-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.3
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qemu-0.13.0: add D_P -1 for now, some people have segfault with it where 0.12.5 worked ok
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
X-List-Received-Date: Mon, 13 Dec 2010 08:16:32 -0000

* I've seen it on one host while building emacs-x11
* locale generation: http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-December/027723.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/qemu/qemu_0.13.0.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/qemu/qemu_0.13.0.bb b/recipes/qemu/qemu_0.13.0.bb
index 9ecfaa9..29ef11d 100644
--- a/recipes/qemu/qemu_0.13.0.bb
+++ b/recipes/qemu/qemu_0.13.0.bb
@@ -1,6 +1,7 @@
 LICENSE = "GPL"
 DEPENDS = "zlib ncurses gnutls"
 PR = "r2"
+DEFAULT_PREFERENCE = "-1"
 SRC_URI = "\
     http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
     file://leftover.patch \
-- 
1.7.3.3




Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3ui-0007v0-Ez
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:57:52 +0200
Received: by yxn22 with SMTP id 22so1569081yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=fMiDEBJD15zdXq8VmHz8S2eac7/O1WTwlLeuUgz9KGg=;
	b=qI8jmX4crGXy4IrvXGLcQjp2luFLWQYx5s7ZNvPq9OKZ2yK2i4ZISVpGqvWQCNP8Iv
	LNs5X2w6s6RnIqljKVsbLGSZHZwufRUltxgyn6bFwGKHCyicQFHar+zQVIPWdPBKSBEu
	ruSjsyTphoEftVudxt0lUDquPI2b4+yHZoO3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=LS/mlCBgdNyvL/VBaoe9MNbqWWB95jVNwA7EBY3eX/pD2qLEhDm408eJ6IV2FJBIGn
	l2OH9TMAY6beYdfoDm9pJ/KKtmjaY2MCsaseqWDf6hNvCjXMSoW+F25quQmrZJLu2Tbm
	bAZLqgqjGWmuVTbzFkMN0qTYszU761j0kTqIQ=
Received: by 10.236.189.41 with SMTP id b29mr6027011yhn.251.1306767283530;
	Mon, 30 May 2011 07:54:43 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:54:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:09 +0000
Message-Id: <1306767263-29895-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 03/17] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Mon, 30 May 2011 14:57:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/xorg-xserver/xorg-xserver-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
index 0f379e7..fd5492c 100644
--- a/recipes/xorg-xserver/xorg-xserver-common.inc
+++ b/recipes/xorg-xserver/xorg-xserver-common.inc
@@ -108,4 +108,5 @@ FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 
 do_install_append () {
 	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
+	find ${D}/${libdir} -name '*.la' -exec rm '{}' ';'
 }
-- 
1.7.1




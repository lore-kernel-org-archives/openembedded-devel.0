Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QR3vD-0007v0-F9
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 16:58:23 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so1569081yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=NH8BUt6ERcRB7PhC4FkEaufVv1r/0JgBZyUkuYxNQAM=;
	b=wHQrYrmcqvZz8EHQE52dBEsJMAQ/DUJE8eZjxoRk3t3HZ+YW+mO4cXnF/BcTSqkQm7
	WU5syHfFN7TYzW810QuJKIKaCw2ia8idbfyijI8RNXWZTKfCaBG6km+T357oFLiousGv
	zsyArplEHb4uJqHpPOJn76v9iN9Az8Qff+E04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=a+NxxKE4ldc37S4/B/nbjDWtw4IJCT+XYeNsYN7GlyZ1TvabBcNdWwbH2YJsuMr8Es
	T/1turQSHmorWG3xGR6NGtckEOebvHMW1cGqerfeBtlO/XO38NZMQCB65U7A3EG9q7iQ
	TCXPjnDWHZcQqDCqQddtZJEtfvvtMbY/4UKgU=
Received: by 10.236.161.232 with SMTP id w68mr6385421yhk.24.1306767317222;
	Mon, 30 May 2011 07:55:17 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e48sm2530494yhk.56.2011.05.30.07.55.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 07:55:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 14:54:22 +0000
Message-Id: <1306767263-29895-17-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
References: <1306767263-29895-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 16/17] qt4.inc: add locale to PACKAGES_DYNAMIC list
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
X-List-Received-Date: Mon, 30 May 2011 14:58:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/qt4/qt4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index b37e7ff..322f44c 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -95,7 +95,7 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-qml-plugins"
 
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
+PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-* ${PN}-locale-*"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
-- 
1.7.1




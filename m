Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QERMl-0004wY-D7
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 21:22:39 +0200
Received: by pxi1 with SMTP id 1so1952012pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=44Dw+aikQjsPBUcDBivbCZJxDk/ZIvUiodoomjUvJLc=;
	b=SN5vgb7XyfIbAUCF8f7JEjB08jJN8mRA2+yRI3XTxHTOLjO05yfVU07LjJpqe92qe0
	Y2CPz9rNGPGCDvbCrlSZzRBANQfrwS7rIDpCtgsoH6ay4YcS0R9AHJ6N6lfVrNZoorF7
	AyUjb/YIO2Yn1cJXTMNZ62x/VgPGykzdc1h+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jtmtLZG9Ec9yyEZycrS1jwsv5srVaDRP4euarVgvsjEFy3w2T/MEFmCxK/sW8gO0fZ
	F48qYOAcZZ+3BiaruzL3fKV+zRiHJKNMsrLjGvJlXNegTw0TMqJWxOC5Iuv9Yi9ZfDw7
	Lq/mhOL7cmJh/OmLsojRKRP8cjcmEc27kcnSg=
Received: by 10.142.144.15 with SMTP id r15mr2779362wfd.439.1303759209107;
	Mon, 25 Apr 2011 12:20:09 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s39sm8119787wfc.4.2011.04.25.12.20.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 12:20:07 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 12:19:52 -0700
Message-Id: <1303759192-7863-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1303759192-7863-1-git-send-email-raj.khem@gmail.com>
References: <1303759192-7863-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libgpg-error_1.8.bb: No need to add gettext directly to DEPENDS
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
X-List-Received-Date: Mon, 25 Apr 2011 19:22:39 -0000

From: Khem Raj <raj.khem@gmail.com>

Let inherit gettext take care of it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgpg-error/libgpg-error_1.8.bb               |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
index 2c17e53..321c7b8 100644
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
+++ b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
@@ -14,7 +14,6 @@ SRC_URI[sha256sum] = "bdfbf2677147239d2d26d4e37f44635d9fd97c133c9ef9fd9793a12a05
 
 SECTION = "libs"
 LICENSE = "GPLv2+ & LGPLv2.1+"
-DEPENDS = "gettext"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-- 
1.7.4.1




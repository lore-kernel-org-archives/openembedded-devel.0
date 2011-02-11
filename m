Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gdalex@gmail.com>) id 1PnzRY-0001aN-QE
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 21:18:18 +0100
Received: by qwi2 with SMTP id 2so1748850qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 12:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=VV1VD0qwyCY4DL/MT/JzoquflSGbn9VtFzKL3l07Yt0=;
	b=R8Oh+QmI6xPOY4o491g32Lya04TcS9KzI2ize5IUb0hLVQ0ngSB4yQ2FDPrjEafbDf
	6PWGU71xYS2yFnReWcz32gJnu+LVMcQ0azO3He2yHWKzP5oyZXWUurMLjBng/lrGQBWy
	G2LN3UvvvvQTWmL9WlsEwlYnnmKgEDL6/vdLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CP8iclRh0q0Qr647Woez6bXXMuWGq32UYTmFVY+3mhL0DAG7YDwa23ZarpGsq1H+LL
	vB5pvj5so4yFWtegj4aJtimKKup9Kp0RECkm4FqGtRRn4mnZcd5fEpag6SvOZVQ5zan/
	9xLqWaDviMzamha4C5o5tWoSlKsRikO4OZfAI=
Received: by 10.224.89.6 with SMTP id c6mr1022322qam.206.1297455428764;
	Fri, 11 Feb 2011 12:17:08 -0800 (PST)
Received: from localhost.localdomain (mail.paradox.com [206.41.90.173])
	by mx.google.com with ESMTPS id q12sm809384qcu.30.2011.02.11.12.17.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 12:17:08 -0800 (PST)
From: George Alexandru Dorobantu <gdalex@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 15:17:36 -0500
Message-Id: <1297455456-21706-1-git-send-email-gdalex@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] libtomcrypt: updated download link
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
X-List-Received-Date: Fri, 11 Feb 2011 20:18:18 -0000

* updated the download link; libtomcrypt has moved to google code and the old link is dead

Signed-off-by: George Alexandru Dorobantu <gdalex@gmail.com>
---
 recipes/libtomcrypt/libtomcrypt_1.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libtomcrypt/libtomcrypt_1.17.bb b/recipes/libtomcrypt/libtomcrypt_1.17.bb
index 9fc9fd0..2f82e36 100644
--- a/recipes/libtomcrypt/libtomcrypt_1.17.bb
+++ b/recipes/libtomcrypt/libtomcrypt_1.17.bb
@@ -9,7 +9,7 @@ PRIORITY = "optional"
 LICENSE = "PD"
 PR = "r0"
 
-SRC_URI = "http://libtom.org/files/crypt-${PV}.tar.bz2"
+SRC_URI = "http://libtomcrypt.googlecode.com/files/crypt-${PV}.tar.bz2"
 
 inherit autotools
 
-- 
1.7.1




Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1LlOQl-0002KN-Iv
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 15:13:39 +0100
Received: by fg-out-1718.google.com with SMTP id 19so461890fgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=cvo64F16Bt7ucxoo9tCcJSqCTMNOkr5ZCsa/cv2DWyw=;
	b=Y8cNSywZBmCEZN4l9aj3ojNDsf/51JrJWe9VlyfahUnHo9Rrb0koCllrBDS40lbscB
	5XxaV04zj65QyKT0oHtQw1LisBEixkOBAKcsFcOqGT4yC/nbe4fnicNrx6ThcUDYWNi5
	IChrXfMzc8J6QrZ7fuMivUpIkEsN5XZhoFGPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=a0E1jqAP1/zsTJGopof/5nBZHTSJQAGtYga26r5xIrSOIEgqbBog+IKqVTJHYhRDiY
	jSs/bFYnuns49uLttkGYRelsTbkEBtEjWLjRZVXvXoDjFpLfSavXjzGbwQfkjr8XMfSv
	SYeXsi+QoLkGRhxufGmwI1/trP+m2U2mfSUhI=
Received: by 10.86.3.4 with SMTP id 4mr1839665fgc.54.1237731143698;
	Sun, 22 Mar 2009 07:12:23 -0700 (PDT)
Received: from localhost.localdomain (77-22-121-59-dynip.superkabel.de
	[77.22.121.59])
	by mx.google.com with ESMTPS id d4sm3075411fga.29.2009.03.22.07.12.23
	(version=SSLv3 cipher=RC4-MD5); Sun, 22 Mar 2009 07:12:23 -0700 (PDT)
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 15:12:22 +0100
Message-Id: <1237731142-8136-1-git-send-email-matthieu.poullet@gmail.com>
X-Mailer: git-send-email 1.5.6.3
Cc: Matthieu Poullet <matthieu.poullet@gmail.com>
Subject: [PATCH] Alsa-state: Wildcard removed and all *.state put back in the recipes
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
X-List-Received-Date: Sun, 22 Mar 2009 14:13:39 -0000

The wildcard doesn't work properly.
So either the wildcard support must be fixed or all the *.state files must be added in the SRC_URI.

---
 recipes/alsa/alsa-state.bb |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/recipes/alsa/alsa-state.bb b/recipes/alsa/alsa-state.bb
index 3ebc0d5..a878c57 100644
--- a/recipes/alsa/alsa-state.bb
+++ b/recipes/alsa/alsa-state.bb
@@ -13,7 +13,15 @@ SRC_URI = "\
   file://asound.conf \
   file://asound.state \
   file://alsa-state \
-  file://*.state \
+  file://asound.state \
+  file://at91sam9263ek/asound.state \
+  file://spitz/asound.state \
+  file://tosa/asound.state \
+  file://c7x0/asound.state \
+  file://magician/asound.state \
+  file://hx4700/asound.state \
+  file://nokia800/asound.state \
+  file://akita/asound.state \
 "
 
 inherit update-rc.d
-- 
1.5.6.3




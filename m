Received: from mail-gg0-f176.google.com ([209.85.161.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tl4kZ-00043N-DO
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 22:30:55 +0100
Received: by mail-gg0-f176.google.com with SMTP id h3so268332gge.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 13:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=p96yclbYG+NARZEpKLBtb4DqRiaOQEM8A0i+SCF1S5o=;
	b=U2EHR1BQS0hUL6xRAhM0ws6zlBlUFOuFX3y1r+mNec8LDrYRJw8h//J+EilK8tNwg9
	KnvtstDsUl+AdJ60t8Mv1SPFDSRisUDhW3XQVB//YHjs4vR9OxBtR9O+h+DEZeMFr+xf
	EucZbFTnw3gl2hE1WNE6dGRnd8OUXfCv+g6tcsbN5negzgCPWfieGYFnp1fsIQBKEm0D
	NpqEugknscZvDiaKNkc0+Ch7/4rz9O+6CP+xf88/vGOoBHmL4EyYg2qxa6Yu6h5ROsZT
	V2BmddaYm/byU5ZtJ28ofhwuStEEDDIzitstI0anKxIPFi9C34A71jOxIRb/OYwfB8d7
	VPXg==
X-Received: by 10.236.114.11 with SMTP id b11mr3455975yhh.61.1355865372608;
	Tue, 18 Dec 2012 13:16:12 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id h37sm2441909anm.10.2012.12.18.13.16.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 13:16:11 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 19:15:58 -0200
Message-Id: <1355865358-21642-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
References: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/3] xf86-video-geode: Add rdepends on EXA Xorg module
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
X-List-Received-Date: Tue, 18 Dec 2012 21:30:55 -0000

Change-Id: Ia182dcff4d42359800a3c19e4b7988e3aa1e518a
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-driver/xf86-video-geode_2.11.12.bb        |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
index 2327054..aa1dc29 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb
@@ -2,9 +2,11 @@ require recipes-graphics/xorg-driver/xorg-driver-video.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=f8ad89d9d9a024f19d7dcc5acb044a42"
 
 DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "a99c521db731c2f1df309057a8465e4c"
 SRC_URI[sha256sum] = "28d845d727d99bfa4d4b93c5486ec01b72eb222e0910a766089db1103b1c2d92"
 
 COMPATIBLE_HOST = "i.86.*-linux"
+
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
-- 
1.7.2.5




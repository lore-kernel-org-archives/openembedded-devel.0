Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MbEhF-0008IH-9z
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 16:21:01 +0200
Received: by ey-out-1920.google.com with SMTP id 3so38978eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bg9bDQN234uDYxF/k9UgvmsWjgV52qjTjBOgctYjez0=;
	b=jA5npq4I28aSMWYF9Ml/VQ/PeR0Ep0LkpqG+MfF7gd1qzqb1t3eoMbbkkUH9dGDup9
	LLix/xQziwkKnfLq5TB2b4cbs7FJjK7KKldRsuCFWnyy3mMhv4ZfaE48RszrFmusasL8
	anbfqntMAe8WUmRwvlwU+78kQd/g8uxafD8No=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZsnDKSbMKUpxejZ+wntda0j2wYVbXU1Jn98oDPY4oQFBRHff6UxnFtx8p9C7iDpGBA
	ywym7Ti3VMg8xLEG4ykZz+rAf+lfRnO8qiZkCyycKcTwhr32X+aHtAm+w2paLCQl/WGL
	zEWOfaX50rcJnmm1FtDU4d98ZkiYNPeGaED74=
Received: by 10.210.136.15 with SMTP id j15mr2531270ebd.21.1250085872728;
	Wed, 12 Aug 2009 07:04:32 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 7sm2666235eyg.45.2009.08.12.07.04.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 Aug 2009 07:04:32 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Aug 2009 17:03:58 +0300
Message-Id: <1250085838-27253-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] Re-enable qt4-embedded-gles recipe after fixing dependency problems.
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
X-List-Received-Date: Wed, 12 Aug 2009 14:21:08 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 ....5.2.bb.disabled => qt4-embedded-gles_4.5.2.bb} |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 rename recipes/qt4/{qt4-embedded-gles_4.5.2.bb.disabled => qt4-embedded-gles_4.5.2.bb} (93%)

diff --git a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled b/recipes/qt4/qt4-embedded-gles_4.5.2.bb
similarity index 93%
rename from recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
rename to recipes/qt4/qt4-embedded-gles_4.5.2.bb
index 5aa07c2..7da5756 100644
--- a/recipes/qt4/qt4-embedded-gles_4.5.2.bb.disabled
+++ b/recipes/qt4/qt4-embedded-gles_4.5.2.bb
@@ -6,6 +6,9 @@ QT_CONFIG_FLAGS += "-D QT_QWS_CLIENTBLIT -depths 16,24,32 -opengl es1 -plugin-gf
 
 require qt4-embedded_${PV}.bb
 
+QT_BASE_NAME = "qt4-embedded-gles"
+QT_BASE_LIB = "libqt-embedded-gles"
+
 LICENSE = "LGPLv2.1 GPLv3"
 
 DEPENDS += "virtual/egl"
-- 
1.6.3.3




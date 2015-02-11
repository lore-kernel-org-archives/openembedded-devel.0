Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1C69E7066B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:06 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id n8so548185qaq.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=OTLKyKw8wbsD7PaDnFYhZJ08SGE/LOiNyNTzi9+nDas=;
	b=RqVZ/IFttxEdpSKmQhJfd1kPjN1GnaO50O57QObuPLZW1PaRHkok1377cW9yH7GG1N
	0WlwpzbdISnVL9RyWkAVQ7Bo4GLkBdVjyHrCmIfI7Ek94oHiE1ek00RkbX5MSGGAyDF2
	R8OGYpb4lOaDpd1OTGzJ6FZ8twdn77FV4wUSEuzopSwgU7vk+2Q+wkH29p1hy+MOaLeC
	nVPXngDdBnBdG24fK+3rkACnXVLWUmDZzsAAOgqAVA0U4dX6aTNcyId0TR50PyKLCTQq
	vx7EMZiTyucyWjp86wMiD4K/QtvsUKUs3lV9lauC1RwYRDYrfPgjuqKkcoQ/vMBf9p19
	GFhQ==
X-Received: by 10.140.102.170 with SMTP id w39mr56032611qge.100.1423619047424; 
	Tue, 10 Feb 2015 17:44:07 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:32 -0200
Message-Id: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 1/8] qtwebengine: Add a missing build dependency on libcap
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Feb 2015 01:44:08 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtwebengine.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 51beac3..f6b1304 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -8,6 +8,7 @@ DEPENDS += " \
     ninja-native \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
     libdrm fontconfig pixman openssl pango cairo icu pciutils \
+    libcap \
 "
 
 COMPATIBLE_MACHINE = "(-)"
-- 
2.1.4



Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 477B56F194
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 06:17:43 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kx10so3012979pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 22:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e18bgwmtr91+8PKnvVv/YBEs62p0DCZyLcT4rfK6FlQ=;
	b=CHR2ylJ0ErMjZ3XMQzBQz4oBlUHDvkaa3YSbkTp6zH0Oc0ie6v4HY5wMam5YvT3d+q
	GzpugTrzqU9cR/ZuXigBW6toSqz4qJx8TMGMQIbW33QS56UrwApr4oVjUZ8OTMTF/ymC
	CE6a4m/FAkMvhI1cvzFqfDjk4KVBVFI7R4s2RNrSCbqesHetXHWz/RNmdP23Ul1an7/c
	/xFMOnjB+LaS0UvnMb/umZEGw285y6ZXpcTtwszdn4n2605zMrV+PtTTccPumvFWAB+/
	T9Dcj2N+LxrNV96YB+YdWrj6SKsiScr9bd10nrUPT/K00dAE0nCdB5TaLxx3UeNucGDH
	J7FQ==
X-Received: by 10.66.162.74 with SMTP id xy10mr7310862pab.4.1392963464664;
	Thu, 20 Feb 2014 22:17:44 -0800 (PST)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id y9sm42019938pas.10.2014.02.20.22.17.43
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Feb 2014 22:17:44 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2014 22:17:10 -0800
Message-Id: <1392963430-16876-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1392963430-16876-1-git-send-email-armccurdy@gmail.com>
References: <1392963430-16876-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-qt5][PATCH 2/2] qtwebkit-examples: add missing RDEPENDS for ca-certificates
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
X-List-Received-Date: Fri, 21 Feb 2014 06:17:44 -0000

If qtbase is configured with openssl support (as it is by default)
then the qtwebkit example browser apps require CA certificates to
check the authenticity of https connections.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtwebkit-examples.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
index 50c28cd..8a8e000 100644
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ b/recipes-qt/qt5/qtwebkit-examples.inc
@@ -9,4 +9,4 @@ SRC_URI += " \
 "
 
 DEPENDS += "qtwebkit"
-RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
+RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins ca-certificates"
-- 
1.8.1.2



Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 613936EC6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 00:40:21 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so12625298ykp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 16:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RJYTjXp/UGQ9wamlRNAEnvj/CI68mqQfANOPaA+1ZFg=;
	b=gVoFBj8g1seJ0Aue4RPoYQFTJjFzwuUVmJGIkCZtT9AGQZ0Ylmow7Y7AtHEK2m7SGj
	kkPR6V9hPiQ5UX5pjincCEc6zKE8thBwr6ls351mgQLJ9Zsi40W3MDS7KVTESNgNe04F
	JfFnZLZJDNrv0JOi5MvoaoZD7BpoElVBT32rYoiQJxd0Rbe+6Ye6XLsGnFTg+V7mZ0Ap
	S/IqJoUV1QTOQ9+klCch0t/hGV04hCbYsqLnI0ZHHntdgHLigk/pzPUY0/rISRF0Juew
	/pio/BJh/eRrz/3z49KPB08YZ5mSbnJJRxwGvuKMQfSF0A6xpvPBfSBoXKwe2x2vP3SD
	LYAQ==
X-Received: by 10.236.207.73 with SMTP id m49mr27049068yho.5.1393202422773;
	Sun, 23 Feb 2014 16:40:22 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id 48sm44205160yhq.11.2014.02.23.16.40.21
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 23 Feb 2014 16:40:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 21:39:54 -0300
Message-Id: <1393202396-11130-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
References: <1393202396-11130-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v3 2/4] mallit-framework-qt5: Don't set OE_QMAKE_PATH_HEADERS
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
X-List-Received-Date: Mon, 24 Feb 2014 00:40:24 -0000

The qmake class now respects the QT_DIR_NAME setting when setting the
headers path, so this change is not needed anymore.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/maliit/maliit-framework-qt5_git.bb |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index b6d8cb3..633bf6e 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -6,12 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 
 inherit qmake5
 
-# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${includedir}
-# but
-# actually it is ${includedir}/qt5
-OE_QMAKE_PATH_HEADERS = "${OE_QMAKE_PATH_QT_HEADERS}"
-
-
 SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://maliit-server.desktop \
-- 
1.7.10.4



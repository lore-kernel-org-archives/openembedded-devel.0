Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (unknown [209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id CF56165D33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 14:47:10 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 19so6136673ykq.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1x80WoKc8pMh2Mk0xebUqnu8IoRu3IeBesuQzamU90=;
	b=EH3ydcn5KxD/tHa7rwkV4JigqfozbtZih+JOR1ZakosXnUGOKk/eHVPLhZ2ZBp1ivl
	toU+5fC1FsAruNFqU47ugyRlMcjEcRCTFeDnZOIxOGfaNSMcocNRMpI9Z5bBmV/kLRvx
	hDll340n+3t2tT206tauae4iPBRroiyb2lgwLKkfTo9w8Dv+rxJhFC7lWUrBeNgCWQU8
	lRZ/u7qd54eZqAZIdCBzikOVdPs6r7+hxMrBry/AbvMES1Ov2qhzyO0ORD5fnet+7ZDi
	7s+UrUv3pG3jzRodSh0I/83FYy/8muB3skK03dguCBIuFM6ZSmjvGWCmRt7QnBOIz4Ea
	BfCw==
X-Received: by 10.236.222.106 with SMTP id s100mr35788038yhp.38.1401115631226; 
	Mon, 26 May 2014 07:47:11 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id m50sm18233184yha.8.2014.05.26.07.47.09
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 07:47:10 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:46:48 -0300
Message-Id: <1401115609-12644-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401115609-12644-1-git-send-email-otavio@ossystems.com.br>
References: <1401115609-12644-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 2/3] qtbase: Remove examples.pro file from packages
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
X-List-Received-Date: Mon, 26 May 2014 14:47:12 -0000

The examples.pro file is useless as we don't deploy the
source code. Remove it from the packages.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtbase.inc |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 1a25aa4..2c32907 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -221,6 +221,9 @@ do_install_append() {
     if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
         cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
     fi
+
+    # Remove example.pro file as it is useless
+    rm ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
 }
 
 PACKAGES =. " \
-- 
1.7.10.4



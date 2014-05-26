Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (unknown [209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 69FCA6B89F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 14:47:11 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so6437220yhz.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1iTHAesVLateN4n/DhXDxB2aHB3aMFVOH3u6AKP9USY=;
	b=q7tj3jZa/kmcqA5f+GTNIWSpLSq6DackQaVo9XAdXWlxCpbdhtVZpGvTw4FdPasjBm
	hKPf0MG6bN1a5AAuyPLWMxjeSi5ahZCqgjYa2d0ew8Slzarnx8NaytrvT+M4hri31XJw
	tGyhQNYJl3lUgNH1yQexCwRaMkS+5bpYL0Fv/uu9nK9Oxma9k3HEYAylJoPIi0Ooax9d
	lIebAy0bI7i/dGMF0MQoRoPo8ncj2256RngIwYOpWNma6Bu/BjV/RfV++kRJV7pCrtaH
	dEtaGoDei8uSHfmKLaTyKgla07X0dFLGbLvc8R5QajkCK9lf982YHiYIc0PK6XOEzqK7
	5lxA==
X-Received: by 10.236.126.9 with SMTP id a9mr1343253yhi.83.1401115633029;
	Mon, 26 May 2014 07:47:13 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id m50sm18233184yha.8.2014.05.26.07.47.11
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 07:47:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:46:49 -0300
Message-Id: <1401115609-12644-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401115609-12644-1-git-send-email-otavio@ossystems.com.br>
References: <1401115609-12644-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 3/3] qtsystems: Remove examples.pro file from packages
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
X-List-Received-Date: Mon, 26 May 2014 14:47:14 -0000

The examples.pro file is useless as we don't deploy the
source code. Remove it from the packages.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtsystems.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtsystems.inc b/recipes-qt/qt5/qtsystems.inc
index 8b2a770..5a8727f 100644
--- a/recipes-qt/qt5/qtsystems.inc
+++ b/recipes-qt/qt5/qtsystems.inc
@@ -8,3 +8,8 @@ LIC_FILES_CHKSUM = "file://${S}/src/imports/systeminfo/qsysteminfo.cpp;endline=4
                     file://${S}/examples/systeminfo/qml-storageinfo/content/ProgressBar.qml;endline=39;md5=5213e8171c07d54db7107f29ac2f7b5e \
                     file://${S}/doc/src/systeminfo/systeminfo.qdoc;endline=26;md5=757f4eda130ceff3ca0985dde715af07 \
 "
+
+do_install_append() {
+    # Remove example.pro file as it is useless
+    rm ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
+}
-- 
1.7.10.4



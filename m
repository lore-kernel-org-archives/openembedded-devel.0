Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id C45C471637
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:27:57 +0000 (UTC)
Received: by wesk11 with SMTP id k11so53234345wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OPmpov6D6CsntO+H1yEGFsLl54HAjCcpoOGy+BRPuaM=;
	b=C6KrKVT6X2QNjkCQZ16z2nL7BRZr3Vg4zV9cYo0WpO72jLDPKl5f4zIcYSYi2ESBhE
	J+ZRMF2F7sTM/LW32vKOCvrWfRZqWlweH1q5ru+n3lAAtyyw8+lfsYl48FR39pi585Zd
	7rDAyLHw2XNB0zolzyeCU7JloOn6LUdPEtfaAzIg2syN8vq9JLlOH7PwntGk+zTownDw
	vW8UV6Ox0aPvwBz24nij9Llts5py6IA89yV6GM+xXITOCaES6/usxgF0tnSz0cTorBrc
	0A8/MxZbFe2q2TEAuzGrFyMoCLfrAX2IjoOiELytapWmugdB3TJOZtP3rlndW4GZOxF8
	4HIA==
X-Received: by 10.194.134.169 with SMTP id pl9mr18078616wjb.67.1425565678373; 
	Thu, 05 Mar 2015 06:27:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hj10sm10742622wjc.48.2015.03.05.06.27.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:27:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 15:28:01 +0100
Message-Id: <1425565681-30153-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <20150305141706.GS2337@jama>
References: <20150305141706.GS2337@jama>
Subject: [meta-oe][PATCH] cloud9, nodejs4: blacklist
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
X-List-Received-Date: Thu, 05 Mar 2015 14:28:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb     | 1 +
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index b5dbaa8..21c7e8a 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -8,6 +8,7 @@ PR = "r5"
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
 
+PNBLACKLIST[cloud9] = "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
 inherit systemd
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index 7e67bcb..ebee536 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
 
 DEPENDS = "openssl"
 
+PNBLACKLIST[nodejs4] = "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
+
 SRC_URI = " \
     http://nodejs.org/dist/node-v${PV}.tar.gz \
     file://libev-cross-cc_${PV}.patch \
-- 
2.3.1



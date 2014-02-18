Return-Path: <armccurdy@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id C7E996EEE6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:01:57 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id un15so16349063pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2014 00:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S6OetpOHH8yHAGQcdbracMRDe8q5fwKQWYt+HIfRRvY=;
	b=WaVkb0fKDtZlJn75nUOd0uI64bZxMboe5kK08G6qjRvB/OJIXpxUAtDYBCTe9/96po
	YMqPhaHXrwLM1NwJjXlZJU/rBCaSA+HpuLPwPQy554wZGI4xXM5mL63j1Imh79iZBQCt
	UXiH5ILpLhkmBoMQTP3DgkCBMO7NbG6w++wWtVow98Wc1dAg0KP97yAtPFyDAd9D6you
	uDTKG8CaW/iJvGVJSJUFVCp+nf2p65jGIZXLfMw2LqZOZmtcbZIq2w9b8MEehk+WMWci
	HbTDrRgVOz9R1F25qmUwNSEUkj4paby6sd25faLFW53R+0wmryfDFdj+5qIdWcUy/4n0
	g5rg==
X-Received: by 10.66.26.176 with SMTP id m16mr8673540pag.142.1392710518792;
	Tue, 18 Feb 2014 00:01:58 -0800 (PST)
Received: from t420s.gateway.sonic.net (173-228-90-200.dsl.dynamic.sonic.net.
	[173.228.90.200])
	by mx.google.com with ESMTPSA id ja8sm53140007pbd.3.2014.02.18.00.01.56
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 00:01:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2014 00:01:28 -0800
Message-Id: <1392710488-7191-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <20140218065625.GG4067@jama>
References: <20140218065625.GG4067@jama>
Subject: [meta-qt5][PATCH] qtbase.inc: don't force ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Tue, 18 Feb 2014 08:01:57 -0000

Forcing ARM_INSTRUCTION_SET to arm when building qtbase no longer
seems to be required.

Confirmed by forcing ARM_INSTRUCTION_SET to thumb and building
qtbase 5.1.1 and 5.2.1 tuned for both armv4t and cortexa9thf-neon.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index f056393..ff62297 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -126,9 +126,6 @@ QT_CONFIG_FLAGS += " \
     ${EXTRA_OECONF} \
 "
 
-# Qt uses atomic instructions not supported in thumb mode
-ARM_INSTRUCTION_SET = "arm"
-
 do_generate_qt_config_file_append() {
     cat >> ${QT_CONF_PATH} <<EOF
 
-- 
1.8.1.2



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 15DD36BE36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:45 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so344278eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=HArha5FZKvzr/gNprIMIia+Gwr0XzmxAidNNVDGr0as=;
	b=xK5ayRnnuX4vtC5BA3iYiR+x5Sg4JBoty8V1XUMWG2G8MbfJR/xYruBSvErek8m6qN
	xXsjeeIFp6lt6lYAJHdjnU76iuJYHlaMn4rYsp2pSphD6r5c88erA96j0D3k9aWNFwpl
	/f06En2hA6NV72cqF2icgUWKQfCvk8M/K6FMcHnHuf3VryZQnN15ysGzDzVC0wQqvnM1
	XJ4YOSw1MtHXX6J+ulvTPea6cjVeMRJShPbh1lS4rSQmUY7/YKFnl1m7ODP9FgXix5TC
	mDpTZpczJAo6H2Vu2O8Aiew4PmJOwUGFjJuXZPf8/twbjtUhjaEhCyEOdivmUAETRhSN
	Z/cQ==
X-Received: by 10.14.174.8 with SMTP id w8mr39770eel.84.1377791506529;
	Thu, 29 Aug 2013 08:51:46 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm47159568eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:36 +0200
Message-Id: <501bb56c14488646b1d7a721cde801a53db04ed9.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 43/66] networkmanager: Add PACKAGECONFIG for concheck
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index 70bda27..f190dfd 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -40,6 +40,7 @@ PACKAGECONFIG[systemd] = " \
 "
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
+PACKAGECONFIG[concheck] = "--enable-concheck,--disable-concheck,libsoup-2.4"
 
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
-- 
1.8.3.2



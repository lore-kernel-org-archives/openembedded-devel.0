Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6F970A77
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:06 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2343205wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p9NxDieft/da369rxpPaWW1IpLBqZ7ZP2mhEaOo+eXM=;
	b=0sfn9y/rTt0ii6s6+XllQLhlbVbDifvwqzJLCFWm5uenSpB/m6ayI+Bk3gShOlKnAX
	Ud7mFqXoK8xBzbqq/NaneJpUq9zAhXLltNI90JAZTK8qHIyY4GcPVNG5Dcsre6sILsGb
	75IM5mJx/X0BziSNMTxhx8l7u1x1KatZIaw38GnBXddBiaSaAFLn68+/4uH6TpNe3yo7
	Fs89nDKdepAYY5zcxmONF5iq9MeyNcztGoRDRUu7Qq+GPd+X6BdWOROsZ3GvTLL1pBHw
	ORjS6SQy8wFw+TgOsTuArDZep2/QmoFWcymNZhR2HqIP/M3IaGVQCXy7i0KB/mKN5v3H
	moRA==
X-Received: by 10.194.205.129 with SMTP id lg1mr5796160wjc.97.1407600547934;
	Sat, 09 Aug 2014 09:09:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fb8sm20418263wib.15.2014.08.09.09.09.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:54 +0200
Message-Id: <1407600537-10857-33-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 33/36] epiphany: add dependency on libnotify
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:08 -0000

* fixes floating dependency:
  epiphany/epiphany/latest lost dependency on  libnotify

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 4c8c58a..9e1a0dc 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNOME default webbrowser"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring avahi"
+DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring avahi libnotify"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "0c566b3ffd428d2135e3c8cb65352d64"
-- 
2.0.4



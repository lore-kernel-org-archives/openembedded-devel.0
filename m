Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id CF9BB70A8A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:42 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so6774783wgh.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I0D2Id0LTaWcWfTpiHycnMJe1bnd80FQFEno6nhLxVw=;
	b=zYpfngvDUmomC22erApfdBXGerEtq44fH9mZkiNj8thWXDCreTpWDeVlv0gx5Z0dZh
	z1gsXKXrZIhOOAq33OWhsdi18bQKm3YppTTPyjaGKKhYWFkrBhCABuL3WUswA9Ffj7Nf
	HpXHmEcWJYyvRfyMlLh+n43n6sJ0W5ulpm8WxkY0NvbKcnlbzP3Dp4RZ2Y/2uwLEEe+c
	ke6Kmr+Ja0hPDCstlF2ZuiHBkkJ6iWU0XGhVsYq3gR49e4ASqt1533nzQ35B2P6q14J3
	mADw64QQtMgdHmEq77F2vqPkW3yQODYzfKhidHjxw7nvmvNIY1Ezn9ibsn92fV3zz2iW
	D0pw==
X-Received: by 10.180.211.233 with SMTP id nf9mr11393664wic.33.1407600523355; 
	Sat, 09 Aug 2014 09:08:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h13sm25549673wjs.2.2014.08.09.09.08.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:34 +0200
Message-Id: <1407600537-10857-13-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/36] claws-mail: remove unrecognized options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:43 -0000

* fixes following qa warnings:
  claws-mail-3.9.0: claws-mail: configure was passed unrecognised
    options: --disable-gnomeprint --disable-clamav-plugin
    --disable-aspell-test --enable-aspell [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 2967ed0..a8bee71 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -26,8 +26,6 @@ PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
 # FIXME: maemo builds may want --enable-maemo
 # FIXME: some platforms may want --enable-generic-umpc
 EXTRA_OECONF = " \
-    --disable-aspell-test \
-    --enable-aspell \
     --disable-manual \
     --disable-crash-dialog \
     --disable-jpilot \
@@ -38,8 +36,6 @@ EXTRA_OECONF = " \
     --disable-pgpmime-plugin \
     --disable-pgpinline-plugin \
     --disable-dillo-viewer-plugin \
-    --disable-clamav-plugin \
-    --disable-gnomeprint \
     --disable-valgrind \
 "
 
-- 
2.0.4



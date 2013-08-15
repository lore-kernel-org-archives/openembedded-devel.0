Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 432436B881
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:06 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so183531eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=c78XumzEQfhawSoVA1TculaNuAr4VE6vYAXq59doLFM=;
	b=jwJHv7+BcEvCF061FZPHpCiya45CGfrWYHw3++Lk4+j44qhK2bCE+oiOmb/aTMgxvF
	SOTswC2aqtpkTYcp1E4HHppYgtL6jHABKNMGHvdZzh3JK61z9wkZeq51q45jaqMXaW9U
	3l1feRpSoNrmQvZKAVJjgMmRooer/cWw/q50arMvybG5+1XCQGQhsFlAsLK84MHi+P09
	osUO4ukS9LTW2X+6SQHwl4f1yL354bWw9PKILZL67zRWwtJFCpzJGu0dG0q8dNEwOaxB
	K1L7MrLzAUfjtwJg2rFTty99qCZ57O0F1bBkw+tTMGSD08+va+mq5ejm8NMbiRnBOW2D
	AmLw==
X-Received: by 10.15.107.74 with SMTP id ca50mr533833eeb.72.1376551206726;
	Thu, 15 Aug 2013 00:20:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74958375eev.14.2013.08.15.00.20.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:35 +0200
Message-Id: <698743400d63cf3819f091aa193badc32de374c5.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 55/60] smbnetfs: add packageconfig for gnome-keyring
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
index 3bb1c6d..2141137 100644
--- a/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
+++ b/meta-oe/recipes-connectivity/smbnetfs/smbnetfs_git.bb
@@ -13,4 +13,7 @@ SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
 
 SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;protocol=git;branch=master"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
+
 S = "${WORKDIR}/git"
-- 
1.8.3.2



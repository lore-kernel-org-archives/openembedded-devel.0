Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 087136BDAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:55 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so344974eaj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=uhfbt0MO0t/qvFwUA7k1SZXZ2+Q4SqqDr5l4QyGDBjE=;
	b=zbQTL7y/Ofm2kUEX9LvJp2vauTap7CzDFMh9g6j9/DXk5RV/tG0WvIQBZA1ynq+oEc
	jYtxwXLBZqMeq6LSZouRsBRojEHqF0VzD4+bLP7i1b1SbVQE6X3HqeTLc6OLx3ZJ6aYK
	5yaK0huC7MarnjHJIs9MgMVU5zdvxvKzif5ykNCzqbtbMS8XJhSRf9o/Y0cqwSEOOuwV
	tZask3BA1yRJ1OHrnhv42+2eUB7Kmv3S5SltqxxhkUyW/nwUw7kUfzrJrGPxewGmTrTF
	H2/FpIMiOlpUB8PQV958WRRSgY6aHxM86SKATgrSwdsmWWxphhyCcw0qKIwRb4h0Ea6Y
	4mxQ==
X-Received: by 10.15.33.132 with SMTP id c4mr5444793eev.2.1377791516474;
	Thu, 29 Aug 2013 08:51:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47241258eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:43 +0200
Message-Id: <cd23a20ecdb092ad5aa5317a0145b7a944be44ca.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 50/66] gnome-vfs: Add PACKAGECONFIG for fam
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 535006b..78110b5 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -31,6 +31,7 @@ SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+PACKAGECONFIG[fam] = "--enable-fam,--disable-fam,gamin"
 
 EXTRA_OECONF = " --disable-hal \
                  --disable-openssl \
-- 
1.8.3.2



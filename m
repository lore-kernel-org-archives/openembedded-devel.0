Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4CCAB6B35B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:27 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so216285eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XJQ+9+WeJKoYUKHvwsuj+F8MEJ8GXOHVF+1wD9cMDT4=;
	b=WbI2a3xUNWfgBOaKPbcRzNl2iZJUYdxsNWqq+p1F8WmUOaVPh4pl9Sz5Gc1sVvkiU1
	5zqstnfk1eH1XJbcXjAXn6US4HokS+6YCQP7mtZZ4v3E5WwAkXuO+JvjsTXpHINyxoVq
	zl1sC94rZoLIJFkygpi5/4Ed2HV0QpfFxp8Rp1yp3vxNcVx3SyOHIpM1GhxDcP/AeFdX
	up5c6gEwYpYyaigPBL+HN9ibMHHIipAl9T2JO1LKdwtAErqvp5K2GgUpqk4W0i494Ewj
	oi6pZUnGSDdVTM1AY8k97gwekaE3BXnzn1manuPfB1viN4CBQD04prSIbsXBmghB8ITn
	JwFg==
X-Received: by 10.15.67.140 with SMTP id u12mr37241526eex.90.1374669687760;
	Wed, 24 Jul 2013 05:41:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm65862388eed.9.2013.07.24.05.41.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:08 +0200
Message-Id: <891051c20bc6996b9b4390b8b8a1334584631d26.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/29] ntfs-3g-ntfsprogs: add packageconfig for uuid
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
index db5686e..42f7ca5 100644
--- a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
+++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
@@ -15,6 +15,9 @@ SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[uuid] = "--with-uuid,--without-uuid,util-linux"
+
 # required or it calls ldconfig at install step
 EXTRA_OEMAKE = "LDCONFIG=echo"
 
-- 
1.8.3.2



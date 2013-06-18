Return-Path: <paul.betafive@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9948C6ABC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 22:40:01 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h10so2843299eaj.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 15:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jCmQH0dw6Bf1wYHaW+4cV7XprLz/ZKkTIYhdRmixe3s=;
	b=ZO6C3pvpqnu+0NoWOUPjhGAO1O/eVC+vENXfkVbLqNby5gr2jyMFMQtgFqPZDDBstP
	HW41+P8Zfm4n5KM0k3NV0SNlm0wN9NFNhVND6COGCi5n8sWlvu2jOm/Byz7pWban4h7H
	0yHkmdRo+4aClTDaODaagizWtVwzLw+igXVhWTKwXxTW5qHwix+vgUxnu5FK/VMuTZha
	UmxbtgdytbqNZbTgBqeN/8qm66v0Nj6XByGslElJ+icFFH46uwY9+Ldjw68knF93yR1t
	gVN9ehEcRJBgSfhwltBAy1bksemvWEsIeCML9PR+jlI63GGT/vbG7Xy7h+KA2uP+Z5Kq
	u4/Q==
X-Received: by 10.15.101.2 with SMTP id bo2mr8692eeb.57.1371595202124;
	Tue, 18 Jun 2013 15:40:02 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id i2sm4434453eeu.4.2013.06.18.15.40.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Jun 2013 15:40:01 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 23:39:34 +0100
Message-Id: <1371595174-14731-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371595174-14731-1-git-send-email-paul@paulbarker.me.uk>
References: <1371595174-14731-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe][PATCH 2/2] openmotif: update SRC_URI
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
X-List-Received-Date: Tue, 18 Jun 2013 22:40:02 -0000

openmotif-2.3.3 doesn't appear to be available from fossies.org anymore. As this
isn't the official source for openmotif, we change the SRC_URI rather than
adding a mirror.

The official source requires registration to download the archive (via
https://www2.opengroup.org/ogsys/catalog/zom213) so this is the best we can do.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index f450949..ef92b33 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
 PR = "r3"
 
-SRC_URI = "http://fossies.org/unix/misc/openmotif-2.3.3.tar.gz \
+SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
 
 SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
-- 
1.8.3.1



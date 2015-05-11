Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF206013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:38:33 +0000 (UTC)
Received: by wggj6 with SMTP id j6so2132282wgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QGBqJpwsLiIz/5ac0chK3u3BMHDHDjZrcByqCpys9OM=;
	b=0pxYn1u7m0K7Qum9I9hM3UuePBx52RlNAA/s7Qd6NBpeWVakXlVKfLOu1b45OMEnCd
	iK7PA7rSAp7krodqNgyEifY1h57pP+/4Yacn8mMY60G5VoJhVzjp7xZG15c0IRJyxzTa
	AfywOvqDBlPgyJitQFVH6WEUhNtvUaWfBAmgbfWHJg4X+UwnE3v/dB30Iupdn2VBFFDO
	WkcOF+irEFUwCknu/OHRgE8KLQZXWs1H8JVbagYIiiEd1qn6UQcixKz7z31nMOOp2UR3
	0mM8+SVkvYqtd/AIAdceOyGuFDxR0+9vXj0xY6oVO9Egb2h45Po4E37TgtTN3UPiA2r3
	1Jsg==
X-Received: by 10.180.206.229 with SMTP id lr5mr23653173wic.86.1431373114504; 
	Mon, 11 May 2015 12:38:34 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	vz8sm24253522wjc.27.2015.05.11.12.38.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 12:38:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:38:25 +0300
Message-Id: <1431373106-7016-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431373106-7016-1-git-send-email-dbaryshkov@gmail.com>
References: <1431373106-7016-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie][PATCH 2/3] opexpush: update DEPENDS to properly select bluez5 or bluez4
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
X-List-Received-Date: Mon, 11 May 2015 19:38:34 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-support/obexpush/obexpush_1.0.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-support/obexpush/obexpush_1.0.0.bb b/recipes-support/obexpush/obexpush_1.0.0.bb
index 57ba5db..5018728 100644
--- a/recipes-support/obexpush/obexpush_1.0.0.bb
+++ b/recipes-support/obexpush/obexpush_1.0.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Obex Push Utilities"
 HOMEPAGE = "http://www.caside.lancs.ac.uk/java_bt.php"
 SECTION = "console/network"
 LICENSE = "GPLv2+"
-DEPENDS = "glib-2.0 openobex bluez4"
+DEPENDS = "glib-2.0 openobex"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 PR = "r7"
 
 SRC_URI = "http://www.caside.lancs.ac.uk/bt/obexpush.tar.gz \
-- 
2.1.4



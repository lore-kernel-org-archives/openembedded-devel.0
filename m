Return-Path: <cleitonrbueno@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD4E6FFF7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 22:14:14 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n135so53640122qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2015 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=G5GDAZP6kWqqobU7j411J0qyNgEXS7+MzT8vRYPntX4=;
	b=y2YdCwKehksVxDZ/Jr0SWtQb9SEzx9lXet3sT98V4XB/dYsaD9utECBTgTqM578mAV
	8b2wvtXjgMagQh05ZwhwErKOMsE3Ftx07yMWeA7vLwUEAxQhLlyMxOvWLnaMfJdrXAY4
	pd42EqsvvrnfI/18KMXZMOJvHcERd5QBrbzsN3JPwzm9b1CFUBJv8q9R4PkkCGafyOkP
	oJoTe75mI2fcifa/7r+h6yO5kBeZdj6oOOdUNsOcIh3Pz+RjXkkggUf/W2/5pHssATsm
	1BsKi3z5VLMInh+1S26HgoGSVHvuP+vQlNk/PV6we7Bjj85qkmvsgHCE5i/8iV/hSrZk
	8PGg==
X-Received: by 10.55.79.17 with SMTP id d17mr34637264qkb.56.1450995254838;
	Thu, 24 Dec 2015 14:14:14 -0800 (PST)
Received: from localhost.localdomain (179-241-189-104.3g.claro.net.br.
	[179.241.189.104]) by smtp.gmail.com with ESMTPSA id
	z2sm20603745qhz.38.2015.12.24.14.14.11
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Dec 2015 14:14:14 -0800 (PST)
From: Cleiton Bueno <cleitonrbueno@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Dec 2015 20:14:02 -0200
Message-Id: <1450995242-16535-1-git-send-email-cleitonrbueno@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: [PATCH] Include dependency to QCoreApplication::translate()
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Dec 2015 22:14:14 -0000

Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
---
 src/core/media_capture_devices_dispatcher.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
index 500fe76..eda2824 100644
--- a/src/core/media_capture_devices_dispatcher.h
+++ b/src/core/media_capture_devices_dispatcher.h
@@ -43,6 +43,8 @@
 #include <map>
 #include <QtCore/qcompilerdetection.h>
 
+#include <QCoreApplication>
+
 #include "web_contents_adapter_client.h"
 
 #include "base/callback.h"
-- 
1.8.1.2



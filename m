Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syf8Z-0000Yd-Qv
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 10:27:35 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1124534eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 01:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=1vtGrbF/+opSQzaW73IKVYubHwc8BmJaUrGVFdX5urw=;
	b=fXZUsMG0ilviBBQ3hS5Tyo2yZ239aaeVf+MinUEsOTWr+L14ozEJ8hfZhdy5p6vjG6
	J9YE8+1bVJ2p4zNvUt61lzP+x2G+97csUK8NkpoNWn5oEQKjFLegIDYtse1AvxUqMRsl
	8d+hZ/PBo5jL0PbPS3KMDYBqZXdIXTldlK8AHUeaJlg//xEgRIHc51qpXUDz6OIz1ygm
	S8SRnnrZeuS7Zj0kt0hNNkT9LYi2b62eCgEdpIlCRdAWufU+ZmbjeESd1UC0hsFxJUz8
	ROdfQNNaGBIkam4pmpblkTML0NHrkIbwGnybQWbhgxqgyf4344qOHA8V0e0GskWT7oW6
	Uj1g==
Received: by 10.14.216.198 with SMTP id g46mr16745508eep.32.1344327352458;
	Tue, 07 Aug 2012 01:15:52 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y1sm4055470eel.0.2012.08.07.01.15.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 01:15:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 10:15:42 +0200
Message-Id: <1344327342-24437-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344327342-24437-1-git-send-email-koen@dominion.thruhere.net>
References: <1344327342-24437-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnqsRv+I1ZNiMu+0OqPAe45OykP5MMc1C1s8+/mOb9c0DPTioO79BwhJhEn1uPTK9eSmGXW
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2 2/2] nodejs: update to 0.6.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2012 08:27:35 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../nodejs/{nodejs_0.6.18.bb => nodejs_0.6.20.bb}                 |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.18.bb => nodejs_0.6.20.bb} (92%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
similarity index 92%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
index 7136ffc..77ed388 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
@@ -7,9 +7,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://fix-hardfloat-detection.patch"
-
-SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
-SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
+SRC_URI[md5sum] = "fcf8e0f2981f9dd66606a2162a2df55d"
+SRC_URI[sha256sum] = "b7bf4cf143ddf46ba5e975761b98a38dd3d72b176fd5d4bb2f9c9e7bbe6c4b15"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.7.10




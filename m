Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0Sai-0005HE-JG
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 09:00:26 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so621479eek.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 23:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=QXu5T5lD3709euBNzM5OmXpzmcce+gL/6xPX6auxLXU=;
	b=XzjMAZvlrqpPUx0U0c58VpdjWyWAUkzA0NVgxWTIidsGp/tpiCT8wyYB+7+mAxMbux
	0clLJstO65VUmxcbS0e1suguWoTbeMT3RxEZIzUYbLr9do+gXZ4qgi5I+IqwS2/XDJFB
	H+VdboFLysGr2VYeL2qfzIx1XlfODSWrbTPVHRO3dGU5K/36gPUpV/VzldX0LzyL6i0D
	xFItT5ju+CIlAHnWHW+cMco+qNy/2HngfxBLUI9K5ARQnTINvfEC5FMzJE/rDcl2uORo
	k7AJkhrb9ChpjTPvdd0OcsyKQp5kvb30kWbqNh3bb45KIYmANBbF0WV0TdCode3+b32R
	wUEQ==
X-Received: by 10.14.225.133 with SMTP id z5mr12460269eep.15.1359531879761;
	Tue, 29 Jan 2013 23:44:39 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id e2sm664965eeo.8.2013.01.29.23.44.38
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 23:44:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 08:44:26 +0100
Message-Id: <1359531866-899-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQliPTyrfZlYoF+N7y9ZDvCpv4vP21yUnvWn7LusK2C/Q7eAEeHNeok84ywCN8s87z9YvcCU
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] nodejs: update 0.6.x to 0.6.21
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
X-List-Received-Date: Wed, 30 Jan 2013 08:00:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-devtools/nodejs/{nodejs_0.6.20.bb => nodejs_0.6.21.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.6.20.bb => nodejs_0.6.21.bb} (92%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
similarity index 92%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
index 77ed388..588a704 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.21.bb
@@ -7,8 +7,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
            file://fix-hardfloat-detection.patch"
-SRC_URI[md5sum] = "fcf8e0f2981f9dd66606a2162a2df55d"
-SRC_URI[sha256sum] = "b7bf4cf143ddf46ba5e975761b98a38dd3d72b176fd5d4bb2f9c9e7bbe6c4b15"
+SRC_URI[md5sum] = "0da985a0bf820400af92363b9f453fe4"
+SRC_URI[sha256sum] = "22265fd07e09c22f1d058156d548e7398c9740210f534e2f848eeab5b9772117"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.8.1




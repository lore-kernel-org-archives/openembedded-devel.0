Return-Path: <kirgene@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id E79C371633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 10:48:48 +0000 (UTC)
Received: by lbjb6 with SMTP id b6so24085281lbj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 02:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wNWzNpwM2tTHava6aZp40/84iV2DPPUjoLAmrjyqCFU=;
	b=QLJqu/vQ8QLiw2bbKOVE3PMxBQB9aBcyk9m4/robzoGRal5HR7Un8HhnT1VnkNKkQ0
	l+E9IDtme4emJ6B506gwMCh6IjtaU7uILc3Oaj4c3yBp9nOfuUdhDZfGmmdmqvixWC4W
	za0mJOYAZPlCTQCnune9n8b0AHNzeqF4DWU0X5vynLGTtxbShokLkp5X8uHfSK0LD7Wg
	Wpcpn8+LMm3wIlfmMdSAXqdPnCHsajzjpG3NqdgDjYFzFiGUQ0r+vchqT2SzwHoceRZF
	LYOI8wsEQAvFlbKiHO6NJLhVjki6spYxA5HnXLDK1QK0Jcpzoam8OehXxiW73r5XkG2v
	H1Vg==
X-Received: by 10.152.29.166 with SMTP id l6mr14103212lah.78.1424774928948;
	Tue, 24 Feb 2015 02:48:48 -0800 (PST)
Received: from localhost.localdomain ([194.44.84.130])
	by mx.google.com with ESMTPSA id o9sm1923931laa.19.2015.02.24.02.48.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Feb 2015 02:48:48 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Feb 2015 12:48:29 +0200
Message-Id: <1424774909-30313-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH] rabbitmq-c: update to v0.6.0.
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
X-List-Received-Date: Tue, 24 Feb 2015 10:48:50 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.5.2.bb => rabbitmq-c_0.6.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.5.2.bb => rabbitmq-c_0.6.0.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
index 762ecd6..cd68ba4 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.5.2.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
 SRC_URI = "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "aa8d4d0b949f508c0da25a9c20bd7da7"
-SRC_URI[sha256sum] = "1ec3c1141593b91c57bf1051657a1d64fb87da38760c7128a9622b107990f2f2"
+SRC_URI[md5sum] = "80b350ce0de3f44cbd7b501bbbd8daf3"
+SRC_URI[sha256sum] = "3a89349880582c24d81d52ee42a93a0633dc366a4cc96174512af88c32509dc2"
 
 DEPENDS = "popt openssl"
 
-- 
1.9.1



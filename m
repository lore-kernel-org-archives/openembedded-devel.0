Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC9F73F9A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 13:40:09 +0000 (UTC)
Received: by laka10 with SMTP id a10so45257089lak.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 06:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ej+fkTo0M88Ms7+oIyg3FY6hvfTe01qVS5XUjB2LqE8=;
	b=AfuwDVro98G9jhC76oM6rK68nCtUROo8CKJu/m/HhKQJOC1B6SPg5h240WRCBFGmJ+
	Hdf7k88Ung6lVLEPIxZnLemtxlSS+WrRHwGYRc/yaGitw1hPAe4tigtQL7H2KX1Fe9/i
	cUYT6Y4UWEi7yaXa/lKdpiktUCUnisXglLVragOe04bc55SJoNo2H/ln7LbJ8msw6Mw+
	EEjtV8jgEQfpStMw+uxgspwJynvOZt0XLEZWuPI974ioDznGtBGnm9jBZurRN4Tucycm
	3SYPUxn3nnRUt/dOOZjrrlK50BpuoNTjkM5svxxTIDduXH7SRc8Z5O0kfJwzl6VUJbHf
	C8ug==
X-Received: by 10.112.166.5 with SMTP id zc5mr44097183lbb.91.1435239609043;
	Thu, 25 Jun 2015 06:40:09 -0700 (PDT)
Received: from localhost.localdomain ([194.44.84.130])
	by mx.google.com with ESMTPSA id kb5sm7242685lbc.16.2015.06.25.06.40.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jun 2015 06:40:07 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 16:40:04 +0300
Message-Id: <1435239604-7245-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH] rabbitmq-c: update to v0.7.0.
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
X-List-Received-Date: Thu, 25 Jun 2015 13:40:11 -0000

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.6.0.bb => rabbitmq-c_0.7.0.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.6.0.bb => rabbitmq-c_0.7.0.bb} (65%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
similarity index 65%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
index cd68ba4..d2de94c 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.6.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.7.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
-SRC_URI = "https://github.com/alanxz/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "80b350ce0de3f44cbd7b501bbbd8daf3"
-SRC_URI[sha256sum] = "3a89349880582c24d81d52ee42a93a0633dc366a4cc96174512af88c32509dc2"
+SRC_URI = "https://github.com/alanxz/rabbitmq-c/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "ace9a4293a6c052863b7cc858027388d"
+SRC_URI[sha256sum] = "b8b9a5cca871968de95538a87189f7321a3f86aca07ae8a81874e93d73cf9a4d"
 
 DEPENDS = "popt openssl"
 
-- 
1.9.1



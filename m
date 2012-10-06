Received: from mail-yh0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TKb2J-0002Ij-MR
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 22:31:47 +0200
Received: by mail-yh0-f47.google.com with SMTP id g23so661920yhg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OKhIGVGQjIVIlg6nYcdTNUlGMhJHpHtPAcCKBMpb1uk=;
	b=gmWsZZ8Zf7jDWdtWIwY8jCe+2FZ6H+x978eGEtqktu5rAoih+O0jeEoXtLq9rCbfqj
	Af8uRWB2rCeu2p5UbY40QmbQrlEHSzhj1XIo9t+cy1g/2aBXJU46j1k/AasNNinRqtxw
	ujwQ6kvOhaFxtM+1gQPxQXBrNx9Nf4nSNx0b1hpPn+KIu65SQI4hvSXAa+eYrf8zBw/7
	5u48dXQVz5w0kyRiBw2jORvlAtqK8lLr447GNTgvBQ+vwmZO91nOtiMhVLrge2N23ims
	FdpQdCmKVYXzTTvt5BUpSDUKH5eWedigUH8DrKykn6lCIJrZeCAgc5l2IViEvufTczEd
	CMvg==
Received: by 10.236.181.225 with SMTP id l61mr11606101yhm.47.1349554723157;
	Sat, 06 Oct 2012 13:18:43 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h15sm13150353ank.2.2012.10.06.13.18.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 06 Oct 2012 13:18:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Oct 2012 17:18:27 -0300
Message-Id: <1349554710-6693-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
References: <1349554710-6693-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/5] yajl: Update to 2.0.4 version
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
X-List-Received-Date: Sat, 06 Oct 2012 20:31:47 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../yajl/{yajl_2.0.3.bb => yajl_2.0.4.bb}          |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/yajl/{yajl_2.0.3.bb => yajl_2.0.4.bb} (76%)

diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.0.3.bb b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
similarity index 76%
rename from meta-oe/recipes-devtools/yajl/yajl_2.0.3.bb
rename to meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
index 671cad2..7359520 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.0.3.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.0.4.bb
@@ -2,10 +2,9 @@ DESCRIPTION = "Yet Another JSON Library - A Portable JSON parsing and serializat
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74f541bd9a2b6c8e5d0714bcdc327f32"
 
-inherit cmake
-
-SRCREV = "04a090f32f6bda183317e9336224831b42bf13f9"
+SRCREV = "fee1ebef9fa7dc0e9f5a23f37123b19b68c796ff"
 SRC_URI = "git://github.com/lloyd/yajl.git"
 
 S = "${WORKDIR}/git"
 
+inherit cmake lib_package
-- 
1.7.2.5




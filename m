Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65CF360290
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:36 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id q184so1069139qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6NumOx3+TQfSzpfWhL+75ECqcn4WgcCDf6wxitCv7cA=;
	b=MUOfPsOdz7p7HN5dk6m3dyoauQWb21dn0If/azjJOuKuMrAaoljDTw7kGf6pA2B6/A
	E7zz0V2spniWJcqsPaPIUTzS/M8s0fFbRA22zdtSG5MGMQGGHf9Y7oDc+MbTx2la46/B
	TnE8Eeex9O91DvUlXz/iXr9iC2qLDRrlwqEI3X+xAHl9vofxm+EPNgYMpzksAd/MJMa/
	/J/PO4vxfl6sE5huR6krH9oUHHwmvOpjgup7UQG1o8xjkHMaKNRI1RZ4DLVH1i0i+O5Y
	5DbFMj5HmM+g8rPWhBJWHwsFT/RCWCRwSIzHHdhCJzs+FK1YgTFN8J1QYXA9yoOJQQwY
	Kgyg==
X-Gm-Message-State: AD7BkJL0R+3pgn/c53+ODfp0vkf89MEJ0j9EoQGoBKNpAyVWhfLoLV3FN7vYUaqWxF9edw==
X-Received: by 10.55.82.137 with SMTP id g131mr5998498qkb.66.1458763357497;
	Wed, 23 Mar 2016 13:02:37 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:01:56 -0400
Message-Id: <1458763321-30761-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 1/6] python-epydoc: update to use common pypi
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
index 56880e5..c4752d3 100644
--- a/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-epydoc_3.0.1.bb
@@ -1,18 +1,11 @@
 DESCRIPTION = "Epydoc is a tool for generating API documentation for Python modules, based on their docstrings" 
-SECTION = "devel/python" 
 LICENSE = "MIT" 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=011c0d78eb6054d731c879132d7313f0"
 HOMEPAGE = "http://epydoc.sourceforge.net/" 
-SRCNAME = "epydoc" 
-DEPENDS += "python"
-DEPENDS_class-native += "python-native"
 
-SRC_URI = "http://downloads.sourceforge.net/project/${SRCNAME}/${SRCNAME}/${PV}/${SRCNAME}-${PV}.tar.gz" 
 SRC_URI[md5sum] = "cdd6f6c76dd8bab5e653a343a0544294"
 SRC_URI[sha256sum] = "d4e5c8d90937d01b05170f592c1fa9b29e9ed0498dfe7f0eb2a3af61725b6ad1"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}" 
-
-inherit distutils 
+inherit pypi distutils 
 
 BBCLASSEXTEND = "native"
-- 
1.9.1



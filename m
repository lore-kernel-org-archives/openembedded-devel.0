Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 957666FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:09 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id j35so4997386qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=tPJS0aZFYMyLmWW/HGaXNf7gNt5RnOAVN8a7ZVOpYyA=;
	b=NyT+2yIgBx7rdJ2InSHmL2bDEHIB1jr2IVsCJdXOC47U2ZF/E/b3ltw+Ai+bVg/H37
	bvhI1g6SXtTRfYV8/gJuJpMKfQUTQaVs3oLD8z1D0Y7hsGxWYpek7UIrf7d9LpcCoZXF
	/wQ2yDVENdfRrLiXchkpKQkgx+d1bXdRbK5ZfoB0QPdf9F6zbIwXwonfB2JNKtT9XANe
	DbEVpJ6KoPy1/fwArT6nUl/tZE7i78TychtaEuHEOriI+gNyyYVWTDEPm3EoMUfDl/DM
	wReyF+dndhANK55KBqmM9e7kILonFuwxhIsih3D25VVBqxJYrTuUEBkUrp8/qU+XETVP
	ArPg==
X-Gm-Message-State: AD7BkJLgDGzRJ8L1dW2ekvOP5rAdPLFSjvibbkUuCA1/ndlELuRHmU6OniQ/UDFk36WIrA==
X-Received: by 10.140.96.9 with SMTP id j9mr22240681qge.10.1458997510317;
	Sat, 26 Mar 2016 06:05:10 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:22 -0400
Message-Id: <4da55176a14e56328fa11d432ecdb62be8332134.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 02/30] python-lxml: update to 3.6.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.5.0.bb => python-lxml_3.6.0.bb}             | 0
 .../python/{python3-lxml_3.5.0.bb => python3-lxml_3.6.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.5.0.bb => python-lxml_3.6.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.5.0.bb => python3-lxml_3.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index cb9986e..0473417 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "9f0c5f1eb43ff44d5455dab4b4efbe73"
-SRC_URI[sha256sum] = "349f93e3a4b09cc59418854ab8013d027d246757c51744bf20069bc89016f578"
+SRC_URI[md5sum] = "5957cc384bd6e83934be35c057ec03b6"
+SRC_URI[sha256sum] = "9c74ca28a7f0c30dca8872281b3c47705e21217c8bc63912d95c9e2a7cac6bdf"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.5.0.bb b/meta-python/recipes-devtools/python/python-lxml_3.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.6.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb b/meta-python/recipes-devtools/python/python3-lxml_3.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.6.0.bb
-- 
1.9.1



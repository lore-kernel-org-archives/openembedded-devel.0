Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3308A9146D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:33 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id k3so2931253pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MZt0Gv4FF5c88aV5wdwnHlr7dr4zEjRDGbXNuR+lBOI=;
	b=WeyqK9b0nqaPfgCAaUkm7Ed5CnsQe8TAf7bverhOf/CSGszSMEm5pq3dlzrjVYcZmH
	UMM/bA2d7l3m18Xx8E2MenQqNWNu7IcEBrILH6T42aVpieNINy8TwIX9TeE+x51cAnBO
	JC+ZIq6HkUblfkscw2nZK5yc5Ehom/4trt/tdNhxkSHcApylGMVYkSI4H8Q+Zy0UhGO0
	oxz+gYGbmbxcy99nF4h34qYfqW9mc9Aoj8KmMAaIU5FkmYPq/I2y+wi6J6myvDLxJ5Qj
	yaiGudsNbsjvdO/Q/Qo0jJ0alVylAxR+FCDpWm1uoYvnc3CcpFaKiFpVn4ITxuTjAPID
	/kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MZt0Gv4FF5c88aV5wdwnHlr7dr4zEjRDGbXNuR+lBOI=;
	b=R6lEbjQQFQwSIfi1xPSk7Z6uYi+cyhsyhdSorfWKoipalqCIYOY2X3oNE0XZQ6DMZq
	w4yAStLoH+csDi20Zfbd74pSfn8MIj62Uf/59M26a/gBvfs5jNSD40CFKtam5qFv+uBF
	9mLa/SEfICLRanlkQ6vzg3N7rFvEngaJhWN5ybwKwm0IFV8TBWMHhmleCJhRMxfKUt6u
	JiJkEnUNA3W8C5jC4PYn+rgVg1hK/uNEej7Bx4VV0byBLQsSIwSKEKGBNwXNTC3Tatp5
	ow3On56wMQv94FlkWGTrOhQS51VeYbd6UElknq2MlVM60cQiSEV9rm9g2ae6oe1rdoOa
	sPsw==
X-Gm-Message-State: APjAAAXkIqvlMmEAgnhbqZ6HkOppmLZ+exfdNK+0oX6RNrdrWXJ/tgsG
	r+cGjtc5mCHNAiBr8MFF+xkIhnsoorE=
X-Google-Smtp-Source: APXvYqzBQ6XycrFDMMjGedcLQNrK/awNWdflcmdcm11+96o5iTOcHeFga7psOXILwDer7Be6v5EFXg==
X-Received: by 2002:a65:5a8f:: with SMTP id c15mr9353907pgt.259.1579675113937; 
	Tue, 21 Jan 2020 22:38:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:23 -0800
Message-Id: <20200122063823.242098-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 12/12] sip: Delete python2 version
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb             |  2 +-
 meta-oe/recipes-devtools/sip/sip_4.19.19.bb           | 11 -----------
 2 files changed, 1 insertion(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/sip/sip_4.19.19.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 60276468fd..e5001c3974 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -117,7 +117,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
     protobuf protobuf-c python3-distutils-extra \
     python-cpuset python-distutils-extra python-futures python-pygobject \
-    rapidjson serialcheck sip3 sip tclap uftrace uw-imap valijson \
+    rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
     ${@bb.utils.contains("BBPATH", "meta-python2", "nodejs", "", d)} \
diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
deleted file mode 100644
index 6299de4874..0000000000
--- a/meta-oe/recipes-devtools/sip/sip_4.19.19.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sip.inc
-
-DEPENDS = "python"
-
-inherit python3-dir python3native
-
-PACKAGES += "python-sip"
-
-FILES_python-sip = "${libdir}/${PYTHON_DIR}/site-packages/"
-FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
-
-- 
2.25.0



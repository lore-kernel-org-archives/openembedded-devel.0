Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9282E6067D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:10 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id c67so8514808qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Rf6f6gnyNrqvB+YYAWTdm7g8I25OFv3U9gSv8a+WC+o=;
	b=MrTzZC5Ww3ra2XC4HtgFvVSy9A79aVJiwmF+Or1RNqliK/jgcbmwt258WN3SNTZRwy
	0IpD3o+ZHFwnmByO1jxlwZ6udCeig0SfaDIJdL0+8gUeTHXr1jBZOF7/5H2LxIaQSlro
	NR5oAPlOvuEW0IA9U19oqriaol4640gBe3VWNLZP1/1S8Flq2CPBqVTdoTlymWrYUIez
	w8qsg+gSalCRxcybEBQn8uDA468S0GXRTVqYFpGDYU3VVI5YZoYsgLWolz8LUUwmqR67
	nA96a4rZlLpKdls/LATUm+gpQEvR3YUKSoRRmPpRT2uFj9iKVao9WzGzwqmkxthQ9hA2
	4plA==
X-Gm-Message-State: AD7BkJJPlrDev8/+5t7cMdqoVRQMVBjj1UapaSXtOEoHqFTNQiG5xBsqCqM2fks/U8fbHQ==
X-Received: by 10.140.22.101 with SMTP id 92mr23336032qgm.64.1458997510922;
	Sat, 26 Mar 2016 06:05:10 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:23 -0400
Message-Id: <9e4379f465097435c457226835d5ed9028df3400.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 03/30] python-cython: update to 0.23.4
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cython.inc                 | 4 ++--
 .../python/{python-cython_0.23.1.bb => python-cython_0.23.4.bb}       | 0
 .../python/{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb => python-cython_0.23.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cython.inc b/meta-python/recipes-devtools/python/python-cython.inc
index 6c8b084..a550538 100644
--- a/meta-python/recipes-devtools/python/python-cython.inc
+++ b/meta-python/recipes-devtools/python/python-cython.inc
@@ -10,8 +10,8 @@ BBCLASSEXTEND = "native"
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "db3c5b365e1c3f71c7cd90e96473a3ab"
-SRC_URI[sha256sum] = "bdfd12d6a2a2e34b9a1bbc1af5a772cabdeedc3851703d249a52dcda8378018a"
+SRC_URI[md5sum] = "157df1f69bcec6b56fd97e0f2e057f6e"
+SRC_URI[sha256sum] = "fec42fecee35d6cc02887f1eef4e4952c97402ed2800bfe41bbd9ed1a0730d8e"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-netserver \
diff --git a/meta-python/recipes-devtools/python/python-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python-cython_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cython_0.23.1.bb
rename to meta-python/recipes-devtools/python/python-cython_0.23.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cython_0.23.1.bb b/meta-python/recipes-devtools/python/python3-cython_0.23.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cython_0.23.1.bb
rename to meta-python/recipes-devtools/python/python3-cython_0.23.4.bb
-- 
1.9.1



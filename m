Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id E15C67FCF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:11:38 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id ay11so192433plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JC2bo5w6Ygn7lXfVq3NVFP/6hwiK1h26T6qZ9TSOACs=;
	b=gPpa0mSKmUhvgKrnpdI4LRjzex5gSS4GM/tWuuJUdFuwaphSWEjvnrZojD3YX3eUjq
	vCuxjKAOPFCXPsVz0owzv7oirutffBt0VgwANy0DmjKqrRu+/4eITZscxp8F+Vt1EI+7
	HhbLb/l7h78Hmmigr2ZVYOqDJ2udU9OEtU8mhIIxDtBRo0y/6HBkRdJzuRLnWr0Q3nbA
	T0tEc7S3DDnih6eAcAPkvkpdqAWBydZ7wLIaqPomjIlWggqWv5dh5m3pQhgJ5m44j0Es
	KJyyiCZ5LGltVYK3iX7mcsuOc+fW2AaODLy7brxmEF701YF6TZPKSKGPfpB5wyAoMahq
	MoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JC2bo5w6Ygn7lXfVq3NVFP/6hwiK1h26T6qZ9TSOACs=;
	b=Jcf54F8e11ZytZFPO3r2HhHyEzUv3LgbRViZ1dUwusfTTcei7Y6vuocCvPaOUDOH+j
	V0+ooqOMKzAb8rlzAxutug0JXuesL1dTP5lFY1cWOZ8uVGNoBStxqSW6ZjHMie7i3X7D
	J3cqJhFb/518uqKTeZUAsnKxVpre2gGkqKl+z6HzuWkOBIwQ9Zp1A6HYxW5XRyYjpbtp
	z5hzJzFz1UnPXxOw0RZPvMmmCNnx25KUtve6ra2o9JguzadG8qZ1kc9f5vsHtAgjxDBL
	U4sWnPEMZJl4eB4n/X4iSFnfBuIzFsOAziMJ3x3gNJsRRAVgS4FiavFYykVNyyb7CTNR
	mAIA==
X-Gm-Message-State: APjAAAWbYD8XULwHO4K+FpzG7HBIytnQtIgKM3ibVW6NkW9VRB5sMNTM
	79Sk8MyCG8oenNqM/dK9+kRciV0S7K4=
X-Google-Smtp-Source: APXvYqwU6lyGJQFpKqdXtNcmUYdQuDdfzCkSgktREwV554YBzC2lLY2N38+uOoxrzZ2JZV0d0lVOKQ==
X-Received: by 2002:a17:902:b587:: with SMTP id
	a7mr12435136pls.155.1579720299664; 
	Wed, 22 Jan 2020 11:11:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	c19sm50595184pfc.144.2020.01.22.11.11.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 11:11:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 11:11:34 -0800
Message-Id: <20200122191134.3307089-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122191134.3307089-1-raj.khem@gmail.com>
References: <20200122191134.3307089-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/4] guider: Build only when meta-py2 is in mix
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
X-List-Received-Date: Wed, 22 Jan 2020 19:11:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/guider/guider_3.9.6.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
index c8ddb15080..397e0cb9a3 100644
--- a/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
+++ b/meta-oe/recipes-devtools/guider/guider_3.9.6.bb
@@ -16,7 +16,7 @@ SRCREV = "fef25c41efb9bde0614ea477d0b90bd9565ae0b4"
 S = "${WORKDIR}/git"
 R = "${RECIPE_SYSROOT}"
 
-inherit distutils3
+inherit distutils
 
 GUIDER_OBJ = "guider.pyc"
 GUIDER_SCRIPT = "guider"
@@ -31,5 +31,9 @@ do_install() {
     install -v -m 0755 ${STAGING_LIBDIR_NATIVE}/python${PYTHON_BASEVERSION}/site-packages/${BPN}/${GUIDER_OBJ} ${D}${datadir}/${BPN}/${GUIDER_OBJ}
 }
 
-RDEPENDS_${PN} = "python3-ctypes python3-shell \
-                  python3-json python3-subprocess"
+RDEPENDS_${PN} = "python-ctypes python-shell \
+                  python-json python-subprocess"
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
-- 
2.25.0



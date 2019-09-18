Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id DB8DF901D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:26:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r5so6441827wrm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=X9/eg2ogLkOefuSucsgrGHOe4jK5r8vG/wEFxW/0xqc=;
	b=qm+5yU+jP0BC53N+MY/nu4gg+30ZgczSdXjpmqjEz2WyJYsZqpoJpGMnH+pQIN8jv7
	m+Xw227msDNqalh1+nlwLkNsFZU7yZotIHSvyv12dgvb/50WPIufBVWqhnQleGA3gSqJ
	MRUMlKv78muQw1s+fprsMb0XCNdV8GP/6nGn4YqXgpXNvfwYFot2doY/Sufe/IULnQ9r
	ph/Jn30MXZRPjCearkZYbxyolIjSWWfyQTts54XmNl3ZhnMvaakjZmJIA7acUjzjwgig
	U8iGXHPRqRxgFmqgm36yHdeHFBjeJtzItFunjhEubMRfk4/hAOIjRuu7j6djNhwZYoLn
	l7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=X9/eg2ogLkOefuSucsgrGHOe4jK5r8vG/wEFxW/0xqc=;
	b=Zle/8mayKoa2KjQcTN3fW2vlNRo0Av545O/inUv5Jaa304bsHgwzmf4VJjagBCNyXl
	w6j5fiLkd6W5+b6Ru1ktgp1Mo9cUUazrIYos7tIYKJZdjvxy+0LEfOE0VtPFnUcrtnpk
	ze498yDgmYauMwER4IqncSAHjqre2tKgc4waENTIDvuY3bFsePP6izvSKG998wYEVq9d
	uS4O4UK3SR4nGuYiWoMQN0bJhO1fA1GWSnYz18y4LbY5j4ALDYs77Yt+Cigs13phf8XO
	ZCHdNelXUzuc9fn4Dn7uiyw71Lj5lzmLxwlHKgiwfBlL51mXwziU6M0TG1cpAoaAg3u1
	CbiA==
X-Gm-Message-State: APjAAAWht9Vycvkpdp0e3PU3BO6T4ZbPsCDRuBmhqXgRRv20jZil2Fr2
	07jeoHasp2nHYc7pyz4aXoBbxDb4MDI2Pw==
X-Google-Smtp-Source: APXvYqxtQCyQ/dWZzXK0xMA2HvQBJlbBlFDU/zrCArLC+bXWZDTR8GYvbM6DFpsmdAFlF8z+M1mv8g==
X-Received: by 2002:a5d:678a:: with SMTP id v10mr2583284wru.145.1568805996247; 
	Wed, 18 Sep 2019 04:26:36 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	(i19-lef01-t2-89-85-250-196.ft.lns.abo.bbox.fr. [89.85.250.196])
	by smtp.gmail.com with ESMTPSA id
	o193sm2191749wme.39.2019.09.18.04.26.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Sep 2019 04:26:35 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 18 Sep 2019 13:25:51 +0200
Message-Id: <1568805952-19822-4-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH 3/4] python3-regex: add recipe
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
X-List-Received-Date: Wed, 18 Sep 2019 11:26:36 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 .../recipes-devtools/python/python3-regex_2019.08.19.bb      | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb

diff --git a/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb b/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
new file mode 100755
index 0000000..80194d6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-regex_2019.08.19.bb
@@ -0,0 +1,12 @@
+SUMMARY = ""
+HOMEPAGE = "http://pythonhosted.org/regex"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=51cb124129fa4d157b4aebb77df73629"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "d31ec392ab75b894404d8db76dacd191"
+SRC_URI[sha256sum] = "587b62d48ca359d2d4f02d486f1f0aa9a20fbaf23a9d4198c4bed72ab2f6c849"
+
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4



Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 260787FCFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 04:12:13 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a6so577346pjh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HNzjzRXOGBOLjfaDc8vXpgTV7zvpg40i5PElxkpq4hA=;
	b=JxaDZJ9VKEunXFUf7D2OKh37zfD7dAVTs69pgi2NlPGtgZrFLXsLyHRoBBeIkx1r9N
	yhKB5W4xOzskNlJArKzsgIn/kXvLoCBLuT0JfeZWaN3VgXEjd20O9S6Ck3Z1244JfUdQ
	7dRnzMfkCeVwQvdf88Ia9HZ7jxD/eHOZOYAQq3AOGc2xckzbHVGvmk6YB2s+mqgNzJQv
	6HmBdZBsqcBOl3KvrMPgwcL12jSn2H+DWv4dFY/i0tmbRR6H4deFez6HSPtXZA+1szgU
	RY/eKhpGx7kycFc0GifHOLEMXOLZGjOgLlclnHl5ZEu7/NqGAvao/RuPv+F6swbJitoK
	fsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HNzjzRXOGBOLjfaDc8vXpgTV7zvpg40i5PElxkpq4hA=;
	b=C3ZbUkCeOUOEuXs/pgH8WI1vx5szz8lemDqQzM9bfzXXdQ4FKmydrYPlkAx6j2mwTR
	kCNlY4AKHJsSIr0c7u6lihxaEXlgsstoOBZ9tKc71CjYR6QTpXlkUEC82OSUqNZIg4lr
	CdK3Y92zbv51YV4OVd+0iLX3cRBDeO3Z78PJtuz0KQORHv572XeNxIXC/GZwO0GYZ38M
	8Bb+i7aRu/AncxtwL2jDZODDuSJTiS4K+4UqraLElS3RYLfNKFPfi98BEdR4EV0ueef7
	0Kdk+MX6hri/cn6WiwEsCHLFGDVqhgsX8LG2FPuqCe5tCJpaoxf2XUDEvByc6rNFJwus
	nrrw==
X-Gm-Message-State: APjAAAXAkRzzCBRANgZt3LFNRSRqpIL1aJ1v6P7EHaQ+6hP1u1dItZdA
	lnN3oM7MDfeRHcjtyaXHHxGd3DdYPeg=
X-Google-Smtp-Source: APXvYqzABLoRejWF/0fZ/Bdkh3ET6Po7IHLMx2lD+HvYBGpjhHwonME4ybc/tpxIqVdZvi8agOBFaQ==
X-Received: by 2002:a17:90a:7345:: with SMTP id
	j5mr2121234pjs.69.1579752734102; 
	Wed, 22 Jan 2020 20:12:14 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id d3sm447319pfn.113.2020.01.22.20.12.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 20:12:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 20:12:04 -0800
Message-Id: <20200123041204.35593-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123041204.35593-1-ticotimo@gmail.com>
References: <20200123041204.35593-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH v2 2/2] packagegroup-meta-python2: add python-booleanpy
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
X-List-Received-Date: Thu, 23 Jan 2020 04:12:13 -0000
Content-Transfer-Encoding: 8bit

Add new recipe to basic and ptest packagegroups

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 95f9c02f..9a8826ab 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -58,7 +58,7 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
     python-netifaces python-configargparse python-sqlparse python-soupsieve python-wrapt \
-    python-deprecated \
+    python-deprecated python-booleanpy \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
@@ -82,6 +82,7 @@ RDEPENDS_packagegroup-meta-python2-connectivity = "\
 "
 
 RDEPENDS_packagegroup-meta-python2-ptest = "\
+    python-booleanpy-ptest \
     python-cryptography-ptest \
     python-pygpgme-ptest \
 "
-- 
2.25.0



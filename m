Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 32478915B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 04:08:53 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x185so890202pfc.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HNzjzRXOGBOLjfaDc8vXpgTV7zvpg40i5PElxkpq4hA=;
	b=iTxt+b7aTHY9Rruo9fugQEsKvue5nCZJUO3nCURNDh3UBooDiPJ5oluYUjHbWEYqru
	olTOTvPmC0vSXmnwylaAg7+nURtEYkwkYfvVdbrvNCEK84OsRufv0rSzi6YrjCsbGTlu
	D3D77/E/oz0S6O/d5OJVBccdsAF0JE5A2a4wWBuHhCPcY5NKMYWnOJUEROWi+BxvU3y4
	P+6VjqI+49TzmWjIQPxYyzQw9u4M5qeqP2gxb1K7BD6ENJCSByA7IuiwJKvpGmvNWmTc
	sC5Yf7oZdFWmBzIbo1514ulNhrJtPbdx7zhgt5m1WSKQY5wBp6NN0lfiluk64dWYs65t
	VJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HNzjzRXOGBOLjfaDc8vXpgTV7zvpg40i5PElxkpq4hA=;
	b=BeAO/GH+iCxq48XEZel6B/jcrj0NQM3/Zyp39W79gkzpwyChJiFl2rqZNoncmyHgTS
	+r4N2zvVl+LHkDAl6sy5woMuplNwJlX/KAg67RdhMLLEe3RRcrdlB18zM825NVPaTyqe
	9Y8nT+stWUPfv0NlNBClf76YKI/N90LLfGLGVeQWDsY3xp92lF/L5D/m9HGSyAXikJXP
	puEYMYEuyz6ArtHRHgAAxtrbqN0JGEWkV408pHWEG08PxUstTRtmPO6142CRytM2WSbO
	mBAfahrZ4p0RbhZZ2a40x/V7HetYqMpL1uNQEu/8GFZJLby2VWr+c8iwW4eUqi+d+9Pv
	aEsw==
X-Gm-Message-State: APjAAAVpaCTnRXH5l59gyU/8AWf48HV3etexylhRuyPqzOvdGsB6XJzB
	lOnJVnmgAWlyMnhRtNJwoST+4vagkH4=
X-Google-Smtp-Source: APXvYqwL2/hR/wmSEu8dzXV0CD7pzwTvHxV3zYxKlAfDD9XWfvV1qpho5DaIaZvBlHBq9GpT4G0pGg==
X-Received: by 2002:a63:cc4a:: with SMTP id q10mr1805117pgi.241.1579752534188; 
	Wed, 22 Jan 2020 20:08:54 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id
	h126sm467637pfe.19.2020.01.22.20.08.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 20:08:53 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 20:08:32 -0800
Message-Id: <20200123040832.35503-2-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123040832.35503-1-ticotimo@gmail.com>
References: <20200123040832.35503-1-ticotimo@gmail.com>
MIME-Version: 1.0
Subject: [meta-python2][PATCH 2/2] packageroup-meta-pytho2: add python-booleanpy
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
X-List-Received-Date: Thu, 23 Jan 2020 04:08:53 -0000
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



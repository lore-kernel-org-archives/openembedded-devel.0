Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id CC02E7E3D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:45:01 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n2so2080922pgp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chxUvBjV+HRoW98DLswgVMqLhrU4GAYhQNq31PR0Ekc=;
	b=VCAnTSvzqYQ7YjTW1WPnUrAKojV0qMjW0uAE+oETG3W0gWveU5sj0jOTataNhZAUB2
	9xiSlYK+eplqZ9OQbmOvNGbbhlwGKKTyMf/0mCF0qVXt/xWSINrRZF4L9ivub0JWcsgN
	DyTSR8EcbZuphT28NzEn4uwnvQ1CARVWb3NR8MxAoxRET+MyDj8F/rqHpiX/h/d+Uz3l
	+mOXras+WjAPCOC2hqQubLwTsv06wqc//pDqx4jAgR8SvHOpuXin3tBfCCeZDkMD1+wZ
	j6tdLptj8qEVADXB5XotokPMCKrdENiey7V+udLG5IZI/FQ7Yq9RSEgaIIt1bG7KenCL
	DGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=chxUvBjV+HRoW98DLswgVMqLhrU4GAYhQNq31PR0Ekc=;
	b=q8l4SdGNzFZYTr98b7562TnT4xCMcCzNzaTrcpEjoT2kL/TOxBzO0MUtAH++DPkO/h
	OGsEv1O0MZ1hQYHDHKoQGIZTwJREtP6Rgmsu7IN77l2sqJ5QHat1JWZDZX/ssadtzP2f
	KJnEjrMAdKLnFODauYvRIw6q1sMT0Mnx+dutSfDOT57hScjcNlIwBX1tp3hTvkkw3uIQ
	JbaosaSPAHEqiTPgwsz4dWlb04N3AXevHaxKDlB4t1fhyA/aJ1SWyMWSavLuCC55K38V
	gzOqrkzq+RM4cYsyYRbW1dTVvQNKQppw4q/YUyZM+2VkfvjnsyGjlMDXJysvd3tpYDBI
	FOOA==
X-Gm-Message-State: APjAAAUqaF2LdvPl0W6RXWXrztImp7TDge7icCxN8NnNekVO4oafS8u0
	5jHfP/nXfzla9UAK0ErCKSLCr+n41eo=
X-Google-Smtp-Source: APXvYqyCo8gEeTCik0PZW1vHhOGUoRtTEQSRsVZhzVa6eTfSSuMkOuXPwpAnozoMejbDVcRx0kg/6g==
X-Received: by 2002:a63:18e:: with SMTP id 136mr63954731pgb.277.1558568702471; 
	Wed, 22 May 2019 16:45:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	k27sm18567808pfh.147.2019.05.22.16.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:45:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2019 16:44:52 -0700
Message-Id: <20190522234455.13121-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] python-six: put python2/3 variant together
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
X-List-Received-Date: Wed, 22 May 2019 23:45:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Upcoming 60.2.3 mozjs (meta-oe) requires python(2)-six-native for its
configuration. Currently python(2)-six lives in meta-python and it could be
moved to mozjs's home meta-oe but that would be just further clutter.

Once applied here patch to meta-python will be send.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/python/python-six_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-six_1.12.0.bb

diff --git a/meta-oe/recipes-devtools/python/python-six_1.12.0.bb b/meta-oe/recipes-devtools/python/python-six_1.12.0.bb
new file mode 100644
index 0000000000..af26e83d60
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-six_1.12.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require recipes-devtools/python/python-six.inc
-- 
2.21.0



Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id E8DC67FC8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:26:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f4so144642wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 07:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTr8/b5Sit9ewAc6BUpPCRGErR+pF3P0gIAQZ4VQqyw=;
	b=fmwFnrdqTUvZJoPGCLvciBF1MkhqUKcBNL2n29hk+wKYNy4k6oU3sAYkXtcYm9W+9D
	+IE8oWGZ4DweFyKgG1NvYHq/MhcKKys8n0vc8lipwVkUvtOGMRVL1VgmgleVEhLBUlDz
	Osd1SPyvlNkifn5njEbHC1AhOCyRYBh/iCpVRowHe9RIuOiYSydoGed/Ay3m/tFmWPZY
	IK7QjjXaUcFHbdmib4HqFUQoFBUdnhnSooF5B4kctPI8QG8dDkeEk+1OsiX4j0JDNQeU
	KI2jbnzLY+hXN4y81vH7DWw5RCUnpBGVusLsQSNW9zjIrs7xMVKG7XLUpOVt4OkvsewF
	PEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pTr8/b5Sit9ewAc6BUpPCRGErR+pF3P0gIAQZ4VQqyw=;
	b=DBDvXcTscce3M8FqAtIXk551Y4b9arv2QIV35jkKX+XMddsmcX5x8a9jNCbC1UVmCD
	H1xDyGiKvRLLdOxNs09h15tW+s5RrIo4gd+Q5dhuJ1xStN6WYL3MickrCxhXjbIyvYvp
	FqGkSiMdpkIh+ToLBgP0WG7+Hxwd5bQ9wLLQ3zx2Aa2x70o7nuVEOTU8oGR6m0eVoprZ
	729PdY50P/BCguzUcsaKbVGOCxzrM3AvZ3I8Z02hmvgMwegMZIeaG3486OekcKVFDcaR
	ygu04wkCJHf00SGOuwJjzCSTLsNqZ0vZMxv5fv4wmBrnAQkPuv+dTe62XggpsTI07Di8
	vtnA==
X-Gm-Message-State: APjAAAUlj/JMQUsc3V2aK8Pm7+fl6n7+A0Yls89hKK4es5qU8xxZVKFh
	y9e8hBykNfn8RlMoSW7KOW9JD5rbSVo=
X-Google-Smtp-Source: APXvYqyM7ZUTwHKCYlIKMrZvBfX1YDq0Q7lbtFAt4Ef3o0ucipMzcO1XKnTbC5yaXPu3gcZkIt+KoQ==
X-Received: by 2002:a1c:ba89:: with SMTP id
	k131mr25802129wmf.108.1575905201480; 
	Mon, 09 Dec 2019 07:26:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z3sm27375600wrs.94.2019.12.09.07.26.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 07:26:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 15:26:36 +0000
Message-Id: <20191209152636.25746-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-jsonpointer: enable native/nativesdk
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
X-List-Received-Date: Mon, 09 Dec 2019 15:26:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-jsonpointer.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer.inc b/meta-python/recipes-devtools/python/python-jsonpointer.inc
index d36f0294a8..b6e4836ef2 100644
--- a/meta-python/recipes-devtools/python/python-jsonpointer.inc
+++ b/meta-python/recipes-devtools/python/python-jsonpointer.inc
@@ -11,3 +11,5 @@ SRC_URI[sha256sum] = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1



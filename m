Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5F97F2A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 18:34:46 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id x17so7505783pln.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 10:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yYhub/84Tte14i+MtPUBeuYfTxUa7IhAJ095oTOcP8o=;
	b=pVd3JkvLHNN5tFjLSQBQvauHCyZPigPugEfgrk6kkjmZ/N431XE8bVUhok5iYIHEfX
	JekL8DmKaTt1k/3aEznkmXfiHZhL8pohi9hBV/mdyJNZpuyxJv5gA8DSj8I8dfGaktg5
	RhVJTVd2F8bfHgRecFy40M3SpDdGdlYWligQeJgmR9MgLs5kpkVs64/6GPLcMEpHpm+a
	A1xdU3rHrfuvRet/2aN6JElqJmoETf5kLkk4okzci0TXsUXIDuOp6arU3hkoBdXLFjsV
	SIk2CiWk8PErSayNIXs30ytUUDL8o3xsfZSdGO+ARjiVrs8qsMX6cH/KyOYkHjezhYDP
	KY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yYhub/84Tte14i+MtPUBeuYfTxUa7IhAJ095oTOcP8o=;
	b=bXK8vdFqLt7WSvljSsOCrE0gZJ8+gmUTe/XjWj+jCmDIXD5qkzM+WmwqH5ixWxIrBI
	vHvQ1xTvU/YgMoLJYQtrSkjV70sf/2wlpWQi9haD5QuB7V5hdpnK8y8i1Tynb8PmukU1
	TduhxTT0dYoHUXzEZiv33STikUiSjdIDoidl+t1M2k4JX0f2lMhm6zeCBRHisjqf+37m
	ZZnSCBKT47TozYHeNs9aQ9yya3cuqWAJBO/Tc4x5wSQqXi35kLu2+NfmlfUJCunO2vzm
	pYoCAhFtsckQvBwrWEYmCRD188QW/1fzPlYz1npws1geGkjiL9WD0UOsbr+oN1tsFeFM
	hOfA==
X-Gm-Message-State: APjAAAVp0H1nfSpAorg0tfqNfppHJ+f+sB10iBX+qdpPyOpDRy2z5zE+
	9cdCAW31BGJgLLbWo1rgtQoQrc4r7CE=
X-Google-Smtp-Source: APXvYqy0mtOUsp0m6d0V3BsWYnOqxiRvOKLwLM61M0iivurWWnWlaA7Xh+z7NsnJnnAErPuXR5yAVA==
X-Received: by 2002:a17:90a:2763:: with SMTP id
	o90mr528674pje.110.1577126087034; 
	Mon, 23 Dec 2019 10:34:47 -0800 (PST)
Received: from localhost.localdomain (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	r1sm22970782pgp.15.2019.12.23.10.34.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 10:34:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 18:34:43 +0000
Message-Id: <20191223183444.420-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223183444.420-1-akuster808@gmail.com>
References: <20191223183444.420-1-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/3] libvncserver: fix build depends issue
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
X-List-Received-Date: Mon, 23 Dec 2019 18:34:46 -0000

only include ffmpeg if correct license is defined

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index 74aa7de076..22fc83a64f 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 PACKAGECONFIG ??= " \
     24bpp \
     filetransfer \
-    ffmpeg \
+    ${@bb.utils.contains('LICENSE_FLAGS_WHITELIST','commercial','ffmpeg','',d)} \
     gcrypt \
     gnutls \
     jpeg \
-- 
2.17.1



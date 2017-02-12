Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACE7571E53
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so16042036wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X7sOIB9HTwi+hnoHOQuxodBlK80aFacirNgQiStiDag=;
	b=ouTeNVu/SAmC0C/pffFbTEiFetbDArMWMA92wgkc8Nas0WL6CuYqcGvPibqyFoHxN1
	5LqtX1MO3QBzVvkhHMgye5g1+0G68CPpjETjpScDcMD0/rlUOq1ye67jjqMy8J7x0EOB
	Y4BpSt4W4ehmL7eZuppTG1ramLHxexh4AMOQNMKz9PsC8iZrXsb+oqi6knMsIzHJrGDX
	IzeJ6tAHOUpdCQV+rI5CpXWnENGQH9/yMOHzyt1ShZOsNq9bwdciWSz4oZET5m87sIQR
	SdPcFFGAjBHBfkd3HQD285EZuSDQ1vlH7xyNmThhIwXbUyYbOHe3h3q52GsSGSKEvt2p
	OxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X7sOIB9HTwi+hnoHOQuxodBlK80aFacirNgQiStiDag=;
	b=nuNEJCdHYcSKnJZEOWuUA66OefU3YFaoC61hYuF4M/b9D4loQuOnt+QlbedyCaHrbv
	DWq/RnX+mbXmFSr/V1g45rufoBXXqmURM50t9+5sJgfVchjP7GcWF7NWDIZFTjAGoXh8
	I55BVv2yDaopl2OAbba5oIy5rWUvRMeqko6HJcPUVPJAuNRErl0NRFG0zheVBZbQYlMR
	c6WZO+OKUaF0c6++Xnm8oHm93eLTJ/SrV7IowEvwGgGqV2/rP6Dlqzj6Fel96bqtNM+6
	jQ+kKS0IKHQAVcwT55qFOeirFcqcZV69tHU16vwyFhWV02gnMLMB1TMTDzXzJ5VS1UgP
	+kig==
X-Gm-Message-State: AMke39kj7OPqGaN5bNwJKBuxQTX+Ni7HbkVoGbvpZPgezSq/zjo0cdrA0d7QM+TUXGfzKg==
X-Received: by 10.28.35.65 with SMTP id j62mr14796562wmj.31.1486933351278;
	Sun, 12 Feb 2017 13:02:31 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:08 +0100
Message-Id: <20170212210216.867-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
Subject: [PATCH 03/11] glibmm: add dependency on glib-2.0-native
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:33 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
index ebe7747..2677bf5 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.50.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
+DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 inherit autotools pkgconfig
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-- 
2.9.3



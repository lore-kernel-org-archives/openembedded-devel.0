Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 17CA26EB4B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:39 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so2732314ead.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kz9MDwl91tBQnyGWF9CKAKk5frTO6ShmPB3pUTchaZc=;
	b=FbIyREQTGnZqWhOpD9sqJSbxA8xyggRGedQdv0l9/+HTsjnj84VjAGgcysipvNc1e3
	RtHXkRwB92luZnf9mfLlqB6u6mot/8sRvPnsxRgWXHmm/mn/KNBNN8/rQ8aVOEalo4Xh
	SkgS1XGI83wmXNIlgIF0HM3CHwWUDRfZho1DmE4GqHQKhXi8SXY7ZKFm+A8A6vty09VR
	f+p3gX95RQ0I4tITHoKNDkExwrGWLduU7bb06jTDy07JtSQAfUHI9LgywF45apmNja7W
	lHLS/n7jqqkoPLHhkyKzuUdB6Fv7n0Y3GW3L+iKXJ8o5l2cyQqEFlc+2p4xrqyzMQDa+
	u3Yg==
X-Received: by 10.15.35.194 with SMTP id g42mr29536337eev.20.1391240080710;
	Fri, 31 Jan 2014 23:34:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	b41sm46491408eef.16.2014.01.31.23.34.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:12 +0100
Message-Id: <262c0f22a512db805576b98bc76b6a06df6aa47d.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 16/20] eve: bump SRCREV and update dependency from edbus2 to eldbus
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2014 07:34:40 -0000

* edbus2 was renamed to eldbus and is now included in efl source tree

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 128bd1a..67d1188 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = " Enlightenment Web Browser"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary webkit-efl edbus2"
+DEPENDS = "evas ecore edje elementary webkit-efl eldbus"
 PV = "0.3.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
+SRCREV = "84579"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-- 
1.8.5.3



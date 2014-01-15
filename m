Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 21CFE6E6FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:58 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so619157eae.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=87/3xRe9MTPuRaxcOvullE7/LIpj0m1dacJtZzP3vm8=;
	b=HAJfA/gWzy7k5woWxiARrRK7tYFzJzvw/f7akiQzPjnn/ZLrP+xy0sgMOD1BOuLSj1
	jCIulUZSNfO6xH+XIzuUJqjteHNZV4V4g1uk+Zm3tk5dV+uOmWoi/YOsrh1S94U7uN1D
	ECyxofhkQXcYwQoI5aO2wQzwoRXOyfenZ1pAG2RosDyk5oH0XnABbrkT1O+oAl9tzfnn
	Wob5eUCjDS+5MFue2Ku3cyVj9JtD6MswlVOS1x7b4D3OXWYJpGPYbBC0k78W3u68s/+y
	lI5SwwnZLOyJeyUSJEy5UZ5LKn7fgdnGqKfF+CgF3rX12aAGSujoODj1K44V4AGaeY4z
	XGWQ==
X-Received: by 10.15.75.200 with SMTP id l48mr4494966eey.109.1389806272985;
	Wed, 15 Jan 2014 09:17:52 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id z46sm11765395een.1.2014.01.15.09.17.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:55 +0100
Message-Id: <3225469ca5bca054b862c351d5a3fe51b3a5cd84.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCHv2 5/7] eve: bump SRCREV to catch up with edbus2 -> eldbus rename
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index c7f7b1a..67d1188 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -3,7 +3,7 @@ LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl eldbus"
 PV = "0.3.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
+SRCREV = "84579"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-- 
1.8.5.2



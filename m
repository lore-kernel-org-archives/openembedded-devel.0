Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CA7DA6F9FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:36 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so6495344wes.40
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZZoeJ9jmxeK75th15sTc+nfkKRdc/s6c8dlDFkpHVek=;
	b=MO2S+zXALfbJNsXoEJnZgF89DnBJll7iAqIG3xuKpO+KylFI1ldTuKK8PLioYo7v0R
	rOpgCpzu5v8zD/RZj6fhQcr997I9a7KDhBvQ1w3IGsAT5Ar95BwyYQH3eTF29HuWmhLH
	SgtvqUPxI6f1A/3rfE5cbVdE77sdW5fUKk1t/4FgMxZFYH6f2F1l8ZCUMOmeilESqjNG
	fquhMOhGr1OBo5eJ7Gh6OE/BhmbyG3D7OXUXVFvSRX6r7DD7JhP1rXB7NNuLL2gM6yXj
	THhbqsLNRL2MCBf/LgQYtMbvpcjUcTCnq5eaN1E1SSs56vAMr7WfzduCq7cTf7BmbZIq
	BAPA==
X-Received: by 10.180.182.199 with SMTP id eg7mr21701808wic.13.1396372477239; 
	Tue, 01 Apr 2014 10:14:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w12sm41833044eez.36.2014.04.01.10.14.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:27 +0200
Message-Id: <1396372434-10710-19-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/46] babl: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/babl/babl_0.1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
index 1ef4956..3830b30 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-inherit gnome
+inherit gnomebase
 
 SRC_URI = "ftp://ftp.gimp.org/pub/${PN}/0.1/${PN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "9e1542ab5c0b12ea3af076a9a2f02d79"
-- 
1.9.1



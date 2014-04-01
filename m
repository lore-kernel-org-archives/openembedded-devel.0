Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC5E6F7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:08 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id w62so6683369wes.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vloTKYdhdyntALorv9nkb0CV7VawkW/SKn6TIyb3ii4=;
	b=lzOq7yNXEM0YVuxGMtXNGDSbiRBx/BnhXVf9F23MF01kXxWihp3f52woZKGARyMtOL
	gdPF63N3qYbardg+SdOBXScAHNm/+Gar3PjxMSTylapBhRFjCxmIhbkAcmHbfnUED2lK
	zIU2GlFyhsYnwkbJtRScs7xp05a4xxZu/4/aDNB2HOrjr8Gt329JwkCx4g+eeuLitLFI
	ZRaGSyfxE29IJDozRtX0lP1bUtg1NXsZAZoJ+nagslcfg0euo56R5CDvXUy1HVaLnWGO
	59O+DqTMVzCX8+XN1OEi+izLeEQxLsxlDDrbTeZYi6mq1g1E4SuJVP/0YJfUaEBvRN/N
	XzeA==
X-Received: by 10.180.38.41 with SMTP id d9mr21557093wik.9.1396372449332;
	Tue, 01 Apr 2014 10:14:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x45sm41852451eeu.23.2014.04.01.10.14.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:14 +0200
Message-Id: <1396372434-10710-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/46] eve: restrict for armv7a, because upstream dropped support in webkit-efl
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/eve_svn.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index 3cc68cb..5845c2d 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -5,6 +5,12 @@ DEPENDS = "evas ecore edje elementary webkit-efl eldbus"
 PV = "0.3.0.0+svnr${SRCPV}"
 SRCREV = "84579"
 
+# webkit-efl isn't available for < armv7a
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
-- 
1.9.1



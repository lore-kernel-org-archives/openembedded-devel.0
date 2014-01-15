Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id B04F96E3F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:53 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id b57so1026093eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=dchq56v/U5p+dtJsXL1GUIhaPaQRKZ5lwsqnNTBTEVo=;
	b=ORw9uGjjj3kB4EU6AJdby4h/0YAytjvvqaEFbF7zOFg/jc1rxbu7WuPqzJ1DMQEiGi
	pd+6t1X9pX7FG86TRrx1U163ELA795WR11xkNEPktUxIoFViuu6tIznWOMQx7W7Nw30O
	xGHPwZuOCCRnliv4F6eogZaFitiu5ngrywzPcH8DK0d81a8rRMKMUk49kNHzbyFk1KWQ
	J4jMeldtdfbqlp/PIAqcRiv7rFfGImzPqOnwC7pO7e9z5mxwKdpqZrBKO9NqiNiruV4G
	CEvARCKhxIBZm7TpmMlg417niw/GMBLuIiguV4Ki9thHM6aum+4j2z/CqcXr2RYpgYoI
	NRDQ==
X-Received: by 10.14.212.69 with SMTP id x45mr5262898eeo.69.1389806274465;
	Wed, 15 Jan 2014 09:17:54 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm11753346eex.19.2014.01.15.09.17.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:56 +0100
Message-Id: <9513585e508cba2fc1270768a4e11e91fad4a865.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCHv2 6/7] e-wm: Drop evas-.*-loader.* from RDEPENDS
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:54 -0000

* with new evas those are by default built-in not as separate libs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 659ad6a..3f24b62 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -60,10 +60,6 @@ RDEPENDS_${PN} += "\
     edje-utils \
     ${PN}-utils \
     dbus-x11 \
-    evas-loader-png \
-    evas-loader-jpeg \
-    evas-loader-gif \
-    evas-generic-loader-svg \
 "
 
 # Uclibc build don't have 'glibc-utils'
-- 
1.8.5.2



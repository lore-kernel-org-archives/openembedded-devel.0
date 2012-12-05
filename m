Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJyR-0000DF-SQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:52 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2122427eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=lZ9fLfGYXUkOaVVkGTi26mWkPhbnEyBG/uJFtk3GxvE=;
	b=g5WTGhu8F06YmtcK7pqsSigI2hLEDjjffMEXZW7JsbbudlbZWVoB20isDC63/6AIG7
	pOQXwd3VB5AJBaG7EbfRdi90Dznth53tfyA5K2bNrkbNTW7UwxvJx45apiNnpwKcxJe7
	MTVBM8S2z6OVObQbnhxxOvaPllBm3j9oSAe/oBb0cdZVj71BDGF1KEL4LIWyRw8CKV9d
	wegHO1cO+0SfnqmxO/Xib1hEXdQeuA1u2CSQ/4c6ChdxAoCUqNe4cNgLDliZ+YW/yR1K
	ssJle4c+oYBnACjmYzR5aikJw/PD4j2VscAdtRxOms6nWXffbdvhmq59OBfLx86CVLDb
	gCmg==
Received: by 10.14.178.7 with SMTP id e7mr63577429eem.44.1354732273976;
	Wed, 05 Dec 2012 10:31:13 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm10684640eep.9.2012.12.05.10.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:31:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:28 +0100
Message-Id: <c8fa84e480b278ff0f1e19e7bf9d9f911e9c95da.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 70/77] efl.bbclass: fix FILES for PN-staticdev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Dec 2012 18:46:03 -0000
X-List-Received-Date: Wed, 05 Dec 2012 18:46:03 -0000

* ${libdir}/${BPN}/*.a is there by default and it's PN-staticdev not PN-static

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/efl.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-efl/classes/efl.bbclass b/meta-efl/classes/efl.bbclass
index bc2f640..bdb5834 100644
--- a/meta-efl/classes/efl.bbclass
+++ b/meta-efl/classes/efl.bbclass
@@ -49,9 +49,7 @@ FILES_${PN}-dev   += "${bindir}/${PN}-config \
                       ${libdir}/edje/modules/${PN}/*/module.la \
 "
 
-FILES_${PN}-static += "${libdir}/${PN}/*.a \
-                       ${libdir}/${PN}/*/*.a \
-"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/*/*.a"
 
 FILES_${PN}-dbg +=   "${libdir}/${PN}/.debug \
                       ${libdir}/${PN}/*/.debug \
-- 
1.8.0




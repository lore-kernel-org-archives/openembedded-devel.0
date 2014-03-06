Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00B156F5C8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:21 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1228024eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MmuX+7WdQeewPLqQlO4mXTDryB+fsgpvfi2N7IGZWoY=;
	b=zq2ves3HTcHTseIba32XTGL/s6CFZF0K9gYYcC3obrqfTUpT1wuhpSinxdKTOl6qso
	NtYQiwKNOvbop/8lsyogcJhFOWF/ggAO758L2Peng/WwvfaGHNno3lLTbJu64Mq71paC
	klsOMyGX6tZbdWjVbqhGNZJ6S05wWvb0foTd74CfqeN1nqeGKzV2VhGRyGdTlVhioxM9
	PHKqfX4WojIXG/l8QQS2N4zld60UpcwHrlQenIb+BghFFpFJddJmad5H0Hseh5BUq8YY
	qf3chBR+LQ4yppnQdi7xuDf5OVzN9eRLmeAm86Lwj6BtF/Lkqtix+dK/jK+w6mShGU9E
	Jyjg==
X-Received: by 10.14.111.201 with SMTP id w49mr10869328eeg.92.1394124502271;
	Thu, 06 Mar 2014 08:48:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q44sm23634394eez.1.2014.03.06.08.48.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:16 +0100
Message-Id: <6e1be9dcba413946941867875d66b69f48a6a13d.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 6/6] eve: restrict for armv7a, because upstream dropped support in webkit-efl
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:22 -0000

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
1.9.0



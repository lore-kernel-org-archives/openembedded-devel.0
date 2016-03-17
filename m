Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6FEF06FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:48:34 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p65so12582202wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bMQhC1NpZtcynUeVNWVBTHI2CSMkS/eM8lZQQiGypiU=;
	b=PHLeTW7Nl8NFUGI6O7uNOPp+7J1vT5LEb0AITjvX4R2zGrXZXE9dzH59V55EMlncNE
	imINEfaDChmqbky76yba2HiRorSNjBJB6IpgQxlGPc7uQMsnhnWzPqt/gUcXxaVmNCkA
	IS3SZNPRqKpN92xFBRIfZuHjSepk2zkxLsTc99E9sRnhGbrVUhond6W4Cm/kHjZVqiN5
	D/EQWtH6X89Nv3DGPsNSg7nKp9rT621S64SUPaKd3HZSFdXcgorSBfJlrjjXA0reWgaD
	IAX8sl8cXLauvoheoYBdD/eo707dHOcOB9X6JtH9yxgI/dRMNbpLRZ+PejwNYLTOmWTx
	KAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bMQhC1NpZtcynUeVNWVBTHI2CSMkS/eM8lZQQiGypiU=;
	b=L6ou0G7ajhE+9SCnpqAN46KFgdbH5Ve72ZD2lvLa0cjMGNphCeNirckHMjCnntQQD4
	tH7xcWV8FAEtABxrjOYdWsZFGz/6QAGs58Ne/3m7DjM4Jhz2abHztTk+mPELgQt/6cHn
	XlkK1qtKQ35EV2sbSwOk/COhmyGHc4FcR4/A7LVwl09dqvJLga3pFKQVBkfGXNaQboFl
	94Out8w6kZFOAjGb0pGbhQI2s9TZgUWYwJRqMJwZpv7edouyq8IG0NThX7QjKMO4yAQ0
	eHIN3Yrx4zE1VO8w6Dbus10LCxNUfkzmwmuEZKBSWXWqiwpSlrn6sJCgLrOY/JnMhTRu
	sqwg==
X-Gm-Message-State: AD7BkJI9wvQsi/QhFbCZba9guzv1aQ1elK2gQ2HfGJOmg09jgHj0UhQ/tU5586+9jb5gFQ==
X-Received: by 10.195.12.42 with SMTP id en10mr12254361wjd.13.1458251314909;
	Thu, 17 Mar 2016 14:48:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id lz5sm9480944wjb.5.2016.03.17.14.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:48:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 22:52:16 +0100
Message-Id: <1458251536-9218-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-efl] engrave: blacklist, fails to build now
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
X-List-Received-Date: Thu, 17 Mar 2016 21:48:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/engrave_svn.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index 20da907..f34be98 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -9,3 +9,7 @@ SRCREV = "${EFL_SRCREV}"
 inherit efl autotools-brokensep
 SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
+
+# engrave.l:5:35: fatal error: libengrave_la-engrave.h: No such file or directory
+# http://errors.yoctoproject.org/Errors/Details/56597/
+PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core"
-- 
2.7.3



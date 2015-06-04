Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B933775745
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:08:53 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so119430117wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yYtzTp1byRWe0oWCvX+apdygPZDXjONrTMtGgViPO/k=;
	b=oJNS++vprKMKDbtd/MWjx+kBk5HsiCZFjf+05Uumj9tXGCgt3tT2ZZS0/zZ9ylEdDJ
	6OipR2HuHW/SNVSZgZuWxvyT9tvvucRalMcGMi+13Lma/6vFZUngCfNgyUJE7qMVCmzh
	S+dWlZGGhKaszagqt7p9yw6bqwAtE7KY+X2uIpn1ZKdFo4IBO6CbvJOfb//SLrjhwsTg
	E+xfVus8HRdDbW6EJL96ZCgiBRQXD0vACkLq7hZ86qgpXxs3elSuEbmASPoSeavpfEJh
	vligwP2gsS8ibM+nkZOWNOBn/tT3d7TV8DR5nEOyGok6fd/zdC9PL14pZS0f6yl9CPE7
	3/xw==
X-Received: by 10.180.218.195 with SMTP id pi3mr6212950wic.71.1433412534406;
	Thu, 04 Jun 2015 03:08:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id bh7sm5010367wjb.8.2015.06.04.03.08.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 03:08:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:06 +0200
Message-Id: <1433412551-20986-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Andrey Rusalin <arusalin@dev.rtsoft.ru>
Subject: [meta-qt5][fido][PATCH 2/7] qtbase: fix dependency for sql-mysql PACKAGECONFIG
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
X-List-Received-Date: Thu, 04 Jun 2015 10:08:54 -0000

From: Andrey Rusalin <andrey.rusalin@gmail.com>

Signed-off-by: Andrey Rusalin <arusalin@dev.rtsoft.ru>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 50cb505..d2654ef 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -84,7 +84,7 @@ PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
 PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
 PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql"
+PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
 PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
 PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
 PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
-- 
2.4.2



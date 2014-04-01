Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id C6A416084B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:53 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so6502218wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h39ZJP5N8apAwBf3ik1R137/qHbSZwYPyF75cHqcTeA=;
	b=uMFaXaqzlIAbNulbgMXOc3AP9oKGS55SudtMjNQKfdHxS9Za6I28uQ9ggLkzyB6Qhy
	uK8ziOXHeJH1kiN5Jjk8pvYLtKM+dXkVzIKJbQNNjOgWI+uz6mMAHfCp107Ds7v+BzWI
	KXBivakBGSOQul92JZOkhvCbsqKPvRU9RNh2vj4sKXiMXcCyrGzoKbohofovW/ua3mVp
	sU6nP7s6D1PGef9fXnmvsfaqOySd5p/lpXYi/3HLd4zlQjFC2NybZxGr9iX51nBLJPMg
	W8qcYTTEJGCz63IvuAGBo2iMuYW4u2phJ15dud0u5gjcPUKLlAaT2WwLsQDaGbIWPzi7
	IZvA==
X-Received: by 10.180.205.204 with SMTP id li12mr21588752wic.34.1396372494159; 
	Tue, 01 Apr 2014 10:14:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm41856051eei.24.2014.04.01.10.14.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:35 +0200
Message-Id: <1396372434-10710-27-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 27/46] modemmanager: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
index c05595c..759c86e 100644
--- a/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/modemmanager_0.6.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 
-inherit gnome gettext
+inherit gnomebase gettext
 
 SRC_URI = "${GNOME_MIRROR}/ModemManager/${@gnome_verdir("${PV}")}/ModemManager-${PV}.tar.xz"
 
-- 
1.9.1



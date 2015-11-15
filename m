Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id CAC8877396
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:48 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so83021045wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=he6ZGy+fVLeDTJ6K38eR3kDxUorcWpH3q6/oWrSJCVY=;
	b=RPDvOMxmFTh7Hm5anki2r38N1opyQaEkqHFf1zoCXATTfPkR3Q/3o4EXdm2+/76h6C
	m3mwOvvjwpDHlswIlohVou1ieNMSteNTOeclE1JrxDkrnV/9oTt7T1Qgezct8k60wkfH
	v1p8ARsAA+gkPi8vP4mN3c5zoU7FLDAk078doKZbRvugj4rouZ8KOxdcQiaeXk2smuLL
	FtBw7yBA5VeQgIiChz7UckxRbMsa54UKvjI/9gD3TYkxDSrnAS+HaxEai1gkKZCjgQK/
	N/b70h8dL/JTdTjy8HDouz+HBY3WsP7XeiJLeiFdL6NznFjJOoe8DzJma2uMxbtVdw9h
	jLmg==
X-Received: by 10.28.135.206 with SMTP id j197mr15349180wmd.14.1447604268593; 
	Sun, 15 Nov 2015 08:17:48 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lv4sm30027754wjb.43.2015.11.15.08.17.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:38 +0100
Message-Id: <1447604260-5460-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 6/8] cifs-utils: add dependency on samba
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:49 -0000

* fixes:
  cifs-utils-6.4: cifs-utils rdepends on samba, but it isn't a build dependency? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index e6b31fe..00617c9 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -4,6 +4,7 @@ SECTION = "otherosfs"
 LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+DEPENDS = "samba"
 PV = "6.4"
 
 SRCREV = "487f46da737291877867cbd3acb40fea087d3863"
-- 
2.6.3



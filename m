Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id E19E16BE26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:54 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so341001ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=BMtc6IyqWXblBfvbCnAp4W6WPzBTnRnAgZqg9PNBoDY=;
	b=Q01gOH57iP7THkNbMpiC0oUrV2Vzjk/X7fN3+A3I9EWPlkYQur1dAfiU2cw4dx2D36
	Ei+Gxk/CTeYcyXtsBze/FjQg+I6n7lLe25NB/ZcleHqF9HGM+v+tMJezKl5Ld0KSctEo
	GOeIDfRvRYLHikJIBVb97hSxulK7pulTbSVUmiGvVyxNcfCiu9biThnXwKVxeKgVEJCB
	FydBFsOuzIJ9cdrCoAmRDwOUKOqOjPlduF4mwfCC40KMw0ZWzqXbooZab/sgZqXbMi6s
	XF39Z/QZlmiUhO8IHda0379stVJDDG8SnvMWxOLPs+Rpige35Wr1+7cmoAvokumYTqnA
	Yi4g==
X-Received: by 10.14.115.133 with SMTP id e5mr5418005eeh.27.1377791515161;
	Thu, 29 Aug 2013 08:51:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47164945eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:42 +0200
Message-Id: <66e6a32594a49938aac39b8897e92988170b6e9d.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 49/66] edb: Add PACKAGECONFIG for ncurses
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edb_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/edb_svn.bb b/meta-efl/recipes-efl/efl/edb_svn.bb
index aade344..9fe6760 100644
--- a/meta-efl/recipes-efl/efl/edb_svn.bb
+++ b/meta-efl/recipes-efl/efl/edb_svn.bb
@@ -9,5 +9,8 @@ SRCREV = "${EFL_SRCREV}"
 
 inherit efl
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[ncurses] = "--enable-ncurses,--disable-ncurses,ncurses"
+
 SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
-- 
1.8.3.2



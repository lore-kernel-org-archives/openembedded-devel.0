Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 39D436B6F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 09:49:34 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so4713224eaj.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2013 01:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iGvnSn9rjHYM/iKZW2OeffFm0J4DfqxXVpHVLn/1Lf8=;
	b=DDYvAPmtEke90DhOvyd9kYoQ+yeW0BG5QEYkSwHJIslhEEt7TWvUeAHwsgj30AMKwd
	Tt1213DMug/1yAS09vBdcgXanCoOed5yD0eRMwNQZr5YWIKoqeT9/wLreoxE/ebvxa00
	E27TLWhsRUNgC6sQ8xu0JHiVHHUkMdKNZd02CV+OKIM3kfsqjQXIugB7uTO2WKbUx/Yi
	6sdgoufP5jDj4IVu61UctwJuTdI6zyTw7PPc60ahp642r04FkUjTlQSPaDgdzVHDnc4/
	5UMRw8E/M41F1U8HLw2Es6BwjmKDAmWnvcQuRcIsSsmaoz2mWJ0byG4LFpzFuAAUzSwf
	Sydw==
X-Received: by 10.14.32.132 with SMTP id o4mr59206383eea.14.1388483374958;
	Tue, 31 Dec 2013 01:49:34 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m1sm116634003eeg.0.2013.12.31.01.49.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Dec 2013 01:49:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2013 10:49:19 +0100
Message-Id: <1388483363-28575-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388483363-28575-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][for-dora][PATCH 07/11] mime-support: Drop allarch
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
X-List-Received-Date: Tue, 31 Dec 2013 09:49:34 -0000

* depends on TUNE_PKGARCH 'file'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mime-support/mime-support_3.48.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
index e730102..db481e3 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.48.bb
@@ -10,7 +10,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += " ${libdir}/mime"
-inherit allarch
 
 docdir_append = "/${PN}"
 
-- 
1.8.4.3



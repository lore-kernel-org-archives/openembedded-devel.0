Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 86D9C6F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:42 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id cc10so5608255wib.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iCee4MEBxZGaaceIE05sICz2BaF7y7Y/Hn4i82/Dpho=;
	b=AJ07HY57JxZGQWp4x7bjBb/8RPen0aTZ2NsNHMVBmtTiR9jjSrzDlA2nv5OuGviAYx
	OZuZYeRRL1pB5WEzlTtNmD76bN8XxkagSwaYd9jgbHeGJZoNVCJIYcJE/F9RJUutyi15
	HeadX7VvInwOnB6a83AusqABSOvuRdRXzFJwRrnUo1w3QySZbYNP8/0qEKaNDpj0szp6
	JO3lmBToxc+gDbPLlD+z1OjfGUZzW5L8yIIz3NzbzEMuAFUpomXB9UiuinzbM53xnA1V
	e32Ed54rSvdqpTHyvsO/z7g4LrrGHfG+O7JI7f8k0NC8YvsImKoEdAlG63VMjTQ3/d8e
	wOIQ==
X-Received: by 10.194.175.202 with SMTP id cc10mr18976025wjc.48.1396372483494; 
	Tue, 01 Apr 2014 10:14:43 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm41875025ees.3.2014.04.01.10.14.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:30 +0200
Message-Id: <1396372434-10710-22-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/46] libgtop: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index 9edb247..d2fedfc 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "LibGTop2"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 
-inherit gnome lib_package
+inherit gnomebase lib_package
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
 
-- 
1.9.1



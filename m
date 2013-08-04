Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2F36B50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:21 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so1257151eak.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=45YDC2ZKloeQJ/i6TNhNx/x4MZ/0k6E4I0ttTMwLt08=;
	b=UovUESL3yHoaviaFvXKqQVf6sG0cWefP/cCNxLIze4/5UOjsUH2ULQIrAJVyOvcIwU
	KMb4T98EvkchiSrQts2EHilx3ZkfLNlgq0JYUZDT2cLsUzZfvmFxltA8wLKWVyYt7Z9c
	qLPkSUI2CPEknznGH9Zn3sZmrb1IpNNjsy+AX3fs1WrvP9kEHoyoD8uLSP/Y8XpgNjOU
	XOVPeMlNkFoJQqaaja82g+Q2rPq/ASJi4O8FzuPjjBDO/ha1+Jj3HyeONHoGQ+j7fyn5
	y59KpPZUkYFlL6IjmyFMs08psUSZrxcuQTJvqjkDfqvCpt8StmzNYNX8tQRFpx2piw4b
	A8Qw==
X-Received: by 10.14.176.199 with SMTP id b47mr14401177eem.117.1375652841632; 
	Sun, 04 Aug 2013 14:47:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm28503628eeg.5.2013.08.04.14.47.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:41 +0200
Message-Id: <1375652867-10498-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/15] gcr: add glib-2.0 dependency
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:21 -0000

* it tries to build glib-2.0 from native sysroot without it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
index 65309da..d88a22a 100644
--- a/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/gcr/gcr_3.8.2.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "gtk+3 p11-kit"
+DEPENDS = "gtk+3 p11-kit glib-2.0"
 
 inherit autotools gnome gtk-doc
 
-- 
1.8.3.2



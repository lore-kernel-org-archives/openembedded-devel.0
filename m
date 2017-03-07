Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17D377756E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b5so5269578pgg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y9lkC5pi4fd1b2csE8Eymwny3Ge9zhTzmpobYrH1Sgo=;
	b=Ag3ommfvvPB/sZqLGmZvBkVEmaGBAU6hvJnKz+QLKEWoXWTMLyytjst7fQA2a/FdL1
	zAMwqitWRNh6V27PqX/J7MlOD1O+cFuR7HFb+U4yqh8zOeHPdfelLRNOJ64zBX/blkiW
	eY5fNoKhQzIPhBunoaHVS/cXeyLbBkLIlgTDp8PYVq9D3SjXeSAHEqY6Y3ILCfOFw43z
	ftmg4GukzD3KEsWX5PwLlrZhNp4gYMRhqr6BQQLxsQ/9JnAFOK9PGXhXGI7J3kdnXRVo
	mXdMLz3tLcB00WfnrwvftTNwhtayTmLTFxMRXgCYwgNFvRDXVuvEnU7W0lu6Bim0J1F7
	BuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y9lkC5pi4fd1b2csE8Eymwny3Ge9zhTzmpobYrH1Sgo=;
	b=MoWhZ1LY6+Doqhij/RFOA397CPc3i4eC2UQNg7LXsdlSUKbEjRTdwe+1W+APoOrHKu
	3P1zXv1zlZj5wEZejODa5KGBT2yo5ihR0KSZdbdIVQhUK0umDCZ4T2loweAoiygjMzC1
	HUUbut/lwa/NzZPO5+SIlYBDXZcz9q5S8o5lMDE1sqc/oYdGpdnmbwoMZB+LlRuAbCxE
	SZVjsg0lxfhcshCLRdJ2JdPm4Qn/7CjRmYSnJ3wlujwWyOXC+jxuuNhDWkBmF7aKJ4p4
	T4G4+8LO1LFCwQhAB3IZF20RlqjZjGS1i+fyqtu3Bsn8tmyjULX3507RzfL7ygGLJw/B
	kRSA==
X-Gm-Message-State: AMke39kqIY226wbOBFG6vnjDcIZ6FLwveHT04GjCkxYOwHXEKTwjqeKHfzerDevUrY1mXA==
X-Received: by 10.84.177.36 with SMTP id w33mr32847270plb.105.1488870848751;
	Mon, 06 Mar 2017 23:14:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:45 -0800
Message-Id: <20170307071349.16444-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/14] log4c: Backport patch to fix security format errors with clang
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:07 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-properly-in-the-example-format-security-.patch | 26 ++++++++++++++++++++++
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb       |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch

diff --git a/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch b/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch
new file mode 100644
index 000000000..9ff9d7002
--- /dev/null
+++ b/meta-oe/recipes-support/log4c/log4c/0001-Use-the-API-properly-in-the-example-format-security-.patch
@@ -0,0 +1,26 @@
+From 97f0b7b25474fab25f5757f7c50a77e20be5d05b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Franti=C5=A1ek=20Dvo=C5=99=C3=A1k?= <valtri@civ.zcu.cz>
+Date: Mon, 7 Sep 2015 15:00:48 +0200
+Subject: [PATCH] Use the API properly in the example (format security error
+ fixed).
+
+---
+ examples/helloworld1/mylog.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/helloworld1/mylog.h b/examples/helloworld1/mylog.h
+index 280f3dc..57e5369 100644
+--- a/examples/helloworld1/mylog.h
++++ b/examples/helloworld1/mylog.h
+@@ -39,7 +39,7 @@ static LOG4C_INLINE int mylog_fini(){
+ 
+ static LOG4C_INLINE void mylog_msg(char *catName,int a_priority, char *msg){
+ #ifndef WITHOUT_LOG4C
+-	log4c_category_log(log4c_category_get(catName), a_priority, msg);
++	log4c_category_log(log4c_category_get(catName), a_priority, "%s", msg);
+ #else
+ 	printf(msg);
+ #endif
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index a028f2b7f..ef7ad847a 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -4,7 +4,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://fix_configure_with-expat.patch"
+           file://fix_configure_with-expat.patch \
+           file://0001-Use-the-API-properly-in-the-example-format-security-.patch \
+          "
 
 SRC_URI[md5sum] = "0d94919136e1d16b68427562e74cb3dd"
 SRC_URI[sha256sum] = "5991020192f52cc40fa852fbf6bbf5bd5db5d5d00aa9905c67f6f0eadeed48ea"
-- 
2.12.0



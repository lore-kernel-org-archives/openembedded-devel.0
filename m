Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5CBC66AF58
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:12 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so1282083eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ivObn4zIENWzbsQD9Bk9tLTPEDHRoYcZ1i8mDkg5MQM=;
	b=UOloBCuD212Ydvja/yUHXulnFnglwhqGH88rYoNYDwB3PEdBUFJSy2s2FuLQQNHxBj
	h8NAZcpNZ3QuerBl9PECeBO0XyzFc/s6x4MWupZ4v7FYUj7RNRES+804Tzy0zaKvZEQv
	6Cuks2kY0kbQ96Nra2e7iBAs59NQ859p8bWwL4ZyRp+LNP5S/nWud4UfX/h4w8HFPG2F
	azvg7J/uFd23yUw1pCxR2I8rCfu9MlLJUrFMvCR0LJWdG3rd/i949wDOYcvmepHZ2ldb
	6WHAwJsubRk+JQeQqHxD9AwIzbbH4a7LEJMWT800aRBi7qQSvyVt1o4TOXX56LV1zjYq
	1H/Q==
X-Received: by 10.15.101.68 with SMTP id bo44mr14533285eeb.13.1375652832536;
	Sun, 04 Aug 2013 14:47:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm28779102eeh.11.2013.08.04.14.47.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:35 +0200
Message-Id: <1375652867-10498-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/15] azy: add glib-2.0 dependency
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
X-List-Received-Date: Sun, 04 Aug 2013 21:47:12 -0000

* Package 'glib-2.0', required by 'ecore', not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/azy_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index a670b9c..97c509b 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers in a simple manner."
-DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native"
-DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native"
+DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native glib-2.0"
+DEPENDS_virtclass-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native glib-2.0-native"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-- 
1.8.3.2



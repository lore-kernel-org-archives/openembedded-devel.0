Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 975936B828
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:36 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so180962eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=lH53MhGK+15Vddh78ZhJFiiCbMuPB0jboYDtoCX5zj4=;
	b=m3NP9XgiKODZpjKEhUrjxrY0s9dZ9m/1LxcLa2e9mfkFGE6n/r3v31qYy8PFt25M3z
	qJdZRwNScqsdAGY1tn0kLbcXMuzZlB/lbBbBeAu15WWVVtiL9MPP3Qn1Mz7jEFPwzp3k
	T1CDGRX9sntL6m0pi+Ohv6uPsadHmR2jNEbyj8ykfPHUdRt/XNUWPKWH7yLdExlPvR5g
	ItEt5yVPbM4CS72Zc4Uug2MqIZzWWVVj/J3W9gOzm0CVvsusXcp3mOCYOCa+BPlV+Pvt
	QGOK7GJrm4UnIeVmYZzDHhULBYqLyPuPZIn2MD7d7lDIa+6U0HuQQKQmIkxLu+7klY+q
	jk9Q==
X-Received: by 10.14.38.196 with SMTP id a44mr226809eeb.78.1376551177008;
	Thu, 15 Aug 2013 00:19:37 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm81944126eeb.11.2013.08.15.00.19.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:13 +0200
Message-Id: <560ab51a652cbb76e578c1da0a52526971c569ae.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 33/60] loudmouth: add dependency on libidn
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:37 -0000

* it's autodetected from sysroot and configure doesn't allow
  to disable it explicitly
* feel free to add configure option and PACKAGECONFIG if this
  extra dependency bothers you

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index 8375386..c864276 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.loudmouth-project.org/"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
 
-DEPENDS = "glib-2.0 libcheck openssl"
+DEPENDS = "glib-2.0 libcheck openssl libidn"
 
 inherit gnomebase
 
-- 
1.8.3.2



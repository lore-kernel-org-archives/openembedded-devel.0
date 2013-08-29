Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA746BDB4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:09 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so340021eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=eWEz3nqF53prpMJWCJ1mQx3T1dlPhcjvDD39War0EQ0=;
	b=hpOnVXwDKCNTMqgSTw+tKlPmC6CiGlm56jwKe3z/hId6fSiF9VKhG6aKpwzWwEB+D+
	rcCprlMYsFiws3Cglme+RcP0RLOPPyyE2Q6cvKQAMZB/s3HBsaVBYYKOa/Nr9TEUksRB
	X8eP1rzjABEmKUxob1UvjD/EJS+1fibTDbcz4AnQsmt0aweQ0y8zz6p+4h8xnSuqDwIy
	PW70siYXfe/0voGf8UAtZxnoxfJr242+wlvCBb4e37QEpcEJRMqwG1DliRYU4xyAx3fl
	TfXsonwAMA7l7uzNYguwRahEnnbOcmr5OYZvH8hLtlETOf01R4y+oRvu02mrLNgFUZV3
	vWbw==
X-Received: by 10.15.63.14 with SMTP id l14mr5447168eex.13.1377791469704;
	Thu, 29 Aug 2013 08:51:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm47153335eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:09 +0200
Message-Id: <368333060a75571ede30a7eeda08e17f99084a36.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 16/66] libgtop: Add dependency on libxau
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:09 -0000

* libxau is included in libgtop_common-2.0.la

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index b6a8869..8f0c89f 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -6,4 +6,4 @@ inherit gnome lib_package
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
 
-DEPENDS = "glib-2.0 intltool-native"
+DEPENDS = "glib-2.0 intltool-native libxau"
-- 
1.8.3.2



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF866B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:20 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so212305eaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uGA9/oBYNn2zt+fIsDWAr9yqoI74v0xpGDJchGnPLEQ=;
	b=xGrdBin5CYFCckc5ciSptMLwdJexhf9BB1QMlb3ypfCCAiTym1a+06toGSctfd58lk
	TfUIbsj4QQiKQB02C9D6n1rFWOqH7y2pzKmsfWOk9hxKgZKEbgZT5d+RPwHDMDNVzOyZ
	m96EHGfYhetrZZWYXquu7/T36yB227Wc1KAbHrddeV9IKdB4LF80SHhxfFIqhDYZSZ3u
	GnSppiE+c8av3DEvf9w1gk17d68rla+T6GQ5vShB9qyThwYN3HVT/pS+hhkZKKOklXH8
	Qvo49336Fue2SprMev/b5FbprIOD0L3JskednJqsWtReyMaeMzjjFJQrqzahIOk7ajEs
	zRUQ==
X-Received: by 10.14.149.141 with SMTP id x13mr37566539eej.77.1374669681083;
	Wed, 24 Jul 2013 05:41:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm65841310eef.16.2013.07.24.05.41.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:03 +0200
Message-Id: <03ed92e26934c36bb2c47f15797832650a026bcc.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 19/29] farsight2: add PACKAGECONFIG for gupnp
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:21 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 5abf1d7..a1029b3 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -11,6 +11,9 @@ DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
+
 EXTRA_OECONF = " \
     --disable-debug \
     --disable-gtk-doc \
-- 
1.8.3.2



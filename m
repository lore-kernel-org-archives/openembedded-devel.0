Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9C66B333
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:18 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so213931eaf.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=84F3JwysR006RWu5v2EUOU8z8ZwpCfnx8MyxEZPIowI=;
	b=fTckmtRT3bT/HYnCdFKnTOnJB3BqpPtqbFz7cn7wDD8qTHT1cWcrmkJAD3xZXOnaTk
	l2NMjmx/mZel+JLIK1kbF1SpF9iKKh4wa9Q+F35qlxx+tkMHiOYIzdhmEJsEBSOlWPKd
	AVarMfRPSPoJhxO4W5i0rFGI//1SOOn8dDY5cUeO8Xj5slWQ0LV6LLk/qRKBU1QNBMfF
	sryudvWmmlFyU+HGmRR0JmSwWTNHEMQJisOZKe/NzAxVyKrR2VjiF80CkeMfI0Jhkbh3
	7vyZNIZn3r831ntrFVCKrOWuq1AULFVlesPDanx9EX4pU11us9TuN0/m2/QhKdAUbxLw
	muGQ==
X-Received: by 10.14.103.196 with SMTP id f44mr37115315eeg.37.1374669678907;
	Wed, 24 Jul 2013 05:41:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm65904836eev.3.2013.07.24.05.41.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:02 +0200
Message-Id: <636f9963b9c5f619e3a17793c45771e435b8a474.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 18/29] libnice: add PACKAGECONFIG for gupnp
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:18 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/farsight/libnice_0.0.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
index 94ec9a2..3205aaf 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.0.13.bb
@@ -13,6 +13,9 @@ PR = "r4"
 
 DEPENDS = "glib-2.0 gstreamer"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
+
 inherit autotools
 
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-- 
1.8.3.2



Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB996028B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:00 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z7so212154eaf.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qM9SvnxHvzWqHkXEP3kCbwpQGQ1vNZCw9B+8OKvxN3Q=;
	b=gG5dWLu11tP9u2w+xdMqmjuS43Y/fv5hgyldS147BYbnGs3kfbLNtM0sUOh9+NxnRE
	h341Kzkg2XyJWDu/eQO5HJjQDFQxQMouRb+0EfDpYacZikO22vREuZHYh1GSJ9elk+MY
	fXHud4tkMdDene+l7UlaRUgzcGdmoq70IaaxpAOjZgRzuyD0QSlLd5PVHfbflgRqeyXU
	4TOTwHpSRdM33GWLpeOKw5+RQQmcTxJm1llXT0C73tJTxyER5X1ilB7Yx1rqfi+PtuzD
	hn9Uyad18AvXCynBezACKkFsB5A//8mKQCvFs+UQnheNBogTStRRRS74BUuiDDPH2Nkn
	LReQ==
X-Received: by 10.14.109.195 with SMTP id s43mr37353350eeg.132.1374669660978; 
	Wed, 24 Jul 2013 05:41:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n45sm65924642eew.1.2013.07.24.05.41.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:50 +0200
Message-Id: <ac0b3bff27d87f48519488cff674d987fa948b31.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/29] mbuffer: add PACKAGECONFIG for md5
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:01 -0000

* openssl is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
index dcd8a47..bd80c84 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
@@ -11,6 +11,9 @@ SRC_URI[sha256sum] = "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c739
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
+
 do_configure() {
     gnu-configize
     oe_runconf
-- 
1.8.3.2



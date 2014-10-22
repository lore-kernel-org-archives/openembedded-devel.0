Return-Path: <cnelson711@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id EB30F60233
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:04:58 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rd18so2600447iec.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1hjMznZroCl7pDm6FGSNR4IJlw2LWcFui5uCnysqwBE=;
	b=dqpJfOD3g3fnLYuCoFhzow/9HqwkMxmY2rY3UDzXB7IzUTQDyRh/Sem/DOkTtJiJeb
	iFOuW12ZB3r+z8tPTDVgRM+qqcusCuAEyOq88vCk5eYc1euv/eHWbvLNWvzlfEt0okD5
	rLqz1Kg4RI4Tg6UvZ5qva2o8prDRSg5Y0uoY1A1EbZHdTRa+fYMkJsb1ftrt6LcQZnGs
	U4ZR8SQxgkpZdjgR2mb7ENGc8KTTFr0NG/IV6BD5DagVcE+V4dEX0gWByD5kZ6rTmG1x
	R35i7LnvGZhqZWypOVPSBidAjWVKpZf/ZRQfvQrdt6uPqZPfqcwZ5/6e9ejndq4V9j25
	pEHQ==
X-Received: by 10.42.212.7 with SMTP id gq7mr2075897icb.32.1413947098014;
	Tue, 21 Oct 2014 20:04:58 -0700 (PDT)
Received: from cnelson-vbox.agleader.local (97-64-223-66.client.mchsi.com.
	[97.64.223.66]) by mx.google.com with ESMTPSA id
	v198sm7003793ioe.43.2014.10.21.20.04.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 20:04:57 -0700 (PDT)
From: Chad Nelson <cnelson711@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Oct 2014 22:04:49 -0500
Message-Id: <1413947089-3995-1-git-send-email-cnelson711@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-ruby][PATCH] ruby-lang.org changed the subdomain/hostname of their download server.
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
X-List-Received-Date: Wed, 22 Oct 2014 03:05:04 -0000

From: Chad Nelson <cnelson@agleader.com>

Signed-off-by: Chad Nelson <cnelson@agleader.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index 409a320..7702869 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -20,7 +20,7 @@ DEPENDS_class-native = "libyaml-native"
 INC_PR = "r1"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-SRC_URI = "http://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
+SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk.patch \
 "
 
-- 
1.9.1



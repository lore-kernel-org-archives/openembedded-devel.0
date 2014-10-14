Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 806B671915
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:53 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so7236635wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=8SHZ7iTcsu9wECtdAW3DTxpwFg8S2SoyMDBIDMhdnY4=;
	b=ckZyrUCj1m3OAx0m7sV32edw9fIHG0BqcEuh8JGhHBGOfIYoCr9Ol9SqB17wonr1fP
	IqUyXvCjRYBMGJE3iTxTdwZ8oxyZLthfnQ+mjqzNjO/z7W984uu3965s8PksSePMKYqR
	myZq7rWLl2xFSw4cdkbO7qucXvRFeGX4o2NA2s3gDi8brxSq4uF0PsoomBaIhwPZj0Ml
	wDLHWdwtF4W02iwFd4j4S7NsY56acXI5jUNTzigZpqBdrfFYI25Fi+6JtTZp4wyoq68O
	qU0lcOSzmdXevhS28KkCeq66p7uVeYeIPa6Uyn3Urv+gVMueggcU//StLDvGUt0WQz+d
	xDdw==
X-Received: by 10.180.12.50 with SMTP id v18mr8241530wib.60.1413324894257;
	Tue, 14 Oct 2014 15:14:54 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:27 +0200
Message-Id: <1413324868-11856-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/15] geany update to 1.24.1
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/{geany_1.23.bb => geany_1.24.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.23.bb => geany_1.24.1.bb} (73%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.23.bb b/meta-oe/recipes-devtools/geany/geany_1.24.1.bb
similarity index 73%
rename from meta-oe/recipes-devtools/geany/geany_1.23.bb
rename to meta-oe/recipes-devtools/geany/geany_1.24.1.bb
index 593ba66..f765e2c 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.23.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.24.1.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
     http://download.geany.org/${BP}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "4290e8c32305e916f57bb0f0233bbec2"
-SRC_URI[sha256sum] = "cdd4a772694803c837ae59e56f7bdc2faba174509317211f522e7d25dfcbe8b0"
+SRC_URI[md5sum] = "d225104cef3973164d70116d46239606"
+SRC_URI[sha256sum] = "7fb505d9b01fe6874890525f837644a6a38c23a372bb068c65ef3673108a8c33"
 
 FILES_${PN} += "${datadir}/icons"
-- 
1.8.3.1



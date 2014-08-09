Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA0670A77
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:09:03 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so6850805wes.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yasSjPN7701r1i8ApHLeZOKWOi7klPdHCA+42DcL+b8=;
	b=tCcwuiPN/wtxi34fsQj/YmcSD/X1aMn22ilLpmZzmqRKQa5WJqA8T26i4BwVqjCdHP
	zkE6xuo5lSwRY7k4Xy5PAFhQ8OI7M08VkuzdY9dEL8XhVnx5G0ibcs32uwMRQ5al+RXX
	sECygEECOBoningIX/fTovpyVFdhoENzA3M0sh0Xx0P4wHSUviYcsYk6LLnhyf2WU/iz
	V10DGdg/JSuiDRea0ecyNHYile1eet0fY/WYSr75u0VN5Td0LkJ2Y274uRQeRj0rEB8G
	3CI+LEPLCWOSLR/JiHbgGfRQFtfxhw64b+7XAnAayZGb2ZJ0Pr3qt/20gZhgs+vOcx/3
	QN0g==
X-Received: by 10.194.172.137 with SMTP id bc9mr40934770wjc.72.1407600544272; 
	Sat, 09 Aug 2014 09:09:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm25525010wjd.30.2014.08.09.09.09.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:09:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:51 +0200
Message-Id: <1407600537-10857-30-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 30/36] protobuf: add dependency on zlib
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
X-List-Received-Date: Sat, 09 Aug 2014 16:09:03 -0000

* fixes floating dependency:
  protobuf/protobuf/latest lost dependency on  zlib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
index c4ed5e6..8386206 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.4.1.bb
@@ -6,6 +6,8 @@ HOMEPAGE = "http://code.google.com/p/protobuf/"
 SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 
+DEPENDS = "zlib"
+
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af6809583bfde9a31595a58bb4a24514"
 
 SRC_URI = "http://protobuf.googlecode.com/files/protobuf-${PV}.tar.gz"
-- 
2.0.4



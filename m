Return-Path: <bobadeshrikant@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB42609B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 10:54:27 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so9372389wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 03:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kzOYK9HhsTEtBcHYVdNrMZ38Ye36Yxo8ABEHow49U4k=;
	b=swiIGANNxGJvEJ+NR1vz4axqIricfI/5uF63xWXdS5BjSsUXN9rWVLfLkRBIyO8RDH
	fffIVXGy4DOl2xhSTW2eENNAwy6WwIa87Yrvp9nLrmQsDZ8NbhDmmru7FrBpTmITMKpm
	wElSU3htUw8yDUxuJ0q7wVQB3nyP3CEzdr6MkGcjy3mLspucTheGnWyZoEuGo7JSuXlj
	+qkcXziK1bkoQU+T0UBFaHQFeX/c9qi+PbnhNOFgePYeQhgk9N9HJ4W/LPxiuC+XVi7Z
	wMAhGGyHvxPF+Ra3WcY/HoBAw8T0jSa+WAwyOTzjbJkEWcxk3TLvYZcFjResbul+mQFE
	isZA==
X-Received: by 10.180.184.20 with SMTP id eq20mr8024360wic.37.1407322468219;
	Wed, 06 Aug 2014 03:54:28 -0700 (PDT)
Received: from localhost.localdomain ([139.181.35.34])
	by mx.google.com with ESMTPSA id hp6sm4926416wib.23.2014.08.06.03.54.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Aug 2014 03:54:27 -0700 (PDT)
From: Shrikant Bobade <bobadeshrikant@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Aug 2014 16:25:22 +0530
Message-Id: <1407322522-6572-1-git-send-email-bobadeshrikant@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: [meta-oe][daisy][PATCH] libmtp: inherit gettext
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
X-List-Received-Date: Wed, 06 Aug 2014 10:54:34 -0000

From: Shrikant Bobade <Shrikant_Bobade@mentor.com>

This is required to fix autoreconf execution failure
: AM_ICONV,AC_LIB

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
---
 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index f4ea800..6185217 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -33,7 +33,7 @@ skip_udev_rules_generation () {
 	cp ${WORKDIR}/69-libmtp.rules ${S}/
 }
 
-inherit autotools pkgconfig lib_package
+inherit autotools pkgconfig lib_package gettext
 
 EXTRA_OECONF += "--disable-rpath"
 
-- 
1.7.9.5



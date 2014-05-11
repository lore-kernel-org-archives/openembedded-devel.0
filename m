Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f48.google.com (unknown [209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 90DAF6600A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 06:49:50 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so1012619lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 23:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/OiaOkillzgQbFaYv5zaq0WV1EYa9yyMpqjVVOJqM5U=;
	b=FdAW0mew098S9kSSek3axApH614zIHBY9zhFpvs8loiDw1kE6HKRld/agW4iPeRxWv
	jipYsLP5lUMiqAYmE6Ugcnq8MQmtWyIoTzQFkfd8CJ5iV42mrBsylPDU9wuTV7+fidDc
	y0h5hTjYrm2hL1+2l3Rh3d1vtwaMt5Qqq8H/ITt3mYM9uRV7dIseTZ34oKlNyVguyU+L
	TJtO6SI8z6msbWrVwspZKiaC/i2AxotvXrtYKw7SGyr2c4UFzP8/rnhhNcF+JNbmmu5M
	A2qYfaUkD+8Z7FauPJvZiqkcsJXNbN3tU0NVR20xMlRqz/LoGLF2UwgIlE+FZ5zoGegm
	qVTQ==
X-Received: by 10.152.121.39 with SMTP id lh7mr7126407lab.7.1399790991089;
	Sat, 10 May 2014 23:49:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id r2sm6970007laa.5.2014.05.10.23.49.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 10 May 2014 23:49:50 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 May 2014 08:50:07 +0200
Message-Id: <1399791009-2718-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399791009-2718-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] sox: add PACKAGECONFIG for ao
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
X-List-Received-Date: Sun, 11 May 2014 06:49:53 -0000

* fixes following issue from test-dependencies report:
  sox/sox/latest lost dependency on  libao

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index cfc61d4..18d77bb 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -19,6 +19,7 @@ PACKAGECONFIG[magic] = "--with-magic,--without-magic,file,"
 PACKAGECONFIG[mad] = "--with-mad,--without-mad,libmad,"
 PACKAGECONFIG[id3tag] = "--with-id3tag,--without-id3tag,libid3tag,"
 PACKAGECONFIG[lame] = "--with-lame,--without-lame,lame,"
+PACKAGECONFIG[ao] = "--with-ao,--without-ao,libao,"
 
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
-- 
1.9.2



Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB62731DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Mar 2016 00:52:37 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so14441180wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=R0uj1r2/SHQ7ToNx3iExoG7ZR47Q7EuNLl2aEIQsuXc=;
	b=UpUjI6e1wHncQdQGEW7aUJEfzR3MS33QAjZ1a00dtnQUDDhovprHr0b8HNx1467jPe
	GaSJQ1dmcEkt4zi/fbj9szGPEYgstTELlviNbMVl1XBnqECsk2SXnC2LpzgPhtZScm96
	R03gG1TcbLxoMNfN2zml9I+g0pQHCxzahGyzRYXS3COrioYoGiSjJak44db9BRisAU1T
	JIk0fJx+ai841lrGhjYEUfEWNjQ1PzbCXDKgSi88y+3Kd6u3L62+iOs2TnRhqNhlHJqm
	fRuX3FxjY71aGUcX2UxVPQ4LdWCm6VX+THSCaHHams9Mq6Zn6hB7I8U2Nq5RbljvunMt
	nQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=R0uj1r2/SHQ7ToNx3iExoG7ZR47Q7EuNLl2aEIQsuXc=;
	b=WYZ95BJ+JHUx9sTjfp8uyOFzXKWUViFSqiMmgVPemBA9K8iEU0/em9Ttj3ri82BCgU
	DZ/gQlDwc3HimBbKzcIilz/l9o76lPOFWp51wpB2G2GQvSjpSB4iXO1VB3LQ2ezyLZpw
	c6vBq+hc455P//oAwHsE6AEr3ZE8Ntdp7DmK0snaThr6u8+TDk3cd3qOcxtukLWIx56v
	ZGFafYzhdwPxXteokA+heElqIQpZQAgQjK0YpaMFcd1CQwh942Et9k4HTuhvY8NQtXBy
	XTffHy5NFQDFTK4+74nJEgLaXbwz9Ul5kg3wVVPTpfTitLV59WbmM6Nzo6SWhx6abc29
	zzsg==
X-Gm-Message-State: AD7BkJL3w2KteQGQHu4sVb8202OIIh+sdV+5opZzO46naAfz6PO4kSLn9fkB1ucWa28qRg==
X-Received: by 10.28.183.137 with SMTP id h131mr704407wmf.100.1456793557806;
	Mon, 29 Feb 2016 16:52:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	di1sm28194118wjc.3.2016.02.29.16.52.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Feb 2016 16:52:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Mar 2016 01:54:26 +0100
Message-Id: <1456793666-26638-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.2
Subject: [PATCH][meta-qt5] gdb: append to PACKAGECONFIG instead of changing the default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Mar 2016 00:52:37 -0000

* without readline in PACKAGECONFIG and with no-static-libraries.inc
  gdb fails when trying to build against own bundled static readline

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/gdb/gdb_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-devtools/gdb/gdb_%.bbappend
index 41592c4..ec17f55 100644
--- a/recipes-devtools/gdb/gdb_%.bbappend
+++ b/recipes-devtools/gdb/gdb_%.bbappend
@@ -1 +1 @@
-PACKAGECONFIG ??= "python"
+PACKAGECONFIG_append = " python"
-- 
2.7.2



Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id C37D47EE8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 21:23:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n9so40953814wru.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EHVWK3cuIDU9JOK5SJ1hdZdimXth55whuNbhb7xbsBw=;
	b=macuudq+BgK4JuPgTXsPs+CYkOe0xs3PVPoLqHo535xux5epxju2NnCUb+2R15BBgu
	YxquhwCcfhXkaGYnjrM7gi0OnmKLnFmX4zzHrq5YJjZuiV1lBUg3lXd9dqlwEuAyEk7N
	4SnLH1kObPhELhpCsUXv4aiSghv/yL7VIFQrix/Mm17PHZxCm+1RdGokAVOkz9d7pH2I
	EwL5yxI9pROBJg6uvcY/i31IhN4wMpXdKlhDoSj1P1EM9f9XgyhAx1Dq2PZiR9Pw6Ffn
	uwWtroK+ukFG69S6Lhoa+49qeT4ZU/N4LsiiTW/jlOdH2mm+YaGw7NiaK2jYNGaPU5ZX
	ws2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EHVWK3cuIDU9JOK5SJ1hdZdimXth55whuNbhb7xbsBw=;
	b=HzmwNseZuy/kR43IxAdd+CAApHJDOJZs33vVk0RXE733e4bNu2emAFKwWNrga8Bv3q
	sxVRZ9OKB0L8qSEWJjUDI8utMl/AXzaL6Z+NNiejHUUCNqgLycwWKUNbZmJXwymtlLAw
	yzsKdJP+39xSKuz3i8h+qe8q3GGLzD3w2eTg3ef7fku5vwn+XWzm50C2WmqC+6FxrXQr
	eKj30+uWarbntLgGTzmhlqMV9dy9RbPLqq93aql9zJjfCVA5G6pUwLGTx8vNTPd2ZUwI
	OcjukyXhFuozmu3grSmnO89HlAhKPWRjjSA3qJ50ti5YpLp0kYT67yJB3HukIbEktpOL
	TbpA==
X-Gm-Message-State: APjAAAVAwsEF/tvrFvx0UXkPAEn6gnxURBI0UIuubN6IPn937vtxyBcc
	+NNyc1XXs7w9Drt+wQVS+TtNVcs9
X-Google-Smtp-Source: APXvYqz1rCkveMqcaSn3+IydB6hL15FPUKoPGJbDEiVWJukoZL2DohWq3WjvqeFGxN9j4OPr1jzgRA==
X-Received: by 2002:adf:dfc4:: with SMTP id q4mr74936176wrn.54.1563830587937; 
	Mon, 22 Jul 2019 14:23:07 -0700 (PDT)
Received: from localhost.localdomain (mob-31-157-4-239.net.vodafone.it.
	[31.157.4.239]) by smtp.gmail.com with ESMTPSA id
	g12sm56634670wrv.9.2019.07.22.14.23.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 14:23:06 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 23:23:04 +0200
Message-Id: <20190722212304.8334-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.14
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
X-List-Received-Date: Mon, 22 Jul 2019 21:23:08 -0000

---
 .../cpprest/{cpprest_2.10.13.bb => cpprest_2.10.14.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.13.bb => cpprest_2.10.14.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
index 3e42a002e..c13a632cf 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.13.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.14.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.13
-SRCREV= "9d8f544001cb74544de6dc8c565592f7e2626d6e"
+# tag 2.10.14
+SRCREV= "6f602bee67b088a299d7901534af3bce6334ab38"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1



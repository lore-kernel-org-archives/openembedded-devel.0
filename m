Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id C56F47FD45
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:37:59 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q10so876997wrm.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 14:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hDM61LPnav3NL0HkkKU+ecxjsC/BTg+AcGEB2IgZJ8M=;
	b=QtccHJScruqxi0FUZ9l3tpW4wkwZ7bx7qg4qZudGlZQzdi8kBTVAkjuOTgTjXwLM8I
	t5MvrJQ0LXX5aNbmjjVp/DYpMkeSe5q4UJyCPfskfOWuqJgXmPeNClpwQ+h19ws9FVBY
	PeDOltpZ/kFdaiTjnXsUna8+KqL7aSZrenPDgAq6xUrEqm5z+SCVX0knHT9H+qfXC1k2
	pybNXGx89TbzBYWntIa3y1delc0ZHYWQrw11Fq8V726zHncnPjC74o0OYiwFpnUToefC
	Wjc/CSnIHogTuA0p8WyMEQC+MppRKQX6Qq31f1p2itocDFJRFvrdsfIIgUVt+rPseEzT
	3Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hDM61LPnav3NL0HkkKU+ecxjsC/BTg+AcGEB2IgZJ8M=;
	b=S1L5aZCeJjD9K0rcNj7+rpprWgRhPRoI5mjK3kbazfhjGyhJHMFpQmCC23XlkKAo3V
	h5LEt0YNDXjA9Do0c7FMdpElHqDL81jeAEGZCj0zKLhLdDNEyr8/u2tyVLAeH+BTJkEN
	9cyGbAbDoIzjCPZhL5Q45FZowLVVawacJBSzCGFYr98mRVI+2UOwIfcNCARhk42P1SLd
	LMnIfCz7MS8SxG/sx9kjhrsXWYhODv3RBWjK7Y+DFiV0aFP+988HxsDLYHKaXMudvsdQ
	ZHB2HSi1Ikl3MY5089MKv2XOnihdGbWgg7g4jWh2olLAotoe9SjF2gJUfJMqEQplgU4B
	ojIQ==
X-Gm-Message-State: APjAAAXlwsKmuAOZHkb4n3InQkra9AuLkciPnMZ3w5lKYk1xW4GLYgE3
	BktwCbAE3NONrKqWbTYyYsHX6M87
X-Google-Smtp-Source: APXvYqwTLVvYkuspnNEfd5IdQhPQRgDgwnkn04qEzULa7j6o21JG2QnXqdVGjAQ99a1cESfKZOnpCw==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr13610277wrn.155.1579732680228; 
	Wed, 22 Jan 2020 14:38:00 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id e6sm377687wru.44.2020.01.22.14.37.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 14:37:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 23:37:54 +0100
Message-Id: <20200122223754.10942-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python3-pygobject: fix runtime dependency on pkgutils to use python3 variant
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
X-List-Received-Date: Wed, 22 Jan 2020 22:38:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
index f1c46c9319..e06f4dc01d 100644
--- a/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-pygobject_3.34.0.bb
@@ -29,5 +29,5 @@ PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
 EXTRA_OEMESON_append = " -Dpython=python3"
 
 BBCLASSEXTEND = "native"
-RDEPENDS_${PN} = "python-pkgutil"
+RDEPENDS_${PN} = "python3-pkgutil"
 RDEPENDS_${PN}_class-native = ""
-- 
2.20.1



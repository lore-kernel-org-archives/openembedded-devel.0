Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 82F2B7EEAB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:47 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n9so10205066pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9x9aCJXXa79OE1eMSnVJAkzgxanIwypmnA64feJeGHg=;
	b=lqPfJHYso6Yo5L+ZGo3EvhlzHfXQiR6h3S+gZoCYDnvcaUW+sJVfyr2Iz11bpywlCv
	vpjGlCxLEC9gSw5QYpLYCPH4V13KclymCxvasAI+avqHoqPS1+QonI2ny2Na4cdUVmdl
	ukDIU9mh5dJvS2fw+4ilTb/5M6KO6WB3qgDoEH4pZMI4/Ycakdbpp3w+XFBjzNF6Guqn
	XoESuPxsFeENeQk5lT7ZvCuOWqiqcLfxJUsYRY7+5WvKd8yReNJzyF5iieSJmwBpdc9t
	tu09BImBHAP3p8GXHstgx9ohn9oSetHIDcCKAMQdJx3p77UXZ+icAzFUghT0hSh9Y7/E
	2OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9x9aCJXXa79OE1eMSnVJAkzgxanIwypmnA64feJeGHg=;
	b=FWi46j73/HuNL9L90jwQAhDeOddMip6dlezcbLAHgu1j6PQHfwgEA7nWPHMorAMqn9
	kPfpJosQnszFg8vPuXPTDIhWS28vhaYQyW/YHKIgZyBUjGh8O/JRl+zEgA6NxCzKSpRs
	WDTD2rRJeoitD/pt93Dym37Drao1dgPsQ3MDYFs5vbd2OERqKXlLYYrGcWel2iXnbyHZ
	mj3YaHfZ8L6Zt2+FFqKaOpK7qxrkaBzhwRsl2/EjWgvVSdbNcJnNUR3wXKHJXfcjO4TE
	PEOhYd7gN4dMmTt3WPtnqsxLGj7R7guXRudxqodmPIHpqGJ+Jsn5imp1zhifJOi6H12m
	ctpg==
X-Gm-Message-State: APjAAAVuYDKQZ9vMfwhgZ4yhmtgc0W2LK5Sx4h36mmrbawWYYz02rdTg
	3qu+tE5qfo4996Dg6SoSXFgqhFUf
X-Google-Smtp-Source: APXvYqwZn9csfvKr1CVBg7TQAA7K1RmImJ0Py9b5tpkrV8NJT2aWPElb7iJDoZElyiB3HvctSpaPiQ==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr23875747pgr.62.1563720108451; 
	Sun, 21 Jul 2019 07:41:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:36 -0700
Message-Id: <222cafdcd97549f67c98833721b4f8f33607555e.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
Subject: [warrior] 8/8] wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:47 -0000

From: Adrian Bunk <bunk@stusta.de>

This includes deletion of a frequency where transmission
is no longer legal in Japan.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{wireless-regdb_2019.03.01.bb => wireless-regdb_2019.06.03.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.03.01.bb => wireless-regdb_2019.06.03.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
rename to meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
index 7b7de58..ded44b3 100644
--- a/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.03.01.bb
+++ b/meta-networking/recipes-connectivity/wireless-regdb/wireless-regdb_2019.06.03.bb
@@ -5,8 +5,8 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "b5eb2d0cc23f5e495a59405e34ce437f"
-SRC_URI[sha256sum] = "3a4e6f7006599bc5764f86e1e86422710da13ad80e0242147b61c6855ebc915f"
+SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
+SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
 
 inherit bin_package allarch
 
-- 
2.7.4



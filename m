Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 029617E4F8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 20:17:21 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id g69so5509143plb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaUfWImFuGxVWVy3zpTkL65wS3tp6E0ibFLyGwXEteE=;
	b=OXBvXLja+GPilVIKoyPsSvQuHtc+pCCciPZvckxC7K3Ho08tigaGwiiH+mWFTwJf7y
	2gDfQbgbOd9L2mC7/3jUZwX31c4+KL4uXfZXu12ANsOXno+Rpb2do6gldQluJUT7xTxD
	tWM3PYrR5ac0QQcEKK0DAzP9ubEE0pxh/LNOBntorIXX63qIvaS+RbiuTyGaAB2/iZvu
	cfUZzhKfFqbFleHXe1atMi+cxT/lz28LZB5hfti9H0AFFhkoEFLEEDCvZKxGxtZvBeZl
	9YtQMU/4RcbUFV/VAQMzdH/+nvyRRze+4oEP0qWoWVKEi5etoZeITwmq2O3xr5/UU66o
	Rjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AaUfWImFuGxVWVy3zpTkL65wS3tp6E0ibFLyGwXEteE=;
	b=SEv0P6UYRgXE21xaQN1BS9uPfy6Wk5IOa6tEvjlqy/w+nqpb7GingFoM06ILgXnGxU
	R+ftfZbfuz4fyWBYPenzieYfiYwlC7X++vfCpR1rn8efk2g19A9oAG5G//BTAF26JTHm
	0Y7Jw9uML0KX/mL/4RrcRIgMB/QTWeTahdIVsgcjyQse4DOSZMVIRRMl5jvHtyRUOLJx
	9Z48q0Ifjck++3gnuqGTtvAEdtWR2H0TjoVQ6Pkp4v/9LTAa2RDJ+YvMrJEwJ1zsiWXw
	hpA7N+QtMZrS8MCgd6jSdUv+3CUY87M1W0tgcY5nNLr/DBdnHP6ztqBdKY4bE4y5KNfP
	pWNg==
X-Gm-Message-State: APjAAAUajqBNXGi2/bIFmD+ZMOKvR825uM+mPRjHhugGIWNRj/vUuaCg
	KoOCaOf+hyCAZmQgp9fjh7DyGzCA
X-Google-Smtp-Source: APXvYqxK6BohXZ5DQeR/ZBZfrDtvyYy4xPA1By2qrqraqbB/q86zo+OsvmufqnqTWvBvDhFYdjKyZw==
X-Received: by 2002:a17:902:3343:: with SMTP id
	a61mr12561712plc.274.1558815442893; 
	Sat, 25 May 2019 13:17:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8c20:a770:5243:e558])
	by smtp.gmail.com with ESMTPSA id
	i27sm10832553pfk.162.2019.05.25.13.17.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 May 2019 13:17:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 May 2019 13:17:20 -0700
Message-Id: <1558815440-18048-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558815440-18048-1-git-send-email-akuster808@gmail.com>
References: <1558815440-18048-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 2/2] mariadb: update to 5.5.64
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
X-List-Received-Date: Sat, 25 May 2019 20:17:22 -0000

From: Armin Kuster <akuster@mvista.com>

Bug fix only updates:
https://mariadb.com/kb/en/library/mariadb-5564-release-notes/

5.5.64;
CVE-2019-2614
CVE-2019-2627

5.5.63;
CVE-2019-2529

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../mysql/{mariadb-native_5.5.62.bb => mariadb-native_5.5.64.bb}      | 0
 meta-oe/recipes-dbs/mysql/mariadb.inc                                 | 4 ++--
 meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_5.5.64.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb => mariadb-native_5.5.64.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_5.5.64.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.64.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_5.5.64.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 8ca5b2b..4f7784b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,8 +18,8 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://change-cc-to-cc-version.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-SRC_URI[md5sum] = "6375d577e9539b839f44d857e70f82b9"
-SRC_URI[sha256sum] = "56a365af71b8a9ec8bfee0801e2dec95011da8ee7507986ca329be11296411db"
+SRC_URI[md5sum] = "03968ae08cff3038e2420921ef257550"
+SRC_URI[sha256sum] = "c103f3c54741b296980d6be48b221340eebaa97c6bd95a02fd8d530a5df5c343"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb_5.5.64.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_5.5.64.bb
-- 
2.7.4



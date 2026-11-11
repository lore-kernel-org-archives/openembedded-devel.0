Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3641.1794429602715098959
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ji1SX59u;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb681de50eso1235686a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 12:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794429602; x=1795034402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/MIgTbFhy0402EcKQpuIjjhhYvZNZWqYEu0Brl5Xzw=;
        b=ji1SX59u6ovl2qa4/i/l7xJohLtorjql1JXr697OGujFKFoa9cN+U4rAZ6KhA4MHx6
         K78+TVgg3SLVKLxH1hM65Kn+7/3GQsuCGEYhPpZDZI5OkXsZHvSN9EcJF/lv4m0G8sKt
         8ghKh2TOP4MURrbiQaoPDFpD5EWjplSKhonEMEwN0iZrw+/BH8fRD4TFAfCM916WaZja
         ZiSXT0aC9uJinwbHBOAf8RsYUO96XaE5mVThxOifed0X04wUpum14tJplBlETdp0wZxr
         ioXDNDbRdTBuaonE/TYj5CZMnnYO1EZdCslllp+5cFT71m7iY2dJSlmXP4iDDW19crmK
         3RwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794429602; x=1795034402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/MIgTbFhy0402EcKQpuIjjhhYvZNZWqYEu0Brl5Xzw=;
        b=lKFYWZ4lmz9vXRsVx6gQXEAFlWdvg+aWOZrLO25dT81Aacy/QLcre19GELEZlZjnTq
         9r5WMso6GN3IlQfG32OE1NL7P7OFygujGkbCwX2wr7VgBnUoTKRuM9LWcLxL9vicl1Xs
         kpP2EFUJySXw5t8vJVtJdd0YgVuT23N1ocQmX2ooUJk2OK8ODRFrkFC4vEfadfoQlfrS
         Zi1tZLwcv38cU6Rl35a6yuU7Q27WYLj7lquY4dW7H398Yjp2NEjoCIQHJC64fQ6EDVDl
         QxpJworUBwU2BoHs679kJ1H2vKnYnaanCtaG6hm1HIpT0Eh9TBxXy9FdQMnzM41AvjcD
         vQjw==
X-Gm-Message-State: APuU4Z+6OZCy4tue5YhlO9MsA0WAuuKb4cbsw2yQrESB+Iu06p3hHYbk
	DmPDm2ohqJ8sxsBbLS/SFnpMhz7mrp6Ha4Lht9wygEGGxOISldAUC8b02LxbXMN1KDU=
X-Gm-Gg: AYBFou0ZJBP6aokplmKnVv+ka+bi+gRoYbu1eejN1MvDwm2usFsgNnYd6pNyDAp3Om/
	NGR/WyEFfBBMeH2+uhBw6scvYjKoHrvo++avWOAu5Z71ba0cJAv92xru/C74Br44ZYtE4BwWWzK
	lV9ZjRlzoqXFpooaNhtIMwdpgbmaac1s55kHv+9doMz+rIgZTgbtitnLI5UKlJUJPApq/JM7NQX
	iEM3G0zeeSO2FUS9ebibOoYZhpE16amRPKfe5AbB9sPjdbjnvFaZMDrMYLWk4DXR8JWPPNowVsj
	LjpyQVJADOfUBlSq9tNUczPR++dZYJWINn/+P0BWEYJUvq7lFxAmiOIvQP+dX+SMtjx1khDViIw
	NujjSQu3G9R+zMz5juj/N42vXA+b3cQPiDv7u7cnUzcLgEpp3ODIwoTd5l15cFi9v9Nynk4L5cV
	3mKMCLd8j3Pa/IE8KiLZf5QT3zd+nSQ6QiLEEuU8BngYPF4MYAkMeRwdQuvjPbfRZVzhVRUyMbF
	J0/wk5HE4oQgsbK0YdEuF1P8y0BgSjiAsaoqwcAWH5L22LWmdN0Dvv00oT4od3S8S2hNFrkEihr
	fH5sQCVcYbwI2y2Emz4IXVetyqOFVKM45DGZIVLwDRY/vjSiluc+DIy5tmQ0g1U=
X-Received: by 2002:a17:90b:4f45:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3b182ff36acmr3401172a91.47.1794429602020;
        Wed, 11 Nov 2026 12:40:02 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d699b93sm1841011a12.14.2026.11.11.12.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:40:01 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [meta-oe][PATCH 3/3] pg-cron: add recipe
Date: Wed, 11 Nov 2026 20:39:57 +0000
Message-ID: <20261111203957.7-4-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111203957.7-1-bbnpreetsingh@gmail.com>
References: <20261111203957.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 20:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132140
Content-Type: text/plain; charset="utf-8"

pg_cron is a cron-based job scheduler that runs inside PostgreSQL.

Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb           |  1 +
 meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb        | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index ebd66425de..7fba0722b9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -214,6 +214,7 @@ RDEPENDS:packagegroup-meta-oe-dbs = "\
     libdbi \
     lmdb \
     mariadb \
+    pg-cron \
     postgresql \
     psqlodbc \
     rocksdb \
diff --git a/meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb b/meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb
new file mode 100644
index 0000000000..9f9a59b398
--- /dev/null
+++ b/meta-oe/recipes-dbs/pg-cron/pg-cron_1.6.8.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Run periodic jobs in PostgreSQL"
+DESCRIPTION = "pg_cron is a cron-based job scheduler that runs inside \
+PostgreSQL as an extension. Jobs are scheduled from SQL with the usual \
+cron syntax and run by a background worker in the server."
+HOMEPAGE = "https://github.com/citusdata/pg_cron"
+BUGTRACKER = "https://github.com/citusdata/pg_cron/issues"
+LICENSE = "PostgreSQL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b70f68d78dbcc36c5654d795cee59b0d"
+
+SRC_URI = "git://github.com/citusdata/pg_cron.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "2323864075a50f234235f98e567eb958f923b2b3"
+
+inherit pgxs
-- 
2.43.0


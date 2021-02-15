Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.25510.1613351620958143734
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IiKVKUr0;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gb24so2776413pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vVacleoe0D/HpRFLd6Bcn+DLADY+OOrHuDDVyeyxqSc=;
        b=IiKVKUr0tnV9p4sW1gsNj375L/8mGFQQzsu/Q6SvchEVLZILRuOoyMhV4C3li5Gjpc
         v1uScErqR0H9YZLgLAnu6jMDaKGPTwzIQ8B5CrOnv301d3GwOyI+dBHJxKy08PUUFnkH
         u4Gnr/WBVCboci+EXNYgLw5G1NIoGpxLfQXwdKUE/2vUh1uZUm66bqB6AyQP+bhlNw/h
         F+JcrEfw4YttcVDXjMlxQmg35FmDNRX/dkDlJa5Uj8NKzo4eVCnwStSPc/LDqnXIEj4v
         X5Sa1L907+KvKb5sjpUMqVl0/X/YkW5fOlUjsj8TB7dw4m6DDs8h3hpRajzQ+h3h1xNd
         oQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vVacleoe0D/HpRFLd6Bcn+DLADY+OOrHuDDVyeyxqSc=;
        b=i+p9gXfZwHAHbQVr2wys6AtPWFwWRTEKqBjHCNZEtkUxVcLQtqV5U3W/ng56iMct44
         84ph2sgCjShOaFwAe3smCOK/ZbvfVc3TsMaHrqfkAh47XxquO9F8Ks9MvQyuxXMaU+0j
         eeXDwdMISQPqxuJVufjaKUoVFeL+BmC+Q81ZqrVjKm3EWBCKVsCesxQE3h2PQAcMeNJa
         twBfyRCUsaTeR7iLcVd5TlD45xjH8Pi7PEVtHcKr9c0Qqj+bFP4RdfM75v9IhBJccvO0
         Rec1XK7pIz6GHeV1MWlIXWP30K9DWZ1vI1wfOJ5PwtD4JJFitlKfzK6QPYB3Ab9YWEwS
         voDw==
X-Gm-Message-State: AOAM532cJuXuZZ6duHXXSRzJyDJl9U+9DajKG5jjEba+UszOrxXjUTbT
	kG5DvxQUc8Etq7ByBNWKm0ui6WALcDfQ8g==
X-Google-Smtp-Source: ABdhPJy0TZzmtfowMvbpgbGNJZSq72nrDD1COP1Phkr1V5wT9QbKNB3xi34wDZRUMQIxLMjwWedL4w==
X-Received: by 2002:a17:90a:9414:: with SMTP id r20mr13184085pjo.222.1613351620447;
        Sun, 14 Feb 2021 17:13:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:40 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 07/15] mariadb: add package config zstd
Date: Sun, 14 Feb 2021 17:13:21 -0800
Message-Id: <e892991f8d53fe7844607d29b35ecf5bf89d8987.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

Add package config zstd to fix file-rdeps issue when ccache is enabled:

| ERROR: mariadb-10.5.6-r0 do_package_qa: QA Issue:
|  /usr/lib64/plugin/ha_rocksdb.so contained in package mariadb-server
|  requires libzstd.so.1() (64bit), but no providers found in
|  RDEPENDS_mariadb-server? [file-rdeps]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c1ac3cd7d9aa7a00aa82e3caa0124aa0489baafc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index e3ce297618..f6c32270b7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -62,6 +62,7 @@ PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[setupdb] = ", ,,${PN}-setupdb"
+PACKAGECONFIG[zstd] = "-DWITH_ROCKSDB_ZSTD=ON,-DWITH_ROCKSDB_ZSTD=OFF,zstd"
 
 # MariaDB doesn't link properly with gold
 # https://mariadb.atlassian.net/browse/MDEV-5982
-- 
2.17.1


Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3143.1599324980319784922
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MaKmaQKw;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id k15so6304089pfc.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gQpe6EQ44HumVDt0we1PbVCGGCDUSawq9BF4SzDsyRs=;
        b=MaKmaQKwVKRLnGGROMXdWKDaSdVnqJcLTt1o2hWawlN/y4x80S3sWnZn2a16OUp46b
         gsFgzU6FG1DNyPOIeHRz/sgkpF96H+4dJdI1vngte9k1Vvx4PmoXPLVy1s1hqIEud7nH
         hASzDTXGof7OK1FB3GqIhMB9mIWdtWv1RMT8x6VtjuzV2ypuuhUwy9N+EpLpYriMtUB+
         3y2T4jjyZKQjnR+azFpokDOTgOh9Q1Z+WcUE4lZLFdyypJzKrGAuj8ES8Z3SAr3IN7fr
         b1nlAeRrIZxH8hP4BJDkPOPGak9ierL5oNbCZKiwE3L4ubdSf7FLpKl5araE++Mor7q/
         swGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gQpe6EQ44HumVDt0we1PbVCGGCDUSawq9BF4SzDsyRs=;
        b=DhhlpVvo70TJ+ExXTPZhBw8eb51swhTfLu4WmC8104P5JuVj0WRUn8TAEQ/Wb+toyQ
         zQYZm+LbEb/Sv1V8qTzc4Bqp2eR3tO1u/TxTtMA4ciCCtIfMFY3eReJt4cBZu/GPLunt
         F0PI1o4l1ON+t4Yy8OFUAd7wt2xDm57uQJ9twWnviuTlrZZ+vaqhMGQbP3LQPBBtW23R
         haX10c1wn15UOxWeaXBCUrTDg6f1mcYYzJqQKkDDSIY+IVdW5zrocqIOieazsvVwHreP
         EuJuapgqd72FyvUIEu48OJEya2/y55b4ReB5wiqM4tTWjJX0RHtNaPFpLOBnAhXcLois
         vSHA==
X-Gm-Message-State: AOAM532nPjRSZblhKe5tBg48OyWKCMmzdTcVi/8OG875lMbwCmaWLTZf
	R+ZCG4t/M4Mntoc6XqagdpJ2YQHt2Yk=
X-Google-Smtp-Source: ABdhPJxRsQReiKff8PIqaoyuydjGV0m8Y+eCX+OfQ4RHy2q7f1M3sdih8xiLw4MKPNigObi/2lNNwA==
X-Received: by 2002:a63:e015:: with SMTP id e21mr11667025pgh.264.1599324979578;
        Sat, 05 Sep 2020 09:56:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 15/20] python3-pandas: Upgrade 1.0.3 -> 1.0.5
Date: Sat,  5 Sep 2020 09:55:58 -0700
Message-Id: <fd16ab3d6484994eb1e285f0fd34ad3a5de38301.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.0.5:

- Fix regression in read_parquet() when reading from file-like
  objects.
- Fix regression in reading from public S3 buckets.
- Fixed regression in replace() raising an AssertionError when
  replacing values in an extension dtype with values of a
  different dtype

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5dbc25ea9d4bd4b3f9a150d3893a12b41dd456d3)
[ak: fixes build issue on CentOS7: Bug fix only update
https://github.com/pandas-dev/pandas/releases]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
index 099e035e14..d8db4cef39 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
-SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
+SRC_URI[md5sum] = "5183db713194e6fbc96c45f30a0d1311"
+SRC_URI[sha256sum] = "69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8"
 
 inherit pypi setuptools3
 
-- 
2.17.1


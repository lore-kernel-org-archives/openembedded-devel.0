Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.11334.1629036410544600803
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hDt7uc9z;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d17so17821337plr.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8cC49GOgWTRAYC23wB54m2bTe3/9BO8WqHIgUtVpgig=;
        b=hDt7uc9zyOZu0f/jERLGemBSnEKqm/5D2SbOXEXZ/+RBvNvrrRhi9uyc08g1LAEKNN
         JfhvSzQPPXetwiiO0h98YQUuDimAa4c0Psw3WDx97h/Z26SWtSnrnTDost47fR0Ctf7p
         Jt4Rnb4+K0XiXWZLsXZ/zvXPDi2fR+RMJZw+mx7GTTzLFg9BWdJi41V6b7M79Cv9MxJj
         CXuXllA3yddW3wbay2uyeNW3ioCO1LfuqpxrTWvE87qhAsnJimQbwyhsI9P0H2glUvhf
         JyUcbV7KNM7+OwHId/dE8Zz27NwaOP15DvOMB/6apTYDYPURFGjP30xubjGBon5VQsPg
         w0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8cC49GOgWTRAYC23wB54m2bTe3/9BO8WqHIgUtVpgig=;
        b=W5PO+yvsV1Y6z4TzgRiZwerYzqHx2tNEFeF6YiUny53qEnJBpQ3aW59FawYlW0nvLw
         Zn6zPIIwMefpqRQqUPc4vJClUbCQKzZMU1LzOPxyyCYzkygsTeLahfVVH0eYSt8QZq8t
         clW4SASTqlblDTX3sNB7b6x1xEOc0v6QbW83jnDCdQAzbBSo28MeMOTOJptYzI80UF0O
         7aNdysry3AoAlVIngY3SsBmNeJOxc9oCB0Qqzxpxvo4lYZDMM/LgogdPQ720IGKqfvV1
         9bpE7MYPfZwFhinVXb4Gwm5ydEJiPc2TRWFjZ/c8oRzJz5IcvUEwc1MLLYNZ7LVKNtjq
         kzPA==
X-Gm-Message-State: AOAM5312dO8X80hWsY3v2SL1ArNUrJGMW+xxkoESl2ZPKErGNg+Hp1/M
	M8bb+YCtTvZgEREXfU85KKpR060mDDhg9Q==
X-Google-Smtp-Source: ABdhPJzFt63B8p+6b0rwaoHAAdMwsEMZOOpV285TKmlAGewlOtf5o5i5x1lJk0aJIiwcACjGU7XWSw==
X-Received: by 2002:a05:6a00:8c7:b029:3a1:119b:736 with SMTP id s7-20020a056a0008c7b02903a1119b0736mr11859910pfu.52.1629036409989;
        Sun, 15 Aug 2021 07:06:49 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:49 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 11/18] mariadb: redefine log-error item
Date: Sun, 15 Aug 2021 07:06:23 -0700
Message-Id: <56b77e4fe7591580fa9d8335d697652ae11601fe.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

The log-error item which defined in my.cnf is "/var/log/mysqld.err"
previouly and it's not consistent with which created in install_db
service file which will call mysql-systemd-start to create the file
"/var/log/mysqld.log".

And it fails when boot with sysvinit as below:
 $ service mysqld start
 Starting MariaDB.210727 04:05:03 mysqld_safe Logging to '/var/log/mysqld.err'.
 210727 04:05:03 mysqld_safe Starting mariadbd daemon with databases from /var/lib/mysql
 /usr/bin/mysqld_safe_helper: Can't create/write to file '/var/log/mysqld.err' (Errcode: 13 "Permission denied")

So make the log-error item consistent to fix the above failure
and also remove the related workaround when boot with systemd.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1a4144d954692ad68121d16adae09dc990e8ab1f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc    | 5 -----
 meta-oe/recipes-dbs/mysql/mariadb/my.cnf | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 5787ae4bd7..7cf08f4719 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -168,11 +168,6 @@ do_install() {
     sed -i -e 's,@BINDIR@,${bindir},g' -e 's,@PREFIX@,${prefix},g' ${D}${systemd_unitdir}/system/mysqld.service \
                                                                    ${D}${systemd_unitdir}/system/install_db.service
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "f /var/log/mysqld.err 0640 mysql mysql -" \
-            > ${D}${sysconfdir}/tmpfiles.d/99-mysqld.conf
-    fi
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/mysql-systemd-start ${D}${bindir}
     install -d ${D}${datadir}/doc/${PN}
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/my.cnf b/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
index dc4c172e54..75db46a559 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-dbs/mysql/mariadb/my.cnf
@@ -10,7 +10,7 @@ user 						= mysql
 port 						= 3306
 socket 						= /var/lib/mysql/mysql.sock
 pid-file 					= /var/lib/mysql/mysqld.pid
-log-error 					= /var/log/mysqld.err
+log-error 					= /var/log/mysqld.log
 basedir 					= /usr
 datadir 					= /var/lib/mysql
 skip-external-locking
-- 
2.25.1


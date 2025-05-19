Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338A8C3ABC9
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 01:31:10 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.41602.1747618260214926332
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 18:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MvENbEzY;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7b8673ff36so1386505276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747618259; x=1748223059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6X14RdDW8xmGYFze+Lzmhh7C/t8t/Xg9wx6u0oIBc0=;
        b=MvENbEzYU9RkpoMjjMMV4yDscdSnujCd+s6eseugd9vRiLWNmGOTOW2jRoDT2W1hl5
         dOPBYolvP5NxzGJ8FE8zimwpCDEx1G7hlvG9YOUuox80xFgUtkBI7qxHgzIMXqWzFEQu
         m48piD2Iim/Swkdmdjs3pT2QLYfzEGevQFvxoDk9j48eSiVSR9oT7uR/25/HXrKaDOQ9
         WjagJwVBicKVnvR1iA5/LsdTJ6LM5DShcAUAfBROlEIOugEpH6gvucVlXuSIJbzlgNi9
         QE6SApHhxspBeKoVPh//WjgB/+6b7emQb1tLsjyuzymZppAqv8DIEmWRwTGTRKrPfPwV
         wpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747618259; x=1748223059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6X14RdDW8xmGYFze+Lzmhh7C/t8t/Xg9wx6u0oIBc0=;
        b=VH4sZyiP5V6ACg57oinRtSKp3ujjg+1/vP/gvZBP2voBGttmYZ2oBB3iIP2HPTEjCv
         OJufwI7TmTrmj2XPJz29dWD9h8Tc6UVyXO6Ze0CjvQq5QUl8Ihm8HRSVYrdxurq3E8J8
         JnRedJN86DoD/xwMsnAF0ep8YuNw8oaZXlcNU7BnaGGzbLSRsKy8xcZoOh21Mq9JoZ6J
         ZtTT6MEbYawZsMZKf85ymMIRTthyv9/3/hJ+1maScQPcVaKCyWEijM1iOgjpMtySJJeT
         onhsWFKGq2ZdntOstnhvhzqda2j0aN63RRbhdaPfBYsJ+S5JXlw2vlIQuM+mvzcMYaoj
         XGOg==
X-Gm-Message-State: AOJu0YzJru4xF2y3YQWYrI5OX22Wygz4yKFb+8ZN7IMfIjfnMOSBBZVF
	pZZhBytI+oSNC0lK8rSPkjVZYrLDXd7JU5ado8kzHIKfQCg0E+kQ0U3GUPQyuRqJ
X-Gm-Gg: ASbGncv9zKoIwKB1qND/44rcQontveip6WkXi+VO/K29Jw+IkNJpIFxRvWg9gu+5Qng
	JAgjvRcK1t7ij2wdRGjCSuAiEu1EhB1I4uN2VLEOldGxsRI1PMu4o4MefSwNIUx3AuhWM8NUoUv
	s61q9ksMqe+f38s/R7ax2ioz1dz1MJOm00sKDbMFIHnhv6+knpN3cDHKtrKDbYBQb84lTqRKbgD
	KfSu458Dxsx8ghnSe85v+I+GKqBXO4VmRibWl+n0e4t+HgTIxlvBIKCWGS2RJRygxXJd9lvzdJQ
	I5um6CQC+cLs4hHR3Cnb/sh8dzOkexfL2bwdEJjNIFJtK80dUtdWwFGh
X-Google-Smtp-Source: AGHT+IHq7azWYgUR+WY8HVGrBVXUUfRdLgXojQaCxw8Vxk0bVcRVPU4EZFbm7WSmQYDxGJqjVbOEvA==
X-Received: by 2002:a05:6902:138f:b0:e7b:3ebf:f836 with SMTP id 3f1490d57ef6-e7b6a0c1eeamr16762365276.15.1747618258740;
        Sun, 18 May 2025 18:30:58 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6acadf3dsm2368446276.26.2025.05.18.18.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:30:58 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] dbd-mariadb: upgrade 1.23 -> 1.24
Date: Sun, 18 May 2025 21:30:49 -0400
Message-ID: <20250519013049.392560-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117468

 Changes for version 1.24

    * Add a test for large BLOB with parameter
    * Fix Dave Labley's broken e-mail address
    * Stop parsing a column named "limits" as the LIMIT keyword (https://github.com/perl5-dbi/DBD-MariaDB/issues/208)
    * Various test fixes (e.g. no dead loop in t/87async.t, remembering the value of --testauthplugin for repeated Makefile.PL runs, support for the Embedded server, explicit disconnect after testing the connection)
    * Better handling of the Embedded server (e.g. fix mariadb_hostinfo and SQL_SERVER_NAME, no support for async queries and mariadb_max_allowed_packets, extended documentation of mariadb_embedded_options)
    * Add new Makefile.PL option --requireembsup (and a corresponding env variable DBD_MARIADB_REQUIREEMBSUP) to ensure the client library's support for the Embedded server
    * More support and fixes for new MySQL 8 features (mariadb_auto_reconnect for 8.0.24+, SSL options for MySQL 8.3.0+, bind params for 8.3.0+)
    * Documentation of empty versus undefined password
    * Stop calling mariadb_db_reconnect when changing $dbh attributes unless it's really needed
    * On MSWin32, non-socket connections do not use WINAPI HANDLE
    * Fix type (MEDIMUMBLOB -> MEDIUMBLOB)
    * Handle new SSL error messages in tests (https://github.com/perl5-dbi/DBD-MariaDB/issues/209)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../perl/{dbd-mariadb_1.23.bb => dbd-mariadb_1.24.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{dbd-mariadb_1.23.bb => dbd-mariadb_1.24.bb} (86%)

diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
similarity index 86%
rename from meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
rename to meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
index 0eaf2137b6..3b686f7fdc 100644
--- a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.23.bb
+++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
 DEPENDS = "libdbi-perl-native libdev-checklib-perl-native libmysqlclient"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PA/PALI/DBD-MariaDB-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0d0c76c660ddd55570e48f3e2fdea8f621a69ac0ed48190e8cfcafcb5e9b859d"
+SRC_URI[sha256sum] = "f977a25b4116a0a95a7c8a894fd37097abe19af9a6a9ed4d800604ec17873fe4"
 
 RDEPENDS:${PN} = "libdbi-perl"
 
-- 
2.43.0



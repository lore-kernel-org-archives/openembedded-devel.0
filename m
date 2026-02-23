Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F545EA4FAD
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 11:07:25 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32956.1771844839791845565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 03:07:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VzXo67PW;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-794911acb04so40439637b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 03:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771844839; x=1772449639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ad8mI66V2m9u8WPMBsEgP+tkJAbEfoQ+9PihsvoMQ+c=;
        b=VzXo67PWUwpp3JWNTaLnYen36bvyOI8EErzWwTALOhOszwASkMLN9d1wlDXSuUokzL
         yP/FBWDE2HUZolj0P2sK2W35tSI+RQI8Wy5znn6vtBhGDvgkv/gLUfnupjOXCmCNbvZg
         3dP1VjJYcdN0frbgTKNzNkUqW6re0IlGqNOvzelBBawL/vObKPojwd/QaAQ21d/y2T4e
         hEGf+4mf0EXQAx6pYmKbq1hb+T69M/c/0GJl/GACV0aRkLqOAm4vMRzGeOs7HDn8zTZ+
         nOEVKFCjyilnVfo/J+YBrCX5IJ6BQ5n1v/ouRLfVHQ98/1/0qkSzEFMZrYsbZz/AjZlZ
         xrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844839; x=1772449639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad8mI66V2m9u8WPMBsEgP+tkJAbEfoQ+9PihsvoMQ+c=;
        b=NA+/F6wMWv9lPHOToEKPeY6ouQNs7NPLexSUWV4SaRr/T1zFHvYMd0/zRwMmtvshou
         Z/MT27+5LRb8JZ9K76ZzcDf7lc+Lpos3LwBA0OxT/u3REAY+X6PGGCLEOBcq9/I2UWV4
         WuGWPCyEnFBZAvQTQkQZV+ILmRK6bNP2i4zNilMHqCO7XnMSrJSGssSfnwOyuU7bU6L7
         v7SgOr79N6o+IkHlHlQl8OJ7fXML+NaV+AaXV2R3nHrUGa3HG03zEqX5RawJnlesYpiB
         YSLJ05BcAi3VCl0jNe7YpIckQoi0lHP/Ck2ECYJqgrG3Sogxmv2vooUQGGOzh24uRMxK
         Xcfg==
X-Gm-Message-State: AOJu0YysLToqRooTgnl5rjy1PC8KPJQKiwEnmMi4ksuTaHm7GwM0q+aM
	ldupuovsyyix/jTLRNZ2uKchbc954b29/qD00t/M3gXJ4JpWUoDzqqBrrw67wxjo
X-Gm-Gg: ATEYQzzOJ9wT1rZXbgtDuH95NqTmYvjqmVpr3MPMqz7Dlydlyc8X/eLkWm7Z8RzeMeI
	JgnbKo4SBpC1DzY5cbXyNadmrq3LiHk2OZ3okL1T5JHwS7ji9SIamvl0QevDUxcPLqhtbycXWhk
	Cr53LE0po5CE1Vb1stcmKe+nlRA1CgnGwSTmfnAE/IJ44O1HbR5OkH1mEASDMdxDQ9B5XLdP9BX
	V9+nNtQNRXjuJjalLOsPlKzsEGWv2t4SVOZOEjSO5TlMF9Y/EHwXbplizVx1SfoW6J/rCg8ku8G
	shGRU+1B8F+NEegYhoEtsg5vzqBGyTkID0dcgD2tSbgMoKOZBezVYGp1gKR73VZ9IGkttiWb+rb
	9CV41qdSYj31J3R2JL/Rwav7fdc1I4J9FRiDCH8smHWrsLhE3QHXGwqaq9MHU6lLWOuFKWRZtl5
	25K19yKtfpIF1K1nMdBKLDekNNzexNBfGCC6vl3etcE91AsoIkSjE61jh9fMAy55Cgs9ScIM3cf
	fjZaG0K6R+sAFFwkaYEzDbehodHW2FWTyjiarDbO7z8/z0Z+F8=
X-Received: by 2002:a05:690c:6c0c:b0:796:3977:9f28 with SMTP id 00721157ae682-798291405famr68121597b3.51.1771844838441;
        Mon, 23 Feb 2026 03:07:18 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7982dd81e22sm30649947b3.33.2026.02.23.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:07:18 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.501 -> 2.520
Date: Mon, 23 Feb 2026 06:07:09 -0500
Message-ID: <20260223110709.100767-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124546

Changelog: https://github.com/webmin/webmin/releases/tag/2.520
Changelog: https://github.com/webmin/webmin/releases/tag/2.510

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.501.bb => webmin_2.520.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.501.bb => webmin_2.520.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb
index 2c807947e4..16a2ccab56 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.520.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "0f2772a582d4c4cf24085993729cfc94df2a64d619cefede5400c24b02efb08f"
+SRC_URI[sha256sum] = "f73bfff803c8eaf566044fcdcfe5edb150bdeda721ec9daaaafd17a23919f529"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0



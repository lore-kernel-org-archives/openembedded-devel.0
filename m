Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16992D31775
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:01:44 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.26865.1730829699628104882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eptqZm/s;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: flowergom@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f58c68c5so10451872e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730829697; x=1731434497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SokxpQMqdNYUDYKowBEzxiBL61b65UYxwVadkvLWQz8=;
        b=eptqZm/shsreNkvEV6JDjypDNXywNxtjA+QcpfqG5MZX4qPDLhyZ4qCX7EMCkpU0UD
         CzVEaeVZH4dJQq1jWm6mGsttffx7H9YqGs3ZftioTtrf68HnOod5Y1Bg/fLlFHhUe1WF
         Lwha7lzoOtUZ0aPpbl1xbF2chdKWdr7BWuP7cweQMHnjX5V4D2NZlmsMR4oannSYDZk8
         C3u2dlEeBdKBD/kaa3WL0as7QBv+TTrSwwn3iLa8Hp8SR/k1wbT/Wu9OjBFaKSbP3+9O
         Nyucni3wyvglnuY+mk40JCRK9K1ADF2bzAdyNOb8Depf0SlqfTgtq3jisl5NDSvFPRnh
         92ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730829697; x=1731434497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SokxpQMqdNYUDYKowBEzxiBL61b65UYxwVadkvLWQz8=;
        b=XgGLCnwD6bCgUAP/gBGHOE1SYv+PdHMNxr8cdvLeCiBno3Qs7zkG0U7SNdgr7JNfy6
         wqxkRt8Q12JbJZ30E6U3s18g4Ku0G4u7wCspxmNbO5+3C73KJKmRQX3dnABXpZVjWYie
         9F6oFr27p9LkPs9iUp8ha9/ffMzPzJLejpNIWLk13SWQxl9tjBn6uuLccUPhgk3c0F+W
         uyROtZlQgvh3y0J8VsKYqJz/yAsTEylvvVpsKh5JveRpLZcS+890hAABfdksGazwu1UT
         Rtkd8la5Gz91J9JWz8WZcmRR4KKEZFJ2h+CAHQcPIjynK9hpeujOdAXkrUh79wwKXDMD
         Fc6w==
X-Gm-Message-State: AOJu0Yw3MNnHjrkZbmtVqct0exfpvfFrsHeNCReWVhOVySzXfVyWzDOM
	xwX1qNRrOlnHDC3DftWoZvUf5U6I6B8kUAP5SL6R+9a5YSRgzjG7dwIY1H+BKfRWqg==
X-Google-Smtp-Source: AGHT+IG/WgPC2qgAOTFqmJMK1SyA3cVVE1SOJXzhEwoQjhffkTsJt+CycKO1oC2TvgoxXlmCPoztFA==
X-Received: by 2002:a05:6512:32c8:b0:53b:1fea:baa9 with SMTP id 2adb3069b0e04-53d65dca657mr13660955e87.8.1730829697019;
        Tue, 05 Nov 2024 10:01:37 -0800 (PST)
Received: from localhost.localdomain ([146.52.197.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f6087sm166980366b.142.2024.11.05.10.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:01:36 -0800 (PST)
From: flowergom@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Minjae Kim <flowergom@gmail.com>
Subject: [meta-java][PATCH 2/3] xalan-j: update SRC_URI
Date: Tue,  5 Nov 2024 18:01:04 +0000
Message-Id: <20241105180105.4721-3-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241105180105.4721-1-flowergom@gmail.com>
References: <20241105180105.4721-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113512

From: Minjae Kim <flowergom@gmail.com>

The archive URL has changed slightly, add missing /source/.
http://archive.apache.org/dist/xml/xalan-j/source/

Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 5e72a34..d1e56fe 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,7 @@ PR = "r2"
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
 
 SRC_URI = "\
-	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
+	http://archive.apache.org/dist/xml/${BPN}/source/${BPN}_2_7_1-src.tar.gz;name=archive \
 	https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
 	"
 
-- 
2.25.1



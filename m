Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25314C46CD3
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 14:47:28 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.22847.1703083639801501995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 06:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Es9/IPC4;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2340c803c6so474893866b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703083638; x=1703688438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI56oJr9MViQjmc21UeKI8y/fDf3/B8zTWy69rWqQL8=;
        b=Es9/IPC4zsAkbe4OtTmvR8isMsgdyu2f0l/51ad8QRmxU9GYd5N4i0InUZyATNIPZu
         ZzG7bvRqIQetvJN9XL4dh4SZ0fLYWGx/FUu3bAeI6GMOWoXoTl3vSgcmvv6Rp6Op/iLp
         2ljficagLHhnFB0dAzNgdFD6icNV0krK6Kgn+zUpRGlSHyKvI7iDaffN6zUe2+rJF1Eo
         7EGvYenpPicVgdhGyx3+YZjeBMz1Zu+OLuOnwujnQtkPgHy1ZNS/eFrXuP1rPqhVxuX4
         /U6X99H5xqz/irIA31ItD+hocyBgoTxP2TiMR5ukagkegJfZvW8Q9sqTpWLBvOPdEd9J
         ZW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703083638; x=1703688438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sI56oJr9MViQjmc21UeKI8y/fDf3/B8zTWy69rWqQL8=;
        b=k/K7DN8jtSgC7Y0UerP4LlhH4KwHyB6spR43+kyU9zmvmNZiM5GNHJ/o90N+XzHHI3
         nQ2Q6yN5XDl/tqOHMdcpFvoVvJBjomwhXex2YQO7DWO+qRoTD8FOuOeVufocMT5pp3jU
         gP0H7Xmq7jFMx6vpp5eatl6jmVqbviPSbwYyd0qvumXlHaVU5lMNsaeEPzmymEFSqEtD
         iC2z4la3UZq1qohmh2HSBnGMGvN4qEH+Aw73eBUTNn3jFoNMdRExPT+vjSn5fysdGt8W
         XYVt9AGvjm1H4mzT4UipSXqi9GkfVQbkpDb0sGGUCxul4CTmFZxeL0N3fw5JEVDGFLEm
         Vgqg==
X-Gm-Message-State: AOJu0YwRgiAHYgbIkaAHOAmvuf3Ucj43/bSg0ecUf7mnmW4pQ3MGDCd2
	oEwtvwhuaeHTGsVnke95tZDNthh0WHw=
X-Google-Smtp-Source: AGHT+IGOA2nXimaq18jE1GQAazOaLdLFlfU4JDfHTG9sGOTSEF0oK3yDbSUoinwOC+m9Ow+Zm6dhig==
X-Received: by 2002:a17:907:36e:b0:a23:6079:67fa with SMTP id rs14-20020a170907036e00b00a23607967famr2158826ejb.112.1703083638063;
        Wed, 20 Dec 2023 06:47:18 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ah2-20020a1709069ac200b00a23577b265csm3927230ejc.173.2023.12.20.06.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 06:47:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCHv2] poco: fix branch
Date: Wed, 20 Dec 2023 15:47:09 +0100
Message-ID: <20231220144710.438752-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220144710.438752-1-martin.jansa@gmail.com>
References: <20231220144710.438752-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 14:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107659

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix branch again, now it has "poco-" prefix

 meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 51bd5611fb..5fef774576 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.12.4;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://run-ptest \
            "
-SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV = "3572a1fb981672e2cd1d2533ffd836da7db0f414"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0



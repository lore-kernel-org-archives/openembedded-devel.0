Return-Path: <steffen.olsen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DE0ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 15:09:58 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.283.1662476989471521792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Sep 2022 08:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C68lDURe;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: steffen.olsen@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id z23so12680959ljk.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Sep 2022 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=koccWTuqMH5y27cQ0+TZV1nX4pf17KngLYifEWPmWiE=;
        b=C68lDURefxob2PxeA61zDzingF+530RFKzAze7Jj+nba+sE/v60lNLllToQIdoUNWM
         k6MkSNIoiF4pKhRShpg3eLovLyHqyetfvVmp5OsX75+oMpxoasF+68+a96YHA7MkNMie
         M1BMAnLAWlKDbFyfA8PAdy5QkffE+cAJNZHXJs0bplNWwEhcVGumlv9M6fuf3KtZEwSM
         dBZ1CODfI6hZTjgOFTjj6PZ6wQJFwHaqiJe8c46vr7lFaQvA7Kt+BvFVw8XfQB8Y9kh6
         N0dPzcx2sd8YkeYW9jHcmGrCRPWQ/ts5W/cqWQoSuRQOE8WkYEw4nZRXBuuhuHg8rCqM
         0Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=koccWTuqMH5y27cQ0+TZV1nX4pf17KngLYifEWPmWiE=;
        b=YfWHPRwkQmTzyZs9AQ66phQJnOkqZp8N5QKGvsKaRiWWHaA8iGk8AdNE5k2XHCq2Jf
         0I+GcM8Zd5bLkD5Pug4FoGuIkX/ircNNh90WszmH7YVBvWAtV2wDf3I1ihQS2FfL8HIp
         fpQcQK8n5JCX+/vlENNViNFuZK2sVKrExqA10gM2usT0vyrPU5lbb8YByvunkz4UeoMV
         MTxMlZo7qx7DP0LrWxRP18TU0bPiJ16Juk0keKiTOBXbKB2YF2QX0pZCSFpfQnDVnjS3
         82BJ7gn8lBKQKDRmGtK2CzIYFI53lTX0Z0dSddlBFZ42uIbry2FqXmJgPYP3fR8ZJwEi
         Crxg==
X-Gm-Message-State: ACgBeo2gEUT91MBtabkk0kbXHFaBaUH6Dp6dnoJl+cAwXl0su/Eoo7fo
	UE/H8NuKe6L7FrF9sgNcVKMKz28Ry1RNDg==
X-Google-Smtp-Source: 
 AA6agR5hqUQ+8J6JsyMbtGALOhUbFYDGD/5IbtsFA8HZVntSW8OiqZ2a12TEuH5nrMbRGiNm111jkQ==
X-Received: by 2002:a05:651c:154b:b0:268:95fa:7f7a with SMTP id
 y11-20020a05651c154b00b0026895fa7f7amr9254148ljp.237.1662476987219;
        Tue, 06 Sep 2022 08:09:47 -0700 (PDT)
Received: from steffen-desktop.appeartv.lan
 (195-159-183-44.customer.powertech.no. [195.159.183.44])
        by smtp.gmail.com with ESMTPSA id
 d17-20020a2e3311000000b0025e6de76589sm1774473ljc.106.2022.09.06.08.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:09:46 -0700 (PDT)
From: Steffen Olsen <steffen.olsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Steffen Olsen <steffen.olsen@gmail.com>
Subject: [meta-oe][PATCH] postgreql: Fix pg_config not working after
 buildpaths patch
Date: Tue,  6 Sep 2022 17:09:39 +0200
Message-Id: <20220906150939.21426-1-steffen.olsen@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Sep 2022 15:09:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98678

The patch for removing 'QA issues' with pg_config was incomplete, it did not
change the number of items supposed to be in the configdata stucture. This leads to
get_configdata function asserting, and pg_config command does not work

Signed-off-by: Steffen Olsen <steffen.olsen@gmail.com>
---
 .../0001-config_info.c-not-expose-build-info.patch    | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
index 101a74877..52ca276da 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
@@ -30,7 +30,16 @@ diff --git a/src/common/config_info.c b/src/common/config_info.c
 index e72e729..b482c20 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
-@@ -123,74 +123,6 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
+@@ -38,7 +38,7 @@
+ 	int			i = 0;
+ 
+ 	/* Adjust this to match the number of items filled below */
+-	*configdata_len = 23;
++	*configdata_len = 14;
+ 	configdata = (ConfigData *) palloc(*configdata_len * sizeof(ConfigData));
+ 
+ 	configdata[i].name = pstrdup("BINDIR");
+@@ -123,74 +123,6 @@
  	configdata[i].setting = pstrdup(path);
  	i++;
  
-- 
2.17.1



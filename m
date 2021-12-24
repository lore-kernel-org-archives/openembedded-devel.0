Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECC9C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 07:05:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.43056.1640329504585376040
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 23:05:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g78FOUlQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id s1so5447410pga.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Dec 2021 23:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXro5vslH6Qrb5x/qCEQhg9PKqTN1qHgLWIEgU4PM6Y=;
        b=g78FOUlQtuNAKx/EQtcem+9CNxUKpBqbl59iLCef04xUrBCOCj+uXQmcw02m51t7JM
         y74OGabRT7Qcid8M9vLWGpZmjwj4wS8OLdF5P6Dylx0N/Y2Fr1U+QFpUa4CLxntQBycq
         HUgcdXe4FffDdC6LfDmYmAmJEV4vMkp592uKB2sMNrIzDqCuuslTHi1TqLIlmRvne4PJ
         krxc/Lsc5/4/PmdxqXtUEuCrWSixIi04Y/ImrlY+RMWxsc2kaqeBtuU2wXBqvn/R+xrK
         uGXLp1LcELlInPxCtRSMencEh6Uw245jzF8fV+aBFjQpxzWJcgYCdROoAKpHs6kI9f3v
         m3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXro5vslH6Qrb5x/qCEQhg9PKqTN1qHgLWIEgU4PM6Y=;
        b=cW5RCBQ4ulGWi2GKe/+QFCz9ObdMZVXgt/beYgZ2waJgnn8TumnILg6DnHuwkPoWn9
         zxITftxpyZokftbIQKdd0xis2X6Va636dNCcxVq7dXS+iGsaSQiDRxvzwZ7DohUWI7Vs
         OA0dnfhmeVbHtiJ4XkqUi0mrXaUAXIFwrZVRjV1dGBQ36uGubFbY3CLgIpbzPV3wZN8X
         r8T4Hjzn8Mi2kguljah5p75WRAR05E2ZZHjN3uqREAlW4JxAmtZIaOphpkenAwirRaHm
         9QKMzyrBe0jWvV3mAPwGZMFMEY7+vwYhcggm/AouCCQdMBDS5Qo+ytyaDNaEobPVeXx/
         koRg==
X-Gm-Message-State: AOAM531hvDZ+sG9C4G2jDquOHLiFh5JfFYDC5tzcNePNyzV0S1EaNfSu
	d6LTuyVarg02yfxXf0gaaPbeH8M22OX9lQ==
X-Google-Smtp-Source: 
 ABdhPJycAp4OxxErd4NeXEQNeW7ITvC4riSMKupoaRFNeaBIHG+7Dn+nm//g2J01V1h7DrU6Wxz3+g==
X-Received: by 2002:a05:6a00:1a48:b0:4ba:c29a:b4af with SMTP id
 h8-20020a056a001a4800b004bac29ab4afmr5636608pfv.54.1640329503933;
        Thu, 23 Dec 2021 23:05:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2b9d])
        by smtp.gmail.com with ESMTPSA id
 u8sm8319157pfi.147.2021.12.23.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 23:05:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] tvheadend: Disable dvbscan
Date: Thu, 23 Dec 2021 23:05:00 -0800
Message-Id: <20211224070500.2642405-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 07:05:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94491

dvbscan is fetching sources during configure, disable this for now,
if this feature is needed then adding it to SRC_URI would be needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index c97c20f3fc..193055893c 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -23,6 +23,7 @@ EXTRA_OECONF += "--arch=${TARGET_ARCH} \
                  --disable-ffmpeg_static \
                  --disable-libav \
                  --python=python3 \
+                 --disable-dvbscan \
                  "
 
 CLEANBROKEN = "1"
-- 
2.34.1



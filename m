Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686FFC88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 14:37:43 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7764.1789223692862694521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 07:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nkent-net.20251104.gappssmtp.com header.s=20251104 header.b=k/K8+znY;
 spf=none, err=SPF record not found (domain: nkent.net, ip: 209.85.167.50, mailfrom: nate@nkent.net)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b754cc3b6aso2142977e87.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 07:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nkent-net.20251104.gappssmtp.com; s=20251104; t=1789223691; x=1789828491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=byLwPbI5KEYlvbigcWnJ+SjZEpfgjlF+yv3kC8iSNy0=;
        b=k/K8+znYsFjez1nQ/7Mhjvq1OAf1xQnEAerWnS02O0pmtw8P0gXPg+qPFopKuTfgEC
         RwR4OFhac/wAWUTiNDmZ9LOeS3whLhPH95B6Ul0Fv7jJxk9C9vxN2Stc/81FLxsdpL/P
         AobT/doXzrFcUpSZTsY/W4HBg4ziz2W5F0lg2udhJetCsyJkqz4l7Q84dQMo/ailjaF8
         tXj9/mzWMzBj/u2G+C31VXb+JC1TbZzKPdHojs9x5wV44JBg1E0p9bvduwyg6yn743My
         8C8MHrWyd57Gujc8wV6j3PKQyEAZDlrOA1go1BYv+CCq2zGw60ZE0y1v3YQSUyunfDAl
         tc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789223691; x=1789828491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byLwPbI5KEYlvbigcWnJ+SjZEpfgjlF+yv3kC8iSNy0=;
        b=GPPo2QUs2qql44tGGPZaiaYPpQbTYrCjZxF7uStiRyA9/D6lBfBtGZaTrXPX2dur3F
         ErEhUH5VFMAt1EpwPto2rTTvtmF0WOgxeXpgNbrfPjR3KQg+5dY+oDqMRQfhpYTL68lS
         bgomlZlMtgxM/h9yhU3ESQBj5Sd5UoczTx7lSYfAI2wVH5fTE6SepyitXe519eS0LWyj
         PCtJTSnLaf7jVKWAsyGKGAuVsTxAE9atzprNVLflsnss1chIdWS018xy053PkGsoXJx8
         uJLUiwnBVibknzt1yD4uOHA7u8nhytquc5YU99RVlygwbE+C6PkVkWjk1o1wafnV/tiw
         eeVw==
X-Gm-Message-State: AFuF++lUoO2/SJ4pP+k+MVsURYD8tE7w9z7Fh5dmqA2nl852A97OCnMP
	ppIggcDRvQSid5p5W+hHaDmSA54BCQP1eJixeLX1v01p+KbEr2ned1FTusm6gh+pEKOpAasP761
	pk9CK
X-Gm-Gg: AYBFou0RpHzksWkTiB5k6/LfVxW77rzcCI5rH/HWbHfZ2uv+uFv96voES9Wf/d1eo3m
	Af1QpXXHO1nIy/fA36D0JG7dly42zXeufozwDVSCzM8oQRt9W34SW6dpPb+XrVO820SfwyLr9rd
	gxK/mDWR42Ylyl/HBJFRooo553PkA9vUSlWfLolDPk2IS17rGqyu6iSd5O7epmozGOMS6E8c5mg
	VgHiMnzuxWzj1ikh0GiR8tfIXvfbInH71WuSW2C+3KkeRLMEEW33f/vh5Y2uwNpn7bg/vZDEVFd
	T3RX+sa5eoWIQ9b/VOEnhx/+aVmTvtlUDnGG/G94kuzaaYJDUJkiDUySwMeSwYK+OvKyuypHLzP
	SuoO59LUkvws0Y6EsQaBbffqHERxkKSlH0voHL7xVArW5+2aHtZpf/awi2ksKU57A6WpqwFLf2A
	abaVXS/qQatD5eBKo0cxmnpP1G7rYhXMyo/IBRc1uvIYmHcEd9SaRmPL/zdQRk+oWTlgk/HC2d8
	FGtDoASon9UJl8yk6Hyphlh/+qL2g==
X-Received: by 2002:a05:600c:a07:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49e619bd19cmr100237375e9.19.1789223345790;
        Sat, 12 Sep 2026 07:29:05 -0700 (PDT)
Received: from akatosh.telenet.be ([91.90.123.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6aac22bbsm57181965e9.0.2026.09.12.07.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:29:05 -0700 (PDT)
From: Nate Kent <nate@nkent.net>
To: openembedded-devel@lists.openembedded.org
Cc: Nate Kent <nate@nkent.net>
Subject: [meta-networking][PATCH] nanomsg: upgrade 1.2.4 -> 1.2.5
Date: Sat, 12 Sep 2026 16:28:34 +0200
Message-ID: <20260912142834.424512-1-nate@nkent.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129980

Minor security fix for people using IPC transport.

Changelogs:
* https://github.com/nanomsg/nanomsg/releases/tag/1.2.5

Signed-off-by: Nate Kent <nate@nkent.net>
---
 .../nanomsg/{nanomsg_1.2.4.bb => nanomsg_1.2.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.4.bb => nanomsg_1.2.5.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
index 95b81869b5..cfd79487e9 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.4.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master;tag
            file://run-ptest \
           "
 
-SRCREV = "e6d0b8ddfc780eb89f8f6ef305e92c19e76bed6b"
+SRCREV = "85856cb785ba6dd38c5e9757298a54d1bca55580"
 
 inherit cmake pkgconfig ptest
 
-- 
2.55.0



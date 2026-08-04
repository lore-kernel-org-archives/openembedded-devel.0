Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44313C55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24965.1785872419067420122
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sI8YjlAs;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbe3fed2f58so118701a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872418; x=1786477218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APzvHpOF5/0T8R99rTwYNK7qbVuKMeyMVRBZCYecQSY=;
        b=sI8YjlAsHwKMsZiY15S228sampnsCZWk55lxXY9G2stirAq7mmG0x7tAxWp7cu60HJ
         +uYZp7PpyWhs0WUzGkaLXOmEE+gwShVy+SvasWW+P+buvdkWtZWYSmLXQdvyYw4bOxOg
         KvKz4cC0fRd2BFHTt+2fKXwcUrQ7DR7TsKz2LYJ/IrXWExoWr62px9Hxjp6rw9sSZhBt
         b2gaXt8BzNo2QLGrzrtVXFKUwTMfLFJ+cxokvcjhW92BZfsk7SbPVhZsRH3cUWu+cMhT
         sKrygDFnmPhmX7afZPyBBAKNMI6S2NNRBgx4aZ/wB/fc0eXeAij8nOmlPk8ZmAz5SNJT
         zMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872418; x=1786477218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=APzvHpOF5/0T8R99rTwYNK7qbVuKMeyMVRBZCYecQSY=;
        b=AX0j8k5uCKFGsrMGB4rXg134yOOEnNey6cfsmwaf9re8brE3fK45vQYqyKaOaO4qap
         872PHfSpHC1DmVnV5qq1hLEVtDULUo4uxPakuRBP6pba8G5kY2UwgVK+Gxg2DDD7s2Hf
         jtdUnLUHkIp6SCBpptu1j+nhBNZETi+uJQbpcLhfdvO+qr+pPYQ6iCkpYXMvXX8QP1ST
         RKBjNHySr3E8rwYQFRHEjudMXpGJaFPwmBBHU36THSrkD2nKv7TSnjAa5D0sXiIoTc7d
         OpAN5tjXO1w9MeoAGk8SXfFGW21OFkVMKqXqLB+ccomZ6gnU6L1POXs0dVs7FyOAHHF2
         vAAQ==
X-Gm-Message-State: AOJu0YzFbn2OKCGdQrnnBkp9CXA0t1XHRAL/TY36olzrxE4bPQR7KcCg
	dOI94qrrzCSJnDOrjvJeoJRwvyyFsxHMngtzLOCJU9YnKbMEYrX+Ym0jF4vwgJ4g
X-Gm-Gg: AR+sD12J1z+/LX0pET17H21VMhTdtlRmA6kpTpvjfAntBdtLznxUgOisaxQCdkuQDZm
	TYBjRtFq+/0GNtesXizC960aeEJurbwqVEItucuX4cY8qHfzrzIRDOWAWfdYGG4uCp703ZJViQw
	oB0pJ5vhZQ1hiTLpMvxMj4j5OunUt6pb6hO43x8haZTl91Y8+u7boncHuym/8AJNJtsKlHwCiro
	YcYFjK1g7CD2bvYyPomYkHV7Cc1/vC08vXl5pXbF1tOpAQ9XXe+0E16ZXqt+9ZQmExJpAsUfGa7
	rvM5f6/kMHQjWjr/6iLpJpD9KBqqcM8Nn2VX+s/nes355kkLknXMi4J2KZHWvACNPidyVn7pV0i
	ZUX+/G/rqNwxpGm3CQwX2TCJ2H6KaW8YHRQvEOXaaoF07dNFDmLCIIyh7Iz10yKeESfXe/LVpWj
	MxizyWU4f6HDLGDUNooiJlEZ5WOg3cTxijM0XJ4Z624O09J3yM3Y3/eYOD/kelOm7i9tN2nKOY1
	Q==
X-Received: by 2002:a05:6a20:4307:b0:3c3:68b0:e273 with SMTP id adf61e73a8af0-3cb85ea2c70mr826520637.15.1785872418361;
        Tue, 04 Aug 2026 12:40:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 3/36] libiec61850: upgrade 1.6.1 -> 1.6.2
Date: Wed,  5 Aug 2026 07:39:30 +1200
Message-ID: <20260804194003.3158916-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128750

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/mz-automation/libiec61850/releases/tag/v1.6.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libiec61850/{libiec61850_1.6.1.bb => libiec61850_1.6.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.6.1.bb => libiec61850_1.6.2.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
index c46ed88d83..f87bedf649 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.bb
@@ -13,7 +13,7 @@ SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "swig-native python3"
-SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
+SRCREV = "f0f797bf955da763353f7081c892a1ff6b55e5a1"
 
 SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
            file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \


Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE0EC433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:42 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.11852.1639668221159086462
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lMPwcM9M;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id mj19so5892836pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5lMQwvMaVi6o9sak7dW383O3PYj+I3wSR5fTAZ6LMU4=;
        b=lMPwcM9M4tUCmDmHzJnurIGZ+MRn4Pg9jOfhq4T4DlIZNpCgcuKf8NGBTXxGjeTuhn
         uDPANMWNk2ZB4jYJA0CxQL55amT4VkVgAJ/0iaml3+YeUylnvjY3fwlb3OagjAX4m05h
         IhJgbK3AIwdEMjdDZz5zUbfaAYzyYlA3SwrOh1rNjL7vkolu10kwUrTONzri0HwNHIiD
         9hrm1RCBjsr34VJXTop9NCi5k7c2Hyj8b+/oMHSPur7jse0ZwnPxzC8hZVddcIk2uAw2
         5vU1zHtYamsuhAAMAxAfvwzJNRBbKhWew25MVhHyInxCo1qmx4+Pbvrbn2woXT7A9uMK
         kLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5lMQwvMaVi6o9sak7dW383O3PYj+I3wSR5fTAZ6LMU4=;
        b=BSp0JkBm3qrwIG1ylktHySEcDfCEXMQF4NV4a7BO1nAzTnVhnInOkFAWCr8pQhD4n0
         hDngOXggC1WyAbNF8cFBEXV8hmVY0shI2rk/0ZzepAosDzbNyDCmpVlMQbITdVzZhMsd
         c3/pf6mTbuJOH1CRxDwqpx5SncFrFss2jNOxSRfJRFmyT/7Yfeb4YjVjATQ35m8Yvey0
         vIr5bbzixG93j88Fe+vgORyE7bpykHgGqTsSXY0W8PG0iB96tZQPVR+H1P5vuy1kIYUm
         O8vkYR2O3YCyaZvfzSdDXBRvVDwUN0k///G2E5We+2dL0Al54Gm4xxsGI6jjdpgzP9QU
         BeOA==
X-Gm-Message-State: AOAM531eoRuoHFUMpHz3pCuhOkqOx7etapCCTktc88EbgS6ggulJzD0M
	qf2A43tpZrl7v2Nni2kMiPoaLqxljOY=
X-Google-Smtp-Source: 
 ABdhPJwgcmm2tqZrTUlUhmskCl50BUelYHW7iZtUNT26QvGAZ1fEnzjE8Cd2Ypxad01hCCo8Xq+SKw==
X-Received: by 2002:a17:902:c412:b0:141:f710:2a94 with SMTP id
 k18-20020a170902c41200b00141f7102a94mr16748508plk.1.1639668220557;
        Thu, 16 Dec 2021 07:23:40 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 16/18] python3-posix-ipc: remove spurious dependencies
Date: Thu, 16 Dec 2021 07:23:21 -0800
Message-Id: 
 <8b5bfb2e008ec58a1d9354e6c16c20f0fce0b13b.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94401

From: Ross Burton <ross@burtonini.com>

pip isn't needed to build, and adding the empty string to RDEPENDS is
most certainly meaningless.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 57ae325941d3a71eaeeca107ecef69d664a3f710)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-posix-ipc_1.0.5.bb | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
index c46881cd47..d66ef0e3c4 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.0.5.bb
@@ -13,13 +13,3 @@ SRC_URI[md5sum] = "8c9443859492ecf3aae9182aa6b5c78c"
 SRC_URI[sha256sum] = "6cddb1ce2cf4aae383f2a0079c26c69bee257fe2720f372201ef047f8ceb8b97"
 
 inherit setuptools3 pypi
-
-# DEPENDS_default: python-pip
-
-DEPENDS += " \
-        ${PYTHON_PN}-pip \
-        "
-
-# RDEPENDS:default:
-RDEPENDS:${PN} += " \
-        "
-- 
2.25.1



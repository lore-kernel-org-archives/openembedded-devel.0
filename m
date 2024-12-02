Return-Path: <ghislain.mange@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C63D7830C
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 10:59:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.170705.1733137166851436067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 02:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tXSh83qv;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: ghislain.mange@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ed7f6605so583655f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 02:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1733137165; x=1733741965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdhb9tFv382+pi/aAG8ebNQ2Wf5MY/SyQzD5+yqwdI8=;
        b=tXSh83qvUfgBQIhipJTZvUL8tyjg5bHXmcbRggha4L6HMslEAGkrgO+whLAly4ejV8
         2ROJ0ffo2XPhyKOOXncChh1YuKSrRVlqPNsqzrp7JhNaFJpoVGgkIsqmla4OiBS29dvB
         C7JOlY2fNlbiNCmR6cdQUUDs0avXtrx4EktXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137165; x=1733741965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdhb9tFv382+pi/aAG8ebNQ2Wf5MY/SyQzD5+yqwdI8=;
        b=XD0Wg8mYor7S7ucEMgL3AB2aLalrSEGmyQ7yWP0xo3nKw/XE3qF4QWWyD/UYGkIeXf
         H2qQ36RonV+kANojjL7La/C2x7Q/3+0yCE2C6pDPUVfzwXx854RUu/oB0sZXuTxC3UZx
         HkKD4vMSYJNoHDqEt8FFI3bjl1NJa6nBhciD5o8SjPX2yvrwLODzuyAfbWgyZEPG3tCq
         iJP+q8Vt/pVHeuKO4nEl/TgvZKJNx7YPwEJUhPi4IBHAMq1k2yxMnx8mNQVhoa0E1bUH
         Wo8OrMo8CZC31av4NAxFXLZbDobvRc8w1OBDNF6AOyusaOdcVkCbaKvx1/R61ZQUIKNn
         0gDA==
X-Gm-Message-State: AOJu0YwQgsPQdWb/cMQzAdjwNILAJbZwhpekOnGuTIJ/huY8koiwMOxE
	Q8BU/sL2A8ia+NvH7+c8oflKjUMP5Xvy30qbylF576IwKymULWjxKcXpVpTMNSfrFEYZHZpz3yO
	d
X-Gm-Gg: ASbGncv6a8ghIZhQlbOYWfRlUqQTfKX81Pf+JAJ3d7QXeiGptNl4+EVmWR6gR4XdtmK
	YYuqaSisavswQCAGL+yyzy/g+DDSEndbn+NXJ4upUSbCCWQqdoP2K3eQuzY3Y7UJecLpAJrKJzj
	rpScPRrYmYMgItjIBncLAfneqzy+U3YRvvnax6w46RpCSwbdeIHPaFmGW5nUlXXWX16TNwktQYg
	+DlXlIzSJVsvsw3/QyAO2Uos2P1DDZIDPlTInIAGMpDb2gHP63xW0RRIsYdtEkRbX3Zql2sJWbn
	/glZDZN5mGhPp9Rk+LZW+MCnxAqKFlT9YBJp3Jl7af3+1Hg3/sus8ysNaA==
X-Google-Smtp-Source: AGHT+IGxH6ALc308cKFp2zJfkqvQ6F8ojhlvmoN90J4rDHpYkVKI9I4VknpgzPRjL4Jb0UwoDXSC6Q==
X-Received: by 2002:a05:6000:18ae:b0:385:ef2f:9282 with SMTP id ffacd0b85a97d-385ef2f97f4mr3846896f8f.5.1733137165282;
        Mon, 02 Dec 2024 02:59:25 -0800 (PST)
Received: from FRSMI24-FULL.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e32ee381sm7185282f8f.76.2024.12.02.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:59:25 -0800 (PST)
From: ghislain.mange@smile.fr
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH 2/2] wireshark: use inherit_defer for conditional cases
Date: Mon,  2 Dec 2024 11:58:47 +0100
Message-Id: <20241202105847.118348-2-ghislain.mange@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202105847.118348-1-ghislain.mange@smile.fr>
References: <20241202105847.118348-1-ghislain.mange@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 10:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114137

From: Ghislain Mangé <ghislain.mange@smile.fr>

Conditionnal inherit may be missed when PACKAGECONFIG qt5 is activated
after this inherit, eg in .bbappend. see patch [0]

[0]: https://lists.openembedded.org/g/bitbake-devel/message/16815

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index be342c73b..0109fe6d2 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 # these next two options require addional layers
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON -DUSE_qt6=OFF, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.34.1



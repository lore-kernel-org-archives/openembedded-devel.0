Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAC1E7719D
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:06 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.48443.1736119442509255158
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IlUpInu2;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e3983426f80so18816076276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119441; x=1736724241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HowMzID34hgb1UCyDHViLl3S26kmtrY5xwfXP9j8EM=;
        b=IlUpInu2Qss/5FWL5K1yuNe8yWTHq4JVgwUdsgfx05nz93sT+2TIp+pd/5rAy8Hxct
         ShbbZiku0Z0ZtJIraY1/tZZs5cOqmNwds1upDZhkCfgEfI+A8NvMggi0skejHxc/t8Sc
         HesBlBFxnu99q5I+Ktzv8cTOyimtJdq5yzO64ovnQXw/z8KBWS1j1F8yk9k1PYStckc1
         Uc/4mQiVscuF0udjys1lxfSBcKl8ziYSdvmJnsgMO4d4UtdWmaDrXogVT63CSCHZMC+z
         NfrNApFNC6i6vwzNAHMSHUKU/InrimR/8Ju24+1+uGcvuA7KAg3N6CnLVyDwsam8fEi3
         u4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119441; x=1736724241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HowMzID34hgb1UCyDHViLl3S26kmtrY5xwfXP9j8EM=;
        b=ZmmUeAaxHyJDLdSifOOal6qhaCdd1D8T1VB5bpb8JFjWIL2R3a9pvXs82jf4rc3w97
         kuFhODha4JipQc9fdZj6tuYsTA5upYRso4tZNGynzjX5hbAYdddzjFM8VNLiBdGulo/M
         Bm+iSW8tGO1DqoTKVKorVA9RUGeUGXqPpsjuyPJ5FPkEU4M8P9pqiF8sR1VC2+7vQHMU
         AIO3xnzIT1y6oIw8d+R7vph1NwW0xnfnyoLKWRrEuH92+i2g/p2iM4YGT1M1CuNdvLKc
         1mRBUAjQaWaOmNFEYHBUsUeliwaiQZU2u0iENklQilwEElr8DKMHTvbycG02x/cBj8tc
         CcOw==
X-Gm-Message-State: AOJu0Yzo5M+h8MowdIVwPHN6oSwhIcwWAUpYERz+ZY5fAmH8JPu3VAu2
	8w5xW1YXcdeM66JPYofdvdTakOY6Za7lfgVe+SjXknw4ItTjnt6oIqS+FMcf
X-Gm-Gg: ASbGnctc8+NEVFvUxXVZKqLRQ1GUsG1YmA6+lMVjQd1nCwpP3+IFceur/yiQWjbHw27
	QKxfzjjS6bjrIg5UB346H4SFcOgYoGnbqaTkiHPXuOuSgr+yxioOhbgeDTOnUgn02h5Y7M/Skj7
	/NK8mDyRJcBy/FdhISAF0qJL4XepY+ruWrNALJ87BXFKEjYlfVZEVUWimQ5uzCc3Ctex9eiCgnm
	2NSEt4pwICAOigHJDKBkQ9WPw80eSbZ0HrlH/KN2SNlndlQkPWgam9LFwm/8S5rYJEsMg==
X-Google-Smtp-Source: AGHT+IF4OnT/OggnQ7j8XwbONqSity1Z1ZCN2vFuhoa1ZiHkkVIUCSBqYiolui75UVaAy4B0vi90uw==
X-Received: by 2002:a05:6902:11cf:b0:e46:e18:9e83 with SMTP id 3f1490d57ef6-e538c34f3ccmr39509773276.39.1736119441507;
        Sun, 05 Jan 2025 15:24:01 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ghislain=20Mang=C3=A9?= <ghislain.mange@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 05/24] wireshark: use inherit_defer for conditional cases
Date: Sun,  5 Jan 2025 18:23:38 -0500
Message-ID: <20250105232358.1502946-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114635

From: Ghislain Mangé <ghislain.mange@smile.fr>

Conditionnal inherit may be missed when PACKAGECONFIG qt5 is activated
after this inherit, eg in .bbappend. see patch [0]

[0]: https://lists.openembedded.org/g/bitbake-devel/message/16815

Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Ghislain Mangé <ghislain.mange@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97318e27ebf9f528acf77fb0759c332bd83adb4b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
index 3fa293d0cd..9c93fd026c 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG[nghttp2] = "-DENABLE_NGHTTP2=ON,-DENABLE_NGHTTP2=OFF, nghttp2"
 # these next two options require addional layers
 PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON -DBUILD_wireshark=ON, -DENABLE_QT5=OFF -DBUILD_wireshark=OFF, qttools-native qtmultimedia qtsvg"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 
 EXTRA_OECMAKE += "-DENABLE_NETLINK=ON \
                   -DBUILD_mmdbresolve=OFF \
-- 
2.43.0



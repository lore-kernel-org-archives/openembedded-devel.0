Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74897CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:59:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.17243.1760450351474753290
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h/6Ca3g8;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so43447575e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760450350; x=1761055150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y19YFDHLirgN7S0KvDqiJ+oXpX51IbDc0rIIb28Pmps=;
        b=h/6Ca3g88pUKrM0gL0SVxW8l9wSh5vZqwR0b3yK8s86ChZZMFPxTkFMnvB2IFowRIg
         +XwVeTA/t5rUxjSqBG4FaUi01jzXSjXoyoOMUG84ItRMf7DQeHq0ez42GUy2LwLRMY4O
         sppdLSxAezm+4gqmFul1s2RzVgvg9w4oVP9/4eDAcP65JTyaTk47HZkfVqW8XdvtkdE5
         0ugfvmhsDLCq7ttQkJTMKQOczSy1VryPTdqtXs+i+xIYw7WNi8HOX++o9rG1/3ZZb5fR
         7BQSXPkDJ7oZOOSVolVnMjx0JN7IAQEcdib6FaPzQu/pM5N3MAmUZXj/awSZUP/qrQM4
         8QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450350; x=1761055150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y19YFDHLirgN7S0KvDqiJ+oXpX51IbDc0rIIb28Pmps=;
        b=pcv/k/7L7C9dbI6yrs2SAVJA7dVEFJ/nfjZXuE5sNBicRW1h4I50u9QJay4Z4cF3VF
         qKmAMFttnHh425Qyy7enoXR2kFx7ZbeCdRi1UrGrqBb+bSp8/7ZTSvk/1P27czW8m5N2
         5lnIbx778IyLPa7Kj8gOiOhEKEOTNOQd/JMM4SwRpDBRkBb37xKFjGEuCOZpSaMnQP68
         XTYcmbRBFMkOBNVxMBuI3yl3QSuGmUOY7wneVu6AK/e3nXCIp+78gyMkEZW5/0DIvMM5
         g6NFwqh6/Wn3Lw9txDBtUaTKTgFDG66B9fY9w5a50F6FM/e8S1CNAAal9IyqSEnlE8OW
         0TPg==
X-Gm-Message-State: AOJu0Yzy8OXLXxl01DjkgISvZbbPZXIYTaGn3ujbwkfm7lYbsjOTvtAI
	b3D89q3iK7xF0dixivwR0GGCt+2kyyy1vv9XamqC7SO6KDsPBJNFRlYyPttlfg==
X-Gm-Gg: ASbGncv4L8K0E5N7jerceRlv9WHNTFAlKHTaK5fzkdZQzBMYX5cjzvmgo8+70R6/aBC
	P+qIiTmia0C6mrA1iRIavIamggqV+J0UclDtaXlt/m4kWNgIC7EK3m1jvieRUBdjkP3gKa8FV6s
	m6WWzF7FYiBkUEEZm3pWsDum5UQl/uy1JakofJR97x2aZvK9nAe0oXZeZ2E593VAUJU29RB8ykY
	/L5Ol5ywX41XG5UY+kxizgHbkdv1EesRy5T3twilYJdasf5UY9Jvitq32+a8M1DXLxnLJdbnup4
	ogXBqwXQcNgUHa/PH1kiAIVmvJpRpdDMbItzSbvqTDhddNOCDD4U2j91J/batRBWB0VRQlxVRgt
	ZXrNcLe9buTSAmUth23cGRXGZ/Yk9KW5/2Mgsfj8=
X-Google-Smtp-Source: AGHT+IFVwwkQOAI4nvUutL2NTURr9PPN6T8O+M2z03B5fnvjbIiYKtfjcFEzZQRPqC8hdJrwK8lklA==
X-Received: by 2002:a05:600c:8718:b0:46e:731b:db0f with SMTP id 5b1f17b1804b1-46fa9b08f09mr191971845e9.28.1760450349560;
        Tue, 14 Oct 2025 06:59:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f2f72e18sm2537710f8f.0.2025.10.14.06.59.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:59:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH] apache2: ignore CVE-2025-3891
Date: Tue, 14 Oct 2025 15:59:08 +0200
Message-ID: <20251014135908.1055606-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120610

The vulnerability was reported against mod_auth_openidc, which module
is a 3rd party one, and not part of the apache2 source distribution.

The affected module is not part of the meta-oe universe currently,
so ignore the CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index c05304f96a..be827b6407 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -36,6 +36,8 @@ inherit autotools update-rc.d pkgconfig systemd update-alternatives
 DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
+# cpe-incorrect: The CVE is for a 3rd party module, which is not part of the Apache source distribution
+CVE_CHECK_IGNORE += "CVE-2025-3891"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 


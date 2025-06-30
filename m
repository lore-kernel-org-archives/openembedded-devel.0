Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9E4C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 08:28:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.34676.1751272093949117407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 01:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AH7NuLqS;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2008407f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1751272092; x=1751876892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6m8MFGRmiDdY48iNcDDijUJ8FVg7RmhH2gh0LUmuUKU=;
        b=AH7NuLqSgyIrX6r+16DFsJdDkUdspnmYdcuJ0flAK7GfM/Fh7+a+F6Pl6sZmU6EXQ1
         RsyLtps+Ueb2HCYn6G4A/WcszOhKdCmyq6tlVJlM1Wo2jNtY+AX/wDXytRj1B5YUJ/Iw
         tiSsI6SPbn9UJ3wP6CbLaz3l9GLf95TPf2Ncc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272092; x=1751876892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m8MFGRmiDdY48iNcDDijUJ8FVg7RmhH2gh0LUmuUKU=;
        b=f9bXKDXvdQwJ5X81EnMwXNnLpgHoxk65BG3xYOypzku5cVjPZX0BAM2vW6PA6ja7AO
         aVqJPrdeKWBnL+D7l7lcIEWitiAjt7yUvxfaoLq5ICvUrf+S7/1cKgmhP4kyLxW0k0Ln
         DEb2BfzSE2GF0msI5DsBISDHD/FUROo/9dRr8nGLldInqhlwdC3O4Mf8iVshD+ewUIbb
         R3p3a3j0AvqEYGL7VICpS0Voq/2Q+12OM8Ekvqblcx3xfrSmDlNPmuWrgs7eQGJDa5Jf
         Z4GfvT+W87u7YLqnUvgG+GTwBthP7ZN9LjhXNtLzcA6kyeigvEt5UUiyRuLWxIxw0+BI
         OqZQ==
X-Gm-Message-State: AOJu0Yxtsufn14b7wxvQ4dxWvaQLdrdtFhbqWgi5JJ0GuJO1nBC/OuXZ
	Pf97to9LOtLV+5aorDcnvnbZE1dqW18d2zVPy+k8L+8Rgbprn4x99XomJgzFVEQE4SkpW5qAUc8
	0jG1X
X-Gm-Gg: ASbGncvPNd2GQWP0HnB/Uw/MZa+bjbhqSYdbPLKHe3WsenZsnDmtmywntyKYluz7ZzJ
	CR8sFA2ow7Xqa/PZ7oNN+iSHn3hiZ8tGW3YrgCCPwJwkYflFomPzR7K6KmEsLbClVR0JLDDQiUr
	lYoK999G3mrJYfukOeAagd91bn5+jLGfPHBkVhr4/CH80ST5dVtVU4l+TCk8iy/HQYXHb7v7V/O
	n9nVr9hV46FG9xeAfk8IKmAJHpUwcTZOp13XgejQv9jiHpRjrYftIZt3Qsvj1pyzAEBz6tpTneB
	abpRH0+7Ec+L8wxmvhdJR6UB6YSy0WsuGSnP82e9crKncWGUN+YVoE4O2Vr/ARBzMcVU99eFbSz
	7D7EDrTi8WqP/FtEnqxO/OOJGMavPhZYYTOaw28d4edKix25/bURcoIMMwIz0zzv7ucVxSA==
X-Google-Smtp-Source: AGHT+IFe0iwfEr6Tc0+Oa3lCXohdef/MR+fZLMFuDQlXFgA8mEFFtvNzGilLvCoF044ALuXpALG2Dw==
X-Received: by 2002:adf:9ccf:0:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3a8ffcc9e23mr6975977f8f.34.1751272091837;
        Mon, 30 Jun 2025 01:28:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0090447d8a8ceab4b7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9044:7d8a:8cea:b4b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7ec6aesm9706815f8f.5.2025.06.30.01.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:28:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] boinc-client: fix hostname reproducibility
Date: Mon, 30 Jun 2025 10:27:17 +0200
Message-Id: <20250630082717.579624-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 08:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118167

From: Yoann Congal <yoann.congal@smile.fr>

The generated svn_version.h contains the hostname which makes it
non-reproducible. Fix this by removing the hostname from the file.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index b2cfd9b874..3e626f32d9 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -77,7 +77,10 @@ do_install:prepend() {
 }
 
 do_install:append() {
-	sed -i -e 's#${S}##g' ${D}${includedir}/boinc/svn_version.h
+	# By default, the SVN_VERSION definition looks like:
+	#define SVN_VERSION "$SHA1 [https://github.com/BOINC/boinc] ($HOSTNAME:$S [client_release/7/7.20]) [Server-Release: server_release/1.1/1.1.0]"
+	# ... remove HOSTNAME and S to make it reproducible.
+	sed -i -e '/^#define SVN_VERSION /s#(\S*:\S* \[#([#g' ${D}${includedir}/boinc/svn_version.h
 }
 
 SYSTEMD_SERVICE:${PN} = "boinc-client.service"


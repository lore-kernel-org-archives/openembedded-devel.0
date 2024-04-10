Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9458ECD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 12:57:48 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.166193.1712753862761930847
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 05:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=SIxZhE+H;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51d05c50b2so434983166b.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1712753861; x=1713358661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biiodm1UX/ohCn1yg3iBi9rim0hXi7BODruZewxajYQ=;
        b=SIxZhE+HDAU8N1pL/uZcc+xscVpy8XFQU0rG0EG4ERmupTpvC6WeLR65FhTT4dTZe4
         SvkE+VguX7UFbudtE9h4qVkS99I0TDdxt+/VDmdEhlEtusue8C/amPu+ZDHaVI6ccnk3
         5fkf2QtDOei6q0pPjrCSUimXQcDCtjSZWOPFzEaX2hsI6t9QIok39HUwE6m0AZdodyij
         fsFsfQ3Wh3Z51drwxOww2XJI4T6bUiIHpJdu+6gaTSNwY7bN7+6tVkotqS+x6EgO2xwJ
         1pj++ixdNCxBxyeMsGmSh9GsWJAbLVy/2xz3a95A8TGpfQDwswtrfeTRknHgjJQCrpUE
         Zd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753861; x=1713358661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biiodm1UX/ohCn1yg3iBi9rim0hXi7BODruZewxajYQ=;
        b=f2ntIV7JHeMf+zGooPrdSZdJaoNbhalxOKycMUJBw2zN02Icbkhr5v5nzDsdTesSDS
         IIhqvmXzBg0zuSHHUVoHsvzJuqbsLDADP842con3EKNc1qF0uQKZTS7FmD3AmOH4wuUb
         ugIZvhkSAUA6N03CN1EapWcJPvc/MAA0R3R+BIP6lELvFuaBVg4KCYEPBAjjSSobmEqJ
         oAevPz6d45PXhiJ27IgxqlOxloPalUb2ouu2ozRDm61zykj9KYcXn3itxWiL1P9ZYcVT
         uI491pMJta0Hxcmm1vvWZukgtM7zaRcfZ+/3gpYZOG5fbQsfpJ75vgcOjyIvGxSwCfN5
         Mywg==
X-Gm-Message-State: AOJu0Yx44MDWU1Umd+4z9qQR3KWyEiYMnxecTVubxumv1cqsWHhP5nW/
	GAuXDPAms899NxVM3ZZ4NcboAQOO9ssMe5MLDYlR7a+Kgrvhgm0c2Wafl9BzQV2siMbQyYexFwX
	M
X-Google-Smtp-Source: AGHT+IGr4pjH8OU/zvVsWs5Py9UmFF9CjFgExM8pYUDIH1huw9p+h5VJfV8DYs3ULrtC/cIgrGyJ7A==
X-Received: by 2002:a17:906:110e:b0:a51:ab38:7477 with SMTP id h14-20020a170906110e00b00a51ab387477mr1396528eja.43.1712753861229;
        Wed, 10 Apr 2024 05:57:41 -0700 (PDT)
Received: from localhost.localdomain ([62.72.77.226])
        by smtp.gmail.com with ESMTPSA id ck20-20020a170906c45400b00a4e23400982sm6951573ejb.95.2024.04.10.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:57:41 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] dash: Update CVE-2024-21485 status
Date: Wed, 10 Apr 2024 14:57:34 +0200
Message-ID: <20240410125734.41558-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410125734.41558-1-ninette@thehoodiefirm.com>
References: <20240410125734.41558-1-ninette@thehoodiefirm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 12:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109892

The recipe used in the meta-openembedded is a different dash package compared to the one which has the CVE issue.
Package used in meta-openembedded: https://git.kernel.org/pub/scm/utils/dash/dash.git
Package with CVE issue: https://github.com/plotly/dash

No action required. This issue can be removed from the CVE list.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.12.bb b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
index 947ef702d..ad3c75e97 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.12.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.12.bb
@@ -10,6 +10,8 @@ inherit autotools update-alternatives
 SRC_URI = "http://gondor.apana.org.au/~herbert/${BPN}/files/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
 
+CVE_STATUS[CVE-2024-21485] = "cpe-incorrect: The recipe used in the meta-openembedded is a different dash package compared to the one which has the CVE issue."
+
 EXTRA_OECONF += "--bindir=${base_bindir}"
 
 ALTERNATIVE:${PN} = "sh"
-- 
2.44.0



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688CFD35E54
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.27856.1730831917550483437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PeEiJwV1;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e29267b4dc4so4787019276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831916; x=1731436716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMRWxm4SDLsSYn/BbwDwAylCNzMdXgnAuAuc15Kkmq0=;
        b=PeEiJwV1ikUUusDGKeB1yDZ1iExQPMb9MbXMC9WZLZEAsDFtEBzEHHsoG5NC7sEgxJ
         9UQN1xJHVGo9fuTfu6DkCax/6068kfyrlJROpSZKX//FOY1HME/MMIiYhKoCVXg2Eb6D
         AwOZJn8bmNnRGWkCNSzADxgteP6NHD5vlCIbtXUSTlt6BXiVB9LwgndR3Eq+MRBq25S5
         cnthoXrYeERLykY1B7tWt8KdwztbffuGjdiGfcJwSCb/IawgtFxH50dq5AQcSEBMiHE9
         +SvasPPWvJjS0Tq1zSsVKbSKRGnNelOjAn2hnuNY5DBZoFjW6UHgZ0sUxQ0lkxRQvICV
         NLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831916; x=1731436716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMRWxm4SDLsSYn/BbwDwAylCNzMdXgnAuAuc15Kkmq0=;
        b=Bh7buZMICK6LvXwS1aUkVHkPCc9RCtnfTMYE8+5CmLtDW8NgGv4Ergw556uSPLM2Jn
         scIveRGvcQLUcLwJizN6or2ieqUusmjbhuzcIRDd1CYDYoZh953DHT+hFc46BktGnuj1
         p97c7m+nzKgvk1pYB8rp8rgE/WweWwr0yY0yxkPCBttymawjyct8g0UnpPRODClsfppe
         jF35RkMfEUhZbKwKXAkN6a2i/+25xzNmzu+egQX8kb/8Mpy9Tcjkk2x2aKKE6d0CEzkm
         X2RnbmfN6qBs8Hp9yxW7VRpLaBwXfcVsAMuVd0r7kmqPoJV/+g1nwoJzgREUrnLvsEyu
         19sg==
X-Gm-Message-State: AOJu0YxCTW1lZ3vub0YYOzMTUVF2ZUBMmZZXO9auW35JAsnpeozzRe5N
	TlT3plcIugewEPA+SAr82LoGhBH+XgdCqrWsyraNfntpUs7TMiYE3+cW4sLD
X-Google-Smtp-Source: AGHT+IGiWLfsiW3Z0Zv+TaRVGvzv8ikZp0n2kszx9GjNT37weFUt7sbJksorqWFT8EK6DU8fn+hGeg==
X-Received: by 2002:a05:690c:3709:b0:6de:2ae:811f with SMTP id 00721157ae682-6ea64bf4929mr177675247b3.35.1730831916208;
        Tue, 05 Nov 2024 10:38:36 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:36 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 045/161] libgxim: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:21 -0500
Message-ID: <20241105183658.34982-47-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113560

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index eb85a07e9..125b7e9a8 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://bitbucket.org/tagoh/libgxim/downloads/${BPN}-${PV}.tar.bz2 \
            file://0003-Add-format-string-qualifier-to-fix-potential-securit.patch \
            "
 
-SRC_URI[md5sum] = "4bb1fa63d00eb224439d413591c29a6a"
 SRC_URI[sha256sum] = "75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79"
 
 LICENSE = "LGPL-2.0-or-later"
-- 
2.43.0



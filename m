Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1647.1792738437307176221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KkkGRlKK;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a07025cce4so347547b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738437; x=1793343237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap+ZdJZcC2sGJMV8a2OuxUs0UsdWERf0nPlP5EfxBHg=;
        b=KkkGRlKKeBYrBwseOBr0q+743xyGG+y7QS2nCc4PlfIAS0YjJ291AZAhRx18DsEsuk
         Hh47P5z2tNMci1E7K8EgYBB57j0+liT2qX1uTlhtwrG2ntvA17CmMI2mTgzPaG6m1j+j
         AZ8jU9L+2MpbobVQvR/nQBUMebS1l8SPlNCvVczw4QNhVJitiYOOZfFJUaY2NeyhELLn
         FFYwcOUfGJXh1LrgMB9LyyGgF+OzmODtx78MUiwFSZWkWJYib6+eTCjULfZULbp9tP3D
         CT/TWIBT79VwFm5pVtdo/ncGTFPdUntj5qT5/eKDPP0xQ83ZOnr/LPy+ZP3Gu9NzxC/X
         /SDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738437; x=1793343237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap+ZdJZcC2sGJMV8a2OuxUs0UsdWERf0nPlP5EfxBHg=;
        b=r9SIGSi5CgkMN4REOaKCIkjL8VydLYmnnZwG6ODiG58mT2jCdWBjQBt0w4jtZtG2Cf
         B8wbkkJ8cL/+oUxjByjdmapyoR5Lk8z8Ng7SOf8qo84tdLl+WBVqI9mvv4/hTH6iAaWS
         xjbiwIJP0qgU+Qx9LLvmv90UQ6EMO1hvwXhzWXp4wt9183qZJmiPjT+3WgKKdkXn8nj0
         FZ3/5wY1AsHN8ydd/TTPeJSBv9ZuJ+U2q4XGIV4VRpQTI3AYyjKeul9I9bp/igw03Vj8
         qmb1IZgxA34iRoPiW7IdL4x11W07KAaP4yeLKsWMRME/a+RBL27GJuVhonVznIe9OU3q
         22iQ==
X-Gm-Message-State: AFq9FYJ2Q20lKcLGBmJYtp/Nm7vFy4mm9UGKjocLeBE/BmFrxOR1xd+U
	jPmZnBHX8Xm5A5gTY1J1w0E2LptdX5ClkJTuaBOQ8tlt926pqdspNHeyinDG/NVJkpE=
X-Gm-Gg: AYBFou2Tv7NmBWOt/Z3n7HnosGxPhbRv0QgA3EELNRfnNKC+KEzGOHlKKVcwaYWrgzx
	Q58iSSfM53dCgmQhhwgzTnf6Lbi8kx1VGaPQB4US85hHvKWN9WL8CzR6MH0nTDDWYt+ZbHh69sq
	as0sHUw97aSIQ2qKixKpXB5BwL238kT0CF0FF3Wo127GW7bJlXVxAs7Clvn0msTlKRsvsfILPjR
	Tbq3GM4uvrIiquNwK4TNlcu47COiWLsMRZZ7di2i778Ass/feM7M8e1IYwnrw50ZDYOXwZxSkhI
	D77r2KtDcq6wDI39QC8oWM3i9GbajaBKkdtZYNkveTQTos05C8ckB5doZWx1LnvXhqU2kCUwndw
	UJASs0xgWEfHqF3P34OXvD1QOuoIIz8v9ZMjHX70BBSt7N4jm54Mwt914ZZ+HL+zmk7MMKiZv+M
	cZz9UgTqao63Gcu+ivpSX7mi1aWtE7cmrQkYRZVVFp2r6RE2VwVqveX3GJz/caSWSXklI+shy8C
	BwWwYy6AzH4Z/7ptx2iZZDrm0kxisLaaV9N7iR5P1XtMTmJG97ymAZzmxxLxSb/l20340Kyu/t2
	yAwxpEGHsVS3VuPsfTdDKaGDuTWl/zxt6tOZ/I4HH2Au9JezM5BIvN94/X8z1A0DLsjzrfUJb0W
	vXBngHpWHKSH/7hilw8htNYdlsG97QvFs8fAt9wzAPruEoHYOmm2Hz7vRHy6DkeOFlhKiYC5w6G
	j/CV3RU5vjBxIMtqaThLSxZfBExyh0Nbs9k+Vi9Tp5hCkTc1QYFTaExEoQJm8AxhbyncJUfxL2s
	AKYhCFpiD6XhnygSPpgktz1yiIP19U=
X-Received: by 2002:a05:6a00:4b13:b0:886:9939:caa2 with SMTP id d2e1a72fcca58-8a2c66636c8mr1250815b3a.52.1792738436551;
        Thu, 22 Oct 2026 23:53:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 03/29] rdma-core: upgrade 64.0 -> 65.0
Date: Thu, 22 Oct 2026 23:53:24 -0700
Message-ID: <20261023065350.3228996-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131327
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rdma-core/{rdma-core_64.0.bb => rdma-core_65.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_64.0.bb => rdma-core_65.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
index d4faca1727..a465bda583 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_64.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_65.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN} = "bash perl"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
 "
-SRCREV = "f272237493ef309984036f7b85655e11104c61c8"
+SRCREV = "58e40801bfed5a8befc0881594820fa0a0baa4a1"

 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
 LICENSE = "BSD-2-Clause OR GPL-2.0-only"

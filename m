Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5B8CAC5A8
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 02:58:48 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.5006.1758164326028539547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 19:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dcjwTYWj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32e372c413aso508302a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 19:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758164325; x=1758769125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owz6VTx7ZBjhMDfjLhujNkF7jwpTfSo3xLDOHXY8kqE=;
        b=dcjwTYWjDQ4l/cNCXx7lWGrLswZQrTPv7yM2mLTt11hleDLguyzy4aF1ULI3mJyMPM
         2EwXLBR3CZ34y3GWm4PVGzqNiiMeNVe/fbsdADqJsg5uaCgqsJL4bRcg8TXtggrLgsbY
         weGJgazPgdlgaVHqet8udDpMsrG73WfZPfuwmgdQiuVKDtPL90nIPyj7ybXI+tJ31wtk
         Kztp4r4tyQy9jWXIYYVp/j3Bu6kV643bajLRCtHemMdmxUPunfIbT5vMfHZxv7zLeLMm
         CgbjorwnXOtt9xbeB3A3vHUkDU2iW+OxZx5NlLBC+N6j4ps9re25xXykaVztSIAlVDid
         oqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164325; x=1758769125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owz6VTx7ZBjhMDfjLhujNkF7jwpTfSo3xLDOHXY8kqE=;
        b=kxHW1f8nfXukdyK3AlAucIApJ0/Oz9qEWTHIU/3StPsmh+vqz8xfuj6+MRy4diatUm
         wxq9BhdPvukNHo1RlTbaKhV3jdHgpfN8uiJpnp5nQahXiz3KufmmT/L1p3ft3ARqo++P
         JibAErHubjViBKi82r7vLRlFSN3NuudXXdodUs4823tYXDHMFUdJmAFD8rkW/zxernst
         apbT25uhv61IFhMQgQz9bUZzvhIj9mlnXxCmwwXnJXlIhs0/rpq1Z6ASILUDV28rv2Kd
         1S/1T5uu6EQLNplE37VAYS9pnFI0SrGOIvKOtzbHNVq5gSXgYY+4p3AUluGHerxj+V8f
         HGUQ==
X-Gm-Message-State: AOJu0Yz2TVBECB3cwC5woqmgRa9pOfjHtQ0mU7igvoAHMveycRHm6jGD
	wamiccO1QaHcu76ZUsXBPw7KjFJFQ3IZLXdu/adWx2JPI2IlNOnsYJdJ+ZTGRelA5w8=
X-Gm-Gg: ASbGnctM8a9PzW+JsGgbMnExPYjsIXu4BMFfAVgki/a5t06h12/6f1PLHd81okvZ4Jb
	hjl3g0huEthhxxjVIA8CbY5egbFzTfju5iWvgpi/C97gOKc/dKY348QVYuQ+CO6OiNdT3qBTpEu
	g6b8ZsDlaoY60iLutdTS5yLM0NGsSZhegTdBjeloJRiTLGGVuRTYlN2Evb5UPxx/zqxLx7J3TNk
	GMGL/nu4LwafX+f4xcg0tj1XZj+LPc0ljr07w0QQMfHlliRLdmczsD1MBxQDyx47m+XdZf3kDt2
	C+WHwC2LpA+2YTSmAapSnRllOwDO1wl2JtveLKY7A7C7GhySM0OzvW3tw2gtYjcdj8CK3+D0kkS
	KME/GmQCfxrimkrBXTuhpV8/EiApY6qhOew+Na+WsmNmHM8t5oz8x/6MCCaWrtuLvcFxquz8RDy
	fAN0N6nteUuDTly9AWlH8q7kn4QHaUFOkXwIB+ZA43+4sf9MeOIhgK9o7iykI=
X-Google-Smtp-Source: AGHT+IE0pjsxrGENrs7T9juJQk+aEwCxBpOgccXWCAcYTGw/dWNnmTRFqE8xgA1WYED3ySLleY1Q4g==
X-Received: by 2002:a17:903:2c7:b0:267:4b13:c855 with SMTP id d9443c01a7336-2681217a94fmr48101505ad.14.1758164324899;
        Wed, 17 Sep 2025 19:58:44 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980368ef4sm9458795ad.149.2025.09.17.19.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 19:58:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] idevicerestore: Upgrade to tip of trunk
Date: Wed, 17 Sep 2025 19:58:40 -0700
Message-ID: <20250918025841.2170106-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918025841.2170106-1-raj.khem@gmail.com>
References: <20250918025841.2170106-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119504

Add missing dep on libtatsu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index 03eb7ccbf1..e032573516 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "\
 
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue openssl"
+DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue openssl libtatsu"
 
 PV = "1.0.1+git"
 
-SRCREV = "ecae6c6e8ca6b6bad080a1c73f10ffd0e67d75a7"
+SRCREV = "a0cec3b34fb112168aaae9fbb024e15302563b34"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
 
 inherit autotools pkgconfig


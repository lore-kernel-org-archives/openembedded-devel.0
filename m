Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB228CE79C3
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 10:29:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.34509.1695205763249514544
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 03:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSqfhlkQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-532bf1943ebso2140118a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 03:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695205761; x=1695810561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bo0HcUNRxa2j2SbKK7eXKNLU0+EBliE4GU8vgx5bIl8=;
        b=FSqfhlkQSFtfSS1CF8O8TcZXYWlt7ZGTDokuP2eosmE3kAKdPJjfd5WKkeGgQrgfYK
         rxTk4pn0S4WXFRNuuQu1HJlZMyNmLJ1NvM+WcKdflUeXESkjJ7HG/e80QhT/5EU8GY+X
         apzzdWE075W0enTKjq5hAQCUYFTgJyLq+QxBKtZ1JtE7e3ysviGhW10lluh4O9GjaxE0
         tz6ii3wLKlo6C+Wk4IbDDPgtYKeDLqFSblqBWIX3nq2CRp3QbPcUkgN+zb04Lmu9lheA
         +GN9oRD+1MeHGnR2VQPythZPs/URUZXOK1FR85oAvWbEAQ5e5K4qUW/cOEh34SrabClv
         Uwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695205761; x=1695810561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo0HcUNRxa2j2SbKK7eXKNLU0+EBliE4GU8vgx5bIl8=;
        b=Sd7e6PBK0dfMsx6rv4haBsoZmxFg58aMdIy+X9PwPBIWRA0vEysMguc/ewsXKX5BRZ
         vioUI4n1S1KY0glIClBwcokEkgwt/AiTAAlBH5iZ6TyqPulAyJ0DpgwScfzSP9/22E9t
         TWgElblB8kfXd+rWWPN5fd52R94z+fkHWJnEaDE/UZZ1piXmE7P4eZc6n13Jb+zi4dCp
         ldxP7ga5aa6B3111eoEkp14OFcAQ45AWe5SSjC/4IZiiCKGrxE4R35+JlhPQASYPiWq3
         KYRsIMg/hepc2y2P92kwujvjtnUGueqCfcrEwwF3cZqFuPk6N1ygoFyzdezcwxnJBDtj
         cGLw==
X-Gm-Message-State: AOJu0YyaFnX3n1Klu1YNVyUtcw+LtXBPazdm8EexyLG6KO57nGWeMJPT
	fqZcMGhKHERKEk+vZS+odr3Mdd0ERQA=
X-Google-Smtp-Source: AGHT+IHLauxnRSRtDQKA9+0+vVzgAI+tf9hUf9cguRDaW3E4wTvQRd8sv5X43FY/DiC9OYEskGIJeQ==
X-Received: by 2002:a05:6402:1357:b0:52f:9d4c:1d28 with SMTP id y23-20020a056402135700b0052f9d4c1d28mr1743154edw.12.1695205761505;
        Wed, 20 Sep 2023 03:29:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u22-20020aa7db96000000b0052348d74865sm8606264edt.61.2023.09.20.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 03:29:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] cukinia: drop allarch
Date: Wed, 20 Sep 2023 12:29:12 +0200
Message-ID: <20230920102915.1269280-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920102915.1269280-1-martin.jansa@gmail.com>
References: <20230920102915.1269280-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 10:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105010

* it rdepends on TUNE_PKGARCH libgpiod-tools so it cannot be allarch
  (or cukinia->libgpiod-tools needs to be added to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS)

  bitbake-diffsigs \
    sstate-before/mako/all-webos-linux/cukinia/0.6.2.do_package_write_ipk.sigdata.630262028cb276fdac170d30a265aa72d4249f84a264e11ea676a5ab38f1cacc \
    sstate-before/qemux86-64/all-webos-linux/cukinia/0.6.2.do_package_write_ipk.sigdata.5d193e43c71f1270d36075be6124bb70585bb682771cff644349c4a7ffd13605
  Hash for task dependency libgpiod:do_packagedata changed from d3dffb55884b89470065c3eaf046563e2f306706400be396b022a470ceca1916 to 76e47aed399fdbd14db3c4b75ef2b83298322429f111175d4ca4f3f4c67eebf0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index 470d26ef69..ed7a3f06af 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -13,8 +13,6 @@ SRCREV = "a290f2dbb813ce12ba407962655a5d8b57322221"
 
 S = "${WORKDIR}/git"
 
-inherit allarch
-
 RRECOMMENDS:${PN} = "libgpiod-tools"
 
 do_install () {
-- 
2.42.0



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8161CCDD0ED
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.21785.1729612091479532764
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lmbsd41m;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e38fa1f82fso54603677b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612090; x=1730216890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aTMHyjszijaQUm0zgD1CG1mrLKzYW5/5Z8dFj2WmYM=;
        b=Lmbsd41mbgcOrm/xCkBTZ6BLNp+zn+OyTUgKXJPEJrkRXQr87hnbzNvTnXr4BmE86n
         EXC1UpxirKDgby+1HcX7bKMMhlUT95VYs8Uk+o10H/zj/TtDMknyDQxQvsLwsuI4wgiD
         c8xu+r+UNFcsQpe+EfjKP/730hbm8BXPq8T4ES5acIbQCl6EQrB1VfXJTS67dotZRQla
         ufo+5xVnckNeeis2f2rsHk5mqgzIFXvpgT5ie7XoPmzHFA+yoxSPq7DCN1pMKi45d8Un
         5vQvxKSIMChDqUUY2mc2R/Im0oQuBn2yH/iof1GDB0RNlYLdLufSWmYhDU/jhJT3n1Yc
         gNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612090; x=1730216890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aTMHyjszijaQUm0zgD1CG1mrLKzYW5/5Z8dFj2WmYM=;
        b=mESIMZDDoPQpSIYbJBrlNO+wVb/3jPkVqLMNvoAUBYlza5Jkrw6RBpyiNBMTjhJeEJ
         nfH54L+c/Fw/gZKKy3HLPEDvpSizkYMXmDzRXqWshmrJ6ArPDgi16xgDEavizqJvgREL
         9lZjKKnfEesEZluHp7rPh+ZDFWB4Y0OBnUVSAI92aSUf5mnh/h9kcY6rLf0w2RjAFAoz
         8o1Izss6KTWu/Y0E9jeqZJCbvwuDe74Zzhf9xlKKps8uFEIneoFoLe97SLl7L2sw7AAY
         P3oqkcxqjE7KWASb475SEC1vYORgx6TgOcqUioBs5hwnS8z+lIlwS1HiuE8bRpbWcPqk
         eRPw==
X-Gm-Message-State: AOJu0YxKIIehoLy1f7WLc8fm+Dm3UR7wuSNgoLB2k413mXELyUic2VKN
	Xe1plq+YwG7kjnrMRoEkDdmWBHbnYljikZKCTD+cffTJa4r5EfR4zFtaYw==
X-Google-Smtp-Source: AGHT+IFK3HamRqDnXaONxPqLgRk71ADSZKUB/zlJrfUNy8SNkFjyW7jd7r+TsKa0f/CbzB3M7YTo7w==
X-Received: by 2002:a05:690c:f94:b0:6e2:12e5:358b with SMTP id 00721157ae682-6e5bfbebc41mr151410447b3.4.1729612090079;
        Tue, 22 Oct 2024 08:48:10 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:09 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 24/46] liblocale-gettext-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:42 -0400
Message-ID: <20241022154729.20331-25-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113115

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
index 1e4b56353..654fd2eed 100644
--- a/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
+++ b/meta-perl/recipes-perl/liblocale/liblocale-gettext-perl_1.07.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://README;md5=d028249c2d08dca6ca6c5bb43b56d926"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PV/PVANDRY/Locale-gettext-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "bc652758af65c24500f1d06a77415019"
 SRC_URI[sha256sum] = "909d47954697e7c04218f972915b787bd1244d75e3bd01620bc167d5bbc49c15"
 
 S = "${WORKDIR}/Locale-gettext-${PV}"
-- 
2.43.0



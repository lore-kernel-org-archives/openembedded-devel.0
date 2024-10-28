Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D10D5B171
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.50623.1730119265003516492
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 05:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fgKpM7a2;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea11b32ab4so4375457b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119264; x=1730724064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6cByHqzAFbvcE0ZHC5XLoN2lidvNcZEqFGvV7nOdcQ=;
        b=fgKpM7a2Biw97BDMkEaFVCoBoCFT7R8D2BEQGhop8a9Vy6PePKsxhKO42Ll7La5G/h
         gsg1C9LURY0ZeGhufluosVl2y7Y5DnGxDNAlwinacKz5fBhS6UNr/Tajfl3xn22S+Oxl
         aGNY7pK7Mg3JOcqPb6WMPf8wCbe5PDQBpyySMhiST4mR+vwA8plhuB66WpEFA1XD0hOk
         BBeUh/moOh609/TSy94Sj5i5V6UdwzbsPQAR95dzGmfhvTo/rReU9oHMvKJ+lH4YUksm
         LCArTC+Ae1PhWTPTm9yx7tg3EpU4BIP0z4WuVwJPP6HAUolK2npULqA9MHHmxJ7d+Zxe
         n7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119264; x=1730724064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6cByHqzAFbvcE0ZHC5XLoN2lidvNcZEqFGvV7nOdcQ=;
        b=vsWupdPSy/IC6GTn70UpPzQsjffdWYaU+v35DulGemu/i/+A3y4KM6jS5uo5Wp0S8+
         J+Uf7lux7zn9P89uIqGJvPXbn388Ny8RJ8fOSczb4Qwxkl7Bj/SrvZOXRNYidezcRR/T
         ubK9q7fSSJf9/BOLI19rsl0bm2EPs6N0yMgKsc3G+XUeIVEsa8YbejcbxzFtmpObuK2E
         qT42548DAlHiV6oCkhtkMzKYWsrrRJelLm0KY8B5xV0IqLrmGQYUb1TzMiNJDVFbxuTc
         5+VYlLKXJqzl5JEB31wt0V2220jXSihAbqbjfIw5STWVN7Tm8pecCyt7tWTeUdj3vCFz
         xuTw==
X-Gm-Message-State: AOJu0YyZPzaAY5A+lmm12qLJewicM5Epv4Xm7fhNDQP6aD7JhToiv3H3
	r/AkgBcXxo0sn83vGXbO4BufyA4mWyCy9RFc/im5SjNoktuHOpEqDceusQ==
X-Google-Smtp-Source: AGHT+IE1+dZUEh+btNWumiOOUcFvNNkEbW4owo8s8mnVWV/PyPxmweKodrGrusYhRl4+i4qRc327YQ==
X-Received: by 2002:a05:690c:668b:b0:6dd:b8ff:c29c with SMTP id 00721157ae682-6e857eee03cmr108236857b3.17.1730119263414;
        Mon, 28 Oct 2024 05:41:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c76fa5sm13974777b3.97.2024.10.28.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:41:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH v2 2/2] libmodule-build-tiny-perl: fix QA Issue: TMPDIR [buildpaths]
Date: Mon, 28 Oct 2024 08:40:43 -0400
Message-ID: <20241028124043.5014-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028124043.5014-1-schonm@gmail.com>
References: <20241028124043.5014-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113267

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libmodule/libmodule-build-tiny-perl_0.048.bb           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
index a662b4540..bab9c5c95 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-build-tiny-perl_0.048.bb
@@ -21,6 +21,13 @@ S = "${WORKDIR}/Module-Build-Tiny-${PV}"
 
 inherit cpan_build ptest-perl
 
+do_install:append() {
+  sed -i \
+    -e 's|${TMPDIR}||g' \
+    `find ${D}/usr/lib/perl5 -type f -name .packlist`
+}
+
+
 RDEPENDS:${PN} += " \
     libextutils-config-perl \
     libextutils-helpers-perl \
-- 
2.43.0



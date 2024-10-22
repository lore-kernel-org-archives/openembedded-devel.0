Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1CFCDD0F2
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.21949.1729612092811626967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQYP8c4S;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e5ef7527deso30373727b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612092; x=1730216892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nftgrU7SZzJsQgXXfmGcMh5WYUMgML2uSGTd4FM2xv8=;
        b=MQYP8c4SnIngl+9CCr1q6lY8uxTiUj7h0HWEYKJPVt+xG+FI3K2kqIm+FAXe0wi/sK
         bSLryv/jMK3pANMKh7IvPAgquzldXMbDln4un8EE56Jel6kI7o5eSYY6NUFJgr4/jal0
         s58lWovsRurgk21o5sPesE/IIsqscdZ5T6ye4EdBspVZRmUTnNVFWplilF7YkGYoHBT5
         +qUfnuI7vzLumr2DlJWKafybRAjVZd2HcKMaPF12L5QJn2zZD8MV2MLbNU3TqrYnM+ee
         B4wsEj/O7/p1jv6zoXeJptLbgvxUMqU/4hvnp1gDdk2dT7dxwRwdPIs73q6cs9Ue7TZn
         oXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612092; x=1730216892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nftgrU7SZzJsQgXXfmGcMh5WYUMgML2uSGTd4FM2xv8=;
        b=bfwq2DgjEXX/WD9D38HqohKucA2bHD6mILWCaTbF3kPmftSnZg01oGz/J6/VpZBnyI
         ImEC5fuWUH0SDeGw51RpkfTmmIaN9imb/QFl8tmJxOaRO/pdMx5IcxvYp8klCdZHRlu0
         85ckb8Kmpw7e2UNYfVRzojI0Ad7FLpHtZKKk9uLe9tu2v8Ubqr+F9vtIQKWOfSUtLhLS
         TyjMvO0tfRR0WuyELNZNS/NAR7VKvTm2iWKEIV0jdxVf4qAASVLSd7mC+15TmrVNTrx9
         0lpt8cgawo03v0QFMuPaafLZ5SU3lc6Un7COUabB7hIFdikIaDE8AJcN6tHx6XKZ1aOW
         QQOA==
X-Gm-Message-State: AOJu0Yz9BubmiWf+X1IKuwzRIgUcE+Bh8o5I2yz4SN/gwgywcvmF9WmB
	qGvXrXyvRjWoaoYbjiMTijutfisSGGb1Ut95qgU82a5TrCK5DfXxe34vRg==
X-Google-Smtp-Source: AGHT+IGf4VH37fC2Iuo4qdzWXUBBRuYBZBTe5nBkgobR9wRSnCY+IkuL2fZL5x2X25UqMiRgIipsBg==
X-Received: by 2002:a05:690c:d89:b0:6e3:d688:e3e9 with SMTP id 00721157ae682-6e7d82a9e90mr32728557b3.31.1729612091385;
        Tue, 22 Oct 2024 08:48:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 26/46] libmodule-runtime-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:44 -0400
Message-ID: <20241022154729.20331-27-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113117

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index 205df6802..9c4370e96 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -21,7 +21,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6
 
 SRCNAME = "Module-Runtime"
 SRC_URI = "${CPAN_MIRROR}/authors/id/Z/ZE/ZEFRAM/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "d3d47222fa2e3dfcb4526f6cc8437b20"
 SRC_URI[sha256sum] = "68302ec646833547d410be28e09676db75006f4aa58a11f3bdb44ffe99f0f024"
 
 UPSTREAM_CHECK_REGEX = "Module\-Runtime\-(?P<pver>(\d+\.\d+)).tar"
-- 
2.43.0



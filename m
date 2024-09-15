Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8409DC3ABA1
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:53 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.117817.1726417843665412245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQpMmL+h;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6db2a9da800so30394377b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726417843; x=1727022643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjpTWEeYNQNuHpn7KBA4hkydXb5EwcJL9HHWJIkcJcY=;
        b=KQpMmL+h2rOeREAu6NmEFMYFqTvoVOh+VAqD5csXlB/Fke4z2z/vyNnkV8PPYxf7o5
         fH7Ofey53qEvmzqc6AAffBlDxNikSBHFyjwk+pR82c5JPNujIjOxe29uh/GgOlTCoarb
         1xwjcTSP8gIM/2VGztcmRIad/Pxsl5NpfnTlSQsZLPfnlwtA1qTO+iB/0wL9rJr47zyI
         nbZtwCU0Kiku9MZZqUIz2SgOAFTE9ZkK4Krca8ThZ6AuPNCjO//WAduttQE1JYuY0E/5
         c4foqhq8YNjXQ6uoj3zZYGinz7AKgbj7fv7AGNJd4EFynAbNVwGHCfatWZv7oj7n9I1k
         tQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417843; x=1727022643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjpTWEeYNQNuHpn7KBA4hkydXb5EwcJL9HHWJIkcJcY=;
        b=Y2l0N6jBDWcwYcH49Bo/rIIb39ahXZyGOfKXGKT/yB0DO0b+6ULPK5iZddhisE5V7K
         +2CFkFtoCHRfwirL8XRm8Exs0W0kB/5s6LqXAEkOem3Lhm251zyFP729/AUjD9elSb1M
         IaUc/L6EbIqda9jcy7zA+0FcykRrgsTTtVyIJjj6T9PDxyA55eEHHpPz6CMcfpL2TBQo
         4gA3KQzBnpGGN2P9hINGvu2lsptESxRXK6pVCGsZkyz2XZdGPlLwsquBcoLNvypejRql
         9gD0ja768PmtwnMygsJV129MlIigMQwHmb1H2Vw+2ppqyjC+TgICDPZBBBxHFw1KU5bY
         pH6Q==
X-Gm-Message-State: AOJu0Yw3QfnCUjAypnDlEdUqEq06Lu8QqpR7QNC3bvti/xAK+K0Mw6X3
	463DJqRVUYOncNnYxwKZNE+EckuqWeKmrrTLpGRxuX/RH3i0JgVWZux4jg==
X-Google-Smtp-Source: AGHT+IF+hSeNX+wpZj7AlP95yjkiTazacMfL8PhEdXbWkwvx74T5YhDL3X7Qyz9yWlQBWPqCJBQa2g==
X-Received: by 2002:a05:690c:b82:b0:6db:d221:b739 with SMTP id 00721157ae682-6dbd221b8e3mr63662417b3.10.1726417842522;
        Sun, 15 Sep 2024 09:30:42 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28e55sm5777867b3.70.2024.09.15.09.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:30:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 3/5] samba: upgrade 4.19.6 -> 4.19.7
Date: Sun, 15 Sep 2024 12:30:38 -0400
Message-ID: <20240915163040.189190-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915163040.189190-1-akuster808@gmail.com>
References: <20240915163040.189190-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112306

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://www.samba.org/samba/history/samba-4.19.7.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 41df431b91f1d81070c1f0e8633995d7afba52e4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/{samba_4.19.6.bb => samba_4.19.7.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.6.bb => samba_4.19.7.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
index bd0309934b..dddf594515 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.7.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "653b52095554dbc223c63b96af5cdf9e98c3e048549c5f56143d3b33dce1cef1"
+SRC_URI[sha256sum] = "2bbb800af2d6bc7b9c23e708cd58d008da3bfa6ef7e621d9ec8b53387efee445"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.43.0



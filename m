Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91336E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 20:00:43 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.2132.1736452841999595423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 12:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N47WEeFg;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso1978246276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736452841; x=1737057641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/W7d39RcFi3C7bEUKCPrLHUfRA7TnSp/uFs+Vdz3E4=;
        b=N47WEeFg/RKNMW6DPslC4ZcZmstSGLbVzbLqO2vVrMfZs30Uzw97Ve+c+dhyGWht9/
         FPB1kQdX/X+R5Zm4NfJ5g+WSP27Z6gvAn1QLbcUgmX1Rhkia3a7HQfzJuXTpPFa2AW9w
         jUyreaYEFIVdAw4V17Cn0DzF0786covQPdpaBEIgG90+SIaH2MMC8p9con+fXraFYIXs
         kjMNuF0ILXmf/Gsygmm8EOZEcfb/XQeRrclVf7K00qvbIWvA6v1SSpfKItROnOW+5a8v
         xSoxNcxPCwQKd+L9CElrNTE7odtHXg9fHL6qOf6HKxFLSnzWXkaHBpe44soaz+n8aEZj
         XUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736452841; x=1737057641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/W7d39RcFi3C7bEUKCPrLHUfRA7TnSp/uFs+Vdz3E4=;
        b=bFPOL4VsZGot8vChkTPkTABiWQaQQzFQCRJ7DGiA7nuUxxf0Bc02Q14ASQWNQkJU1U
         xyQT/exmPNjlIoa3KXitOuMnoN5pHVoS29dhJDyJpybmTKfE59Ex1M1I3aR3VNIN7JM1
         UqhJFh/3juDgUb5BcLmI4nSDRh4Oa6wK/s21Q9M573zX+Q2FtPxp3fc2bRBjYClAOJS6
         mGeDABCbd9fvOoKE86umPtNZd9yhdZUjNREOtRkVtwdZBbC0oEWeG2JPnh9ydNRvjhE4
         OGXuLMySw1AfAtTxkR1wIpX/Qg7YCXKPOp75cqW1NDoEvr+cjq9J6EyUhKJcnU90v05W
         GzLg==
X-Gm-Message-State: AOJu0Yx2x+JpaSL3o2sj5sXx7hAoHagK7cxurlnaizHriyzkFc3WPoBt
	wiU3F8ciBl2Q0P5Z3SwjIg4suoRY515QxM/c2nC5kLjzNTM70ZowNiffpA51
X-Gm-Gg: ASbGnctDghxctaxmCh5ZKAb/nhb6GmN7PIbcxzlirnN/kAIdEMc+3h/VJm97gq6jQNi
	AeMiJHcbNDauSi92dZNVn8lj8CSserJu0jk3a32ARJt8VeG7eLSnzg7P1e787+Fntlj2vIZuhhB
	uWBjfyktjFahERRxiIHm9zrZPXsMtUvzXxcfjL2smFqNUT4pnqqJxNVq5vDgdBZXO/q/NDvcBeG
	J9vU3bxoyc7hKx0nbYANNd2QUzUOpWgQWGbNztNG73hxxD7EWXoEVTzkrRtRgIqPa6Ei1HQ9Asw
	kGyVLCJcyM+xsFlS3g==
X-Google-Smtp-Source: AGHT+IHsFjvwXlkZf0pmr6qGrpBheuy56hIY5F/YeshUELRv9wCQapVH9zQTrWGgymDq4SkiekUDTQ==
X-Received: by 2002:a05:690c:4983:b0:6ef:57ad:9d91 with SMTP id 00721157ae682-6f531238d2amr77813717b3.24.1736452840555;
        Thu, 09 Jan 2025 12:00:40 -0800 (PST)
Received: from localhost.localdomain (71-208-27-252.ftmy.qwest.net. [71.208.27.252])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c23302sm3772857b3.8.2025.01.09.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 12:00:39 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libcgi-perl: upgrade 4.66 -> 4.67
Date: Thu,  9 Jan 2025 15:00:19 -0500
Message-ID: <20250109200019.4152-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 20:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114754

Changelog: https://metacpan.org/release/LEEJO/CGI-4.67/source/Changes

  Fix:
    correctly parse unquoted expires cookie values containing embedded commas (GH #268, thanks to rlauer6 for the patch)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libcgi/{libcgi-perl_4.66.bb => libcgi-perl_4.67.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.66.bb => libcgi-perl_4.67.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb
index 42100acec..fcda790d3 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.67.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4697437688a193e3f02556e1d223015590c1f2800b40becf83dc12d5cc5ed8e1"
+SRC_URI[sha256sum] = "f4a6896eb94a3ecaa1c1ba02f7e0d2bed0be4c5ad3378d80196ec25662ac4111"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.43.0



Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438E0D3F29B
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.30094.1729278823429023182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ShJl6nnU;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: schonm@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3e6075cba82so257995b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278822; x=1729883622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrrWvI2DhzbWnmeDa9GxYjBlmmpWdxvNsvE1CP56Ryc=;
        b=ShJl6nnU5BfD8E8TjbTRq2U/OdxVA06fjLvy34EhdG2kg43dBaEMJTP4uknclJ69+l
         N6PpZr0Y/Unttt5yIeLMDVXyviCWvfTFU2XtIqvJawuVEG4XyMLljupzzWYsLNdC33dF
         3Vub9auurgMOgrvle9zoMiIVsxGlnzm8bh/3yaSl/69Fx5QS5V97ZLeTv+/O+JutOjvt
         VMWq1oNr9KXL30c+dmK2IoZSJb+0S6HmmTYr57248yQHusn4wY6vslPuZP+tgsib0Hil
         Ixgf+H1h69PZZMOln5m0Pd7bYUNG7IvI39+xmYWymSfSG+r+DUnjLdRn5m3vS+eiWt3J
         6SrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278822; x=1729883622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrrWvI2DhzbWnmeDa9GxYjBlmmpWdxvNsvE1CP56Ryc=;
        b=FwYlpWwc22Ldu0AedZhfWpLr+n88qdOEQEV26U1u5J9/4S+TXdtgQWhaXp26IK/y76
         9BWo46XiQ+bfKSBu+/aqSlxVHi/awKxOggbOk0kpkgsmcFOY7ad4BR6+6Ya0pPkV1ppM
         dxCpMGeZKiOUTztrDc9yHR5/2ESnJOfjF7fLRNawxEZ6dOcZlh0R1wVlpZUNRB2oBJag
         wnGWpYngLZoH1+ViISVEr4jO7ETGgO6vWjgz+szp6ZcUR632KLc+WzZpHaJJyrVPSNe8
         AcZtduAdn5C0+7rjKEOphelyLM0I8rINAMOAxqLoq33lx7eOZf1um6Nba18lU64YtFkD
         1xCg==
X-Gm-Message-State: AOJu0YzCte5K5FH2Udksb4dCAcH07kfxaxulilFftzwP6FTRXnoXiUMS
	73TO9oB0xZDWvjy3IbEoi09sgNrvsOGGJMcPjNcAUY4UsyB5H/j/wFo/+A==
X-Google-Smtp-Source: AGHT+IEI5dbrlt1369hATIonY5m295+Tcp5LOahUoZJs70Ps1O4Aoo0m6awgtl7r2oTMp7HGWXFZiw==
X-Received: by 2002:a05:6808:191c:b0:3e5:fd5a:c39b with SMTP id 5614622812f47-3e602c64e79mr3324931b6e.4.1729278822345;
        Fri, 18 Oct 2024 12:13:42 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:42 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 49/68] python3-precise-runner: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:36 -0400
Message-ID: <20241018191101.25184-50-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113036

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-precise-runner_0.3.1.bb      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
index 1fb72de12..ea453366a 100644
--- a/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-precise-runner_0.3.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-precise"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.md;md5=2ad29e930f3107d52d2a55728bf62116"
 
-SRC_URI[md5sum] = "a2434be110444192e804f4dada0ccecf"
 SRC_URI[sha256sum] = "1a464209fb4bf0a3f5d5a428310cb2a70487a01a6bc3a960d1dda90af896b80d"
 
 inherit pypi setuptools3 ptest
-- 
2.43.0



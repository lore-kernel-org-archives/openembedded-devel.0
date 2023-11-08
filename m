Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E466EC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 18:02:18 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.21609.1699466533503011165
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 10:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=q/bOqjgz;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.175, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-41cbf8e1f77so96961cf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699466532; x=1700071332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rn52szJ+dgdv2/eb07Bqi58l/eCD61FE+ZvOXC9Cv8=;
        b=q/bOqjgzlpkPmSwmLu3VLHyVcifOV+y+L2ziNk8IVLEBhVAdc4HbRik1OVRID4N1p+
         685slTZlOXgW1UghjAFaoCRpo+ca/bMpP0Zz5mXQaZsQ2Vs3HWkXOIcqXjJ+rwQC63lb
         ljVrMBguq9u7mKv1bxEA6yBOH6bbjnMpCbQoQATvrwGDsikGXMftNLn9i39JwRk8Y6Ml
         7pTI6Nsrg426ZD+pfhs8WtA9x+F9k57/VhFObRzeWXJT+vBSiTlAZ7vNETBlrSNEiadd
         t2WywV1ampt30i6SRYU4OS9oHo7U8pn0v5UCwAqBIn+hiY6EJIE3NIJySTdBwody3Mtb
         52iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699466532; x=1700071332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rn52szJ+dgdv2/eb07Bqi58l/eCD61FE+ZvOXC9Cv8=;
        b=kVJewMFnqMF/+5Ah9z+vDkavRUHbPAUZEJHDyf+QrdBiBhT5htknGAnq8OVm53Dmc7
         wEYhL5Bd1zIVdi3vBAE8UcA3A77UEAkrKQJD8klI4wMz4r60jBdakS1rughlOotR34tQ
         LjQOcwBbpjZ7HHJSe61XyzNougLJOjYEaBI8V//tHgS/NWlcvx/RTjQlRtowkkbxhBRO
         /WJDUNTcXPhY+ADa/ECoKyGUxh55UjYHW5Fj0VYhb++Cs+Xi6bf9aos98xpEFXrWEnDG
         oA1CXbhVYGr2xHgn8THA/vsyazNVErAE2dI92rh+4eSYNI1Cu5mDqsDkNXAUG7k95xSF
         d+Ww==
X-Gm-Message-State: AOJu0YzjkVE3RlA/h/WfF0qWDkXEcVzvg7hG5OsInGt0FiyQTRTnwIif
	Xno7NzQG5Kvd0/+5rHCpgditi/VNOtFguOUy0rOzxA==
X-Google-Smtp-Source: AGHT+IFXhVMS34/s5oVYZPTQ65Q1pRv+fWN5ZkOSgi5Wc1As/i2l6kStyuWOVIMH18D5Q6iorV2+xw==
X-Received: by 2002:a05:6214:258a:b0:66d:57ca:fa59 with SMTP id fq10-20020a056214258a00b0066d57cafa59mr2392776qvb.37.1699466531993;
        Wed, 08 Nov 2023 10:02:11 -0800 (PST)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id bu7-20020ad455e7000000b0064f5d70d072sm1325643qvb.37.2023.11.08.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 10:02:11 -0800 (PST)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 1/2] python3-aniso8601: Add ISO 8601 parsing library
Date: Wed,  8 Nov 2023 15:02:05 -0300
Message-Id: <20231108180206.3263886-2-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108180206.3263886-1-arthur.oliveira@ossystems.com.br>
References: <20231108180206.3263886-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 18:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106484

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

Add new python3-aniso8601 recipe for parsing ISO 8601 strings with a
BSD-3-Clause license.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-aniso8601_9.0.1.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb b/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb
new file mode 100644
index 000000000..3d99e48c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aniso8601_9.0.1.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "A library for parsing ISO 8601 strings."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6d91d56f51a54389d95526eefe039b1c"
+
+SRC_URI[sha256sum] = "72e3117667eedf66951bb2d93f4296a56b94b078a8a95905a052611fb3f1b973"
+
+inherit pypi setuptools3
-- 
2.39.2



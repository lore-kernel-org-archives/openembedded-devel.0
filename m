Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CC7CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 23:27:37 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.8329.1761175648384396785
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 16:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c2cyEYZO;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6cf07258e8so84993a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 16:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761175647; x=1761780447; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7nR8i4MvkzGLG77qjep7fYozZhlMHyCSJzu+IsiXnM=;
        b=c2cyEYZOJrxg11X9J1P4rQjBleycMFI1e/+Jf2f0VNRAZCyLhwld/zHWPaB9VJWgru
         9QL1MP2VQ/iWn4PDGrFIILsCnfUVpk47843n9sj1kEXIVHYDj0Ivh3VyjUcnOqRJo+qd
         cBSmguk9cVe3ezOE8eeNxGbe6otCl1d7kcgOzPE9Ep7L2nH3wxD7j5t0qvAW/zshykxt
         5eTfXVYR+UHuUJNZtmiRWeYkVDqmrkdBehTu64G5hNSQm/6iZG8GP/kOJTJy+czwa96P
         qg2Wf4lyPxKkdQTyyLklvzRxoXCdq68mWjtl7GJIhiNQuNikzczuLrFFeOpbrc04phx/
         zFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175647; x=1761780447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7nR8i4MvkzGLG77qjep7fYozZhlMHyCSJzu+IsiXnM=;
        b=XlfxCSOnPtqMSvMWNIzZFgAUme2BeQVAYtSjb03nqU37MqGEz6ViIXuZO9ouQmclWh
         E12LiFUOwAEFN9Jt89OXvuaRfG7p471He86QTW47HCxef9pn4nuQHuBR9BPixc9rLGOR
         LhwsfXVkqFuX40CSrYTtZr+zCE/Y65nRX/PkBbskTa8igvEgnyM6rQ+8qUTAI3vnNFZ1
         10I9c1dgAQ6aVq765b95rCifQJkFhvUbN+oW4dZMNASCX/gHRbyY0B+pszrGmTVqxV5H
         T98iK/2V4wFxgieCZBzbrXR5oShY0dePghyNY5KdhY+3ux6Py6hVFzU/ko5qNxFLTYu2
         BIzg==
X-Gm-Message-State: AOJu0YzxsGfGKDAiRlhrv0vxNLoqJbgu1Wd7N0+gzklzwyq9ZAnmswW3
	K8m9jFQ93dqBjIRns+WfRn0VX0ahoJ6WtUHcB/ob5ZxHN//RD2yhb+6NJrvRAQ==
X-Gm-Gg: ASbGncsw97OCHl+RIw06JUZr1V63Lhrrk/UD63eGp2FpxryUrvhDJmICtYd2bYXkp17
	011ClgXsVKFgH5zhtmWk8bJ7uYWTkQl+d7pDtqQX6KFFXPBgRzJRlTPY2V/ox7/O/YLqfAdSF0I
	AvHgB4qWGfnvq0kGIfbJHtcFu1gq/E4jg3gS+jzk8ggj9RLskLwsqNBi6WaVq+j2oRk4n8wZipX
	Dx0jZRN9SP0b2EM0Xp43gsAybsLWB89d/JVudghcsjTHw16VUsnz8X58ypcsUfDPMPkCvxPSrMN
	p4g91i6n9HUtQqLZxBEr3+Fm1kXMt7YyVaxMPMnX/M5ocEISvXHUtQ1QNIkvbC6uPP9S2UjARWR
	zl1QymF84pLCuV3QbA45KzuXBj4u+jClKTXN/qU8wcJU4n05F5inhqoyTsBoWBgQ5gj+/FZ62jG
	/IYkIM4SMuKak3Fw==
X-Google-Smtp-Source: AGHT+IELeYPB+Dv7GhLDP5V4RdVQhxwrJZQGtd6U274J3Z1yzrqJEthF7lFmOzBYaZSyO6UGPQEgUg==
X-Received: by 2002:a17:902:f64a:b0:269:9e4d:4c8b with SMTP id d9443c01a7336-290ca403110mr277385325ad.21.1761175647556;
        Wed, 22 Oct 2025 16:27:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fb01919aasm331129a91.17.2025.10.22.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:27:27 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH v2 8/8] python3-django: upgrade 5.0.11 -> 5.0.14
Date: Thu, 23 Oct 2025 12:26:31 +1300
Message-ID: <20251022232633.1703690-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
References: <20251022232633.1703690-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 23:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120909

Includes fix for CVE-2025-26699 and CVE-2025-27556

Release notes:
https://docs.djangoproject.com/en/dev/releases/5.0.12/
https://docs.djangoproject.com/en/dev/releases/5.0.13/
https://docs.djangoproject.com/en/dev/releases/5.0.14/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.0.11.bb => python3-django_5.0.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.14.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-django_5.0.11.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.14.bb
index 5060f3c9ad..b95a5067fb 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.14.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
+SRC_URI[sha256sum] = "29019a5763dbd48da1720d687c3522ef40d1c61be6fb2fad27ed79e9f655bc11"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \


Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7334DE9DE4D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:52 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126701.1775718587676420801
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yl7rNhuL;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76864f4e58so220516a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718587; x=1776323387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hEJE9TU7sgj6NPPCYd0+et2OxFFa3btxj66KE1Il+to=;
        b=Yl7rNhuLO/fjg+PDrfxuNhyFSGMp2YCamHMYhYBHBjo9+0ZZ60HcHqs8Dv0fhQZ/wp
         eIZGhsNxcHqIM5paHTvfUkxSiULckLbNeKvAeQ/tQef7VwTBDHY9Ro7KkpwqZbjSOszp
         s9gG8RUarh5qHAMxqm147rsbf21RDbnRmL03tqMGt20HHM03gYWmXQnllMIcowkVjaNI
         L4fTaJ+5BHa/z53OAIdmwQJmwgtqjIwgaI3LhSgKzRwWKv1I3710O4vYZRGnNkCV+cLh
         UGE3wapu/xlrcK566A8n+0Tn5Dhq4eYo7YamGEnZN6y4VwlSvrEXSrAYKE99aOg9jLO6
         BqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718587; x=1776323387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hEJE9TU7sgj6NPPCYd0+et2OxFFa3btxj66KE1Il+to=;
        b=F8TWG3l0w8j+7QTgO002Trt72Ka9W2OrFV00XRArLhOCE8U5dEoNh6Y7DKjC4/LS8A
         AV9OF6hO4cqbjAVClQIwpxkQftq8JjP0IS8nIZ2Ep1IKNLeUfDJBF5ucrfPuWA4JkzcV
         7+tYF0wkSFT41VSIPcaJNXMlRa/yhcgZr0z6BuHAnYQQlTaC3nGDy5lIDqyet6JsUaTI
         4k9Be6plohc/1K8vckJ1cIoRrMhElmNtzbs3dax43eRANYSdE99KHOV45qgsBXd7Pu9y
         BQZet0di+HVCbSRJm74LjfoaUAdiQP37Yur46lloXlUp8amjtcNX5pDSuPa+Nyhmb0i3
         My9A==
X-Gm-Message-State: AOJu0Yx7zZuvG82OZXMKqqYffopRTuivcxbWaXLUvn082GYoOtOYZu+s
	uuTPKOuNNeUSM79R5WX0T6810/xmlLUgjemHNnG8JvDdzzHoxF+pkeNaWn+xxg==
X-Gm-Gg: AeBDieslIRkHU06AvRV8f3fsyWVfVYYzGDeq0eg3CdJL9Y38/t99YR8whiHNAw847Ob
	zHxCdBb1fbPutCGvPLiJLIhsk5Za7op87wpPKB9ONYt/mtsFxy9xt+dFST/lmxV/d2sJ/m/OwR4
	/Mcg5vjBY8BcWZQ15Jb51gbfuxqZKy2BYxNOVxZEAHfsB/SXyjwfDsR4yW7iVh2gn7OTfMigbIZ
	5loqNaJkWeJw6pFVBY5VzuuqWou3rnGvDZAwU8RYEBx+3wOhsMjE6qbwoQ901bMQnvdfAS4jJeZ
	wuSzveZ3o6G3kvwlriVk6ouDzpOkanViOrJ/PIBEdgpw9ENTZMFYYqtqXov29WHHyHMIFnjCPtW
	AW3nAOuPypmxA13YJDAxMLaj97QwgVGbj66GSs6GdoArlv4i3XKhEhO9XLHvfrhy23coWQHl7J4
	2Ela21ivsHrcAOT2NMXYXMAI/CWOBWOtEkOFIYieUj+GauAg==
X-Received: by 2002:a05:6a21:9984:b0:39b:91d1:6bf3 with SMTP id adf61e73a8af0-39f2f2b873fmr25928516637.56.1775718586944;
        Thu, 09 Apr 2026 00:09:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 8/22] freerdp3: ignore CVE-2026-24677 and CVE-2026-24678
Date: Thu,  9 Apr 2026 19:09:05 +1200
Message-ID: <20260409070919.3968586-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126130

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Both vulnerabilities exists in the functions which were added in
version 3.6.0[1]

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-24677
https://nvd.nist.gov/vuln/detail/CVE-2026-24678

[1] https://github.com/FreeRDP/FreeRDP/commit/a81d111ac4023d31e10ebf579fa34c93bf56bce5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 5f0a2536ae..82b926f430 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -81,3 +81,5 @@ do_configure:append() {
 FILES:${PN} += "${datadir}"
 
 CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: only affects Windows"
+CVE_STATUS[CVE-2026-24677] = "cpe-incorrect: The current version (3.4.0) is not affected."
+CVE_STATUS[CVE-2026-24678] = "cpe-incorrect: The current version (3.4.0) is not affected."


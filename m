Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A45D3E783
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.30345.1730838792925611358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmSGrJut;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5e5c43497so47795807b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838792; x=1731443592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moZWeT8k2pj0LjCAkF4JvscxwylQ6NuNbX1Qsjogonc=;
        b=HmSGrJut6ngZq/nagyFjNcwIZ2ZlgFwiyxPWjYik9pTaPSrRxdp/7pfFPJzd+uBOUd
         2shYYvDCPOkBtB7W8AIzAWiBp9GnQor6mssf5XOt6oCjyt+Z+4kbGdHt6NuCx37wHmhH
         7rOUbJJZnP46PTa+kRj+WmhZNHa9p6ZzjgFuEvCeuCm+DqbHlfNju5iJVftUE6iRaPrk
         nmreu8I3rsZ/9z6rtkSwqXCrjUrhhho1Ph8wJ0AvD6JRGBIFwbuN0K3r0ztURjcjbfT3
         S5dABZ3kIuTbM9Wj2+kytoGAm8+P6ITtAO8eFoXfx+qaOTpLyoWkLtCXKleW5nwdZGaF
         wu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838792; x=1731443592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moZWeT8k2pj0LjCAkF4JvscxwylQ6NuNbX1Qsjogonc=;
        b=w5/hAzyXJPp3SxdVxo8NZ4JEdP1CilsHc0H30LXhQBxHub4h9BjIk+cU2iScoq9U1b
         FSsZVRFQgzqbJCZmijNTLS61ixLaiM0qDk6mv9d5nZTRgPrZ580rhqP7A0MxGS81bt3V
         ymQy1YIjdSHh7PtdqPPhaxTlVJH738JElpvVEXPjOvJWyndboeGXrbjYexSpECDGb8sH
         +pl2KWWWp0RMV8ZNChtcg4+ID+gb5kveXfx+MhKKNW9cL6+5MDz0lJKuFjfzfupiTBoA
         alAah3nN2K2HhnCjzODohMdyIwd9e9IhrPBcjKo+WWR73idH3uViS23EY+4RdaISX6mp
         372w==
X-Gm-Message-State: AOJu0YyElQDklXEPvR1yIFC7s2EOWHq3dI3Yz+28rWbIcLqljLVqyFK3
	tp6WTkdGiIW9/v6VfCfqfHB4H6uNtK5Qga9e4vhN3W+SguSTY+oZCTFrKqhi
X-Google-Smtp-Source: AGHT+IGNQlCeyEUIDmVn6m/ggTnA08yAD2RR0gMhgWzXonkQdc57qScFfa3emcEpwkj8Y3cYAGLi9w==
X-Received: by 2002:a05:690c:620a:b0:6e7:f940:fe81 with SMTP id 00721157ae682-6ea523213b2mr221878447b3.6.1730838791583;
        Tue, 05 Nov 2024 12:33:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:33:11 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 115/161] augeas: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:40 -0500
Message-ID: <20241105202827.3104-115-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113632

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/augeas/augeas_1.12.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
index 2c6d4cdc8..14e818253 100644
--- a/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
+++ b/meta-oe/recipes-support/augeas/augeas_1.12.0.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
            file://sepbuildfix.patch \
            file://0001-src-internal-Use-__GLIBC__-to-check-for-GNU-extentio.patch \
           "
-SRC_URI[md5sum] = "74f1c7b8550f4e728486091f6b907175"
 SRC_URI[sha256sum] = "321942c9cc32185e2e9cb72d0a70eea106635b50269075aca6714e3ec282cb87"
 
 DEPENDS = "readline libxml2"
-- 
2.43.0



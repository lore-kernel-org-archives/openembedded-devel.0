Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A33C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:33 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.11864.1639668211872147907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ITnCoOW1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so22997781pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZpmnfiugAEgMsOrcDTZJ+ZcUN5NlIwKgNfOgvRgODd4=;
        b=ITnCoOW1Z3biGr0ssvbVB8BGdgdIervDh6Afy95oKpcrBJngMoSe59QDi9q+ibWFdP
         5bFFPlQAhD8V7OyoTOoEHoXZz/ulS97BxcwAzmnLGVP45ZT2u+HukgQs+VmT/gLvcQLD
         GBpOVxCw/abji6Rke3vAcQxeTllAV1BH7COPayy0l+mO5KpnfCXW3r1l1sdZwe86qh9N
         vbpSAe8Deq2jBCdYdqg3JD9rhm97ki0AmtwVJbXzHX2nE2zczNOPrNdQPnWqYqxSMwhY
         lgNpv4IoGYNl4VZRFSE28acbShoET8iFoRJo9y2MD58u1SA0HSe1Zyr/hzmIhWWRrw01
         58Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpmnfiugAEgMsOrcDTZJ+ZcUN5NlIwKgNfOgvRgODd4=;
        b=tUZzqhdlR5GDIKC7W3vAokwMnMDiKBS9Yuzaes6SbuM9YYWGrKOO/ruaMcMh2u+pKC
         7Am98iEiEODssX8d9o5X4WCzPZ18zEww5M/G8TFhQ5BfMCsOgWQ7h9ssTdSgPWlHs1v0
         m9T4ir5TVq3LLL0HxcKx8+SaTKkC4GC9FO2r/6uxkAOukIonOPrILqxQt0fE2MlBEnUF
         FA6ADYB2jbd+Q7GWpxIcgBHp8Zy8KNaQVgT0+GeZNgE6mwlxhe8X/QKCoSCHjxeBvJSR
         eqX8SFTVXaqNoWQJy5M9GvulUJ+kjP4791VtSOYQZnJPQm9YJsCC5yl6oHXFgbmjOmki
         firQ==
X-Gm-Message-State: AOAM530OfR2PXXsaslwYTbqtHg92C9cpgkb84+kn6Ldh4bBMorq3KEx0
	XhnNbzTFzScwxM0TtL+z24JzgpJGjuo=
X-Google-Smtp-Source: 
 ABdhPJxLWYqJRMPV1zcTc/qtlRPct+4NWlXbzzBBoQvfRlAk5HKpq+fx60HnLErkFyOcVZcp7prC5A==
X-Received: by 2002:a17:90b:2381:: with SMTP id
 mr1mr6772738pjb.12.1639668211237;
        Thu, 16 Dec 2021 07:23:31 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 05/18] dash: set precise BSD license
Date: Thu, 16 Dec 2021 07:23:10 -0800
Message-Id: 
 <017674dbe8f9ab9c3d8ab3122272644c89fe466f.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94390

From: Ross Burton <ross@burtonini.com>

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 09aa844891f7ffae50a8ad7112c8f64737df17f0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-shells/dash/dash_0.5.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
index 8fe601a2d4..20f840411f 100644
--- a/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
+++ b/meta-oe/recipes-shells/dash/dash_0.5.11.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small and fast POSIX-compliant shell"
 HOMEPAGE = "http://gondor.apana.org.au/~herbert/dash/"
 SECTION = "System Environment/Shells"
 
-LICENSE = "BSD & GPLv2+"
+LICENSE = "BSD-3-Clause & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b5262b4a1a1bff72b48e935531976d2e"
 
 inherit autotools update-alternatives
-- 
2.25.1



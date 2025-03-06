Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6DCC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 10:59:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10274.1741258773112236739
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 02:59:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZcMFDqwM;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso3035865e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 02:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741258771; x=1741863571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ATEG1iX6c4YDSTiD0IHODSJ1BBov+471xSnceQXKZm4=;
        b=ZcMFDqwMgaxv7OIQNzd3aEvj8aWLVeldmj5epWUsk+saNePTPkmtqdiNhA2e/EyATR
         /GQjbLFPXnlXMb73Pv88ly/XPTHo7g455HFys8YFMoASU+lfjYrIWFcoWj9Hx4RfsHXL
         fFvpR+8GnxF50KwaZc+8WuXsp5tl+bYfoKwB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258771; x=1741863571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATEG1iX6c4YDSTiD0IHODSJ1BBov+471xSnceQXKZm4=;
        b=HZkDOf8DjcENVdCSIL6y4uzQEDVlyNhN2Iaxbj/1CY8ejJ36rOEcFEq/s4VFv/bYYY
         JNGvaIMIBwYmYF4uCa5XrQezE6Oe8Ok3O5VeNDe3EWZd/ft5hyDX0cAoQK8XqBD6CEon
         uibKi1naqbpMPR2eluT6Z4xA0ot8oJJ8ScDQv1DDlA69ZVUql8kRIpQ9wIeKWICK6VhK
         BdoGzJt4qovGuADzeWB/1RzDSOs9zbn4VM2Vfk8INPCU5gXuhORXGH+NXjkhxMuFKFsO
         fDGmCiECyaRj0oYQrbe1ZRefAR+ZPguwkGVzQ6/buwzFiciDhWOdjzUOo5HVg06TwVuE
         ri+w==
X-Gm-Message-State: AOJu0Yx2iP3oXksaUSFl7W73T2c1jiOLRe4fVxbjolrQvQ4EqOpvlbuK
	UYHiswYxOri99kZ/aDZoJGUYUYStvSiT95Z113t/wV3JYMYFdrJ5v3XYg6xqkI60/VDlOjrzR5H
	9
X-Gm-Gg: ASbGncthAHqkLrzI0W+EBnpLtq7P+gw95VnvpXLd1Q9XlbEG/Z4wohpp/9A9NZZSpqi
	drTHo6fvp1PKB26hCOYpUw2MTmOn+FQ3cZxdw63aPVKdgZLDRv/B83d2JaWBZH7sMDToIZUYNK+
	IIw7DRO4/9kpCaRZHc+RjWgDRnNdmry9u7HHgXKxYeed8Hbi8ggp0u8jG8QhvkSbRa2zunwZNcb
	genYdsn1jwaqYhRVAX2CNsTJeiM31owkvvCn0oqFdpZJThq+bnRVDbmcCprRSpKffeNjgYa0f5q
	15tuG5RFceTzVitF8/OD+5vCVv4QygbfmNTQ99KWGcGvUcohlDx6+pf9+EE=
X-Google-Smtp-Source: AGHT+IEn2srk2bgd8qqFHgHAH2W14Vk6n0A1m7lOmEfQ6lr6TYoi31zUeIIxMJtF8gexSMh5eUdPJg==
X-Received: by 2002:a05:600c:3506:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-43bd298559dmr56682115e9.14.1741258770364;
        Thu, 06 Mar 2025 02:59:30 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352ed7sm46244835e9.26.2025.03.06.02.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:59:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-stevedore: Upgrade 5.4.0 -> 5.4.1
Date: Thu,  6 Mar 2025 12:59:26 +0200
Message-Id: <20250306105928.3735026-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 10:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115769

Upgrade to release 5.4.1:

- Skip installation to speed up pep8
- reno: Update master for unmaintained/2023.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.4.0.bb => python3-stevedore_5.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.4.0.bb => python3-stevedore_5.4.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb
index 07e0778aa7..6a6fd36cb6 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "79e92235ecb828fe952b6b8b0c6c87863248631922c8e8e0fa5b17b232c4514d"
+SRC_URI[sha256sum] = "3135b5ae50fe12816ef291baff420acb727fcd356106e3e9cbfa9e5985cd6f4b"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.39.5



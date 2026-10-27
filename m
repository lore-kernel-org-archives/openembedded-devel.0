Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14859.1793092886499246044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JXk07GPQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so27269445e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092885; x=1793697685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mCSxOQmuKJPTz3OoVdX+xcNmGp7XpPva/UH50K5j+Q=;
        b=JXk07GPQhgND2uMCZPD3QfaXsXNH90c4Nz3MQ6gy8E91wso0bHXpmCMCfJs6mMTkan
         wskqKGzZ21MOnNO+p02DeXQ1KyPdPmS0C29zLwK09Dk9K2Qa/RFx8oviRPI7LFRlN8fi
         8I6aG2/nSKzDG9/CM2eTNwbOdmRrNFfvQ0M5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092885; x=1793697685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9mCSxOQmuKJPTz3OoVdX+xcNmGp7XpPva/UH50K5j+Q=;
        b=Xqxwmu8VtEBqttfC8fJIXQGw60xZxzj7nC6lWwSHUPg3oBtr0yL0dORkhRIgOPzpS3
         Gkj2JIsV07Cmfsc+rV4mfqVbw7YNgYuAWYmGncsxuKk3EsiyZwtRmcLLASDViPRD9Gp+
         +l64N0YC3yZSk0wXNjg6B4lSTgjeIiMMXJ9KBRyeXDoxLkD1ciECKUE8E0APIl77tNAe
         oGm+BZEsuVLiDHN0Mi0i3WLuq5ZVQA3OqIQVpcMnPuAOFu3IKljkI4+XrP9ii97e5VUy
         u9+9ddmo2d0fGcpAwFtd8sBRGIZFriu1qfLLSowNraTq+06lXNHpHlcbvbxOdCjjWpJM
         6p+w==
X-Gm-Message-State: AFq9FYJFIDKsld23ylWdlGHxOy4HHtbElVqZ8bzexcY+wcbXU8tplkAB
	syMkPP47b88Cn7IMzkyUTYG1C1Uv4aHnhkLjXx/DMmyxcKl8pKvqhRcklnDCRxYfGXW555eMjgG
	CBquR
X-Gm-Gg: AYBFou32j1LbjtfWWt8irurf06IrfFH4BBEsAVW4kEsR1qf28qiG1Z2/edkuFHLkVpA
	5dlPpyAIwc0z9RJSgAitjjpR/66jbGrhGOh2oWeo5TEm6yMjpEZ4usda7x1L8XnTDGNl0K5b4E2
	muHr4uQPH/EWsl2hj46oKFwryAultzDv3r1uojPi6T0maPjlc/KNUvA+ThRRtVDx2SJUwlmJq/K
	OMaFtKx4/VXEr4gXBYvlxPRtNIIYIu10xNYBxuDk96FvSC9RmmKUGwwH53sNSTtjFUUBxE25zGL
	1igScv4UZG2m34sCybBLt3Y/X8Lxq0PrEdA0bLY5oXLpUpkqHR7SVbn3eYV1VNIngQ1Vb4nbWZ7
	3NyTH6mR2RkEmRpD6suMka4Y2ty5BSMmKyUM4/iVREIHjKpqNNvIDnjF4+aB3WPBnfeU/j+nLZ8
	TpjEZD4EAKR6ZpVPrqugUKEBj5ciMABTziqJTTmiLcm05pZJ83CmKWkywOrDIP2sPETiD5rSvkX
	ke3Rc23ikYgbK78UI6djktdax7DksCrdx3/IGxMxVpgCl1jkHaQyszibr7q8PcdupnQRqflodCk
	V8Z3My2IY62bEG4uJClvCknJtYO1FMGCAPsathewLDiqNMA8J7eJBq3+K4KzAp913Dm9Y/4I39Y
	tV0LM
X-Received: by 2002:a05:600c:3b19:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4a35acc7696mr176039745e9.18.1793092884845;
        Tue, 27 Oct 2026 02:21:24 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:24 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 45/61] python3-texttable: Upgrade 1.7.1 -> 1.7.2
Date: Tue, 27 Oct 2026 11:20:12 +0200
Message-ID: <20261027092028.782979-45-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131509
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.7.2:

- Recompute automatic column widths when redrawing tables

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-texttable_1.7.1.bb => python3-texttable_1.7.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.7.1.bb => python3-texttable_1.7.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb b/meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb
index 65472dfb9e..6815554d00 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7"
+SRC_URI[sha256sum] = "dc16ea6b35fbf5291ba6ef79d79e37d9b3ca6acd7bae3ca3450488d7c2e19c99"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


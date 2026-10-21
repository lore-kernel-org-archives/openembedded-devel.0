Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8736.1792580505922267734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZIDCpJJz;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c45111bebso386650f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580504; x=1793185304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O5xbZN8Iw9MBwN4Ecl9DghqdTe1glIJ+fvcbXihpc6c=;
        b=ZIDCpJJzoCmVRpyQyOrWL0c1AViMsz7SjTEwRepS6ZgQkY/k8imCNoQJeShUOzOeNw
         ZNIa/M7hJc2yC4zyrk8d2QElcQcVPYyrNOw+sTU4aUhMBDIxwGstbXbRUoCJXudxGMgx
         x72QJrGHxTHuLq/0gkqW6aBMjamRjgSUgqV0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580504; x=1793185304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O5xbZN8Iw9MBwN4Ecl9DghqdTe1glIJ+fvcbXihpc6c=;
        b=fIQmbwdvJnKxZldvzxGvpYdJVtrKMg/mX5Tnn5TIvriFHNuMOK1uOnayjwGK2kfYLI
         QmeUwl35oe3122T0ydKp46oODffKy8V3rtLH9qPpCh8jJnHlOUWkXIIRDxBeh7juta5u
         e0u+AvB+MdwVpt3ee2AWv0GQmv97d8QwBsI+NCDQnInRW2TrrfiAf/hsWZfYhjfdCFgR
         jJvv76/8Q8RUo7DOpddBfHHWDLW1vb7wwOafWSqcQkEn3eQT5sRnGt5b9/1jYx9GQydf
         iOfhMlP09yquoTJPoCqkA9f8MBlNiyI2R2gmJH6cHJNU4OY75/hQPYK4Ukuoxy7YyqO3
         M9WA==
X-Gm-Message-State: AFq9FYJpnN9oRFVHJ75p4yLHnzBUILosTcjBu1v45hth140v1Pit3RLf
	2T0iUUONnlE/ByB1dUnmcBTAca0s410oQTiA6SdVpOcNdEVBO/6frT9lj0Vp7QTJWEV3xuwXVkL
	1Mdck
X-Gm-Gg: AYBFou1BgBF78oTAfpjoeX/iR+z6H7U431BlDd8S/G+YMJYrczvxzWeEij7W6mjFf7G
	nN74hpQUAyLiqlAD9SWtJv+iTkOQEz8FJYsPaWG4OjUzpT2lufZnnYpHxhdlgt0qRn6gtGwgXyg
	WmdPfmM8232NKyAkPNRSAUoIC1/wQVDr734TRqSaSfnBB18A5vzHPxV0fyhHEBl927n+WJ7dHGH
	2KcgBmZ+4bZQ2T4vn9KBkRwimMnTcq2OHpcQOe3MFawsKdaNljp4i3FaNfmFTGXSs8Yww/38s2R
	7e0wI7QsdmLI+EClqjp0toEZHFgxDAd4pI0EezOv6duCszAo/d/TLFKLJazR1UcuMbxt9/j6bJ5
	HdxULtbvf+ZwkMdeAHgQDkl2f9CIfLJwd8gE/WeKTsFFhisOJhijkLaIs+ji2UW8WdRo4lwpipV
	aHJbNDHUrd9eXmpamDDymyI0bBSi1xa61z/3m7DDjDIiWig81gnkBU03vSrm/VsFZ8xDtJEnpf6
	mBrvENlID6j9Vk5CLUgq8xWpUm64qcF91xrThSHi+0k9zITs1YcMODQxCWCe3cf38m5E0XLdPbb
	KJxG+XmoMGimWUhYGlDwaEuVcmD+5AH67LDvVTsu/gWuWFU6DTGDJy3144pPWCllE1rmD1iX8tw
	x4x3n
X-Received: by 2002:adf:e183:0:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48e264d6d37mr3605411f8f.41.1792580504113;
        Wed, 21 Oct 2026 04:01:44 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/36] python3-imageio: Upgrade 2.37.4 -> 2.38.1
Date: Wed, 21 Oct 2026 14:00:43 +0300
Message-ID: <20261021110103.1943456-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131278
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.38.1:

- Correct v2 format argument type hints
- Drop Python 3.10, fix PyAV gc stall, temporarily pin pillow on
  pypy
- Bump multidict from 6.7.1 to 6.9.1

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.37.4.bb => python3-imageio_2.38.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.37.4.bb => python3-imageio_2.38.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb b/meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb
index de59f27c89..d0d3166f2f 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.37.4.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.38.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6c492278d46e42af592aa26d7cab1e54"
 
-SRC_URI[sha256sum] = "e45cbc5e83502047fb138f7f585f7f105a136a57eea5f4b3cfc6ce1b52720bd3"
+SRC_URI[sha256sum] = "6769f1f01c4dd46448307863a787c9a22fa4dbe11c0c88f525c6e410fdfd7983"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


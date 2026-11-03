Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1418.1793731022264630802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r23vOJfJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b1ce85287aso2452121c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731022; x=1794335822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UU4P5rUIZnJGhKO0+C/SH9RMumHEyhRgAOLXoiVGr90=;
        b=r23vOJfJk52/xDsg254rmJNAET2GJX1LtkliX5yfyhVmoy4tfrUWdVD33CF66qiFL1
         hsLXmyZ5/AZej/Ob7bG+RreV5Us+5oB00OusES0a5kQJloF6nkzDtfdQCfME/VbrgJbs
         mnFfMXUdQhq1BT3YV60mrhWB7I4mbmz5IhtQFKXlG/bcDDPDyOaLnsi0Ed8d3ybBxQdl
         ZN4tJoFoCnW+XrsOrFeNSDwPBsNv2lZAFvgO9DVRgkBAxHeEpLfjyRb9XJ2UZn+wByag
         lhFQKvnhKruXtgjUy1dEFPPpkjRYBxZ03V6ny8/QfstXxv4TUjigbcmSD44IVQS1Y2yN
         9ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731022; x=1794335822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UU4P5rUIZnJGhKO0+C/SH9RMumHEyhRgAOLXoiVGr90=;
        b=EdHLnKT7dW22qWfvnhe2FHtUsphNANCwEEQiQGsAYZAMYJVFxV/TIGoUDfXFRsTvfe
         GjoWp/9dr4255oAbUax7Iy9fOhnS+yXKLeBJuoqffYUkt9U941t5rVe7jtIv1/MG1c15
         BQuT64ye91LdWEsGwwryqngghmde25CXkfLPn6dC8w32oY8pZv3185hkrN1pVSB8YQuY
         oS7fmjoEDtstRHtZOky7WTza48yE+08AYrd/lSVzMCRkLvjvOYPmGf5lpvVJDbbGaROV
         Z5g93WOESmn1JP4i5mTVTdkmuzI+AHPOkw7JoyWVd0HhKaz6kqHkfHs81KJb5HUBm4fg
         I5qw==
X-Gm-Message-State: APuU4Z8ENZhXPj6DvDfjf28opUctJc+sAow226VZkRob9jTm3cGrZlmT
	Pas2vrhjnyXmgge7nb8sEuXQaC4c37JAzv1okyKA2TYXfjEiHiq6TSsG60x0VQ==
X-Gm-Gg: AYBFou34UDED+oyZz/b0fHqiRtxuB9czh4xxtsPag+RE4Y3EIi2my/u3pGdYJNvSyyP
	eiE074ktXORzkwp02BzUYQxAEK9UnL6R898E7CtCl7Lk0zmXJby+L/BZbfDwRrs3csPMwX/UjEz
	UAfpBvW2PCKSRwQU7Vyyc2F5eaBP/ZKfbeVXUQljAVElzlILmvqLuriGEqhylJGIWi+za9F7N7o
	AVjwA2oQXEtHsQ1zA8UIzv+Qyif9aBQJ1sLMeGQWMK7fVTTJQZXj1EqzKadpA7+z6jIgRjuSeba
	0SKNhxXUdz/5E3GbKESJsxAT5bX2ZLFxAb25yiJwFBzKxKLXgLwTjlMlE5NjZkLk+iJh3V87rmO
	s2fBLpGiqeiCHEkhsteXceehX5uldoiJiOqzdvuLJkOF+Xf+waF0saqobQJp/voWlU5PSGDGbaZ
	gUx7/3aYL3IlSpW6twFABpdIbdY7hOS9F1A6I/cadHAGDXCch6HJXcjgY7Yn1yaLjNIj6Ojbx6E
	L4fSD+9F7ZKYMQW1sliqhRnnVmHYeNmj/1D1jEOZuyHul6MR/O8LgGgvmL9JagrCl3k6yrQsVdG
	KZnN4pCf0L7tmE6lJsQQaiaO+4PA+LOwSfxEuq+voOeJvK1Ug7JKNtadI2w7rQ==
X-Received: by 2002:a05:7022:68a4:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1ac5d1d155amr27526524c88.24.1793731021462;
        Tue, 03 Nov 2026 10:37:01 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:37:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 8/20] open62541: upgrade 1.5.9 -> 1.5.10
Date: Wed,  4 Nov 2026 07:36:28 +1300
Message-ID: <20261103183640.919438-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131806
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/open62541/open62541/releases/tag/v1.5.10

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../opcua/{open62541_1.5.9.bb => open62541_1.5.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.5.9.bb => open62541_1.5.10.bb} (98%)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
similarity index 98%
rename from meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb
rename to meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
index 7c3eb85aae..a8cce65386 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.9.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRCREV_FORMAT = "opcua_mdnsd_ua-nodeset_mqtt-c"
-SRCREV_opcua = "05c2b389b65cc35884eb40d800301af1f3d130cf"
+SRCREV_opcua = "93c3bdfc9ea4718b503c6cbf57876237addd0f2c"
 SRCREV_mdnsd = "c1be962b37e4b952625d9b0a873e5ca619b1a35a"
 SRCREV_ua-nodeset = "257db9ad98ee7ba4b67d3500b54bfc9d744a36af"
 SRCREV_mqtt-c = "0f4c34c8cc00b16cfee094745d68b8cdbaecd8e0"

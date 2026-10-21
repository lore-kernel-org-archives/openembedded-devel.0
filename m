Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7534.1792574965379475770
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mxKIvpz5;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15354aa70e8so1570391c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574965; x=1793179765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=mxKIvpz5yISkuSaY3I9ZlerkUn2xT2Vc5RZNP5ToxbI2UfAR8dhcuCGl+XWCQdtnvn
         fS/MPeZ2IWLFFZ8EXLr6a2nv9dZlaS/j9HgzRKq9c0dIAdKhaxws3W2qSO0Lt9a1bKoU
         V3PxFySxfjTc46CdG2gzSGYRXL0XIHa4f+66ZBnJ0wm29kmoWFCPSd/mZKIOw+1fuUy5
         8YZYZHrKEaJnsWmqYKeMhoy43tGLoyf1r9oy17B0xZYQnAFafelQDNpwD4ssSua9kTpT
         Utay6YnwUc7r4PB2wpjFugs0cqZyCFW9i/YfnXvs1UzICVo04ABLNbSEfIxpRPNnLIFa
         GsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574965; x=1793179765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uLxgzOj5PVjJcA9KrdjjodUQeMPLWlydBZ6fmvtUig=;
        b=e2D6/VYVUcH9PVKTBRtu/6Lh4qIXhaIXW/3XqgGshNHIcUjJc2mgvMVvQWOzPl3kb6
         NBQQyFsgRq7kLdj6+rMnczJ69aGHtnHmNZrCGpPt62ZwmztiaCvrw2j9DmRKdIBR3fkP
         Xknw1knxrYebSDOwiMMZh+i9kFbhPgpmoyJO6EkPRFDieAAyZNey6Dek1xna5Pxu+rY7
         hEozbJVGeCG1YaHKWE/bLYRwcUP47v+GkDCckIQnSFQL9TYQBHH5nCxJ1YEe+AKcj5v4
         wEm6T6nx0BWLOrm4M0V74TTv/xe0466+KcuXdRhXh6HxqUQ30CTVA7oW04B7EAPSKEDu
         sp7w==
X-Gm-Message-State: AFq9FYLaf2aVVV6jpZoCldheA7HCpDCl6eQ10DCSCxxJthRAmixPObM7
	Ujbkqw+Fk4uB+BBHDjnkqsFYNAAEv5hn41UWNKFtSgQgUZDs378hFyXkasjjjA==
X-Gm-Gg: AYBFou254YXmYrNdQzPohGWCdVF/tc5/UyXmB/wMxt/6mzDIZSMQoGGTLY/f8uZBV0v
	ElRNYhmHwriyXeNaV9ZVz3iQm8vUXGmL/gM8CaH7B1cX4QJpt//pGh0dbsna/hp6cx4lsCqmBz4
	Ksp79RO5sLnpTlVaaNiNVGkISZI3AiFRkT1pXI1a2BSqJLyIUlMbU5IYY6jgI5w8mRUAgcAI9nZ
	osd+oBHrXqpoEMuJQocVIiRowgr/tjY0UQzACI3yl/7bgQrkCPVuqkABAXM3otowtptLHSgs7Fx
	kJ91SKSPc4VG1RUgMb4l+ha3EADYCo9/Be4KXaG9Wf03iEd2F7BX/3rIFxRPwdCE0LMv/TnA1Kg
	ZGBur5TOSd+k9OO2eFHzSftQTznD64dK9wxlA9Bzg8gYjYSYisK70h6cpmX280oNETzX33wC9Y0
	IpGVbDRMIh90B8YKpuKA7QW+5SpCDTcmUZ5NztbUin1K2DEiW1dq7IqIibB7tDXtDEDBuWaeckV
	a+oiHJgOZBYoqbvjToeb6+YDF+2dnG9dUOn1UtoHSIg/17dLKe2jTN7wyZ+PIEigwsYRxL6YN6j
	zGKUWkbPdLPqua8rUaXMDfi4seQpGOXZnw==
X-Received: by 2002:a05:7022:929:b0:14c:be8e:69fe with SMTP id a92af1059eb24-190a051dd50mr2647288c88.5.1792574964724;
        Wed, 21 Oct 2026 02:29:24 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 9/44] spitools: upgrade 1.1.0 -> 1.1.1
Date: Wed, 21 Oct 2026 22:28:22 +1300
Message-ID: <20261021092857.3585453-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131196
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/spitools/{spitools_1.1.0.bb => spitools_1.1.1.bb} (87%)

diff --git a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
similarity index 87%
rename from meta-oe/recipes-support/spitools/spitools_1.1.0.bb
rename to meta-oe/recipes-support/spitools/spitools_1.1.1.bb
index 69f527a6eb..e2ab0a5d11 100644
--- a/meta-oe/recipes-support/spitools/spitools_1.1.0.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/cpb-/spi-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-SRCREV = "a19dffe44fee857124a993598caae0c85894f914"
+SRCREV = "74ba65b19e0cf9d1eabd52d17d842200ef901d61"
 
 
 SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master;tag=${PV}"

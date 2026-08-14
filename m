Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EBBC5DF79
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:50 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24519.1786747610025014056
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DN90hDmG;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caed617615so21591515ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747609; x=1787352409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmS3v8f6vYpvT3NgTaxwPQL5RlCG/fwOwQEFXExoHZI=;
        b=DN90hDmGreczWkQyqqkMdFNrNZhe1wQV4LVYNFPQ6O5FfshMWe2RLLvmNpXQ5EL00j
         CdJ72dUWsbeI8d6UICKLKAjz09rJFlgnGseQBLjcJpcWvKkbqvmOtXl4EB9WRf8u4QYB
         P/KgFduFl8iJBUhS/+H5EErlCnTtn+bwd5Mqf6ptFxcVe5PEHPk/RdOZ3JSUJFcptwZN
         xWKpHxDxfIzZ020ebU+7F1XSkf913IqCixiIi/7KGjACfor3KKgxYxXeEu00dludLuBU
         y3NmsZe1oFB9BOcMqYuo+X6Yvqqr0/eKoOzY82qIXzyPPUw7DPSdll4PKgu9IRFfB3qp
         4pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747609; x=1787352409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmS3v8f6vYpvT3NgTaxwPQL5RlCG/fwOwQEFXExoHZI=;
        b=K9S31yeRUml1NUP+QU9pGwv5/BPoU+Bg23i0MIwrjMX4GQE7gln7QWPIQWdZF67t/Q
         91LiLyzDxmxcblZIAiepSzMQ+zGItmyKx/yM8H7CN/tDQj60UwaqH0nqASK7SGDIiEF3
         dM06syuTKrcR4QcU3kDIEdTWtYgl8e7NzTq4hPMNBFH8sYv53sTyQpVlM56FktVBSIil
         Odte7VKwQgHWV3LP+UXR6JSZw93i3ITvbPapPgSXpsN8S3ig5koYLMK52qL2WQx5bxlR
         3KuckjLzffIJWNPfPKb9Smc8NCMxDStPTOSpXfzDOVIl3OrhVjIuektTvqos2o+L+qNM
         wesg==
X-Gm-Message-State: AOJu0Yxj781wc6KUqOeLy6LBndnniqJagbEe9FxHDzmpX3RG8fa72Jc9
	SNGblJKuQYSC//PDxXoXOXgqD0QHlOZSIRRhozZwm3fPSbFKmBmMum/gilDyvBSn
X-Gm-Gg: AR+sD10itzX9P0M8ohFb1iZdNB/md6beJRRhNrB+pRoME3QqamTzdxl1QqJitlWqa6j
	gxd4wYtLzD2OPHPWyrp7WF6d6dkUFP3rNaoI/XuVwxH+JOYLOpxH8PKKaKfyjwO65INIkT57wrs
	KYa1rNTKA16Eq/goGNlZg/gSSVqdSIgIhZWW6raPK0FO2/MydCVWYjyzcDYQuOrOq8Xlu1jfTI6
	LJaO0dLnXvhZxzMiq7LmfviFGI3yFUEP2nEg4fdcjyR3vRJVqBgt6sP3N4yx1trtFsF8o4LFVpM
	iR4EjYAIKMI5Qm4eYJ5/WTLm5zuNwAajeV8McXWZgPVlLZcyDWD6DMZrD5iJRdiEi+1ZaiSC722
	hag62fs0hRUZTCjDrL7YBKB71kVgwSLdN7m7oGzQKDBKx1OYeX9bRWlYKdssD25VlF+BxN54KsU
	5sRjSJCSD2DyEkZR9am/PG+sCT107SshOppLCAjxFjDSBpOPJQAzGXwd8CU4eHd1if3rbym4DkN
	MXvxukNwA7xabTe61Zxbe53p2PHqZrO8fpKrIHmR9PsPE50O28j82AKghN+h3cGbd8IJ9y2CY8d
	l1M/JO+PbGgR4wXqmLkDK7jhO9D4Uw5z27PkfSKmS4sjiebDB6F/HUst/v/arpLyXHkN4IqwGkh
	w0StfVCSYGWptgevW4kebbO6DXiatm6+oWOkUvVWf3XN77Q==
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3cc71d533f1mr10576324637.3.1786747609366;
        Fri, 14 Aug 2026 15:46:49 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 060/109] rtc-testbench: upgrade 5.4 -> 5.5
Date: Fri, 14 Aug 2026 15:44:46 -0700
Message-ID: <20260814224539.1523174-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129124

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{rtc-testbench_5.4.bb => rtc-testbench_5.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/rtc-testbench/{rtc-testbench_5.4.bb => rtc-testbench_5.5.bb} (96%)

diff --git a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
similarity index 96%
rename from meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
rename to meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
index 18c65d7875..6aa2a76a09 100644
--- a/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.4.bb
+++ b/meta-oe/recipes-test/rtc-testbench/rtc-testbench_5.5.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     git://github.com/Linutronix/RTC-Testbench.git;tag=v${PV};nobranch=1;protocol=https \
     file://0001-CMakeLists.txt-make-BPF-clang-and-include-paths-conf.patch \
 "
-SRCREV = "bf016fdf422094f1ef65c0d88f148f46663ebbd8"
+SRCREV = "b7541b4b93b4d9fe6f395bc53d3cb50401d406a4"
 
 DEPENDS += " \
     libyaml \


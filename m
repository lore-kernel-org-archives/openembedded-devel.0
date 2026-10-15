Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B34CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32800.1792043000753852380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ltNqtOsS;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso11431575ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043000; x=1792647800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FoArhE49vCg0g/mnOsPCMqt0Cv43GTb/2k96P0GEjQ0=;
        b=ltNqtOsSEb4uNLkh+lxA1XFafTQHO1ZlczR+Fw0UfG2EAU8X+91C+UrSQCU6vbB10q
         h4jW1wUclM+JBf6rowam/P/dze1vKVmPOMoeG8SBYLQXY1dSo1xWwTV/IXAPDoAsrx+U
         qrYXofkX39+Bs118WNoghnvk++2JvuXMO7MPV27IYUPMyVta3l+VOqytwBs9hZSepqOn
         MKNoyGMTpmZf4U/yoeZIz8EZHsTGqJOx8A4ltQMH9hMse9wpt5q0A/MhYVG6KTcgo/W2
         Ksmc+L3gCtUJl/AlhBzl6c8L7EJINayqMQiVQ5AaS4SujDvP4K4UR9QqRVmFx4ftRUlY
         78Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043000; x=1792647800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FoArhE49vCg0g/mnOsPCMqt0Cv43GTb/2k96P0GEjQ0=;
        b=kby7aw3u1M8C+f2L1My5ev3o3C54M0tabuBjt3tVvSZc26UiifjczeGBVsHhpnBkco
         XWCde8ByS/cf+tUPP3vSsjwFgZsD5so7SqK6s9K5wcRGAlD2iXBRyBWEouHgsB3tRmPn
         2PB9hurOiuo/UsOdNyL1AGJ//nacJx8DgqMN1K3/j5HVl5E1jqScwp89QFxwbGVwyHet
         oFpoROEmQ9SakVDa+Z2w4Xvn52PmudiTmsCfyEV3GiZANfrOgUi7UWYHsh/cuWXLiBMx
         l9IF6b54nNZ+av0vxEFCjoI/XCxjxXpxutyAIKdVgYAv1rTGHn8B8bTz8GKaSZCVQ+bK
         iT9w==
X-Gm-Message-State: AFq9FYK58EtKY6J692dWrHmliokYSo08lmUmvXYy37R0H1WpHM64JHAN
	n3S99equ/8gvGBmnSEcnbntmu6fj4OA+agoJtqzh/tz4Pqc/Ue6iZRIgilj4SA==
X-Gm-Gg: AYBFou2L8ypzr7Kl1R0S1UJ4d6430l9SrczYSxJPNkK7nv4LfIDgiX2avbs2/NqR7yO
	rn9xcu2N4q3lk+ZXKjWEWEDTjb+uQJIr0IventwVy2zJVXaZpj3DvXq0OPDU+1gFsYVnH5FR5Aa
	l0Lz1UCHw0iYkInrKr5gsVDHTpebDP4ZImylGAQCtvxINsU/C0TfnnWlnc08cB2D/7PGiAk5Jqc
	NjKN21lbZ0rsFTK8Ht9yD/GD1VPoRdawAVDupp3onj4sUqcctZLQJUSaJ+EuqfI1J6jimwk7qc0
	8wJKPM129BO3uviEWK5vs7x5YaA/lLgGvKl1sxEZX6jTJhW4ZfQhQ6iiumHt3XxOORlXstVb99e
	kVRpmKzRcwi3HRK25r9t6VpRYGIBMfD99T4HNSowoWCVXgAa9nDiAiHG0dmb9c0TDTi+SGJ8wZq
	D9/Sbr1CoNTCgYSotxVq1BbfC0U57pyShoMAQl6xpQeNypSpSxKUibxxGEwiWLkXh81MtaLWebq
	6Gm81kDJAu3YpH93Yqw3vg=
X-Received: by 2002:a17:902:dac6:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e842e061d7mr157375375ad.55.1792043000098;
        Wed, 14 Oct 2026 22:43:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/82] bcc: correct CVE_PRODUCT mapping
Date: Thu, 15 Oct 2026 18:41:03 +1300
Message-ID: <2883998669b316a1a51de5a3278e4cb568fbfe7e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130935

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use "iovisor:bpf_compiler_collection", the exact NVD identity for the
https://github.com/iovisor/bcc source.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.37.0.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 8caeef90bf..eec8ef4a32 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -91,3 +91,5 @@ FILES:${PN}-doc += "${datadir}/${PN}/man"
 OEQA_BUILDPATHS_SKIP = "/home/ubuntu"
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
+
+CVE_PRODUCT = "iovisor:bpf_compiler_collection"


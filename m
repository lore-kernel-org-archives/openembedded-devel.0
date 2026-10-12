Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FC6CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:43 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3491.1791763841494160548
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Iwfm1OVs;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso567176a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763841; x=1792368641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MR39kHT8Rwj5ttSiVFLB95sc/8LyJ4pAhvdYOC3+C/U=;
        b=Iwfm1OVsrm899m8ln8wBWnN6/mcQ1Mf5qicihI8E4KH+C93d0PjRQxVanxPfAcoMLp
         +c/b5ISk6Y1zmvKo35C3fbDJCzQCfGKuH279k+IGg9H0OmJp2p56A9fvPMEUzJinhqaD
         +s9q2vkdEeHjGSCvAvhAOgK5zT6iahSS1o+8Cm9fElKDvsPUlDYbRlZJFPTO6gNRKMqb
         FHhFZ/w2CNvI9+MRGDB1s2WdLfSwDg5PhsN493Gg7TGBh/a9+Yw19pRKdSuV1xBJ1k1S
         HhtV00u9A/ljOm9e8e0qreWFl8HydtpfQPyy6BlzIBmvAUi4yQZ0EifyNClbSinFyY6N
         39tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763841; x=1792368641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MR39kHT8Rwj5ttSiVFLB95sc/8LyJ4pAhvdYOC3+C/U=;
        b=ci9zoK87RF50gIbQJmtAknysRwAhIAy1q2KgYbvD+Y/fHLSUuP0DHHdpfbdOroOL6Q
         R1zIJtmrpfNQTVEAtQGjZR+rAGt6ymLfqA+G0i0B+/bcZqRU/HVpBU0ouKttbwao/czD
         yWiQ9saz5ohMizqyq7e0wrvzV1SLffhC7YMxxQQniqgxAD5RxtsD1Qe75cGxue2bC+bU
         gQYkKHGPFWTeDwZ9hpYpjSbUMxzYOfKCrQuAABNg7upE+l2L1amqpKQtOeDKuwJW/EVT
         0GZ/iFsJiNA4c0fekLVX3030YkvBvTlflfydXtj+VyL8vOVMbh8iJJ4KfN4WsDGwnfa6
         edKw==
X-Gm-Message-State: AFq9FYKcU8oObl1s7OL4JnsCKeJZ+sKH+GOv09K9mJlUDYAvp5jZ4Vi7
	MK33dvvEIm4q9iQqce9+3z2ZjF6ETkOIxe8lFgwlJrrf4ooZwa1avB9vgqo5eExcJ3A=
X-Gm-Gg: AYBFou3YXaMRzqPeLE7NmOJUfbjD+cEtMB3UQmo2KZ7hjK8JfQhQheCwTjV7XMAvxxH
	cjTJQKPVnQFf+f1D1wPEfCPyLDxeHVxay8KsZr/ZlS0Y0q+lrAihPzAZNBSWXhaYmrrwkSWINbW
	pTdlsv0GdwGXQxszspcXeM7UKxBYRXqKuJagHxtYOfmyxlu7OhDAPbnsF3YaCYSaQ20C1OU4/xT
	il9C0AiQoshAFQKCjkfmwH4hH/Tf0/zJZBozfdYId0XIh0FoqGgAlytzSv8Jej3mFbgqvGxipkZ
	na4wiJuODI9qqMir21MhZZI5LCC5MF4GL6HMhKiyxpxueIUvKtGk1p4D3uTJazWZT6/Cbc0F/r9
	IiZWb93xcsTsHeH9G/pC+B0Lce4UzqeisxvEkJyrFGPcuyIYD2qP3zLTnR7aFuZaNRJzRyZIJKm
	3G0SxvRM8vlFd7GL9+4PUqCQcYzhlD+lnmDg8eAb0UDWTMs2FXNeXNrGjR6Pyu5tRYyadyAAFZH
	y/CyEbdHVfm9l66Z0q+1JtfcqG8xMlznJzr+tg=
X-Received: by 2002:a17:90b:384b:b0:3a0:c276:1ec0 with SMTP id 98e67ed59e1d1-3ab3a9536cfmr6022377a91.28.1791763840790;
        Sun, 11 Oct 2026 17:10:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 10/28] gpm: ignore CVE-2025-4558
Date: Mon, 12 Oct 2026 13:09:48 +1300
Message-ID: <20261012001007.2541673-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130735

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-4558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e134adc8f3e5ff7359d7df04c4a841e4d5eeff15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 155e56bdefe..9c07f334b0e 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -42,3 +42,5 @@ do_install:append () {
 }
 
 SYSTEMD_SERVICE:${PN} = "gpm.service"
+
+CVE_STATUS[CVE-2025-4558] = "cpe-incorrect: this CVE is for GPM from WormHole Tech"


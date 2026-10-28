Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36215.1793161539261990898
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kfTcOUup;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso482603a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161539; x=1793766339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOAX1qtHtE3urSOdXzpda9dKlmJun1VpgJl8QbWETE8=;
        b=kfTcOUupVgP/9cozNAnXEqlfHSeHI7qYGELVCY14qshjir/QAsIwTkWiT+HPmxDFh6
         RQxhH5UuWkdXzH3uCgDu1RiI+AhJcLJjVyCnVChDvbSpSp6EomMElPAZRfL9p+y2eNoE
         Kb2CFSHOtkeCNkE3Q+0C8rS4ezXzzTDKo14BE9Wi9RaQ3//FNE4XTdES/mH4Sz4UIL2V
         xxPvIB+n7gvq0riCICf7y1VWSQm335UVVAnIMro7KxIEzYmdP5c7/9oAsOjUDq+V0qaY
         oUqYZA9xBnaNqRwJdB4/24HT6a+vqfmJjdoMWKuzuI4YIqPCDfpIsrhH6A8x8Q6A373y
         6YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161539; x=1793766339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOAX1qtHtE3urSOdXzpda9dKlmJun1VpgJl8QbWETE8=;
        b=QGwa8e9wXmm4VkgkVOwJNq62WaPA4dRbleHAoKHqBKSzOAQhn2uO5RXoY/kBD2vV23
         qftP0p81GaYoebluxAsE3dMwgS+Ra6DMzurSJsuVwhbR71NPV82EpCwU/LWy6C3Nscu8
         EFijSkkDiXEBBmJb1fFRN2AR7yvYN6ZX1ausks4cY0g9Rp7DE0Fc12t9MRA/QDqZwxOS
         f7xfLu/UFEfxcDRzaT3ZpQYxrWrv8a2W7SoYUxJq7sNp3IYCfIUutg+/QC5k730hNL6v
         UTl9XzO+UdGf4/i8pGbngLci/NxT1CgeyMP7FWcAFSfcHUAJxyU9drxUNTz1ccU1+5bw
         L03g==
X-Gm-Message-State: AFq9FYL8loAsQ/6LWcDLkcoY86MeEjqjBcsOOFP8FcMmaTHDyM/W82Za
	JnHIdP63GoriTUT/leNZ072716zZ4jXM7btlBPakNYiAYXu3AL11LmiEdYk3oA==
X-Gm-Gg: AYBFou2UQKvhAdulo1duy48ZMe8fn8QgqUi3GJQJR8KzR33E4Y2o2U2MqFBZXg0W66x
	W4LSjs4vQV3h6PC7u8ISvjRgEy5YSCOsYxM5DHwvSGfq9Ot617t0k6/b9FGna3UihafN289+3Ol
	R46G+bDpeWhSHKDqiBgh0LRzI8TexdNpRXSHkG036Gqx1PmnTSz8/J2sjW8Icy1Oqtj+xsJX0CT
	60ciUugreeY6YceSavyDQgZo1nCVQCPnYGzQNYubqRelaKB11tYuLTPcfaizOB5fHZUTsPmQfyP
	vfny3YRppfoWR64MlxKGYgWUJBZgiDwJzc0SCaoFiAsnMIpsSouRewhaz0kO7OTwjpJgQ6G2DeZ
	9phIiddb/N+UuojIErowpdPjxNbu4CDF5Z1l4XRjhj3/js4FwACv1IAevksEQY7g24BXoZzhNqX
	kyvElI/eb96f9vJeeuatDCVtA/aW/D+m812aZbd7z6HRhkp4CTinvpuG0afJK9e9jBjeax0RMFo
	ruVbZ5Ym6qzvcHyVa+8yKF4S71epBENi9zLp4nQLj0+rebmjOd5Hi2RCkF3iTh4/d2kATx708S6
	YvA1gzuvAo1SwXHUYSQ3iOF7nXxNw3ojxvYavGUESVn7ij0ZMjHi9ihi7kq0Yw==
X-Received: by 2002:a17:90b:37cb:b0:3ac:9e5e:d1a9 with SMTP id 98e67ed59e1d1-3ae581aaf2bmr838239a91.20.1793161538713;
        Tue, 27 Oct 2026 21:25:38 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:25:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 39/60] ncp: ignore CVE-2025-14577 and CVE-2026-35087
Date: Wed, 28 Oct 2026 17:23:37 +1300
Message-ID: <3e1f043594d015469be6889eee1bb2e9b7c5818e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131591
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14577
https://nvd.nist.gov/vuln/detail/cve-2026-35087

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index ec6d918744..19fb258aec 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14577] = "cpe-incorrect: This vulnerability is for Slican NCP"
+CVE_STATUS[CVE-2026-35087] = "cpe-incorrect: This vulnerability is for Slican NCP"

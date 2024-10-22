Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6F3CDD0D8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.21954.1729612098585505202
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSG4muRP;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fa1f82fso54604917b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612097; x=1730216897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAp7yq3tJ7tNm5EICurx5STUqktFohqKhek3Ry4d9bA=;
        b=XSG4muRP2xZ1dWc+WGHure/ss3vDEc7n5yjlpbOOBGOUFy258FtplsrPoFm/9lZHpS
         gnKsous+VFkg8mckQ/sEfsRE/Kf5gO6jhn18PKH3Cb6n9bPcLnyn7nweq/kkXRSBsC4r
         /CVLxcgV78b3Saqdu2OLkNexjswy5rKRFO5Cnoigf1kR22kzBnZdCWJ/GLU1jWDQjF1T
         ontocZa8f4bLgIKjW8x+RkeeyiJIla567KYxNJ3Wss4+Sfe6rDYdZIvLiV1FRvF9wpHU
         eJlporQJDzWGho4esl96Wv29bMNMXUzgkR8Q4daykV61Q6Lvih5LezHh6MoPPOjibBiD
         xpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612097; x=1730216897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAp7yq3tJ7tNm5EICurx5STUqktFohqKhek3Ry4d9bA=;
        b=Zlx8VQNpf4jc3AFBCRQe/Nn23zq/gJ4IWBzurvD0v25EzkBsVoWJ+xsPrrp16uKiJl
         09h5AIQMcqY98lIh/M/8k/z9z9SEIbmZQNb40+IMqYzsTakqLxqjZLmz+K4P7BVkYeAj
         VmSJ0NpXD9Q7bVIswI4PxFcvthUeHOeVKWlCCL8GDampaqJ9qpV1djirRKXmqlsdD74l
         gCHnf/jjiXiyuHdf9o0/fQeuKIqfPvevDooONmnyJ6N8toUFk6+NlHM15SATp8J74lRs
         o49QWUCHe159IYcRClbp5WJ5tViXWAbBTmK0xJz0L3IKHFfk5h5zuZB+r4OJbXKB15r2
         R/nQ==
X-Gm-Message-State: AOJu0Ywrl7umD6AG/Ju7VGPIeNoJEGa/JGpypazWMkCL1ue3v2fFYTh0
	lrHmQmUjmDZaHYyTVV8jJfuWF7971OBYkUsE72B749fHy43IUfpyR5koAg==
X-Google-Smtp-Source: AGHT+IFTaUTmo5NYpyEOe+N+IASnTdifHME33z7BRoe669s/kLGokS+QeVigrwOp6a7ohjKOhEbTlQ==
X-Received: by 2002:a05:690c:4907:b0:6e5:de2d:39e0 with SMTP id 00721157ae682-6e5de2d5659mr124779527b3.42.1729612097315;
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:17 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 35/46] libstrictures-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:53 -0400
Message-ID: <20241022154729.20331-36-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113126

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libstrictures/libstrictures-perl_2.000006.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
index 80c21b2b1..5a779a673 100644
--- a/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
+++ b/meta-perl/recipes-perl/libstrictures/libstrictures-perl_2.000006.bb
@@ -29,7 +29,6 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=246;endline=262;md5=43be558cf4f19823cdd6af22135cf5f8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/HAARG/strictures-${PV}.tar.gz"
-SRC_URI[md5sum] = "35c14fd25320f32ff40e977feae95d0d"
 SRC_URI[sha256sum] = "09d57974a6d1b2380c802870fed471108f51170da81458e2751859f2714f8d57"
 
 S = "${WORKDIR}/strictures-${PV}"
-- 
2.43.0



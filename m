Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3ACCEB2F7
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:23:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13879.1763230995055860265
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N77IJWSt;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so3257265e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230993; x=1763835793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCGkaRDf0q7QDam/ZwQNyJeWMEJzBW0PDMgd6SmjBzs=;
        b=N77IJWSt8ls6Mhm7b+WPZvhtE1QHBWc+Hguf1ZAVFCCWntVKq7Fvind2dmh1+TbuoB
         bfea3EGXpCPwm46A9n31dla4GqofDSVxSpVSwnh3HRfbKVxAbEi8QMJjqUOrk8MwzA5E
         h5hDnYzVRO8rqrer0hd57pZj3V2NvHOvZ9qurd4m+hFsEIZmTDm1Y1ZQlGR8xBvXsWCe
         KBfwJHdKrZVEERHQAXr/cIx8gZVmQJVnsnsD87OLa4pcyXAuvcXNVhhKfOfKhIm3Oe+O
         ExL3dhtWIfBaZ+a3vbUma8NtTfCkoguP616NEnuaRUSqwVMifswC4qpbFAQeoSfIV+9d
         9Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230993; x=1763835793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCGkaRDf0q7QDam/ZwQNyJeWMEJzBW0PDMgd6SmjBzs=;
        b=pF6TJzYrgshWxrvLwR0LU6Xv2K2NTekek0MAKfm0LHx8smEZ8UK5iidhVdZ8oVaIfB
         h9BnStN2A6bKtQC00SDSJx1HYHlfvTUxS+vhBC5m61j/uV/l7awtMn3fk/TT9Rog3wGG
         9rXJeiQADK1h/NhR160MZ5V26aLgE8AEs+AG8aN0ximxFwZ03t+4vTqdHirhhqgUYCJC
         vI6nmnX/iFrQxl7DnHNL5xs3Vsr9DpgB57/W/svkZgaCmlDmB3L0Fca04LE3TyEtYeLb
         GQQM2MjHo0ICZGZ/0RlZPfWfFoKuov+73LdHy5wRPX7YnVfTLal76wyHhbjXpImM2XUe
         v74g==
X-Gm-Message-State: AOJu0Yyx+VVj8BmfDK2crUIiD9ze91EOcZ60l/yY42XJPM87l68Utj/y
	ENMhY1ODUaECH0qsENni64t3SwDk+4CS4W4km/XVjL9m4UIX5zmJB+d6BAiJ8Cva
X-Gm-Gg: ASbGncuo/bksE/X4KHN6KHOKU4jHU2TVFizQQIpNU376H8nFPbl0sAjAIoHxLjIteIM
	cjdHlyAjd82rqDoAV9/s3d1OlelY2nuwP+nPqVAQ5pfplCt1RU58u4TwOMA70uLEWUQsSU0tkMJ
	PFe/qesz7mbZFM6Br/UerPJsZ4f7HP2/7qAXClbd/Gky8q3dmE2KxlOMGFXGRURK2SsFBmE6n+V
	o/3DmQymdiJ4xMlP120lnArmjqOK5Xv3mf2z/vzEFUo8MA9WdaNp+ZiLIIOK1wlXySKgGcYCEyy
	CQjj9JWA/Fhlsxdi3dj6fJdu52jJ7HEltbl0upvYy34HkKMwInSvw1db69tPaD6iAjePe7qDGOj
	LZocsPnLKO4csD5gn9Z2GA8tjo3VTMgRNFWvv5qMGbPHDRxFH40xQ6FB+msfRwL9wqf0CVWko/2
	y2ojbKMxtV
X-Google-Smtp-Source: AGHT+IG+rZexojwolnlzxQWmVRrCcawhwuCpttI4wETyH+2KJ9vdD53gTDE5nKeQWllPmeLNQXwNDw==
X-Received: by 2002:a05:600c:4f93:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-4778fe588a9mr69564985e9.10.1763230993215;
        Sat, 15 Nov 2025 10:23:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f176basm16791186f8f.34.2025.11.15.10.23.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:23:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/3] linuxptp: ignore CVE-2024-42861
Date: Sat, 15 Nov 2025 19:23:10 +0100
Message-ID: <20251115182312.1262645-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121743

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-42861

The vulnerability report is considered to be bogus and a non-issue
(or at least not a security issue) by upstream[1] and by major
Linux distros[2][3][4].

[1]: https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00080.html
[2]: Ubuntu: https://ubuntu.com/security/CVE-2024-42861
[3]: Debian: https://security-tracker.debian.org/tracker/CVE-2024-42861
[4]: Suse: https://bugzilla.suse.com/show_bug.cgi?id=1230935

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index 9a5c9b5204..d7d90bba25 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -60,3 +60,5 @@ SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 PACKAGES =+ "${PN}-configs"
 
 FILES:${PN}-configs += "${docdir}"
+
+CVE_STATUS[2024-42861] = "disputed: Considered to be bogus by upstream and major distros"


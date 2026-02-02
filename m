Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F980E7FDE4
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:14:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1565.1770066848138946437
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QoDcoPh9;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359249bbacso101172f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770066846; x=1770671646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkvszOsFlcL462+M/rvk0apByoITa+uutHQrkvCykS8=;
        b=QoDcoPh9pW1zP83IFuWOmMT4Vwvvbjng0NFcgT4UhSkora4wyrXaTiuqttk5vKLhEc
         APYvsENSzYG57/zLCN1mxDxc93av5wignTZdisUlZGXWP3pWxnMfKXgNznfFQii27TJP
         5Gh3Dcz2tW1zDj1gJkcyMxuuJ3zxO0/WEFzWSXBqFNhGt5q6gZpda0VQ13EJ3DtD+qXl
         ROa2C0xAC05EpJhYHvUTsI7jYSFLbxRJn9hrfWblc18TeE4yl25X0RuT50Knqc7sY5DE
         rh1H9ccG6ynra3Q4zQJ1Tk4UOsC8sihZrwck4H0sW4vxF662+pneGQzXee46bj7mKNl2
         BmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770066846; x=1770671646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WkvszOsFlcL462+M/rvk0apByoITa+uutHQrkvCykS8=;
        b=KXFuIQScxzPEruDTS8DmxysFfSJ4k9GnapysFEFkTHRA24wG32QTQzMh51fH/X8Uu4
         T+ztFFxk+EKSVVGdU+Tda/i33gyZAyOOoUu/wvw190zLBYooLRRK4LTpXvc3ld34DaYY
         CoQiVXAmDiS9MP5lFGfZcw1ZcAhbdbeVr0lpjUATrNpj4iMFsGJlMGdGJQEylAYcCgVG
         I80eTukbNJk1v7qq8WrcE3XxrhT2LljHCgHCMN4SNJ1BxQpXYKcNcShuVfHlJtZJ4ltT
         Q0VNhxLC3pjsVYhYRu4OB7yCPGmwGYHDEurVWWBrOoBiwz25V0vwrtT0u3NaM5Ij8qJ6
         aAtw==
X-Gm-Message-State: AOJu0YwdEefzQuxXEXF4HoKscIwnO13dEGCAUaYSig8u2jR8yvHHt4x0
	UYxniJWLcz0tj9Upf9L9KdTupbX8V8sXpyq4ce5ZezGvyqco92z/uypZIpbcmA==
X-Gm-Gg: AZuq6aKJ3bo1L1NrByfjohKrwNcXf1UEFOkuQ8LX2pwWUaOxA29E/wVBePKzT0rpAKg
	ZDIKVRJ6aqucB/4AV0EN2BU2m5wSGb1cgRsVZwMpG5cyAgD3PM0zYGRMNviCM38X71/DZU15T6a
	7HeKSRia4rpH0oRdpkAHGiVLHEy9f5n0pBQRxaLu3hdatUhLYVLn/JwOQPUancT2cBRhysQo4tq
	iy3spxIObmmO8dKPb5jhmntju9CybEwVTKhe7B2AWvURp96pAV3ysKrOZfOFMOsCFPLKaJXAwCI
	vOCgDzwI+tizi58Le3/iTdLNa856O6xEVeYNQjg//SvbOnf2k3Kv91HLdD8GmPieyE2qSygemxT
	LCPEqwA5WDsIUN/VIELbcfW11Ye4ki1OAeoTuKHYLvB7LQe94kTTb6R2Tzu0es88CrwNhgB7xJR
	5K3Nzf2TiC
X-Received: by 2002:a05:6000:1886:b0:432:59d4:f54a with SMTP id ffacd0b85a97d-4361145433amr1321831f8f.30.1770066846406;
        Mon, 02 Feb 2026 13:14:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce64sm48756747f8f.26.2026.02.02.13.14.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 13:14:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 06/15] gimp: mark CVE-2025-15059 patched
Date: Mon,  2 Feb 2026 22:13:52 +0100
Message-ID: <20260202211401.1287664-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202211401.1287664-1-skandigraun@gmail.com>
References: <20260202211401.1287664-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124079

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15059

The patch that is referenced by the NVD report has been backported[1]
to the recipe version, and is included already.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/c9eb407485f6c085adf70c8a334f75ea31565c60

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index a5e892c508..863d9a1667 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -134,3 +134,4 @@ RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-8672] = "not-applicable-config: the vulnerability only affects MacOS"
+CVE_STATUS[CVE-2025-15059] = "fixed-version: The issue is fixed since v3.0.8"


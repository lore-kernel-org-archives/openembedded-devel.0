Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93779C98327
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 11:48:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6905.1768650500362287419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 03:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CQ+EKRk5;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso15597815e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768650499; x=1769255299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhGvs/5p2aRdpQAQvgQc9dkl2cOD2fLDddpblvciCsQ=;
        b=CQ+EKRk5jTsEHtRjbEkymfUA2TcXz+YfiKzj876usxdrxBzRnfq6lp+agUEwVNTs8I
         eWICkg4Bjb7+G6B2XQ/QNa0S9fyaGLlOJgT4p+47IbIA2tM9x1nn59ZBZfb/xHSkfdMt
         RpbC/MvDhOgtF1zeZ3L9Df5OXHuAFmBl7qh6bwmnlUDNEAiKuJPUp/Z3jVaxUx9i8yWT
         i6zlK6CxJOgZLnrqf7l8eKN0BmPITVstPXEnLRduAs5HkADd8+7j7wpI3bEICiot52HY
         N7jTr3WWs96O/WLO7WKvCSILbW4w/MkKkGoo1yuTebk3xYxSGora1bVwPE7xucpGTSeF
         tYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768650499; x=1769255299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lhGvs/5p2aRdpQAQvgQc9dkl2cOD2fLDddpblvciCsQ=;
        b=ijRH+wiZCYF6AU+BT8dXvOBH82qPzlPi/4fBC30ewMA/sLEC9RqeDA+er990hZDLJw
         L0sLfjUXHIypis6SNSfZnqxc+dmnNyEh63oPHF7+PTJLB8gVUGxuQig8B4DUDPW3fgy8
         7Ccq6Jb4I6loYGP5ORzIkI9grr/xj0WjdCRIkmDDoBPiRbGEEHVxC/sQtbM8KxblmyrH
         H85T/+3UMMFATe8flScX6h9IVfxd24zXpauwoTnopFGiMkFi64WA+qqyGMKSp+NDVGOF
         LyDulfDqLmTy5kuFEii6EcSUfTP6NxteYFGM6jddfiet02hduyoDhsYgibWD4Tw51fmf
         fH6g==
X-Gm-Message-State: AOJu0YxbhaBglJb0taXcC0snRGksq3FBTQlydJx1efX7n/KVgFRjCya1
	rIME2fHVN4W799ynQbMoWs6rgbwWGbVDs+4IRf0e2tAXb3DwgIEEsxGp8KShBg==
X-Gm-Gg: AY/fxX4Twt9FW344UPD/9BaoZu3Jl2JHMKBOn/wwvjUGm9+YNEiFaTnJom5JjRM471r
	CKTBxAmRkvJ8kgFBmQ/JELzFloZU6wYrSBV14PbSc2Zac/b9WaWUMGqsE1ktX1LnuhLNtQo1Vtg
	rpTADYFCx60HUnN2tNBhxseilU7CSUBhJtyZ0Gjy4OVD1me70Hczh2HX87QH3eAmxGz3pqByWu8
	K/hs93k+A8SoBu4EH4tHPFgdrxCLmQK3VnxPJegO/8nh9RDuYre2cSbySJBfqb1OJod5ewByieF
	WMbUQYs1VA9HgDeFN8X9BheBHmfGIRUDSIXP0lo9Ln4VeLh129aWm21KxVOKPqIkS6GgLsfQEUo
	3Wl2BqHU1VqEs3UfaN2QQQg6/vS66izJ6TSqJLvf/Gaeaz1k/bOZOi4zLMHlH4hONejaemdgwr0
	D6HK/L4Hac
X-Received: by 2002:a05:600c:458d:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4801e341e2emr60267425e9.19.1768650498700;
        Sat, 17 Jan 2026 03:48:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e886829sm89717245e9.8.2026.01.17.03.48.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 03:48:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] openvpn: ignore CVE-2024-4877 and CVE-2025-13751
Date: Sat, 17 Jan 2026 12:48:15 +0100
Message-ID: <20260117114815.782230-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117114815.782230-1-skandigraun@gmail.com>
References: <20260117114815.782230-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 11:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123556

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-4877
https://nvd.nist.gov/vuln/detail/CVE-2025-13751

The vulnerabilities are specific to Windows platform, not relevant to OE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
index 6aed4145ec..861f9e482f 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
@@ -21,8 +21,8 @@ SRC_URI[sha256sum] = "7e2672119bd4639819d560f332a8b9b7e28f562425c77899f36d419fe4
 # CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
 CVE_CHECK_IGNORE += "CVE-2020-7224 CVE-2020-27569"
 
-# CVE-2023-7235 is specific to Windows platform
-CVE_CHECK_IGNORE += "CVE-2023-7235"
+# CVE-2023-7235 and CVE-2024-4877, CVE-2025-13751 are specific to Windows platform
+CVE_CHECK_IGNORE += "CVE-2023-7235 CVE-2024-4877 CVE-2025-13751"
 
 SYSTEMD_SERVICE:${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"


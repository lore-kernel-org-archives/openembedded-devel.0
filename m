Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56362EE6B71
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 08:28:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43083.1770625680197044621
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 00:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTCs/M+8;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so39112995e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 00:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770625678; x=1771230478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=52/KzkupTcMSOfdookQj915Bm/HvaiVEG7ADGBgzxqk=;
        b=OTCs/M+8NEraoW+nhybfzpKSprbpEeTw9Nk+HKSI38zoHOXLOIfR3MgsIyKHeGmRoT
         6kFjB8BqsmBos+ANADfLJfW5BlUsw9YYN/tH98fmKcyFGc1t0l/5PSORQqLAMxRt4IDm
         Cyvf9ijDykzeyxFEOEhdAfXCZjaLnwigT6HB2ORLAahujL8dXxbCiHoH1SV163MtcE4q
         7PKlh+QlMNxD3sosFftyBE+piRYeTjXCs3PucqA/qH8FcZeMThHTBsJ9f9+r85qa/xEN
         tMTioRdLlDZScndM/9xb1VuSDJVdnknE8elBejiqLJHNHKn70PSxxLPPCGkicjaiIbhW
         Bjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770625678; x=1771230478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52/KzkupTcMSOfdookQj915Bm/HvaiVEG7ADGBgzxqk=;
        b=r3SzOHzkCTY7tbQhLkhuRgfSgBRP2Sz/SR7TSt6Qs0PTOCx1jUVh1bt4mF+R8HklsX
         A5nflQ5H0XRW8GbELlK/2NjgQkSx+bNA+pZppH2m23vt9aY98sKhUULpj6W7aFeGlrvz
         V4YT1VwIYteUnQkvkhGHMzsrYmoeRVlFedFNhiiikxpSt0jRxjNglY6HMJnh9vFTZwq3
         C1CPBVIoN9f1F654xHuZlXS1r4l+LJXQMqghsoShiSMpgrVbKQwEVxJaTLoo8x33SNwR
         IB31zUfS0Z5qp9+LLHD6JcB/7IZ0gZ1ju0ebraw4mdVxhKQCiUxhjekfX/QC3iqaRN5/
         ZLzQ==
X-Gm-Message-State: AOJu0YwqLPsMcEu3F0+usyvYHOq98XruAk3QOjJ/tnrZIsERpSW/IBa7
	bRJP27270SHkRbM+e+2qkXyyZXZXiT/F+HzKiC4VdK3hbrP4ikIJxjvo+TUTVQ==
X-Gm-Gg: AZuq6aIRn2peJIXAfbe3zKXwfu5F5rpRFLi+LRcbI0+bcCJDPO1zOOPwIUSES0mECQb
	qii/aiNDwWvQ9r44zb5wg4bbkyLDszWgwCm/VLNraCxwvRcnnQy1dJw1uw+g/OR6tf3uZKtf1B0
	UVKsJ9mKSkzDsOWXtVD2fGcMfL1aXnvUrPX8I0I0zYX0GD+6R9UiUpMcL84Mvor3/b/V7+Y83nW
	YX7Eo0wMKTvzKD0+Q2WAQbMibiOvLqlVBjteGCl+QhUlFzLvKP8Cl9uT25EDd93hFv0Xx7cmgZS
	YoyS6mjmCRabXMycg6zE2+V/E7m9QLDy7udtkywHtr9CQ9PZO3ZYN0qJjZzbi4Irc7OX/t2zvEK
	nBlHCQx05FQpCrfLWXxe/acVxB6Rm0YgmUYiMssJJ3sjd7sDgR1KJuvJACLcL4N12dWChip/Oya
	X0rWmJeIPZPz6HKSwXsng=
X-Received: by 2002:a05:600c:3d96:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-4832021eaa9mr162176645e9.25.1770625678236;
        Mon, 09 Feb 2026 00:27:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48323c12d74sm149332595e9.2.2026.02.09.00.27.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:27:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] tigervnc: mark CVE-2024-0408 and CVE-2024-0409 patched
Date: Mon,  9 Feb 2026 09:27:57 +0100
Message-ID: <20260209082757.1296541-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 08:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124293

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
https://nvd.nist.gov/vuln/detail/CVE-2024-0409

Both of these vulnerabilities were fixed[1][2] in xserver 21.1.11,
just mark them patched.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/8d825f72da71d6c38cbb02cf2ee2dd9e0e0f50f2
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/a4f0e9466f3bc7073a8f0c28a581211c2d7adf0e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 57b1682e95..ac8c8b7cf8 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -122,6 +122,8 @@ FILES:${PN}-dbg += "${libdir}/xorg/modules/extensions/.debug"
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.11.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2024-0408] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2024-0409] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2025-26594] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2025-26595] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
 CVE_STATUS[CVE-2025-26596] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"


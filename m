Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C218DEB28F4
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7173.1770366055336037536
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaqedhHT;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362507f0bcso920965f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366054; x=1770970854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDtmuDg2pD5nDYocxUiZmrWfXJis8AsBIXN9/70VxHk=;
        b=GaqedhHT93JbacXGO5OsrOSYkZF+BE+Hc5O5g7TUP0Y8HYTJxQBOX1qnTqqOnvZ/XP
         vWbyFTii9kM/BigjaSm5E99+JeMWHr1Jp/zJ3xqXypUGWQ28vObNx/gN0Dhr/ePQ74X4
         qFMFNfZa/uETfTwenjhMCxVmA2hgnDL4fgbHmB/LoxT029RQXjnj1Q4SppAplQ/ChCTF
         AMjxpC9zEtFjQHFNlJcvak1xFKAy0ZECTbF9f9wTRjI46ueMTwEqUz+4x0s+eK3ShPEx
         JFICUhJEiH4FfFWsDl55D/0c70an0R+XL9Ldql8G4b43BewmVP+OADNwwgWtw87rDb36
         vYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366054; x=1770970854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDtmuDg2pD5nDYocxUiZmrWfXJis8AsBIXN9/70VxHk=;
        b=nxzPpSaYr4PmW+T9SwvV2H0YgNtaO/2jXrNTR2SEucN7kVxH6beeKg3iwFF2zbUASN
         s9QVGOTDo9pD+dyF6TqMNTe4FAKTlN355K/FdPsm74iFpSu814eGFzFy6OgY7QAxArNw
         Xd5O875oCfkkmRoPM5yrt9oxPWktqVXExSxilltjT4c9/GrpHvmPnFbONKlhe3mDBEFw
         Or090K6A0AhDx0ApDzXw5aNCjUaB0ajBYdSzRTnxngHxNQgWOmbBEEeFjCEeTfsw2KgR
         jsMazAsxbZYlv1KmxLrs/GlQFSdd7D/YRDBopfUTb2n0LPM3lPprN/ipyEcEPAYOBIJm
         Sc5A==
X-Gm-Message-State: AOJu0YyBdN7quRuT4eZiovryL3dZv8b8/3FAlmFLPoTWNAKvPxAb0whi
	KHGoGXod5Rg6F/YM2X65svitFcBVOHj4swyLVDAVcz6k1N+eqIB7+VUuxzDhGg==
X-Gm-Gg: AZuq6aKQ7teuZImPXq+tj9+mYmONYoTrF1FjvxxfBidXB6xEQ0WkNG8vq2wHdp+s91P
	Rz1fEbXAauyGydvZ35SKPdWkBFCIvQAtLQZWzTi8pXI2JxK8MUS/W4ur+8tCUqXOxx3x6LZKDhM
	iwoAa0COSTPui8Jyi6bwLAViPGR/Ny2PRaL8YGj4dcnylsHd0nkKtZFTXGYs+7BX2pAPckan5m0
	QgY22J9F3sHa9p5eeWAZ2wQR1mqc9z8jKn5HBpHHDtIM2D2qXDVkwK91US2LilmwtDxFQdx1g1l
	H7BJPhwwMIp97IhmdqhbHs1xeRaSEHxBKb8B/SJVop/mQBTOOWEKPXQWzqTwlX99R3J6B7sBD8t
	kbEdfoHM82dsPK3DkeixJ9tNt93DvymboiQDxlJx7USoFl+oKox68hGb5NXR6BhpVvSwBHVYA3m
	+T/1v8ewuPME1jw5qbi0Q=
X-Received: by 2002:a05:6000:1787:b0:432:b953:b02b with SMTP id ffacd0b85a97d-436209bfd5amr10379788f8f.16.1770366053635;
        Fri, 06 Feb 2026 00:20:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 8/8] gnome-settings-daemon: ignore CVE-2024-38394
Date: Fri,  6 Feb 2026 09:20:48 +0100
Message-ID: <20260206082048.1442403-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124237

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-38394

The CVE has the disputed flag. The project maintainers claim that the issue
is not in gnome-setttings-daemon. If the vulnerability needs to be handled
in gnome-settings-daemon, than it is a new feature rather than a vulnerability fix.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_46.0.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_46.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_46.0.bb
index d409e77eae..7e3afa7998 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_46.0.bb
@@ -48,3 +48,5 @@ FILES:${PN} += " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so \
 "
+
+CVE_STATUS[CVE-2024-38394] = "disputed: mitigation would be a new feature, not a CVE"


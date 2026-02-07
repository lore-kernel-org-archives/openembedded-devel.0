Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425A9EE0AD2
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2755.1770460447307077260
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B2w4uLpX;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359a16a400so2730928f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460446; x=1771065246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUAPQ0xIymNcGM3E5KzH+NgO3Zpd/3ivyUO0Y725gzk=;
        b=B2w4uLpXKKyJ0pXbzMALoWA5D+0QqGUESVjRwuFoJYRLGYT9yMP3EAjqa5trnaGsZe
         WjlgOSFTccYaX419dOCE3ksGygK+92Q57qMNeUVveqf6LxINrNax/1ybF8H16LZBjtJo
         7v6blIqkMzeAOLHyGDELbne0ACQQ6g9nxPT0dg53exaRKJw6VoRewAlaT4lEINX7Ukew
         jFvp/3HYp1hAPvvvv5RsmAta3qG362T5KFTA4JsuH7auZBXQnNDpqVGtCkAs3UpEusbx
         er/XUR/3KaPiR0Cf7gwFRgaSpeZg4VDV3TptpMeN3B6W4eyt+/xiIvTy2liIEGrMewLj
         ld4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460446; x=1771065246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUAPQ0xIymNcGM3E5KzH+NgO3Zpd/3ivyUO0Y725gzk=;
        b=KpzdOXg5BnbP+BWFXOV6lvGgq1k6Skzh7JDyKuTqn8XNLDm7kpQenh8+8wJTi+11Dl
         gFwfUf9Nt25h107Em99WoyCIQcLCDC5FwqudmaIKDw9w/U88VUo+uLkeKeha1QjokoDA
         QsHAl/b2/KGv8RN64zRXL1cDpdmKF3IeZwkZCmIjQ1b1SH8Jb8Y6oj1faUIi6KSvE03C
         ueogXP5AirOKwvJuzqihRry1voosZD5A6DARgvOnlMv/CY1CV/4loHQy6bX0KM78xiSp
         YgPjQVlp8S1dyTPHOdUeK5IfwvSWDrF7MZPwzCH8jPMSYPmQ51aSTW9/h1bQu4NjcclJ
         H2HA==
X-Gm-Message-State: AOJu0Yx8vwV0EUesiV2oYkOFLtdAaa+oEOcGXpu/JGaUIp/c67IUYnST
	s0sWtrXOhqmoOySNa69OrHsEqUJeYZ7XE3U/rX61GO2seXkq1odk9eP/gMeGbQ==
X-Gm-Gg: AZuq6aJLdr4YDvKt2aS9RD63+kGdQcx6YMymN9xZJ3j2u5j+DBMVa8iDvi7gSRZP3JI
	8AdYgVokJMTf4Emw0vh2w9RL9gh6XxkJibTI6MiqO9Whoe5mC5nLfJP5uxmWiM2KBO5K3jI9yzm
	W7h8w9Y76X0l0kUGHOZ8V+ykxh1l8Bzt5SP3sjIcR0TDqHHt4NYnCsF2px60bdhBgNfiXp7UTuK
	dPrnly+BbvM0a/go0picVoOQEOGlMq35852vdsSmwmEO8i/VMBkKzT6ebeHQZ1zB3fbP8CJv0+Z
	teDkv1qOigCNRErFngXJKO7SJuP+gPq/7PAdmFoGJvxRkatmjdyVOTP/0CYvSYcchF8oZfVhA6b
	pfM24d3TWTCHhrCdL7/PixbIsooHbfPypLzIjomcHPAgTK0PRihxhEPognrPdoTe/iUIccoGiZd
	3oMaCGaoeK
X-Received: by 2002:a5d:584c:0:b0:435:db9b:5883 with SMTP id ffacd0b85a97d-4362933a9b5mr7261085f8f.2.1770460445509;
        Sat, 07 Feb 2026 02:34:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 07/15] proftpd: ignore CVE-2021-47865
Date: Sat,  7 Feb 2026 11:33:49 +0100
Message-ID: <20260207103359.4177243-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124248

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-47865

This CVE was opened based on a 5 years old Github issue[1], and has been made
public recently. The CVE wasn't officially disputed (yet?), but based on
the description and the given PoC the application is working as expected.

The vulnerability description and the PoC basically configures proftpd to
accept maximum x connections, and then when the user tries to open x + 1
concurrent connections, it refuses new connections over the configured limit.

See also discussion in the Github issue.

It seems that it won't be fixed, because there is nothing to fix.

[1]: https://github.com/proftpd/proftpd/issues/1298

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
index 2c93393e68..2004595e6e 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
@@ -26,6 +26,7 @@ S = "${WORKDIR}/git"
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
+CVE_STATUS[CVE-2021-47865] = "upstream-wontfix: it is not a vulnerability but inproper configuration"
 
 EXTRA_OECONF += "--enable-largefile"
 


Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11402CD13D8
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:37 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27200.1762704036448243494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gHMvMjyX;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c19b5de4so1615101f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704035; x=1763308835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0PJ7PSPteiyajk3AgKEbG+K0tv1Ghl5jgOb3xznkMU=;
        b=gHMvMjyXkqxofKHGUlswCuCM1toakKW0UNDzGsvV/1Q1kpNCfdhSZ4VRB+63mL8il6
         Z8YkOL9fvOtdeidOJ3RGdvj9qp8QSatg0u0mTHjLAhueeb1yjcNK+H7MVZyG9q0GaE+G
         yfP/BJGBmLGHqPYqlW7jEkCSyBYDYS3DLqX2a9+Urn/E6Ru9aQoZBzXwLgmxIxnq7FuJ
         N+TOcOYyGfYqeJLuFTvbRVPsAn9CS71zD8oaEcRnpGkjmnj1Q+27H/3XAVkJskMubgGE
         F3ZFLVOxW7S3aJNx05Jj6TrQNGw+gZdoaQRQdZ0L9w6thWZIc3qjwE1MELYyclK12AB7
         anQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704035; x=1763308835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0PJ7PSPteiyajk3AgKEbG+K0tv1Ghl5jgOb3xznkMU=;
        b=BtcHMTp/kNpXIuL7wi42ywSFANq8y1iLQUpbHBVI7Hb36IzSf/Lxvz9da9cXuSCdEW
         32MucEHc9tB4AtDHJjs47bpv2h48GB3MQ96303gQG4yhqTv5tnxbd3aqpW1AFtqWFJ5p
         WgdnFWoF+YMHnxSzSVyd+ZieUe2IjjSxz3Pc6jtw99efzzM5WeVGJJ0/2nAmrTQQ8nf4
         UnLo92BOsChwtPv37vXYrTV5DqF2qfgmKmkauuOoMFTrBmmD/tx+14JrxPBR1Fvah/bz
         Fw3LTAz+zqWNbUM7yn9l3i2gQsphLsYmikSkalnd4JiH+KxESglge98hrjUzT/QhxEyg
         VBcQ==
X-Gm-Message-State: AOJu0YxD83PYEbS18eF5FATqrJtg0NNy7oc/T+cG24B6zGQsQIDrwA5s
	HaH8cUomYHDxOf3YXHNwiiueAhDpRInBnM8TQAYr33S7Qgiq/DXuO3FXemUHNHtN
X-Gm-Gg: ASbGncvsZKb/LujL3UJtr4YsgHKidfnn246Mz2Zoput3+lgBC00gIQSDMZ/cw7CDpEA
	jxe7ymewk7XVna7XRhV6In2f6NGiCC3qFK6kJ7DAiSEwBGFvLr9BCYcK5EcFU0thPwpcle0eqLk
	PDEsAWyCL8rcOO99615VQB4lCA/sKx93g5ksaP+09n7l0wF/0kOFKm9ywOhkqJ7/F7sgU4rEh4p
	QmxI9Zk4so/9ULJkl1t+zaWfrd20MT3zv/aIyQBisRjqdOGet6XqzYKpW1Idk6cbo0BiELewDPc
	XAU0NtUPOkVszQqdrkLd9qH6Pb00IUOHoIUjX+FPeIsVE/Ki/7rcu/CA+7kgkNBR2Mq6RxXGXz8
	JJ5nazBP2ue4dgvqinX2dA7g2aYp4676hh5weGg/CJ6NZ7ONDv5Fx+AgxrC+mEEAiUXki5Z0dWU
	RaXEvvPiHt
X-Google-Smtp-Source: AGHT+IEpkTSbOZRYB5acm4onOIEYxJGny7lDdbHQPXQE1bIsJFM8RqEjMyvdtq9EUjdidSMSH9B8rg==
X-Received: by 2002:a05:6000:2210:b0:429:c5b1:5c63 with SMTP id ffacd0b85a97d-42b2dcb1b37mr4136811f8f.61.1762704034712;
        Sun, 09 Nov 2025 08:00:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 12/27] http-parser: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:04 +0100
Message-ID: <20251109160020.2522353-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121428

master branch was renamed to main

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/http-parser/http-parser_2.9.4.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index 528289b7fd..a3099c0667 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -11,7 +11,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=9bfa835d048c194ab30487af8d7b3778"
 
-SRC_URI = "git://github.com/nodejs/http-parser.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nodejs/http-parser.git;branch=main;protocol=https"
 SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
 S = "${WORKDIR}/git"


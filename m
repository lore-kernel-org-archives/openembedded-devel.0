Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E89CCD183
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:08 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18625.1759326782744968694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eA80YG3V;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-634bc2d6137so10945692a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326781; x=1759931581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUWCf2azVpmr4SifD5nmKBo8K3IxFrXdmMZPbu+r2AU=;
        b=eA80YG3VPA7BdHbuXR66hmCbhksR6A8ti8jkXIn53UtnGFtr/yEXEUWOQ96FVU7XNW
         bfYXKbkiyz7546YQiEdd+NMANtGJniHS0hmYjLrx2CRqS83CDo6AKps861MAA517W1ag
         DWnXCrcvLeoZm72hGAPOs2NYquOJmT9mSeE4TD7nZQ6txZZiwsPBj7nPd5XKRPz4R/4B
         +jJaTzDEnYfquoi9x0I4LihMfGk6KlEyMC9ZWJkrDvTFyTB9QJlVTpl9HQQhBu7BO2vB
         zOmTL2e/LMAg6LXbAmVLPJ6llRiM6uX+TyWelnC2Vk6a+3rINIXxXrWRT3BQuC2adQqR
         ZUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326781; x=1759931581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUWCf2azVpmr4SifD5nmKBo8K3IxFrXdmMZPbu+r2AU=;
        b=sdORjXy7ogfL0PPWoHgMH6/niGAj/GVU2d+uaKl0z8LcW6uouVlpWtZldVJrdK3si2
         nynQtz3dhv1k1HmFZgAfByCtmbqDOPdqsn9ELjjnB7R7AqWEZ72TpjrFARn5Xwk2jMmP
         p8fsYJxKyauyPbhrOfKoXXqQ//iFLJTINCtYboZg8MX5OPIXip8xSumSVWm6ZppVUGiN
         wWge2pwDMTBgVw75FD3LoTvPiiK7zSRLQXn+5I6Of5NqyfmwJNjMAMXC1vL51sj6h0vH
         RMjz3WN6mx6TouLEI3cOr/y3K4dgV68VNEftXklKoTUe0H/x3e1uHAJiWr1uS8cF4mIa
         TtPQ==
X-Gm-Message-State: AOJu0YzvwN40iTMBAlXDJ9Q37iV8VHDwMTQWHy5eugfZ9Gz2HEjZY94I
	JbZrD37Ct9C1hG+9/B/ep1ku7j7aU0PrMAgB7PxytGj0KL6ND5ly6VLbc1+M1A==
X-Gm-Gg: ASbGncs3yeu8iq+OdCkvzzssP7AYHzbTrbC1bytazIGDl6V6Q46+5oKtpTMYeDY190A
	FimpsiLSfqdt5d/LwC9HF9KsnL0HMf0vzIibb+Wv0hXoXxroaI9qGCLWJLgG2ett0GvXggI/fwD
	5R+7Xkue4dzmyDEwdbVqCom3+hvn9iqwQB42hgzg+KARA4dpijQzCuSut+zyCFLTAOZf+sEGIlK
	jtwBMBrQ4HmXGaKRNh1AEC+XzSXfRTqyUE7X2Gn4Js4flnpFU8iDPHVrDjV6K/Fe41Csvun1n/m
	HJUKmtfzda6qfyiyBoLscXuC9EY64FfX9dC99IwXUrkM13G/ILsJ/nAWIVn30iTsKfpivkC1ePi
	ME1HZhfL4JiY5jyr8RGoizaDYwB7bGKspT2zmuTg/xXSz
X-Google-Smtp-Source: AGHT+IFiD2/tuUrhGb518ldXwbnxX8gJJlGSWbi9mmCX58YjjTGmqXTbKrpGNAh27BVQ8S9S/SwtdQ==
X-Received: by 2002:a05:6402:510b:b0:634:b7a2:3eaf with SMTP id 4fb4d7f45d1cf-63678c4ce67mr4591563a12.18.1759326780913;
        Wed, 01 Oct 2025 06:53:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.53.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:53:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 20/25] libmad: ignore CVE-2017-11552 and CVE-2018-7263
Date: Wed,  1 Oct 2025 15:52:38 +0200
Message-ID: <20251001135243.1490753-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120135

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for mpg321, not libmad.
See Debian assessment:
* https://security-tracker.debian.org/tracker/CVE-2017-11552
* https://security-tracker.debian.org/tracker/CVE-2018-7263

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fee86a312fbcaef7aaad66fe2f6756bd7e57d585)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index f197a4238d..869ac93da9 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -34,3 +34,6 @@ do_configure:prepend () {
 }
 
 ARM_INSTRUCTION_SET = "arm"
+
+# cpe-incorrect: this CVE is for mpg321, not libmad
+CVE_CHECK_IGNORE += "CVE-2017-11552 CVE-2018-7263"


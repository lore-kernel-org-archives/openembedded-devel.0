Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C8BCEBF62
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:23:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13881.1763230997318947821
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bzzc4XD0;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2377100f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230996; x=1763835796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdbrLS4UUVaeU629Nag6DcQv0Na5PihjxeUWqTKPbJc=;
        b=bzzc4XD0HWln1YVn7gnMauRyfTqqVpoPgpoQv6iBVaOrnyF6UzGCGvNi6mRTsvwpNU
         AdnEqZN0wTpyO97IFG8vnuhhYUlJI0rjCzLPU0T0HA9GQPBbVYj0dn0oRqIrO3NziOY4
         VCuyWzHvoF7JjJc6yHZVA9i30MY5+aXaVSS1T6xC6wXOjuCW42IldjuIJA3mRdWKpVW1
         I/Oy9ugbMOQmWYPpVzS5kkLXFlltribgbcXxQYF/1tTBXjH6lH6E5ctKWpmDvbzSEaQs
         zKTiGKaDR1Lpuy1+WNCgfG3WU5mMndgLnSMQqxksZmLouwAG/HqkZQIhdIPLoGsNTrde
         xPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230996; x=1763835796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdbrLS4UUVaeU629Nag6DcQv0Na5PihjxeUWqTKPbJc=;
        b=O7MOtalYpFkO/SdwOXTdNjTUNZj7aRsBla3rVyG7WWwcIWEwhBl2xKSuGsmCUVqOQS
         F1/PUlowfKaleq+Emp9dmBox57/S1kaKWcPC9QlMLYesb/6u1tatjaaww4xDkbSKB8Rx
         SYPHPk0Hcj7LnRCUyF6q3PnqF4nnglHkPKGFEn0XLx/INv1akj8xBYUWaVlJoBSFrwSb
         CCiFDHmQxCJjgJdNobmRxRweTAwbJQaFm+B2oXaGhGvBEDVdHovlLmFPjtEBo84deYf+
         Af8L2BHBBQeErBN3M/3Bn2fx7YitSzs2iAkSZsfd6++WgyYZWnIy7sk13z20zn8tl5bI
         Y1tg==
X-Gm-Message-State: AOJu0YymQE24gg6MnjZrQvkeUJueJ2HOoydkD6O/iZ/f58PQ18qRDmg+
	YHFpRb8DJ/2Tk41sntxkFavbXA3IxKCVj9SOCpfvfltLdMtlO6yKPCOkuyZaqH8q
X-Gm-Gg: ASbGncszvPDLdDfeCaArr8V/85qx/VtGK+tJ7lGHB39531grslym10bfD7pIXYWqMlk
	t3BdKpBfsXRAF6bIxXvqjmmHE9nJxdoNYaAjqllSklQgCvFD5u8gROFR4Bmdc09V63uCOvJ7jwo
	uaC8dqna7p+c62rTxZXD6dAbtgzLiTPsZ4F6vxWgfqJ8Fu1wGiIJrMRrpxrGA6/T4X1i5BZHJlf
	4yR5WgWa5omssL0Pi4tA0mclBk1DezZrp35JNuMG4V8qIUvMJl62uQ3EDQZO6mm+rsJawXqwgfP
	Dxpd/o/vBAtqyffjO96ndQfDnzNdC0teSbO0ZOuhtg01bo9vvUeXb+g8rNGivnCYWlSbezSKOzo
	lz6m4CLm0BgX5KXqGJY3Mez2E9uja/QvqXwSq/5oZKPL8G3a98k7MhkLvwpD/JMqDlJN8vTrquA
	==
X-Google-Smtp-Source: AGHT+IEkpp41rmPYy8A1Z/fgr1fRDeB5+7/bVaHFz6tl3Ropmts5tN9YpHyiYlxQnQ0nW8hdlcVHrg==
X-Received: by 2002:a05:6000:1886:b0:42b:2db2:159f with SMTP id ffacd0b85a97d-42b527bdbf6mr12020196f8f.12.1763230995652;
        Sat, 15 Nov 2025 10:23:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f176basm16791186f8f.34.2025.11.15.10.23.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:23:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 3/3] rtmpdump: mark CVE-2015-8270, CVE-2015-8271 and CVE-2015-8272 as fixed
Date: Sat, 15 Nov 2025 19:23:12 +0100
Message-ID: <20251115182312.1262645-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115182312.1262645-1-skandigraun@gmail.com>
References: <20251115182312.1262645-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121745

From: Peter Marko <peter.marko@siemens.com>

This CVE is marked as fixed by Debian.
Extracting Debian jessie Debian sources [1] shows 4 commits uses for
backports. All these commits are already included in current hash
([2]-[5]).

../tmp/work/core2-64-poky-linux/rtmpdump/2.4/git$ git log | grep 'commit \(10b580aabcec1621b25518271ba1ab2b018be88e\|...\|4312322107a94c81d3ec5b98f91bc6b923551dc5\)'
commit 530f9bb2a02a78c1198fb2bf0293a12d225e4691
commit 4312322107a94c81d3ec5b98f91bc6b923551dc5
commit 39ec7eda489717d503bc4cbfaa591c93205695b6
commit 10b580aabcec1621b25518271ba1ab2b018be88e

[1] https://snapshot.debian.org/archive/debian/20170704T094954Z/pool/main/r/rtmpdump/rtmpdump_2.4%2B20150115.gita107cef-1%2Bdeb8u1.debian.tar.xz
[2] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/10b580aabcec1621b25518271ba1ab2b018be88e
[3] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/39ec7eda489717d503bc4cbfaa591c93205695b6
[4] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/530f9bb2a02a78c1198fb2bf0293a12d225e4691
[5] https://git.ffmpeg.org/gitweb/rtmpdump.git/commitdiff/4312322107a94c81d3ec5b98f91bc6b923551dc5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7758a8d0cf509e2d8db941ca4fd855c39beaafb)

I performed the above has verification successfully with the Scarthgap
recipe's revision.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index aa92c58808..47d04af9c1 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -14,6 +14,10 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS_GROUPS += "CVES_2015"
+CVES_2015 = "CVE-2015-8270 CVE-2015-8271 CVE-2015-8272"
+CVES_2015[status] = "fixed-version: patched in current git hash"
+
 inherit autotools-brokensep
 
 EXTRA_OEMAKE = " \


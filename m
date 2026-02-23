Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB97FEC112B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2742.1771874339148912486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dMTE5zFV;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4358fb60802so3456387f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874337; x=1772479137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/5L9eQBdMH5NMm8jH7S7qvonzcxFcSyfa2GBxIWoco=;
        b=dMTE5zFVsgr2a4bYA9rHo44msQ+sEbr5RebBUK76N0jfenIIuQ4CsKNpRgSvPi2rQ+
         HaFajlkTsRatErLHTT4BzN49DDD+qb2RmOGcrpUQCLDm4+Yr/O0owYzEVO9pgQ/OBcOx
         NRidp9rKbYxmImLvCQy3kXRy2UDNM1Wttv6n1Ljd3o04DThRq7+H24BkE9WQOECWC/Kk
         gmw9t/3kOJeQdQeKWHRmes/CN/EKBG0EQVOX5zJXFaufHkYOnzs/i99e3pe4kx0PN+Gs
         PMkOugW6/2HOtHH3g1441ICsc7lj26UAilU4vCmJYxHG52gN6hLtGfXD6xp4T43HjMBE
         cxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874337; x=1772479137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p/5L9eQBdMH5NMm8jH7S7qvonzcxFcSyfa2GBxIWoco=;
        b=GISACpSvYnHhf3w6897BTqc1shiyYxdODAEMBDerq5SP2+6hskBVlvdf3EXsYzNCu8
         9sWb1iuDoiGuwKuaS9bofsTL9E7sRFQKC18x/ZMzJuU0Un16yr3/5ab5lmjh1W/2lBhX
         6KxisaxB5V/EMxZOQ3UHKxjp0JrY2zEjRlpCcLO5y3ZZIqwOSxXUZ0DC4EWJIXyTiuCj
         T6ADNUIaYGkAGkrFja6ohVYZKMEd7wbgJqEolOX8Yf7S9QBTb/i3RoH0vhnJ/c2JMFop
         Iui5bXuiFlqVPMATSVhlcWVv/6OxZDGO++jMyEiqH/elMGo+Z7L2dfQO0hmGthCbZbXu
         SkWA==
X-Gm-Message-State: AOJu0YxPgZLDDA9gjBgUSXZDIB2Xc5Pv4H98bApml6N2YVjzWN3Q74JQ
	fMhytYWZUV6DIjhxyQVlY3JHGlPIyA9LuNzwEG3Hrh/Z2VLfmGuZ9WpCK4pRXA==
X-Gm-Gg: ATEYQzwf79xwLRQgrFicaxoBSMuZJ3/vgtBvtl2/thqrOfVVrBxhKPLgReTNn/K1Jv+
	Pwq+jkHOeosPWHpFNPUZ5VNmGd3BMQLzjpN7qNQ58hu+UrEobJI2ihcR61A/2+Gfwr+6fHhMCw+
	wa71apDLjGMwqdplFdCTrzIYlqdbkVw4Hp9Jqu34JriyaqP7nUfWh79sKgX8K2VTCErp+U5NWk/
	82mtQ01k5pAtpb8lvphBrvd1YPUQhId2Qs1YH0pLu5TGmwl4PM9rXMQqMPtMMLeoDim8chI4x3B
	nguKl62sKm3gW/dJNVNR3qso7F8galyICg6fbCBhU3kGZ156hYTPYkZRQM5GrGt538JKE4Gmp/d
	gJ3J/N7r+Y+ECyZpx/Jgrj1XD+TTFUw+qUPbdlROhW0aEERmFV28FIjjdlc3KDOLakd7LuaJYWV
	atuJ338NQgoFXnvqE3xcJ0
X-Received: by 2002:a05:6000:1a8e:b0:437:678b:83cd with SMTP id ffacd0b85a97d-4396270ce38mr30477840f8f.15.1771874337375;
        Mon, 23 Feb 2026 11:18:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/13] protobuf: ignore CVE-2026-0994
Date: Mon, 23 Feb 2026 20:18:46 +0100
Message-ID: <20260223191850.1049304-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124563

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

The vulnerability impacts only the python bindings of protobuf, which
is in a separate recipe (python3-protobuf, where it is patched).

Ignore this CVE in this recipe due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
index 4f5f53d4e5..66c9c24473 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.5.bb
@@ -28,6 +28,8 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
+CVE_STATUS[CVE-2026-0994] = "cpe-incorrect: the vulnerability affects only python3-protobuf recipe"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""


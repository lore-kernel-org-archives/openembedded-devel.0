Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2590FCA19A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 22:14:19 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26892.1773094450094815322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 15:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HlupkDiL;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3597df496f6so5335227a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773094449; x=1773699249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/GZ2Q0XvKVVysiUAE9KgAXXmIffSGGtI25IMOPzevE=;
        b=HlupkDiLRtoNvpzSpaCebwH5hXZCJsC+JMOBThw+bmFkIQQ2d8WTxcNphYe4c1Eg03
         Y00LmmHL0f8tBbmF6DgCBRVKe6zNYjsOwl08w/0wFNZ6OYt4m/y4rA4Fq6G3VYRDYPNl
         EuS56byn+Ahmvn+Nrm8h7+eF/12O/Yvq3zxKvHC/PSfyy/s/Fr9fwyKoDrIPV97DiAZJ
         aEhIbvlffK3ZqrJ69Km7igEjmxvQch/RYze1zv9gkQw31l2/FxQupaOio0oHxia38Uj1
         /R00SRuCZgkFJIwjxNU0QF7gDxVKrwAU3ecCDE+5FwiIbdL4xA6oMOdsB2eZzS7ne1qr
         cXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773094449; x=1773699249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/GZ2Q0XvKVVysiUAE9KgAXXmIffSGGtI25IMOPzevE=;
        b=Y10hm9XCScD8z55lNgXCyxWFXvQwdW8QvD325C2uTMp48Xl0eeyktdEPejjPZzEAAW
         pSQWnl7uyq5/d9DR5WHOo0x9QEe4s4t5jEHBYHX/8+BSMyvYx96iSn6vuDBs3RUVlHJ2
         1QLOBqnQv28SEr1IFsqLi+j/Ou4Qo3vS/FjVVTurUy9XzY5oHpnvWPpwfBCL9aT8CtKn
         Su6MI+R9z4VsdbwSWKwFtic4VvHJcrsAVm2rn6hmcevkRoaJOGHmTqD+sfiHG+qTL464
         HfDSHxBZ9S0ioTfXcYQib9fUd/w0HI7y4iaRfMlUd0hdrLtPdDjvHMZzfatD4nYWhzFV
         zCXw==
X-Gm-Message-State: AOJu0Yw6GQjZ+yoLQYGH2/Gb5vvswyOS/qdfsTzHrzcP/FBYdXtsxeFr
	lshJgUDEe5t6nwfeDpkL01kbq1ir5AsQ4tJHdz9MaxW4G6rIhnvQwlb697Lsbg==
X-Gm-Gg: ATEYQzxg11Fgf1T7IyBL+x+bgMmTx727YdzVjnM75QNjIkfDhFkYS+JytethSH0vgGQ
	H47T8XBXW64M3hkrM6p7qAr+RzQWqLQIhRelg1yUrc1L1RoYpZUTX4q6E5E6KrWMjNpLxN3QtdX
	9MAQraC5hiIffaOG01V+JpJS6N6As9FT96Nc+BDGJssvGzbxmh0apjnDn8xFMMAqlMwQGCstMlC
	/iVsgzzp3wuIJwSKpogozSimCH5MP+3M0MTDO2td1QjmSraEghLnqW1EkGL583StRR6dg4WMxli
	oqOjpg34jvS7Qdc3jMETUmG2WmULdFH1rIw7fjR2VVMglBH7L+qrfjTwcTa2LY6Oriz3Mw7+7U1
	gRjdmArBUYcO7ZGoW0Rcg1qBVqkskhc1OGSQOYZRk35eqxOrimrVSXcZ4MXTa+rojlQ0EAC7OTP
	nvt50rLzALmSorIeA3aZLV3DEbnguYi74z7pYzhVy7FokAOw==
X-Received: by 2002:a17:90b:2d0d:b0:359:8988:38d3 with SMTP id 98e67ed59e1d1-359be21d4b1mr12162075a91.7.1773094449246;
        Mon, 09 Mar 2026 15:14:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bbc060d7sm5991413a91.2.2026.03.09.15.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:14:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystem][whinlatter][PATCH 2/4] packagegroups: fix foldername
Date: Tue, 10 Mar 2026 11:13:52 +1300
Message-ID: <20260309221354.1058134-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
References: <20260309221354.1058134-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 22:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125009

From: Gyorgy Sarvari <skandigraun@gmail.com>

The correct folder name is "packagegroups", not "packageconfigs".

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93e33ae8090ad30bb1a145e0fbb677e3e51a0ca4)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../packagegroup-meta-filesystems.bb                              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-filesystems/recipes-filesystems/{packageconfigs => packagegroups}/packagegroup-meta-filesystems.bb (100%)

diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb
similarity index 100%
rename from meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-meta-filesystems.bb
rename to meta-filesystems/recipes-filesystems/packagegroups/packagegroup-meta-filesystems.bb


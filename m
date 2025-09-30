Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2343ACAC5BD
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:19 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.20997.1759223949985982839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZrz/XUF;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42521ca36d6so27555735ab.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223949; x=1759828749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj8mdZcWGQBtzl8DnbxK4KFYrRfBFqVregi/UeHaERE=;
        b=OZrz/XUFMpirDh6fOuE+DLWuhZ2ayWWDQEOJj8KllBWABDfbJKyYvlCRlAo8i9FcsN
         TNyy8uepU36FAvcIzMPt3Jmy9ntQsJyhKvHK5OaU25SgAUJXtP7WKJrOBgHooNEf16/Z
         r9gWvHJ77DE4Q4Sg3rHoouA4QkqNecUFKqjP7IfXgH6Hs3Fdk1CLq7zab4WI/2hytgOw
         4mqpf0AaFs59k5Hoa79lS7W66MJjUscpoLO5O3MBTt8sMV26CxBzXz3Imeh6fejmunnv
         asv8gFgDFQBU4UxzoiSekPGr6WzftxlvNfsTLmfFVSfWiy7+H74yfDEN9HVkqD/rL2y1
         sbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223949; x=1759828749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jj8mdZcWGQBtzl8DnbxK4KFYrRfBFqVregi/UeHaERE=;
        b=oUuYO8TrMxNf+DLGbz1pV2EtCVBEQBch1NmevYUB4OcEKSlh2SEb+1NW7kCQPY4Q6R
         H8cH+U6XiTXZHKufMME8RpQwaVLhIrMxqP5T+gWH3ogzncMaAr7PkbKKMdtS8BO35EP9
         cfJA3EcKrVnWcM1AgWjhFeNqAz8u2fw1hOmOaBlCKUF+FFBmjWsyKCU8MqjxCStS46Nj
         A2mC4egWlF7jBotlRTUFkqpW8IPYXdiujs433jjuxCgatJKZs94cN5ZdhbpELg7jS8ka
         i4Qup57UhU2rvMSQBnPzKmEsw+TK9A5YXO+0L5clK0YIjkRYZQYnac9FcJPpfHsLDAWm
         m4dw==
X-Gm-Message-State: AOJu0YztaJEqdD++RPJ9BxcSYOlhFazsuYxsQ1gzykww0uuaFlA7Jbm6
	85A1q1ogmOSA9bodC9U/BWrrnEBArqpRRb+3UEmyZdODysEOnM8bpYLo1LGS9kTC
X-Gm-Gg: ASbGncu07+D2Y2T5+Uiqq0Mg4oUaQRHKmCZDGGmhpzByWyQNqxHaWi/DQ/VmEM7MTq8
	tfdQdLaeHHFJzfzBuBlTcJPKymB3D2OGpDYPby+ks9cijb13oAIsZg2D/+JyzQziS5tipdZnaF4
	mFBjIXiBzhekBaB9HWr5TO3RDDN0soCyh7R4r4EVFn8hzDQKa42a0MKPkXhATh3KXmozYfnsic3
	sdd74blflVrCeH1bXMg2d5u36ol10y/GaX9qB8H25H5INO+XvffI3XGSzAzoOuPwx1pwwk6+yCn
	JSazoPjqVckzxE4foNQusj+m3HxgMXszjkPU99pX91Vb7CDnoAVBoXLSJrLonINP94ywrYhDIci
	7oVKkIJY4e5Hl9lslYr94aCMKFCDG2vBo6enVD+AaS9Xef0NbisZNY3zzuvvlJDWxkKlN8gVu/O
	yimIorNy0E5Q==
X-Google-Smtp-Source: AGHT+IFrjujIMbSa8/SCGWu8Rb/lFYxtbKum5ewkqUmPzrJCvDH/fwcxjh+muNfT8Q5Kv1eDQKj9tg==
X-Received: by 2002:a05:6e02:1a04:b0:426:3ab1:74bd with SMTP id e9e14a558f8ab-4263ab17a1fmr267229805ab.18.1759223949011;
        Tue, 30 Sep 2025 02:19:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:08 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 08/22] malcontent: update 0.13.0 -> 0.13.1
Date: Tue, 30 Sep 2025 22:18:27 +1300
Message-ID: <20250930091841.1693131-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120060

From: Markus Volk <f_l_k@t-online.de>

Bugs fixed:
(or any click on carousel's icons) (Philip Withnall)

!244 malcontent-control: Fix callback argument list

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 827abeaf07d7524f0aaec44ec79a67261fcce0f0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-gnome/malcontent/malcontent.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.inc b/meta-oe/recipes-gnome/malcontent/malcontent.inc
index 68523fa21e..9c059bee2b 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.inc
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.inc
@@ -1,4 +1,4 @@
-SRC_URI = "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=main"
+SRC_URI = "git://gitlab.freedesktop.org/pwithnall/malcontent.git;protocol=https;branch=malcontent-0.13"
 S = "${WORKDIR}/git"
-SRCREV = "21f3ef7b6f984710a23b607d2298fe16e554f0c3"
-PV = "0.13.0"
+SRCREV = "090042fec5181621e2fd8cfef9fc446ed86db98b"
+PV = "0.13.1"


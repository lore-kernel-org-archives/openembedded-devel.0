Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496E2CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:37:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13800.1762853871824345513
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iB0Q8fzv;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-298145fe27eso24281105ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853871; x=1763458671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EQQ2cxHv9H/t0x+fUsEKY/0GiR3U/ocHyyGP+4Mk5U=;
        b=iB0Q8fzv37757Ei6OH4EBWXJI8N90OliHmuZtZIJ8jG08uazRYO7PRLkNyhWx9y1Wi
         ZzW/GMQEKvQvQs5/YQym2EIvS7IxmsslCpJvcv97o5LI49RWuvHe8dWBKu2EaXOOBt++
         vbnvLvpS4XGoSy6VB8JUVNOf2uWo9SL4OkLQL2rwm+VBg2dcapIbiRSYtyRv/kq1mfII
         Cqof3V5cvue3Uz65eR9W1e39q4TzKz/6zeZ/Dikt4MF7U95Ng0cIxWlvzn1fgdvFw91U
         WC7t87dWDWJavKIXLNJb6awnOmbw2qWPTkZBxk1QeyDrLnjFDwSinygBm/RmrAK9NmPT
         hJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853871; x=1763458671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9EQQ2cxHv9H/t0x+fUsEKY/0GiR3U/ocHyyGP+4Mk5U=;
        b=Yy61yVXmTzfsHZebetasn0m/oc5oQt46ylidiCMXI/P/AlMRiHJ5ioIo/ZEN4Hj8zj
         Pk7yXkc2bU6X2dEKV9HwW5XMazNWt2zPcovgz4a1PhqFUhY5qkqFIQKomPLUNFoqByQs
         0GkI4foxvZSTE+j7LAKyPNNA7gQ7ia6bpBqAd8SMpIi5NZwnnrFwgqiWXyst15fqKqpL
         PmWK5dc1ri1dhqLHvwZ95+LM1iDw/zNda0WhdbEklj/ifogV/EweE0BMaxFRVEJscuSd
         fWJHI7kHZ/oS7vc92WrGXXsgNpc/SLiEL97YUo4JKe9tQhkcpenuv15kUhK07z4T+Cvm
         gbJw==
X-Gm-Message-State: AOJu0Yw6JSaUSWpT5STsK9YLGnOnAe+e3ZHI6Cs4KF1Hs1lxYSz2u5fR
	fi7vT/9SdGmNqLP+1+rd7P7p0sYRueCpD5UEsjNVUO3WApiadNUwsQ3Qxq56YWDXkMM=
X-Gm-Gg: ASbGncuMyC94ceelQXy5UuHUTNV+HOKU8BQWPXgxlAPFu5l6XYIAXh3KpfmsSC/35PI
	H0udTMzleWv3zEMu2YS+XaQby9WSVRgp+F24QPgE9Vg2Td4Gja+sgfVcUkyAiw6/2eWp9ZomR1s
	HPEk53s4X7TrbJMPHT6wwdhKh61wS71Yy8ETCsN3QgFzHgpLS0Q1mf9LTvNt//bOXIhhySWALWm
	gFlIXdMjzmusKQHpXNX3F92YFtRtE/YexHMQSodXpRKm0KZH4kcwFPXtsOe2g055iB9crko9LAT
	+/1x6CnT9QsPXh2S6s+tFClUL8NO3KozakSLT4qDfCLqJw5UFTdhl91jJxp/Z43VMKiw+FTPZv1
	uVbNwKf2eMi7LdSknvcl8/JwKeDWshsj9rJ+HzO1R05IKUZdtU4QBDLFZ0CnK/QLmeZsdCty2V6
	3yZZ0a+BIOuKIZCUcKXn2g+Yr3
X-Google-Smtp-Source: AGHT+IFogOOeaA3TRArGpul0RqjQs5eWT8Sql1OP/uDC1P9rokssycmLVpHZyNPHVKPGzpz2n1y4QQ==
X-Received: by 2002:a17:902:f64f:b0:298:1156:acd5 with SMTP id d9443c01a7336-2981156ad51mr101351815ad.39.1762853870938;
        Tue, 11 Nov 2025 01:37:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:37:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 04/18] samba: upgrade 4.19.8 -> 4.19.9
Date: Tue, 11 Nov 2025 22:37:19 +1300
Message-ID: <20251111093733.1393568-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121507

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://www.samba.org/samba/history/samba-4.19.9.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f7305be2c8b81d012a7d7019a9f029f6f7588fba)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../samba/{samba_4.19.8.bb => samba_4.19.9.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.8.bb => samba_4.19.9.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index 429f983c93..30b7ea5a1f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "1aeff76c207f383477ce4badebd154691c408d2e15b01b333c85eb775468ddf6"
+SRC_URI[sha256sum] = "71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 


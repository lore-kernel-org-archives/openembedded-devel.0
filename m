Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFD6EC112C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2758.1771874339659583949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LsVkBbsX;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362197d174so3001657f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874338; x=1772479138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBPy0L/9K6Bmctqd8rQe6U0gVCPeZLpuP54AHYLRVeQ=;
        b=LsVkBbsXcLChD0EKjo1Zc1m/aZ3cuF18p9m5FTbgQhRnFiQ89tT0oMqMBGTvkoEa29
         tzSsbHXAux1ZWqeNCJgZWQE80uI1SdMiyc1PEzZmabvvIqH8C+GaBMoIMRdBLAtvIFOZ
         ihqjwgz7069JdTLL4Y0KEn/LxY039u0ZaU9OlVUCAl64UatvN0DDGdDwptmj7o/os1it
         k4Ly5m2Sbq/qFwDEA00GfjvXx4ceXnwJ3yopCV69Cv3jqyCzTq0AUgZdc58UokX+8+0U
         xlEu61kqLTDBZj8bpQjoLcUUlKsEU0yKuJoQ/tYe8JJktp8MDthG7cKSHzGoo5118C5v
         flYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874338; x=1772479138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xBPy0L/9K6Bmctqd8rQe6U0gVCPeZLpuP54AHYLRVeQ=;
        b=Z/Ju58+UnSh+i/aAGNOeYz3P1+Dgi77eH5LGCaXApp4BV3Dbb6rrBe8aB6LeddXpu1
         3JkXSqv+ST0DCWGY3PWMwdYrZulNcxn2z1xrVrJGzGun8E5SDCFl4xQYT+CV5IvoGPZG
         HUkHYU/2KTxjz1MY7TKAYF9WScUvowW8WllYw4eUVbul1vc4T+C+fWXPjST8Y/5hV+w+
         Ukg4RB3YxIRG+/i/b5l18X25hqUwrwunEv8OX+JuNv8RP7nkBG8n5v316naam2qUVtBl
         W3kJNBlLFalgZsv0Faw21o+M/8ZD9/dW7uGRNkAnTfknSnTJgzfn612BAxTfpwc/oAuR
         +n7w==
X-Gm-Message-State: AOJu0Yx9rfoJW3maBRPS7n7Qru5WBCoL4rOoGPin7XGAWByTMHbYJyxf
	S5qBW3jhT7G7b/qnOdaUbEY2lgfZ2uhdIxpd8Og2SFX5ZA+ct59oaW8RHnUUDw==
X-Gm-Gg: ATEYQzxFv9GRRoQWLUHM+5VPFFMWzP93LkeDf/wYwtb5rNhL5cICwOaEm943Zvms14Q
	AHKDX2xUl4ekACL568dW0zxxjSNC3rCTKIhg8Mm3yXUo6aodYPp6vIgB8Wzh/YSVzWhJlz2Naa9
	ELNvOKrkTgaGoyF1TzqMYs33M5xf6fWD6+tXxWRxu8dDwWqGyGlVr7dU0AD5o4SxHBEJwJ1xmkv
	HrRCbgh5NIckaaRVPBAfSYkTCsNoamh/Bzzj97aH5GJ9xSc95yZQmcbz9xoG1kj+OtweHHpiZSp
	z8JfEIRNRU528K4ZDoHE7VLus4NMtDH/kWmWJBApeghmjn7vV5a6MBYmNeiEX6ohDO3f0BX9Kkf
	viTngSzjfM6NFQ7DLqoN+6SO0x/iE0D4CQrn7wJFVPCjz5F0fBEmxF5wx1j/YkTVd7sBaB9u9rQ
	oIVvQG2OyYD/nFQFfAcsL3
X-Received: by 2002:adf:f3d1:0:b0:439:7e1c:87b0 with SMTP id ffacd0b85a97d-4397e1c8bafmr4362845f8f.37.1771874338004;
        Mon, 23 Feb 2026 11:18:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 10/13] live555: upgrade 20210824 -> 20260112
Date: Mon, 23 Feb 2026 20:18:47 +0100
Message-ID: <20260223191850.1049304-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124564

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555/config.linux-cross   | 2 +-
 .../live555/{live555_20210824.bb => live555_20260112.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210824.bb => live555_20260112.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555/config.linux-cross b/meta-oe/recipes-multimedia/live555/live555/config.linux-cross
index fe6a28604b..19881e4a46 100644
--- a/meta-oe/recipes-multimedia/live555/live555/config.linux-cross
+++ b/meta-oe/recipes-multimedia/live555/live555/config.linux-cross
@@ -4,7 +4,7 @@ C_COMPILER =		$(CC)
 C_FLAGS =		$(COMPILE_OPTS)
 CPP =			cpp
 CPLUSPLUS_COMPILER =	$(CXX)
-CPLUSPLUS_FLAGS =	$(COMPILE_OPTS) -Wall -DBSD=1
+CPLUSPLUS_FLAGS =	$(COMPILE_OPTS) -Wall -DBSD=1 -std=c++20
 OBJ =			o
 LINK =			$(CXX) -o
 LINK_OPTS =		-L.
diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210824.bb
rename to meta-oe/recipes-multimedia/live555/live555_20260112.bb
index 1622a97fe1..8729d9ca0b 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20260112.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "ce95a1c79f6d18e959f9dc129b8529b711c60e76754acc285e60946303b923ec"
+SRC_URI[sha256sum] = "2c54c2e090065849d0ab8cc7b06942f4e66dde17f2a0c80ae20b907d562c937e"
 
 S = "${UNPACKDIR}/live"
 


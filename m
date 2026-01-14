Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D242D31A38
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:35 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9440.1768395692683673794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEvvlhaA;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2331949b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395692; x=1769000492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAjq1M+KrwXEpB0PqtTlvT4GSdvuQYhv2VWsG15AkNU=;
        b=OEvvlhaAS8k9tm7N5VkSgPMGzrlc2tfS9BDlA808yE91fiY4fBdTf0BpvwHPPIQhvO
         CXBv1gfMnqIn7bfTiZLE5T00yO5YNM3huvbFzBDLYv9G3nrmvWSu/u0xKg4x95amm99u
         2wmSB9PJ08SeqIRLOyVpKIwYilnpyYYFVLDV0DaDn4izZ/URjVhNEgzlsT0tntj0kE3w
         WBSBbkoxc2uPpCsDsFAOFNwqpUhZ64iescYJf9eQ8eo3EhcM5oinwONaFDBKhnloeF1+
         I/PI/l7bN7HesjCEc82ufrGhXFuwcywNV2/LMThdU9j4iIJUbS6dQt7pYIHsgtNAQWhh
         dnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395692; x=1769000492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NAjq1M+KrwXEpB0PqtTlvT4GSdvuQYhv2VWsG15AkNU=;
        b=M0E8JZG7IQeWayaAezOAdXIHCujRmgsoBKZP2ddjtDXXF/05CBy6XJ2i+WWipv+14M
         +D28bsMBPpRRh8i6bcXjYF6CX8jLM/vwU2KoVA406aOhASn+FqP7UEhQgS0rm7063TWl
         uAE9c7JydgJQ301c9FTnm+spOd54RzZJko/Xu91A6RANAY2V5Z1RXmz0103anvRkWhof
         sPk9qwUI+U4Zg1Jpr6pfJtXVx3e18yB3CaCunOo7DvuuQHowvgjBx847j+TqGhQLuCjC
         Daz8bux5yEa8A2Meqa22MQ7bETrZ2MnCvHvEyDuGXjObea6zmRenksaU3WlC9I2RFXz4
         6hlw==
X-Gm-Message-State: AOJu0YyCk8QEVYKwUv4AJCvx0pQzjkUACs4zGGA7IQJr9Vr5ygVCF8gL
	kdwhKbJFWPKXrBLdepB9DDbQbEJwHYBquPwM1S/e/AWURNyjdC9HEJ88YbWqDQ==
X-Gm-Gg: AY/fxX6puxPwn1TtLTzGKHrPDNVwWgxDu4gyCIU8Wj+kCKvTNpcJcosT5t53SLbTSBk
	bovcxGHZwInLki8vYkRaUsMxR9ajl5JW2Tpo/Xrx20iHzz6dDIfqNPn+SImuXWHeEuLslCe3mPv
	tcan3Xzoz281JqPlJpf2UWSo00Db+d/CfDgo6XLpnORNuLfx0RDaT4RsGWSyV73MS5Ho54B6T8N
	oaxctqKF713wkukJVMXAdA3mGcUi2OX3voILD33J7Xz3annEhC5Jt+jPDG9nvmzfbZxLE0vbTrK
	PIl04Jb+tDuCsVNhKkIqx1V2J11ND54rir2UgpmpNlt+FCuErLFZcE033Iykkbiu0Qb1uewU5Bm
	tE9k02D6N7+1jhI4PXFv9PSD+4jph+bnEdVwc4+DOz3VXIUzcKNS2FqRdo7uN8LbPbkUmsxtpHd
	QiYT3qt7Oocb45UryTM6wPELI=
X-Received: by 2002:a05:6a20:939e:b0:387:9522:b667 with SMTP id adf61e73a8af0-38bed2176a5mr2869713637.78.1768395691197;
        Wed, 14 Jan 2026 05:01:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:30 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 11/20] python3-pymongo: upgrade 4.6.1 -> 4.6.3
Date: Thu, 15 Jan 2026 02:00:48 +1300
Message-ID: <20260114130100.1016416-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123464

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

4.6.3
- Security release to address CVE-2024-5629.

4.6.2
- Fixed a bug appearing in Python 3.12 where "RuntimeError: can't create new thread at interpreter shutdown" could be written to stderr when a MongoClient's thread starts as the python interpreter is shutting down.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-pymongo_4.6.1.bb => python3-pymongo_4.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.1.bb => python3-pymongo_4.6.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
index 260e134cd2..35a6a81516 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd535d2891f4fc4f9712"
+SRC_URI[sha256sum] = "400074090b9a631f120b42c61b222fd743490c133a5d2f99c0208cefcccc964e"
 
 inherit pypi setuptools3
 


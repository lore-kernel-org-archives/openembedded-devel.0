Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6751.1793913795861162838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tV0E4/+9;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1421979eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913795; x=1794518595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OC0MBZGq+nSb8g55EZk5TwW3G/NNdLuEE7oDuNqtdaA=;
        b=tV0E4/+9MEfENAJR39DN7KnGxx6uK7827kU+EGUYLt9ESRZLnEpN7hxXV6V20SH8YI
         F9ZSGh3NSY2LZIXEmdEGzFv85suRKURyX8G7rRnxa7eugtSp2j/GCYn6ZYpvXgPmaiLs
         ev7YwIZWDZlygSGu9+uapkr4YCeX6GVS2djZzZGiCr5InE8+ox5s65TLHbb9c8zhR8rv
         uMqXXpw1U6Z6o3W/jUrM11+R7x5XRKWofL6fUOTX1C2IXYw8ayaQLTIMJ1PgOcwxP/6l
         uo67pcE/yo9VPtXfmXxk0AReQo/3J9IYbnsXZP244CdjCJvHl2iPNB9wDnd1+B1UiXlG
         NnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913795; x=1794518595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OC0MBZGq+nSb8g55EZk5TwW3G/NNdLuEE7oDuNqtdaA=;
        b=zM1GFGrRUaODKx7V9Uw/GkjYLS832gyYODY1TZLcb03HNA/Klrf127OEuvtGKbqIIA
         PSkqz9r5bMh0tJ44SgLznmcJxoT8fowCe4v2HI5lp76YOY/BHM7Eps6mVYKWKQqlkYN3
         0qtAJ1zZ0QlNwbGEVkbkVqYGnBjcmsCZQwv90A+rTGA0UAhdztaIHwgMuYXLWhUMOkwc
         hXWQYA9EbCiAWHxxf6xDbGgmyzRil8SdQ1ZqZPQJ9JaMRRHdNGBC9Ve7Wb5hSJ883JrR
         OgoopqE7Ibgu50uhQQUB55UQMNbO4/FKBxlRmQfPfZxyB/cVvHnTvdqxpC8BWDa/W7Or
         DVhg==
X-Gm-Message-State: APuU4Z9+S2cY5fcoajHkjtPRPn5aYSEJtofXFMdU/Cp9+bT6lgcFakrE
	9HGMBQZ8CDWxgudv9W/0SCTX2qkpvSEKumvAGW9Cu1TweIKYYhOy+F30ILvB3A==
X-Gm-Gg: AYBFou2Rc/pJnC7S1DCPrzjPxqkCxVubaZfkwZAa4g4BQZ9NudaJmwIRdI+5DYHYn6S
	ZS4tSDxCe+W+6rZm47Xfh4dTpNpsTWfrLoTJfL4hCD+/1O7Odb4vTGQXtc5OEdcLdfIVJ+oPZYp
	66pM3jZsqvVwAN/vrByGBw5nEcufsW/jLhwBlZD8IQcoJ4060vcDCUNTa2HEWRaMD5W3MAFHd/Q
	jOdchIfuD9EVfeAzZ3aGc73rpxtpN5dBsQSeZVmDTvtEWmdCgi5sIZwvIkEFsUM7XPE7lYcLUr6
	6U4f9N9BHDC85BxteAx4i3thXmGx+467/yBENVKKqujQwBPOLxcure63Nor6M5oVxRuDJ3dUxX/
	pNijP7XdUpgf4/i60cG5jaFHJl3iTGMn9RZrzB2wOaQypozuyVhcnm9p5oMtCP1eowJNKubYlAC
	Iob2MEJxtbTX6T6ti4OrlkF8/zm2oIaU6fMbeTxQ5a+mzxxOeYjLXvM+lelP4BS9ApzdNpCE9+N
	V3ppnUeYgFGU0xLXoDMi/XBNbzbwsYJ0pApzqUmeWp5E1+UMalWWFSGxNF/I+QZfQSrbNg11GJB
	/Uyz2Z5OHWjgwG6S31kdSAZ1zW/zwxiM7jUidi+ODSn3A0e13fqehrcpn0OYvqBnKSQkv/qjHcC
	C3GqOOZ2Z+w==
X-Received: by 2002:a05:693c:2a0b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-36f772f8940mr470367eec.21.1793913795083;
        Thu, 05 Nov 2026 13:23:15 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/14] smarty: upgrade 5.8.4 -> 5.8.5
Date: Fri,  6 Nov 2026 10:22:46 +1300
Message-ID: <20261105212250.490188-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131947
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/smarty-php/smarty/releases/tag/v5.8.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3fe4c2247419cbe376ad010e2e56536bec3faab0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb => smarty_5.8.5.bb} (96%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
similarity index 96%
rename from meta-oe/recipes-support/smarty/smarty_5.8.4.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index 0c1487f1df..9fabef958e 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "94a27cbbc7820198d7adc17a2be8d457fb267753"
+SRCREV = "0ae663525dcbc9e996feb2a867e43bc85f960938"
 
 
 INHIBIT_DEFAULT_DEPS = "1"

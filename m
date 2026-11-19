Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1856.1795113376434404887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ye50fZQr;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89d6bd67045so5846b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113376; x=1795718176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPUseMm31BfMitmuBadgiiPShDZ16zDBHeXoyBaMRf0=;
        b=ye50fZQrFppMDHYbu45WTwPErjIlSLogjLZ+fQXYf8yfjWiKbqB6OsYmHSzxj3xU2c
         w5A2XQSFepwe38qtweTIlR3rXoyeAOQZ6Y5oG9q2BsAYbgxAWGgkSnuiqMuYt0FRP35j
         mHea2HigwnTG9+rCYDkkBUM5LiUZdjvtdiSBSrwM+dLeJ7FqgAJEG73iX7lr11pDKAag
         XD5RfbaxWP2cy0imBOVM72NnuH70eEayqJPiCB/0rQsJQrtr+GGHnKsM5zdm23S6YPxS
         lrXNIK8S5340cxwY40t5trAWYlLmISGxzXA5FQWPQ6RzUG8UamyrPMZB/CZPpdmlEjpS
         cPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113376; x=1795718176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPUseMm31BfMitmuBadgiiPShDZ16zDBHeXoyBaMRf0=;
        b=rGaDPZ1+VNDcpRTMnv8C02gmKynal8TfWp8ZWFx574F4IYIeGHP4tQw6W/kRkbi2Mp
         MkEgxh2oy6ZUBAf1uHaMjHiL/10zz7/Fk4r+MS037HiOZcTk9Ezc/spgHBaKJQDEEm0X
         b0ye4lOkBQWXXDd/LJzvDhden3hwK6sM/tzt8Q7wO4eTRHMG9on4TmtXWHIFEz8+PB9a
         DY3848tGSfKpFfS8iLk7SEHjZO2DiCy1xnmYr6N8anCfWeFw+7cPj67WoqnbVxa2Zulo
         mlSY8Y/nl2fh+lqu5tAu6pFRSDjd+/+pnUl0+8tiT/zzrLwhVKt0G+GqJRev/YhRwJ8L
         X44A==
X-Gm-Message-State: APuU4Z/x0vo/H5ycMJrGkkRLZLr06ObzGV85zM7DJvTGdpmXQuFXHa3T
	c8n0NkF9gXNCS8fJ8/ZnuGIUfE8aqB0CIQ1XjQxxX6vI4A/NFGmgR/CTa14JVQ==
X-Gm-Gg: AYBFou1XsS8XFFS6UEct8MOiv8hI8JJZB/klyNOPhYOQVFxV9YtD4HnZxP97VHOaaCj
	x0A1nO0Bk2aLncSeUEI8truUP3b0fU1miWI7UGuOcz7uMYtYgNpuxpYJDJLIn+V8JxYUpaDzRcY
	SvbgItLY5tVg21dXE5GwnxSlZ/kFAGJ0EyAAoeRTwDVVYwmUnGhgLAmDrq7EnYoWrtMRESjHSr6
	4IK3Rs02ipdHDvXjRUvK1xCe6t5UhM5XU0++tjO6C9k998SvJ0DgyVcQ65AqyJ8K4x3kEt1/nYa
	4gLCtYf5qIVKyHAEaNmrTz6VyYQ3FbVOM+9REea6kmvXa4QTajBQQpeqqXow6Pinp/01fzq5qt2
	3zTGOfp81FFg5DpXAbA5ECN7qv9k5BiEOJMffLMOaK1ZjWn1KUeem/Svepa2kt0md1CzDasqDfi
	rX/ZOE8Fr0rFuD6InrhJNVkdbp3lFOqwyxNr6mXOATGUrot6iCj3ye9L8Jmftcavy8uylmu6alY
	ggffQidM0dzXNwnOoPPbXnX6XtLOjN5Zl5u6L3BqbmtGkHylR+Am7/nzNRAneHrtrBAtK/52gX9
	x8h7/kro424QeWq8w9+eG8zeIXZZ9QaQStVEn+DWMMeScc/kjMahbAJs7TfdcfAPXHLjKeSgmhz
	W1tpny00=
X-Received: by 2002:a05:6a00:4b10:b0:8c6:37f1:16cb with SMTP id d2e1a72fcca58-8c7dea67dd8mr1301337b3a.47.1795113375663;
        Thu, 19 Nov 2026 10:36:15 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:36:15 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 08/64] haveged: upgrade 1.9.26 -> 1.9.27
Date: Fri, 20 Nov 2026 07:32:36 +1300
Message-ID: <20e8adf8d91cbcd7e29f1308a75d03104025d06c.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132698
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.27

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 694eb9006e1e1bd6847a03851389167cf5a80996)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../haveged/{haveged_1.9.26.bb => haveged_1.9.27.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.26.bb => haveged_1.9.27.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
index 727f856379..13782ddd5d 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "c0edcf284f654321b7c5665fe38106f9321ceeb3"
+SRCREV = "54d8dd95f90c2af87d1b778f0469fae4cc225aa6"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 

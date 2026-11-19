Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.461.1795102827049134816
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sxvH5Zvv;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so1437199f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102825; x=1795707625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bs+tbqH6zcZiCCC/NG1M78xhS9lIAro+5/1DAJiGegM=;
        b=sxvH5ZvvtYZOSnTys1cuNi4jkwyXmeBl3NfBv2xIOuSx7YZrdNac3VXrDMo6dn7z+3
         sB3S2SFU6CSMGfrfe+iE4jwaotsq/HXPTgK9FAM0SUpm2ypmi06f2Y5IK7tLCkFhkBlM
         LqphEnB9kT/9shO7yQkD2RY3zD0MNDAp4nfEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102825; x=1795707625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bs+tbqH6zcZiCCC/NG1M78xhS9lIAro+5/1DAJiGegM=;
        b=XIHoLT2suOZbmIwvL1SybUnLxVSpEjI2fk5xbrXjo61SM/Vfp65tF/p3+8z78mmhQ6
         alCYpiD7dnHTncMXtgWRzrVfb0kBWnqmnMA5CdvF0UG08Ka7wJ48CWPeXf+aiR+00ZJS
         gO4VIH5KKQ6+EYixGbn2WEIHtzwSPX5yAgr7BByFzMqaOb+sxXz0Qr42o1cWPa8VN/Vp
         Jldn/tcjceLdmKJ+32EPCZWJXulAplJcHu4EBJgq82sPuwk6j1kVGqnICR+2etJW8nDM
         bYILV0ySR8c8Her0vQcK0z/swrv61hcacRtcXTnl9UYmDfV0UB6A2jrn7l+ee2E8ARw9
         Hsug==
X-Gm-Message-State: APuU4Z8IdKYuJEEfHaJXVIkUWdh6VSf1FL89URLoV8N5EggpgJFOrr+G
	nND+ROKEEAU/0eIgSGBjKHmNs2I/FiZGV3STUpam1rwT7fZx+0IyvZNiWdjrRGTO3k7gpthZDnG
	Yy0Ez
X-Gm-Gg: AZFdTZeBDZ9UQzNaDmDy9r/O9CitmWs7ukZv47eWXwxacrw3Xo1XV9bwKIrxQGVaCyj
	/e3PV7t3TxGx9PzFAJ0BRlCqOZT9uzZT8DYBYzSAUCk8fcLeyKAmCTG3wg73G/P9RnFIRa1S1Rf
	cWmM2lMnUaAI1yJ7kx/aQ2q7UQvIYFLFBHkiBmKQmsuxW/Edldzt+/RSOsxmfVZCXH4MyWm93A1
	B4216FAkfGgqidNkmeXj9bYsvmQSUsARlvEXQ83bMzPW1mek9M8+U+8YBQApmsI7r8WeHzwZ2W/
	g3izKeZCaGqTv/wWZgC/NtnK9LKUPlH3BwTOBefPqNRcopeR71ZnrtaKdj02wiUsEn2Two9jmvo
	wq9XhC08tcfrGpb49Jc191i//3TTdOwGcPgEiL/QcaQI2plH4KzjYoMdh1Y+deVmuot/W0YHql9
	sJWMeFyK+tSUuNDQwm8vlZrypcKibmMV5zHp10UkIrZ57VXereSoSwM0JFHqf/ajCaFv2YsXlwU
	fZGUlKEH0CegUlzSXqKwt9XX+2LRM+3nvta16xThT8h6oZxC1Gu8H70++gGI69F88XGfpsaAWQ8
	jRnOxvH4Cj/VQOY0bOV/mtNeUzdTaSUosGP4XgZkvf2O21fsGfqw7Wwen7p/PTUyx/ZHxwTMTYH
	W2PWQhCRhBXTxUkOEnewQa0Pmz1ZjxON8SMtjmpRQil7o+X9qZhNMYA==
X-Received: by 2002:a05:6000:258a:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-4a62d6d7305mr13787517f8f.0.1795102825285;
        Thu, 19 Nov 2026 07:40:25 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:24 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/11] python3-prettytable: Upgrade 3.18.0 -> 3.19.0
Date: Thu, 19 Nov 2026 17:40:10 +0200
Message-ID: <20261119154014.1039002-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132685
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.19.0:

Changed:

- Drop support for EOL Python 3.10

Fixed:

- Fix copy() failing when a format option is set
- Handle rows with fewer cells than header in from_html()

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-prettytable_3.18.0.bb => python3-prettytable_3.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.18.0.bb => python3-prettytable_3.19.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.19.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.19.0.bb
index f74b977798..e7d0b083ca 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.19.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "439217116152244369caf3d9f1caf2f9fe29b03bd79e88d2928c8e718c95d680"
+SRC_URI[sha256sum] = "0ecedd6d9a560b330503bef15791b77954fa46b7123203d91e463330b61959ba"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.47.3


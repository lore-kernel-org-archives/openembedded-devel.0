Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7.1794851760163963027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=e98EHf6P;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e795af1d4so70373eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851759; x=1795456559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAxJhdlwUZlsfMUwmNgNoF5/4dfRV19HLPYQSioWwLI=;
        b=e98EHf6PwO47V+z5kbN4MXqORMqrnhN+8RcU6ZJE/y6wRMazgJPxP3WdbPAb2WCeMD
         tOBm0nDtjuyoZY8z4ODVbfC3B6XSJSZJE4yHehaS1QYRznSt95iIvKq9iNAFztYQlVrd
         99omqKPadNQibwRa95DXZSsjS5CN2XB5Tt7SfrjhQriti3gDOpPnk0AWae/aH8yMHkwA
         HVl1AXcx393Oi9TJ9qMRNRxGk+hMgXr0MnSwhRo1PxqOcGSTsOIz2C4EOxS3XgMzFdPL
         tkb+wjeOJyLxYm6LT38FSNBsdIzng0VRGgLYzMIBJ8XlrERVw/1xq2r2UBYZ5Tv67cry
         kyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851759; x=1795456559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAxJhdlwUZlsfMUwmNgNoF5/4dfRV19HLPYQSioWwLI=;
        b=JZkofOXN/xKgBPqu0KKtb9veivVKrFJK2CVS55qgsCQheCxVK0AWG5N8po0sZvoQI1
         arTaNbi3uoRZNRqjAgRb6FP1SGSvm8+TK6hxU2VLp3CcCqR4B4BSNnuEMsK13vTbYi4i
         QYI2Cjw93XktiOpo+9Bai6pxpTAC7NRCNXscSL5pbtjFIYb8TagenAxPao4TS/A05zE3
         3j4bABYNRmDrwScWA04GhDkdIGDBUTTVWo1onDjRB7rp6COP8N+MWrboqzJW4gOMotzc
         DII905QNK2EGbLs1hDCl6fseQ0yFS1IiX07Kvl5ycEVpjSCMg3MR9F3S+yQkWi3iGBkR
         S8nQ==
X-Gm-Message-State: APuU4Z/7L2YdDeD1KW7xU5ca7iM3fmf0sIVQlevass3yGNRSjmwjT6iV
	TEpsFBVpPUG6VBOLyBu2Re3pdTesjO/fJh4aC2Z2z5V9dXWUBIYbn4c3qQoOlHRx
X-Gm-Gg: AZFdTZd4X3MdaEje5VOtr2U06j++nRCiOdUAmZUBIq3TQBAX0FTKryypsHOOjvfiOXY
	3zY9pZlHW5jmGHXVs+Po9Lo1mWJPtzZjZgyTZ+rClFINOGkyOiJGX5TbWt0tosS+PgzA1kONjhp
	4F2s3e+/pge6pPBw7gdTh9vlg06BBscGGFqRbOSXHL1i/oMz7n0c8veIw9VUy6fO8sC9TnY/i7A
	EXozAJlWgbSoXhCh49rms60bgxoJb6y5cwGiLq9oVIxM/I6aJuSsQxm0limC6q3O6YybnHHbxWv
	+BmS85FGk/k/U+84ofEclMmpeRBLAMH687qtGAcSrHLDdYytOdMhrqVHotYRxZr9SN+dmUdPZ+e
	45rFCddOeJAIjrAQVkILdTHT2zflf1HnSjfX6JRr5EO+DkKRHU2Pj6raqustA20UCV8Jxr/oeJM
	iGhhQyepzfqZkh26DOO3cLN4NtTkXvgQ1pfjKPY6/3VoYFBZn7PCnWjXZ3YnVbTJz9Xv3itAlQ8
	c1PH8ALCcSVJ+zqNn4cWpLVNh4mSgDnlXmd6ye4LosKhEhH9Xc0wpqCQISIQMerbRYlWH8h33l7
	KpOdAFXU3mQlyvq0lKIg99q/A/NSE9xjXOP6m2EH2PFPm5kr6kCNHk9nRCBiSuQ7ljBOvtBDYkX
	Pu5sQxMAOWxBgm/mCczCrD/06cdMjWheQSA9vX5wZ8apgIih4N2poEX/RIC9qfLvJLAWxra9atU
	d6alptB3suGyREniteBNfh+PX6xeJljreneRvSX6QXmhX8a89iHalAoj9ddFHkn4ngqfWLdF00B
	LNl2i2MByDl1BpIrEUtRZMDkaQVY24NK/u0Yd+HBO3wcmWKw9fyPKyo/eotpeoialRcUMPR6zZg
	JQ2hQA2F5SUYAUZRWldphEFRqw==
X-Received: by 2002:a05:7301:fa87:b0:361:2a55:b94e with SMTP id 5a478bee46e88-3810f314582mr201408eec.15.1794851759438;
        Mon, 16 Nov 2026 09:55:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 087/105] python3-setuptools-git-versioning: upgrade 3.2.1 -> 3.2.2
Date: Mon, 16 Nov 2026 09:53:39 -0800
Message-ID: <20261116175359.342679-87-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132542
Content-Type: text/plain; charset="utf-8"

Changes:
- 3.2.2: fix {timestamp}, {timestamp:} and {timestamp:%s}
  substitutions failing on Windows (unix timestamp computed directly).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ning_3.2.1.bb => python3-setuptools-git-versioning_3.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-git-versioning_3.2.1.bb => python3-setuptools-git-versioning_3.2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.2.bb
index 6be4d195da..8628a99abf 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
 
-SRC_URI[sha256sum] = "8cccd352642ed6435da35b8edaf56a2f764f061ef2edaf3ae6602806acc7105f"
+SRC_URI[sha256sum] = "c5b38f3242027cdc53c9eb6c4c8410496afdd2895eb0507115d44dbb98af48e5"
 
 inherit pypi python_setuptools_build_meta
 

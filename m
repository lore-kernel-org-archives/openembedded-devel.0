Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22794.1794814549987651337
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dx0NkKO+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so1370221f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814548; x=1795419348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHhTH4oaeuwCcTaSJMNNkmN7s2KGCXa6kh8n07BNJN4=;
        b=dx0NkKO+G+GooBvkOXthOWxIDy9TEI4iWpbcTXWrh08kfUNe7YpLK31YQf738T0tPa
         RK82+HjSQSeYLqPfuyp529QYZS+wgdBAnVPRtu9nMRs7rAopkD+0M95ObWHIYWTUdXha
         F1QCyQePZfF9Y7P65mbkic0qlKUB4HPF2avpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814548; x=1795419348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHhTH4oaeuwCcTaSJMNNkmN7s2KGCXa6kh8n07BNJN4=;
        b=YbOpP+XQrKFGyAH0JGTqVJ7y1JsVkzCp8Mh+iXP/FVueX9sEZci7Zmh3TkRdQ+0hWa
         g2iwHseiKxcCqN9r6Z6QVqQCO+NXfjMJ4U5Jbiert1QalPMa14Cz6WlWMCkfOYmi3VxP
         9j6gR9LytmfbkPHj6dp/kgm/UfucE0RR4QeyeWQ5RL3rOYZ8wWhBezfRP6CtdopSFLyz
         xQiyOE3QDsyARRWZmO1Bg3yphweOKJGyGrZe8oHlXWFK9WkVBeSYUpgOxIN8XoAYMsjk
         W+2t9IuZU6DsU0ZNFAwo9m4DAMeMahoMAmPmPH4sn/DKRSjiGolJ8/9wLGlSs8AFMEKO
         v2tw==
X-Gm-Message-State: APuU4Z/dOUNPlDuCBI90+IVF6/uTKD9Zbt+RF7SQQU12R8LC93ZjBO1e
	jZLpS6r9z6JnZTPnU8MZKkFDVkQsfpVkcb+a5BxChrP2QjFqPlZf3jBinku/GpnMpscfne2EfIU
	fOLnF
X-Gm-Gg: AYBFou08Pbm6FzWM1q1jElDEw4VLqcEbXa9di4TzLXYn3412yxZlfTDPTpd24Y+LRf3
	PNRrf69D8r5ihh80bnW2g38Yad70pCW4al+qKTzL7F2yqXAbK1Kd5bz6gijLgwRvtcZmxL3H0YE
	fXjkfaAHTIYLsCcNYmmsYl5GMx97A1Ew1cqTP1UuvnwJxl8ta/lUFgYO4r/xTYuM/bTNpGDrI1g
	pQM31cgWB4XlVp9rxzJ0+6aw9dtdmbLHj8hgvUXh9/rcMCb/N/zSZ2DyeO5eD4W6IHix8SmEuSf
	WRtFGgbxPY0sz0awNVmkCWfQWpivetlNmmTEdjSX/rOJqPPLniAZo5vNIyC7YV/Ba22+373t+HC
	YPZANIA3sWIK3BEAB13oeN34yoboSvLsKDImA3IbJHMl8csxJGEV/tTAXrc5NUB+WFsmh6hPGr4
	juBe6Z+vhglgwdFgJ9z3QBfcMe7+i2bY0xBjIHM6D/kOTJ9Do+e61hjsDz6Pvki3/N/GQuh/fm9
	tTtWTF4f5DBdsgLEiKgI17XTrssi/nlaxxfRmrwxSM6VoeN/HFbYBmpX7aGK4BWaOUBu8gbTlwW
	XImKQt06yW9agwgPftg2X+8tMGWRfeBC2g3yKQrfuGRLjroB7LBouHmPePBSpz9YhzbCw2cD9yH
	k+grbtAlmEoopgTyTolILhSZt6sO7DSPNzkaGEJTAXvLl9S2wiu+srQ==
X-Received: by 2002:a05:600c:483:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4bb55a4f4c7mr149899335e9.15.1794814548302;
        Sun, 15 Nov 2026 23:35:48 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:47 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/24] python3-setuptools-git-versioning: Upgrade 3.2.0 -> 3.2.1
Date: Mon, 16 Nov 2026 09:35:23 +0200
Message-ID: <20261116073532.880420-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132444
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.2.1:

Features:

- Declare Python 3.15 support.

Bug Fixes:

- Fixed version detection from .git_archival.txt when the archived
  commit is on a tag like 2024-01-15.

The tag was parsed as 2024 plus one commit, giving 2024.post1+git.<sha>
instead of 2024.1.15.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ning_3.2.0.bb => python3-setuptools-git-versioning_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-git-versioning_3.2.0.bb => python3-setuptools-git-versioning_3.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb
index aa274a46f8..6be4d195da 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
 
-SRC_URI[sha256sum] = "27aa1ad0409b632ee49947ea592cc27e16fbb2a1605cc22efeb7c353fd790b31"
+SRC_URI[sha256sum] = "8cccd352642ed6435da35b8edaf56a2f764f061ef2edaf3ae6602806acc7105f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


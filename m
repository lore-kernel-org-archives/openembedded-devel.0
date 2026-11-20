Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.637.1795195666380973609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 09:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=m3EFB0zT;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1492935f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 09:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795195664; x=1795800464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQ3Y2mAQ2CZWkUp5pQwW6f72Q2K/OSGgghZWQowMQYM=;
        b=m3EFB0zTAqlfNFc5Z8hMEWDgCZPEsYdHECdzcCEsUyrQ79dRuttMTp3rsvz070pGSs
         9JVa2t/RATtybZv8PaaAP0HO44ASqyZFlxJGTc02GcP5kU6iRaM7ho1O3JX1yuRSO6rV
         Q5LTJ/FW2gjgCQp2WHT7TcB8DKQ3PbysHENY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195664; x=1795800464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQ3Y2mAQ2CZWkUp5pQwW6f72Q2K/OSGgghZWQowMQYM=;
        b=sgQncFKphm+iT9qXfxzlZ6kNG8nIB2+kGUre4R6ZwpS0zD8DXMEaC5IWNqviDKs7tl
         c4c8Ahxz/2Sb5j9344Qe2VDjmEV39wTx7TTPYnm5vvXJ85IOAvPZFhaAHmeXplynULVu
         COlwsMwb9AXeWdR/g2YyOXE7WOWr6HS8AZw0tZYlIGlLPNKkYUtsKyoer0MJEG9A24Ed
         8oNp4metO/NbB+eYqcKPlhIuXqy+Gj4ON86emrAL7AHCv7TX43VSxTxu7+VvpQd6rlbB
         sb1G9Q+xaqCAOIct/sUqVpPnmJMu/KpvSIre8wWcQOsQTAldIf79xbHOKvLOUUuB8wU5
         dROg==
X-Gm-Message-State: APuU4Z/QNhTITBxJpDefeteScZqGQRSgkbOMAsrMgL5gxOWZl6YlIkxh
	xqeMO/02l01kctl69uQI2D03aSM/RYd2pQ/5dorUaT9jIxBEaCAnPU4GvsQ5MBtChcCoGS5xeOQ
	5B1jw
X-Gm-Gg: AYBFou11K3bOaayABCQngYV9QdGAl7t4YtXfgZvwb80vpPhrktqn5idIUkfHepHjIYh
	mLGJyMXCMHMT4l53UrKeQ5egp1Lvj9MJ5AoyB0RKDBpkC3++wA9ReeVuSeKmRnrFUVgDCN0fJVP
	o+L8yINcryT61O86cdekdWU4z8vwdyo0X539VazT1MysUs7TjUSulwQvqahY/m5I20ZpXjnvOON
	+RELdwaJ2EljcsI16bQScskIFsZn/Ccv0rgNrdF27sMGq+0u1TprM8rNvZWWJuKc4d1S+l6yQEm
	l8PbPsUTvJoovz/p8R+7p5oOxVCaRDlF8DJFTAth+gLlAfiRQyLgkxaUWZ3SlInOLx1G3OIIZIp
	WJOF6DaWmKdhzy4dkBRoSSCj45qoU45iLD9KScGQ9g0pV1t568aEuHKgu1fKFWQTpHDKtvzBrvQ
	pKmMcXqcq2XMsNCHn53MPBpxnGIzfPRXbgAFiopHXsd4dAHCCEic8JUMGYDchFGbXjF1L99Fm7Q
	YMvpO9hn49mgxglkvVrisJf8sHn2KdsKaFzldfUL8ztUgqAx77LcD8QpkiABMmwzs5vQvyJ3Xm2
	zTvnvfp6okZf+qH3IfLYvkBpqJvujGfgScw9acAfvGUKzAb2BQ1LqepK4zlEcyXivM50PyJZyxj
	96FpVLiRYw2dIaukbvXVpaI0qhn+bja3KEjhprtI=
X-Received: by 2002:a05:600c:64c6:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb887c3412mr83301305e9.2.1795195664032;
        Fri, 20 Nov 2026 09:27:44 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm1946485e9.1.2026.11.20.09.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:43 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-configargparse: Upgrade 1.10.1 -> 1.10.2
Date: Fri, 20 Nov 2026 19:27:38 +0200
Message-ID: <20261120172740.3283871-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 17:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132778
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.10.2:

Fixes a regression in 1.10.0 and 1.10.1, and a bug in how
TomlConfigParser reads section names.

- None as a command line arg works again.
  parser.parse_args(['--foo', None]) raised TypeError: object of
  type 'NoneType' has no len() in 1.10.0 and 1.10.1. It gives
  foo=None again, as 1.9.0 and plain argparse do. The same goes for
  0 and False.
- A quoted part of a TOML section name can now hold a dot when it
  is in single quotes or comes after a space (#370).
  TomlConfigParser(["tool.'a.b'"]) and TomlConfigParser(['tool .
  "a.b"']) now read the table [tool."a.b"]. Before, both names were
  split at the dot inside the quotes, so that table's settings were
  silently not read (tool."a.b" already worked). Writing a config
  file with such a section name now writes [tool."a.b"] too.

With that fix, the quoted parts of a section name follow TOML's rules
more closely:

- Backslash escapes are read in a double-quoted part and left as
  they are in a single-quoted part.
- Spaces inside double quotes are kept. tool." a " used to be read
  as tool.a.
- A quote character in the middle of an unquoted part, which isn't
  valid TOML, now starts a quoted part, so tool.it's.x is no longer
  split at the second dot. Write it as tool."it's".x, which works
  in earlier versions too.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...onfigargparse_1.10.1.bb => python3-configargparse_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.10.1.bb => python3-configargparse_1.10.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.10.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.10.2.bb
index 8631ebc7ab..eac7a19dfd 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.10.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "8ee7c4429e6402b881c9a85569eb9484db2f63260718b45c67c59625284371c8"
+SRC_URI[sha256sum] = "2deb0b3d6d46ff6e3218fcd350127507c5e3c11e21c8072a9fb24531dfc9bd4a"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3


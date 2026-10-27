Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14656.1793092852579654626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cu1uZHD7;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so44632595e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092851; x=1793697651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mrLkl0QCKuqthXf71xy/qLOGLHTm7Jo9sv25SEwNfw=;
        b=Cu1uZHD7XZi4w0oyh7Azq2hwUI64ULJaXOVWMaysFrPpB/QUqTJK7+Ppmgs8/PdO11
         u/2SYFdBQ41sZvz+DoXkLwLpKN/suTur9v4x+hkYoO2t7183NfxN4nkRUVSzQT4yvxnl
         Ae1cItPJL8+mMGqfnradfSGt02xHeD/vuPhl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092851; x=1793697651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mrLkl0QCKuqthXf71xy/qLOGLHTm7Jo9sv25SEwNfw=;
        b=HybITgz+IhKvMEjvE2sk4d/5sqzHCh6cIAcdyQDiKdwctO5QkAY+3X78h6rxuV9vZw
         I27RkQgfidXNOiapmOqNPI2/Xh66MhFT5Fz12SRXBvLPDORefGX+RjIfxVydzdc+BF4R
         B/yDdjusqYnm5VIPl0voptACAE+X9tdljzAWnsJRx4b1x6gpUn4bNyQjBNwlLH84Kyr4
         62mRBVKfRFW1HA/tPoWZRhaNoLZWqSklR1IYGnh4DExgB3oi44tSHbdn+cnM7DBIEBsh
         P+T+MOFravzwXLonEltOkgutNqPuqty6A9vAlWo0SXrdQNQ/Ya6reIEA2pduoZHHkNYs
         N1gA==
X-Gm-Message-State: AFq9FYKzbbnLQ4Y73rBQ/pLjDjG56CRDdoTJRNQzS8+vMXO2kzlBcJLv
	MaWwCPf0ZhIHRnoUSDE1Nysx8/sMb3KOFg4h6oAMZEF+n6ePMj9ivKQ7nG1EwvdlKil6v5dpkaE
	v66RL
X-Gm-Gg: AYBFou3KdOouV1rkgsBepMamijeL+z7fJtP8RaHFocoQ+BdgpR2VCQUFjSSgoG3aTeo
	Ct2q1PZviHg982sqLlfF1jX6q9A3ALJo9B/FJ5Oj2enqJBQf8KgvaoIP6CcZvBww5Vzkr2uUb0P
	z8nr3mloFSrtkM5Eh7Ntr5HnqPgNHur2UjLIRy/gomv3shkyO0uK02lK/FeS05DME6MrIO1W+l8
	rWuk5XHhLFeLwv+tznm5aHH6yBA0rO+HgXNTI3r4sm09qPyfgAObvvYgwWn0LgkTOBNycZn7qkR
	6wVVdtfGb3w+wjv5Q7l/1mSxG8Of4LY+6uSAMCzYHT9/XYDzLnvHNptsKT2Oxvy6980XZ5TtEF1
	vJgs1XaPqh7FsosOl8l8HtchJgDgKqecm/525e0dS6Vva8srINyv7WQaOsnoqJkmDz9Dw+0F58h
	zGNoJt2eh8r8BU4pSIuDBUt3ICIcfSYYYLMDGJVNYAKPggP8YZpD5BqMrUhJVdE74FQ3/Swl9rp
	hJGBBjDeik+sFWxpUMIrMeoTOWdLt91ydaJwi2vkugMrE2n1xFmC3t3rYOyvJLh37jlkSr2b4Po
	xIWQwdKmE5GCaFbGXP9bwfKBNS1akmQ0PmFUWr6hubBQPOQfbaV1w7EFUQmYAmTyE17SwUqicdW
	qaDZ0
X-Received: by 2002:a05:600c:3ba9:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4a35ac99bbemr178180975e9.15.1793092850841;
        Tue, 27 Oct 2026 02:20:50 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:50 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/61] python3-pyee: Upgrade 14.0.0 -> 16.0.0
Date: Tue, 27 Oct 2026 11:19:45 +0200
Message-ID: <20261027092028.782979-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131482
Content-Type: text/plain; charset="utf-8"

Upgrade to release 16.0.0:

- BREAKING: Use the Self type introduced in Python 3.11

Error handling improvements:

- Avoid logging callback failures when queued executor handlers
  are canceled

Documentation improvements:

- Add Args, Returns and Raises sections to public docstrings
- AGENTS.md file for AI coding assistant guidance

Local development changes:

- Type check with both pyright and mypy by default
- Remove tox test matrix, leaning on Github Actions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyee_14.0.0.bb => python3-pyee_16.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyee_14.0.0.bb => python3-pyee_16.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb b/meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb
index 3435ea64a5..ab40be2150 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_16.0.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2b1cc8797dff32cec5d783148fceab5"
 
 DEPENDS = "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "76dd0f4314ecd27f02dc73589dea7fd3853f9b6176d8ef9b122860657e3602de"
+SRC_URI[sha256sum] = "34de6fbc4d8f0880bb997efd0eb642ba01f02688e740cbd3aa3bee9db4b1c5ec"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3


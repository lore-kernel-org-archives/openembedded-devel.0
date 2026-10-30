Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8914.1793358225912705877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HTuQkK+4;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so349889f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358224; x=1793963024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hauj/pl1EHfuNLVU+NH11p1BHiK9NwOr2sI3Vpj9jq4=;
        b=HTuQkK+4VMyqUbDP1v1PFwEhnb6QO14f5yAG+03nkocXov7IO9uPIdEHiuXXMhqHRj
         QG/btFDvb2NbY7UekBLyYLWbnRro8/6eb8dZJrtdVwOzdIefoHJbeA/W2HXP+dnfKWkv
         21VoMxT+mpIfyUpGmNGQyBLjmju8vqjmXdZzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358224; x=1793963024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hauj/pl1EHfuNLVU+NH11p1BHiK9NwOr2sI3Vpj9jq4=;
        b=ZmE5UD3Jc3mxB+A1DgmqS5YtmqjjyMgl9oZnwGaWRHim5HFkN85NaRNSmXPoqMhCAI
         mIQwWHIGall3XVzKwQOVJUJp1SNiKUuuGUWXFlXzhhxKRXzQu9JBZua0han9HKyMTYcg
         Cg+SJFXMhsN5gldT9w3qUrV5gqGMltDSZ/XKdfJ6JWmpjGkMeeGQ88JOjTONDK7JOl9T
         XedfR+pcDRwUwl545IxAsfDRXr/q8MUmJdFUGSFiW01mU+hORMV82kH86sD6p2t11Y+b
         VZQlAMu/WEwSR6yGefenxecc7X5dR/KRMbu4SrEUu2Y+H2fuZ+61XIttRTsdXFaES9nk
         kdyQ==
X-Gm-Message-State: AFq9FYKPAuHFte5ElC8ddxL4nkSZE2bTxwIEeaV3GSs6R5QQWr7VTWZa
	a2dpu0tTEyfoUpXEbScMmZ05ygMeYm+6MlrHd1itD3OM8b1XUhJT5jP99g+xf0H8chYbsMvdnA4
	m0/4n
X-Gm-Gg: AYBFou3YyHMHbrH2K5Cc75LcxhwkE3JRSDh6OmqFySLkE7GViiRNnPbr1NJbHs8cv/7
	3Dpy0ZnLYquxL3QuWSNOErhK/75h71CUmZXkhAoQ5ryrE9EEHACVqv4NUEvp+knB9WoG8s3/oJa
	enZcJakmADKDCfugh9GCAjmAMXDOgIV34bHvfki/4TQ/NzstnXDg6TDr5yfB8pXJO0+8+4g0H5K
	gd8dqfB8EcmgjbnHlg5LraC7I+IBd7VHRji2Ry0FVUxEK+4+UeaH0MVcw0ns0uuFWWURWFSc0N8
	2JoZffmOs8q1IHU7OhWknGdWmi7sOZ0+Idi2SJYyl21WcOZJ6rreoATuc2WvudlVLNrY0uLf+Z5
	Mp3bHg2Fieq7ISMCbpWIsB6527JAi7zquMDhs3cEIQBfgbHlyqjq5qfUVbp6veOIeQhzRwveBDE
	U7+KZsOOp18zvUkwP7O+T7nJLspzcFoIk4XWwklJd9YDTn/Zei1LNisI2r1XtJvU/wC5QeEZQfT
	FBWOnP80HXPivHOg10tVwdRzEI2V6Fwl/7B73IruXGsKCXPmIsCT+BzZHBM4pDvbBGNdsvxSxAe
	Oj7Yi1CxFYiSXSsvYsg3qZeah9bDnDZnc1JiC3KywFucXpMlTr+f2em3PV4dWgk82G+05n3pWpf
	I3XDBfZQhmVJBZpZe8iFy+S5xXzyoE78q2YyzGSZoEcLSrtOYz3Ef9w==
X-Received: by 2002:a05:6000:46da:b0:48e:73dd:8592 with SMTP id ffacd0b85a97d-48e73dd9159mr901257f8f.9.1793358224024;
        Fri, 30 Oct 2026 04:03:44 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 23/25] python3-pyunormalize: Upgrade 17.0.0 -> 18.0.0
Date: Fri, 30 Oct 2026 13:03:07 +0200
Message-ID: <20261030110309.1124614-23-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131705
Content-Type: text/plain; charset="utf-8"

Upgrade to release 18.0.0:

- Upgrade to Unicode 18.0.0.
- Drop support for Python 3.8 (requires Python 3.9+).
- Refactor architecture and optimize table loading for better
  performance.
- Modernize packaging (pyproject.toml) and adopt Nox for testing.

Fixes:

WARNING: python3-pyunormalize-18.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pyunormalize_17.0.0.bb                 | 8 --------
 .../python/python3-pyunormalize_18.0.0.bb                 | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyunormalize_18.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
deleted file mode 100644
index fe367aa112..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
-HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1d882216fa7fde0aec58695aa05ef72f"
-
-SRC_URI[sha256sum] = "0949a3e56817e287febcaf1b0cc4b5adf0bb107628d379335938040947eec792"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_18.0.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_18.0.0.bb
new file mode 100644
index 0000000000..3b079ca418
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyunormalize_18.0.0.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
+HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fcc278e239c8cbad362b2a7229f69b5c"
+
+SRC_URI[sha256sum] = "2b2e65201e688bb38c66ab66ef1071cc07b32e9840e5ae07aab716db6ede7d6d"
+
+inherit pypi python_setuptools_build_meta
-- 
2.47.3


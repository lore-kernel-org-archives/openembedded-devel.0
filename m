Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760F0D1039A
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:05:02 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.4203.1729911896496494244
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYK9FsDx;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso1983277a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 20:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729911896; x=1730516696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3J1MbvlGIfSSbk357o4+m8yk5mpVoCgL7yM+F1MNVqQ=;
        b=TYK9FsDxLN3Dpw+2ISbAOaH3/AEFwVXuU72+5XfqcSQ6LUnnl+Ykc6e9WGHqJtY73y
         JwHiJhrk4uF2dHVtez3eAO3KuO3QHobuaNddYEUVP/YhOBW4f6zy9z3m0KtgEc/hxcDD
         OpwUkciSz4YAuVdFiy1ZjHOr0Z3jBjH8M6/iiv62Ylel1flpA7bM5o+ejNId+oLhJh84
         7eU5Tig8JTBXIGzSuqSs0gHhBqoJZ0CDGduUG0XidkeAXx2rkZANFbsd+YA8YBGQPHh4
         9KhGPKs5mriAWKbvlZF7bfBT6Lpi+8jmZtvSslQCkGlo910POFEvjUsG4l2I+fEK5HFU
         rraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729911896; x=1730516696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J1MbvlGIfSSbk357o4+m8yk5mpVoCgL7yM+F1MNVqQ=;
        b=WPyY9Z/iPW/BeEq/FWEMXrpMXn3bPYSooXpc35GkW88uewvJHHt/K4iiNkde8Km9AK
         hqSpdY6WstZvJKJLXicwt0s10AIfNrQ99vtdJJpkwT1kn1Qgrw//JniMhDQsu7D+yZLn
         M8tZEsavGHyEjA8GgrApw0mSTpgXbsjryhLSCw49O7WMVrZjdB4fLfx1soa1onW5UfOK
         lDwXpfElw8y4DuGgZyaDrWcGMF1kRNfx9jK4PCe9Zjorg+2zgaTGSYphJcWwSsVihQuT
         mF/JnVo9Zb56iwvgcWe7T6hPLvUU92Cp8hbKG99GZzRuTM/TljJEMbrYN9MUlNlHcJUI
         E7wA==
X-Gm-Message-State: AOJu0YxCrycKzGr/HetyVrLtSv4ctZ3V6vIFNrdbAs+wmfws5V7I6CYn
	LKznZgo5QAbbooweZ/97bBlCLG5zD9j08LHo8mlhsw5R096fqYCEw6ieYx8l
X-Google-Smtp-Source: AGHT+IGL8JkZhycKY4fSWE+78Gxn03hUo6cMIW5xUArFhbSdk7iJXbeQ+Zwdbyfr9LnWrgM1Leh7Jg==
X-Received: by 2002:a17:90b:342:b0:2e2:a96c:f009 with SMTP id 98e67ed59e1d1-2e8f105e9d4mr1837629a91.9.1729911895392;
        Fri, 25 Oct 2024 20:04:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7c83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771a1fsm2307317a91.57.2024.10.25.20.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 20:04:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-zopeinterface: Upgrade to 7.1.1
Date: Fri, 25 Oct 2024 20:04:50 -0700
Message-ID: <20241026030453.2517894-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 03:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113231

Changes

7.1.1 (2024-10-23)
Fix segmentation faults in weakrefobject.c on Python 3.12 and 3.13.

7.1.0 (2024-10-10)
Declare support for Python 3.13.

Fix segmentation faults on Python 3.13.

7.0.3 (2024-08-27)
Fix Assertion ‘memb->type == T_PYSSIZET’ failed. for Python < 3.12.

7.0.2 (2024-08-26)
Fix reference-counting bug in C module initialization (broken in 7.0).

7.0.1 (2024-08-06)
Fix subclassability of ObjectSpecificationDescriptor (broken in 7.0).

7.0 (2024-08-06)
Enable heap-based types (PEP 384) for Python >= 3.11.

Adopt multi-phase module initialization (PEP 489).

Drop support for Python 3.7.

6.4.post2 (2024-05-24)
Publish missing Windows wheels, second attempt.

6.4.post1 (2024-05-23)
Publish missing Windows wheels.

6.4.post0 (2024-05-22)
The sdist of version 6.4 was uploaded to PyPI as zope_interface-6.4.tar.gz instead of zope.interface-6.4-py2.tar.gz which cannot be installed by zc.buildout. This release is a re-release of version 6.4 with the correct sdist name.

6.4 (2024-05-15)
Adjust for incompatible changes in Python 3.13b1.

Build windows wheels on GHA.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...3-zopeinterface_6.3.bb => python3-zopeinterface_7.1.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_6.3.bb => python3-zopeinterface_7.1.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
index 21d03f2e7d..76b0641817 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_7.1.1.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 
 PYPI_PACKAGE = "zope.interface"
 
-inherit pypi setuptools3
-SRC_URI[sha256sum] = "f83d6b4b22262d9a826c3bd4b2fbfafe1d0000f085ef8e44cd1328eea274ae6a"
-
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "4284d664ef0ff7b709836d4de7b13d80873dc5faeffc073abdb280058bfac5e3"
 PACKAGES =. "${PN}-test "
 
 RPROVIDES:${PN} += "zope-interfaces"


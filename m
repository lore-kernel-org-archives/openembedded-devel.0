Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001CCD715C1
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 05:32:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13628.1769232737888150285
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 21:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ent5WEJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so24425695e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 21:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769232736; x=1769837536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OftCGg8bcsgktXpatKNIWm1p/oLhgm40MktJX4eWZGI=;
        b=ent5WEJ4ntmhbOoOP8g2023V6WrShAfY7iYbJdG+3jy4zM7bIDeE/5E2Hj/fEDxoCq
         BbEnvbS8PMKk7B1+Dp10AUKLMPXfoPxYAcn6UVfsmYmqQFkJ20niskS+Wkt7KMQ/qjxT
         s+crNuPxmFFlODxeU4KQXndCkRLzWucFvsYrSdn7rqw1W/8BzuefoplJKhCOUWk59c0s
         lM5FEeoUmzfhOzpqjH+ioOMSo96XQZrTqGxjP3vjnq5drqalyPN3rhCfXpBBfZ1aB1R1
         0SxlPmUI1Wc2s8Y/D7g9ZVv3OUIlX7gh6ODVrOridA/VjTeu/JHzmPDF0dgUyduuIjpI
         QFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769232736; x=1769837536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OftCGg8bcsgktXpatKNIWm1p/oLhgm40MktJX4eWZGI=;
        b=u/jwrP9q8sgOac1u7eTktW6gpZbByDLwTUIl7Jx4l6GmcdYEgNlInw+QMbAGW4hVNV
         u57jrCDp9H7IzyvnE09knxUwpasFrJqeoVEYT2FEUBNh8VqgRfaZ4MralWB6bp86idMD
         krvZNdsnIRiUqj23UsefZH3HXwVHC0g0HhpzlMKqnQWG+rXbc33qJoQVZ73AJ5iTWwhM
         1w1WCWl3e6bptpYY3t+D5kVu+CID22MpzSlFcTs1UClbUtPhNNtDhogghd/oIbzqztit
         m8ePkuP+1a213G70wYFWzXW6R1/2OAfEpLj3Xn6fdU4A/VoPjpd2iPUQInvwE0eMt1vu
         ek9Q==
X-Gm-Message-State: AOJu0Yz/wsz3iej6L8LXdHSgcDwNaVSPW4/mtHSK9CXlxD/xxan2bLKw
	lBUm3HQAXf7v2ZSDbUG/8/Jx2AyjTWk4PA+9e32SwGsJtBEKiK1WfyHMsuyZ3w==
X-Gm-Gg: AZuq6aIJ5u+PVsiI/W2X32xhIUK6UBRpYQBvKDGkg0DjOLCOTCwCttgx7vGWz/3Ieno
	6myfwOdPZ5N0gqzAebyZ1ZWhtZZdhRVfmNsL2r1Axc5dB6/Usr8syHU0xvxRczuRfF2UPDh4cgC
	RTjgYcBGg+GrIGp94TdjUlaqJOmdFtukeX41H1AxzJh7jbZORrfNDpqiWL3F4FuOO3emQcUQyVf
	xb9AOB5xYw4cnr2X6qMleLxElWgmNiJY4SohyIpWwmYrjQy8orBjLPgkmZvYlXLMQozgvH3FIiK
	bK60/86aNDdxvrILHNqU4cA+jyf4trfrnu3wVDaJZjYxJDK9/OiTbXNyMNLcZ/czKOm8YOUVatG
	L43vNTmQEoe7fWL+4KDar3/Er/Ots7XCIWjaaO8tX94kcMkLyJURUfN8YsAN3sIgDqkBORKlX80
	fi8CWeV4f+
X-Received: by 2002:a05:600c:820c:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4804d2bea8fmr80154545e9.8.1769232735866;
        Fri, 23 Jan 2026 21:32:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbb6315sm40746155e9.4.2026.01.23.21.32.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 21:32:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 1/5] python3-paramiko: upgrade 2.10.3 -> 2.10.6
Date: Sat, 24 Jan 2026 06:32:11 +0100
Message-ID: <20260124053215.4066209-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 05:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123802

Bugfix releases.

Changelog:
2.10.4:
- Servers offering certificate variants of hostkey algorithms
  (eg ssh-rsa-cert-v01@openssh.com) could not have their host
  keys verified by Paramiko clients, as it only ever considered
  non-cert key types for that part of connection handshaking.
  This has been fixed.
- PKey instances’ __eq__ did not have the usual safety guard in
  place to ensure they were being compared to another PKey object,
  causing occasional spurious BadHostKeyException (among other
  things). This has been fixed.
- Update camelCase method calls against the threading module to
  be snake_case; this and related tweaks should fix some deprecation
  warnings under Python 3.10.

2.10.5:
- Windows-native SSH agent support as merged in 2.10 could encounter
  Errno 22 OSError exceptions in some scenarios (eg server not cleanly
  closing a relevant named pipe). This has been worked around and
  should be less problematic.
- OpenSSH 7.7 and older has a bug preventing it from understanding
  how to perform SHA2 signature verification for RSA certificates
  (specifically certs - not keys), so when we added SHA2 support it
  broke all clients using RSA certificates with these servers. This
  has been fixed in a manner similar to what OpenSSH’s own client
  does: a version check is performed and the algorithm used is
  downgraded if needed.
- Align signature verification algorithm with OpenSSH re: zero-padding
  signatures which don’t match their nominal size/length. This shouldn’t
  affect most users, but will help Paramiko-implemented SSH servers
  handle poorly behaved clients such as PuTTY.

2.10.6:
- Raise SSHException explicitly when blank private key data is loaded,
  instead of the natural result of IndexError. This should help more
  bits of Paramiko or Paramiko-adjacent codebases to correctly handle
  this class of error.
- Update SSHClient so it explicitly closes its wrapped socket object
  upon encountering socket errors at connection time. This should help
  somewhat with certain classes of memory leaks, resource warnings,
  and/or errors (though we hasten to remind everyone that Client and
  Transport have their own .close() methods for use in non-error
  situations!).

https://www.paramiko.org/changelog.html

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-paramiko_2.10.3.bb => python3-paramiko_2.10.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_2.10.3.bb => python3-paramiko_2.10.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.10.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_2.10.6.bb
index 9f7f458723..5a367df710 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.10.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "ddb1977853aef82804b35d72a0e597b244fa326c404c350bd00c5b01dbfee71a"
+SRC_URI[sha256sum] = "faac4820a3173997c378da74b72e832b1ff075ea1a4ee3c0ba048aa30ee49cf1"
 
 PYPI_PACKAGE = "paramiko"
 


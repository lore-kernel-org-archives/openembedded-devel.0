Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.20328.1611493072266180118
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Jan 2021 04:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IycsmwEq;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id g3so14075189ejb.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Jan 2021 04:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E69YRwhd7tMeNov2HnXSu6LSQI/COFcdBDKjHZkSZCQ=;
        b=IycsmwEqp9BaZQHUuI9aEwSiWyLVF2AyWWtxhgkRSkufPLzpUXKd16t7jAIcBe8omF
         u7CRObELC47yV+l0Q4cdSE36TceasKyYZOE/B0acIGTqI0j7apppAHO43Phovt5q7ceQ
         4jnGtNgDeoJS8Vwl+1YvOhvPRWm7TTawxUPGWMVgfyEsrT8kut1Vohi6oSZruoJ/9jPF
         HKPmK7nOxUnrElUuaSaa5WgC764nHjpOWf8DeUZKFdS/4VmMmTMo2LxH52+A+CRXAlL8
         4SGECJg3XziDuhJTFr0uR70HPiAbAR0rnXsE7LV8JPxVF4fxOCDTL70C5P25mufKllX0
         Z/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E69YRwhd7tMeNov2HnXSu6LSQI/COFcdBDKjHZkSZCQ=;
        b=Y+taJ1rgkdW46fzkw7xLCPUrcB1Ie3HJQQDShq6O3S8vKWsp6ePXPi8e//g+7ZP18w
         Zsv5VFXaaveFfVPF4WEyJ1I6amibD2YDdgWMVoY2dxDEgFtZVKb/+RqcJKQsqyOoQpGx
         x9jfUneUr4DNFK5Cjl9foyQjth9UXwvkjoVl47BThO3167aUih6Z08xDmSzTk8Q0h7mE
         jh/uOj/f1SkK7ar9RrXRD57e8LOMc3Kk7iKtTTH3PDZu5FfzcttvxCLxoC//GrSYXhs9
         2oMY7mJllgTz8kuM7v0QGr+ksErZBjogiAssfxZK6v7nlXcOuRz5Gg8ktsyQGrkIprwj
         NDyQ==
X-Gm-Message-State: AOAM532akygVk5H4Xo8PvMAAhjYk03Z1eT9C/DVfvdzT+erTFO5T9rrl
	cucCSQeeXaz2Y1hvOJ6i4PGoyJ0A8u5PIg==
X-Google-Smtp-Source: ABdhPJxB8j7pkMQcHAwhIA1XqIRwkjqfLuyyN8xAR8DvVR1lsV0NzVzeYMI6vHPMx3HRQDms01pvNA==
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr876186eju.375.1611493070750;
        Sun, 24 Jan 2021 04:57:50 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5716d2b4f7e43234c54.dip0.t-ipconnect.de. [2003:f0:7f38:e571:6d2b:4f7e:4323:4c54])
        by smtp.gmail.com with ESMTPSA id f20sm8552289edd.47.2021.01.24.04.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 04:57:49 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH] packagegroup-meta-python: Add asttokens/mypy/mypy-extensions/typed-ast/send2trash
Date: Sun, 24 Jan 2021 13:57:41 +0100
Message-Id: <20210124125741.2886-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is send to be a good boy because packagegroup-meta-python looks broken to
me:

* Tryping to build fails with:
  | Missing or unbuildable dependency chain was: ['packagegroup-meta-python3', 'python3-cvxopt', 'lapack', 'libgfortran']
* We have two "RDEPENDS_packagegroup-meta-python3 =". If I am not mistaken
  packagegroup-meta-python3-extended and packagegroup-meta-python3-connectivity
  are noobs just setting some variable inside of packagegroup-meta-python.bb.
* Since packages are not sorted it is close to impossible to keep track what's
  missing

Please don't ask me to fix this - have no use case for it - and it is beyond
the scope of this series.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index bf46896f1..0b00611c3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -48,6 +48,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-argh \
     python3-ply \
     python3-astroid \
+    python3-asttokens \
     python3-ndg-httpsclient \
     python3-arpeggio \
     python3-astor \
@@ -184,6 +185,8 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-prctl \
     python3-pyatspi \
     python3-multidict \
+    python3-mypy \
+    python3-mypy-extensions \
     python3-netaddr \
     python3-parse \
     python3-oauthlib \
@@ -397,6 +400,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-trafaret-config \
     python3-twisted \
     python3-txaio \
+    python3-typed-ast \
     python3-typeguard \
     python3-pytest-timeout \
     python3-ujson \
@@ -428,6 +432,7 @@ RDEPENDS_packagegroup-meta-python3-extended = "\
     python3-pyparted \
     python3-pywbem \
     python3-pywbemtools \
+    python3-send2trash \
 "
 
 RDEPENDS_packagegroup-meta-python3-connectivity = "\
-- 
2.26.2


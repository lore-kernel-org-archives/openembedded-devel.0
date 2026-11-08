Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2896.1794165955149087413
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so1314915e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165953; x=1794770753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAEZ7Kzcw4QKE42iufg3BnTuhu+NhTVOegHjM1oJpac=;
        b=kqcoKnGIO3K30VIi1+Oj85Rq8Bj+gQrC0cfHDfauqq+Jvn6W5frLXFOXmF6aK519t5
         9hVLpw3mtE6FKZkDS2VQt4PW224rV+Lu6X4vfV6upaCXB86XI3QVb2mR9tvjF8LXraMY
         DY1zJoYmY1m4bIEV1k9XQUnxYETykgX9SvmttPtDeiu9puLJjgvMHR4NPut8EI9yqLBZ
         JXoFRJqf/2LTixn9Ztde6+8/r/Md8qJ7CbuzEccGIw9M24S4ABZjQd7mmSzCOYKUfwwI
         qiWPcg7hvrMufl906e79XHXVjFb98NSFRQgyBBLN6BTYuO05a1uqpghzc9Z752o4lpeq
         jD9A==
X-Gm-Message-State: APuU4Z8SW5ieavfsgTcpy7sgjWea3kAcEyb7wkoTR6DAG66fHS8LDnba
	nDUzpRX2/O0EkBnGqMFGQ3bmYxDRS2Jv13O97fcg7WrjgxRerFR/bdPf5/+MQg==
X-Gm-Gg: AYBFou06i7k8o8+qYvBRPvnOuyXjjgz0NQeuO84h4Mm1zIT+yuIRO//ajfpC/lMQLoL
	8tKIWRF6M3yip/A9f7DAJJm4ytuLDoVWFQm7j6YeVGjIsXNuMCoqfUH9EtpIkH3dQc1TyD54l8x
	xl6vOceJ+CrYkXXQhIm1CaBsBkHuY7SF08oM9PqdAoZAtx1P7ghy1jQGLkPrziso56pI7LwwP8H
	McDBR/s82kYDHizXCPQzkZOftJPzPEZtpZYNkkUHXkT4heGe1XOkft58Y9LPedPD+TUzWixWIl7
	Q62bDVg5hcX0xOIfYqmhCnUxrj6mb9KTaVrYxi/575aK9sG3BHumyprMc2YuOk1Bo9QHLZ2TWTe
	TcYg7om7k7KZxx30ttBpaXnfSpUzP0zH2StNlqroJ/ed6cHkIeek7GuT6AXsbm6mRYoCZnCp30y
	DNDhZEQ2TsV0dCjFLuMGUPOOxvwgmJcqht3FB5jSll5ndcCv1HMmPL0RzPOZVj0YbH7jrY0a7PY
	4JgvkeBwz9OTedEhYVgkOyK2t5Yc/hW7oaJJ9yx1ZOIdnQv+89zhFxFYfGtQYGW7v4/5MHivZjC
	c9oFIDzaXOU42Y5WlMis7UtDalbWvP17GUzf32jY1veQgECSGeyyu+maeb1lgQkXaoYtBtJQoBe
	nANxoxwNZlqnrUneu7VXE9rIyAG5Il5QUarZdvFiv5yAxd+YrfzanjF1L1w==
X-Received: by 2002:a05:600c:c174:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4b963c675c1mr42833875e9.12.1794165953182;
        Sun, 08 Nov 2026 11:25:53 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:52 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 0/6] Fixes for pika, pint, haversine and httpx2
Date: Sun,  8 Nov 2026 20:25:43 +0100
Message-ID: <20261108192549.1082715-1-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132015
Content-Type: text/plain; charset="utf-8"

Four recipes in meta-python install broken or wrong code. I found them
while upgrading meta-homeassistant to Home Assistant 2026.11, but the
fixes do not depend on that:

- python3-pika: the 1.4.4 upgrade only changed the unused sha256sum, so
  SRCREV still pointed at a 1.4.2 era commit and the package installed
  pika 1.4.2 under version 1.4.4. SRCREV now points at the 1.4.4 tag
  commit, and tag=${PV} lets the fetcher check that.
- python3-pint: flexcache, flexparser and typing-extensions were only
  pulled in by the ptest, so "import pint" failed on an image without
  the ptest. flexcache and flexparser are extended to native and
  nativesdk like pint; without that, python3-pint-native fails with
  "Nothing RPROVIDES 'python3-flexcache-native'".
- python3-haversine: numba is optional, but haversine only catches
  ModuleNotFoundError. numba 0.66 (meta-python-ai) raises ImportError with
  NumPy 2.5, which broke "import haversine". The patch catches ImportError.
  Submitted upstream: https://github.com/mapado/haversine/pull/91
- python3-httpx2, with the new python3-truststore and python3-httpcore2:
  httpx2 requires httpcore2, anyio and truststore, but did not depend on
  them, so "import httpx2" failed with "No module named 'httpcore2'".

The series is independent of the "Python updates for Home Assistant
2026.11" series sent at the same time; both apply to master on their own.

Related changes for the Home Assistant 2026.11 upgrade:

- openembedded-core: python3-cython 3.2.9 -> 3.3.1
  https://github.com/thomas-roos/openembedded-core/commits/ha-2026.11
- meta-openembedded (meta-python): this series and the updates series
  https://github.com/thomas-roos/meta-openembedded/commits/ha-2026.11
- meta-python-ai: 7 upgrades
  https://github.com/zboszor/meta-python-ai/pull/46
- meta-homeassistant: Home Assistant 2026.3.1 -> 2026.11.0
  https://github.com/meta-homeassistant/meta-homeassistant/pull/207

Testing, on top of master b5d60afb63:
- built for qemux86-64 (x86-64-v3), together with meta-homeassistant's
  core-image-homeassistant (Home Assistant 2026.11)
- ptests pass for flexcache, flexparser and pint
- in the running image, Home Assistant starts (it imports httpx2) and
  all its integrations import, including the geo_rss_events and geojson
  based ones that import haversine
- python3-pika: built; the installed dist-info now reports 1.4.4. It is
  not in a ptest list of meta-python, so its ptest was not run
- checked with bodnuti: patchtest pass, no oelint-adv or shellcheck
  findings

AI disclosure: the patches, commit messages and this cover letter were
written with Claude Code (Claude Opus 5.5), as the AI-Generated tags in
each patch say. I reviewed every change, ran the builds and tests above,
and can answer for them.


Thomas Roos (6):
  python3-pika: build the 1.4.4 release
  python3-pint: add missing runtime dependencies
  python3-haversine: keep working when numba fails to import
  python3-truststore: add recipe
  python3-httpcore2: add recipe
  python3-httpx2: add missing runtime dependencies

 .../python/python3-flexcache_0.3.bb           |  2 +
 .../python/python3-flexparser_0.4.bb          |  2 +
 ...-pure-Python-kernels-if-numba-fails-.patch | 40 +++++++++++++++++++
 .../python/python3-haversine_2.9.0.bb         |  1 +
 .../python/python3-httpcore2_2.16.0.bb        | 26 ++++++++++++
 .../python/python3-httpx2_2.16.0.bb           |  5 ++-
 .../python/python3-pika_1.4.4.bb              |  6 +--
 .../python/python3-pint_0.26.2.bb             |  5 ++-
 .../python/python3-truststore_0.10.4.bb       | 13 ++++++
 9 files changed, 93 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-haversine/0001-Fall-back-to-the-pure-Python-kernels-if-numba-fails-.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-truststore_0.10.4.bb

-- 
2.56.0


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A53C5DF74
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19829.1786922657310582242
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dQE7S58M;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf27856f9cso25364995ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922657; x=1787527457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS3s7otBr+uQoyPzu6d33bEJ3VhQ811HOWjhguDi6OQ=;
        b=dQE7S58MEx2lHMu4mtv0CNW9xYFkWSvWAYMpsJ9bEY90EIB7wvCknd0PVp6kQw81aT
         yo1JHnCyLm7tVIYlR14xPFU+WyUyRlB7MaLJxPtu5fVLInJyOyS7xlaJNwxPtotx48R+
         uLETvXVIFZApHosYJc2Ba2YbS0necH93x3bd+OYb6Ojf5eUSdxoOb59Ki3m/xWQR5beI
         mcW9iYHzAdy1JgL31FqBVxckrB/4SthBnY0rL4qkUWYMV+SxEk+l+xI0IvQt0GOUxPL/
         oxwttj8vLVFIDtMAONuWMQ+p8vc3+eIwhM78o99aibob8LNblhdw+u0G7tPNg7ipgbJB
         GUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922657; x=1787527457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KS3s7otBr+uQoyPzu6d33bEJ3VhQ811HOWjhguDi6OQ=;
        b=Ly3lhv/SUb0YODlTkGzq8+N6KwDVkOLg4tZFmCXsSXz/QEu5ElLq+3Ul+8K9afq/et
         j+65Svo6CfyUT1IA4px65yyJe9/0hTp9TEOGU2PR/Cj98FvXkQOFAYMtdQUxB5kJ1kvt
         xkQrD9yNuNmf4sCrENj3DrJad+vljrTapQSe6JArVup6JQjKg5LpmqkpHJvrJKbGHBHY
         88osBCiEwNepQLMZCBHtenazPHUxwrymd+WoKIM2zWZ9rF47pS/oaYCGJtLNib+S9vOG
         9Wz1m7ziWhT++jVQMfaPqMCT8CWykWQmyaGNu1dZWeAffFN5Q9ZhdUmRsOsfy4/0J4jY
         yxog==
X-Gm-Message-State: AOJu0Yxv0Ee0KPV5QBjXm2KJPnmSKyg8jeTkAVULmV4ZiMqN3tuFZ7a7
	muGwQvfkp2VdHBuxPiK4znP9Fh+izihmZztaIGI+d8sydWMkRYG4I3mpZuMzKumg
X-Gm-Gg: AR+sD10JLKyKtdw0I5UOZgUobRY7cWMCkt+wVAEEPhxx4liFF62jRe9jrjxUg5jdL0C
	tonghUjRSis7ahcOX5uVCgKh3t1QiwzHqS91wHIqaGfgK4qVLTLMY0Y310SRuVajRdKw7+lrBIp
	/wvRJm2YDA3PRofNneikpQkkDmWd/UFZvvQf1O0vTS3ll4SkjWvz9Xg6VSf7iz/mPrEquqMse8I
	aS0LBGrsXkgemeoDFubQkJovRbtNPRkI3eXwffa91S1mx2wTsq8+4mlGZKCDwpkUy5kTAGlWgLc
	tDtTGvBEim/VoWlkVF8sRSAid2a1gg5ONyRuqVyITHiQqP5FeYCm0/pQtEVs5PYc1kbFYnhdrgN
	Pxpo8BNwVAXWWEK6QtQWfgcm1Oxsk7PPUzxbnd2baXJywzxZ2nd5P+mIbLF037RvQVKUx3l7Ru0
	Xq9q0++nw9sklkB7uvrzEHcrSzfiwSg7Jc8VqpTDnAyLr9W3lfJ7GiutOJq5kFAyM91LFXwaJ3H
	rCEFy4wKE+9WmlZvuFySJU7U3feXhI6oV8d3hUL+rhjs/DINE6KuAK+XY62hcpH/8PUMMnri4QX
	N8cthWfXTjYrLuGLmSS3yxjsLH85H9Q+fO7ZcA8XvLWUvF4xoYL7qxoQvL1zaMYYLfs6i9SvDqk
	GnYumQWiMkXI1uCRYw7K+M9g9a2DfkXcSve/0nySXLn72fw==
X-Received: by 2002:a17:902:d582:b0:2cc:9179:335 with SMTP id d9443c01a7336-2d3b088aed5mr230249615ad.8.1786922656573;
        Sun, 16 Aug 2026 16:24:16 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 10/12] python3-gunicorn: add python3-multiprocessing to ptest RDEPENDS
Date: Sun, 16 Aug 2026 16:23:56 -0700
Message-ID: <20260816232358.1947922-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129187

From: Khem Raj <raj.khem@gmail.com>

gevent.monkey.patch_all() internally does "import multiprocessing"
during _gevent_did_monkey_patch (gevent/subprocess.py); without
python3-multiprocessing installed this raises ModuleNotFoundError,
crashing any gunicorn gevent-worker boot. Explains both the direct
import-order test failures and the ConnectionResetError seen in the
control-socket integration tests, since the worker process crashes
mid-boot in both cases.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-gunicorn_26.0.0.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
index 449c9685ca..575e8a66e1 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.0.0.bb
@@ -19,13 +19,25 @@ RDEPENDS:${PN}-ptest += " \
     python3-eventlet \
     python3-gevent \
     python3-misc \
+    python3-multiprocessing \
     python3-pytest \
+    python3-pytest-asyncio \
     python3-unittest-automake-output \
 "
 
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+	# tests/docker/* are docker-compose/Dockerfile-driven integration tests
+	# requiring a Docker daemon, which the ptest QEMU environment doesn't have
+	rm -rf ${D}${PTEST_PATH}/tests/docker
+	# upstream's pyproject.toml sets asyncio_mode=auto for the async tests
+	# under tests/dirty and tests/ctl; provide just that bit without pulling
+	# in the rest of upstream's addopts (e.g. --cov=gunicorn)
+	cat > ${D}${PTEST_PATH}/pytest.ini <<EOF
+[pytest]
+asyncio_mode = auto
+EOF
 }
 
 RDEPENDS:${PN} += "python3-setuptools python3-fcntl"


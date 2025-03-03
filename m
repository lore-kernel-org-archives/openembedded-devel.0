Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A251C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 06:15:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.47379.1740982526579206414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Mar 2025 22:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nQv3nnfO;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2235908a30aso51247015ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Mar 2025 22:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740982525; x=1741587325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QH+KG+i4VBYs3Gratb0SvwNaoRa/pxv/9CvCmlGEsOg=;
        b=nQv3nnfOb4hdlZhoOC4/OmOWfzvpTS0CIygVGXgrUl+j+PMOyONQLlrj/b/LJwjPR3
         cXPfyT74p3U2A6n867BHFAfdDsc4j3dsyerV+VSx83Zlz9z2IGP/p9j2WQnwo6z5F8re
         VMuYmWQmgAuQLy1zHr1H4jh9qiPuSE3Px/T6JUYie1IyEXmoa9fzPAGuT9EkUIPAffsy
         +GDE9pKgEr5+EggiKHU58Gt7F9HE/N9pKdkGYuHN/mXwJFUU20yVemeTodLfKOXj9fEx
         L2mIS34QjKibANEVNfrGIdiMLXm/u5n/xx7mjzbAlR0e7EqWBsCO2+5i6mopTmxvm3ag
         jSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740982525; x=1741587325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QH+KG+i4VBYs3Gratb0SvwNaoRa/pxv/9CvCmlGEsOg=;
        b=VJIv2NAkeDDlY+9jMpJtBNua5Ptapkj7vwOE3k1eLD1jHmJuajhBF04dWVk71WiPQL
         hyN23ox2LxBhFWU9FZpvfOjwqJShGL1GUgVYf2cUDcoE/7V69YL7PgJwqBHwCeCRtD6E
         tdboHOSLQpvi//3KlT0+klHl8C+Hl9HQ7MkdTgs9pvQoKbBL9/XUnikmjYEaWtL9AFxG
         /+gN4Ce8JmnLrKfEfYrkC7OlqP3ef5RsqHs/Jk1X2M71FB3RzP5hBDoXmYPD4UUGTNxd
         Z5VylVImHugWo14HztnMHk1QrKZuSgRpoa7m4G4c7hTpfe4JSMIVEZpEFqx/uQ322l+H
         OoEQ==
X-Gm-Message-State: AOJu0Yz/7VD9gwR5cdxmssrnWm8M6hzGHVhV9Tj70SHleboEkzrVpdZp
	xj9UR/xpOUze9Z8+RvekVoZSYqg7jF4lDqTV+wZ9kpZDYq+tKpDbdMOUJnIK
X-Gm-Gg: ASbGncvAFgYBUVT1V/MwHSuh4P5VgTqGcR76wmjrr15D2kfg2IPwqU097aw1OBqmf1o
	F7uKY5GB+maRMWo2p1TxKRsgMvw62zwxNPNJRULNydwKcgSVlpapxEcqK+hkwxV4ROsLFMGjQ/e
	7IS+TJx4ONV0JXbjD0elQ3lJyTsnQrrLDkakxIlRUL2U6FAQXtu+yk2xasCZ85LwN7WkJS50rh4
	W3Kf5iU7VazuCm6cLxoAmzxsmU45t8uqErdHSAunK9L/DZffHvWV6PznSMTpO1GQNALh46q9k6o
	yK9x5xRhMOU03nBIN4zwoKdZtKYvSc06kHOW
X-Google-Smtp-Source: AGHT+IEt6Yh4BpFjIvStd3qVvEZ9R5ftPI5nBKoaAiOwDUDXcpP/lUUMtbna+vR7clB4qyKmICjsjA==
X-Received: by 2002:a05:6a00:14c9:b0:736:3768:6d74 with SMTP id d2e1a72fcca58-73637686f7emr11100230b3a.7.1740982525444;
        Sun, 02 Mar 2025 22:15:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c3fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736550edf72sm1143526b3a.167.2025.03.02.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 22:15:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pyasyncore: Add recipe
Date: Sun,  2 Mar 2025 22:15:22 -0800
Message-ID: <20250303061522.577597-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 06:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115722

This module was dropped in 3.12, therefore provide it as separate module

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../conf/include/ptest-packagelists-meta-python.inc  |  1 +
 .../python/python3-pyasyncore_1.0.4.bb               | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index ee8f957cca..3a1fb13ba7 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -53,6 +53,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-precise-runner \
     python3-prettytable \
     python3-propcache \
+    python3-pyasyncore \
     python3-pydantic \
     python3-pydantic-core \
     python3-pylint \
diff --git a/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
new file mode 100644
index 0000000000..cf91d7ebb2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyasyncore_1.0.4.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Make asyncore available for Python 3.12 onwards"
+HOMEPAGE = "https://github.com/simonrob/pyasyncore"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d5605fc335ce1bab614032468d0a1e00"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+SRC_URI[sha256sum] = "2c7a8b9b750ba6260f1e5a061456d61320a80579c6a43d42183417da89c7d5d6"
+
+RDEPENDS:${PN} += "python3-core python3-io"
+
+BBCLASSEXTEND = "native nativesdk"


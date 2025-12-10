Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8A2D2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10812.1765354576756423498
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HvpM1Cq6;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7ade456b6abso5655247b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354576; x=1765959376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTvkL13A2xd55VMIfoN7ZenwiqA+9LAtmMWoJuTw9Fk=;
        b=HvpM1Cq6hJMCnGHYN5fEpidrL/4+ZpG9GZ9Cwt3qWS30BXh6vjm9MPNNdP8pQdBNXP
         4a5V0WSGjfqt9iVWWJbE3i9ZJOWcj4vH4HUTOmIDW2EaDahgmTeSjTQoAa2GxwzORZFu
         H9dpZa8jqCpFHBFl5x7y+PJHarhyk5Hozmw5m6zaKAORuHXXwSly1FeAEKqj7PsCS8Wl
         mMXsWCo3NbcSY3a2LccOZDrgEHJTCgnPOfrh4/qQd+rYUxkqHjvYOQNwzDk3GsdQNPui
         7PgmpT0HC3af6hesHKGj6S4psJum8v2I/hrH0elI0RIVVoAZyUpKBDYn3da/o/ytfH8l
         grvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354576; x=1765959376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VTvkL13A2xd55VMIfoN7ZenwiqA+9LAtmMWoJuTw9Fk=;
        b=m8N0a2niLlVqB0WwzHAd6KE7GlcnSpOvQOTpYsddt3R0bJo3AeCAfZHlxaR/VI7o5S
         28zzk55ln+/UTH1YGG7lX+lXAv9TFgXuIQd3KM6kXbg9TDeBxw3Ec31zZsnxN6BzzjVA
         ArvdmNJjQUWzJRtAqX0b23bEmI4dpQfpkst/QXA2mXAcaAzKQul5gSy5qepxabrPrs/S
         Wm8UGt0CPNyz8vIWtO7SmNipwDqe/vrKGeExg73q5q/K1DxxIkHugyvGKgrArqFaWai/
         YtUV1KpVopaBkdPuIz/grooEW5t07bWVlCFRQoguDreQ75EU48OlMpbpDmQ+AQ2aHbKo
         vReA==
X-Gm-Message-State: AOJu0YytHgYq5Fi68nztle6RETTeQ8OdvIVhf5Ip5kKsW6QQp2Sx8YOK
	zCCvM2FY7dOyHgZWMAhewl5Mupb+5jHAs4hHWLZxEnKeYV2P4v2W3IUcKDSxD274
X-Gm-Gg: ASbGnct/Vb9atg37USkP7cd4xA6BZeu7MfReSf855hr3jsFeC5aFw6JKbha/ROd1II4
	9jLFUZKmeKlQ26cDiEpk0X/xKuAnY/VdULBVuBLkeqqsQegY7DtCtHhsSLaU5Njbb6Wsc59yoMp
	Zk3zTYieu9aO1hh3HQne2ts1rKWNy2QdVhmvZXaR3QvHlNLXKKssqeF6tEumxoWjHQHZuQuyg0G
	mShG/v4qjNv3UMCRFh2XjsDPH2EtW8eyCDKxHp/YRLU8YqJeRWOTQ7UpgUY+rm1PGbUGYUsQ4eJ
	ZD4wJ/Y1Sa81HApsBrzR+s441ZPcEmP/dTmB/sX++FNzpZiYjgsppuKFhqyICQsp4ywbVwlkYB5
	MWcf72S24QhKHfRyVwD60SdMoyR/7gqw3jV/hkDuuWlLzrLCXQ7k+/DLy3nzxr+BRzZblNlHcah
	+j+uIxU0KOEAGBQnuiJXO980TMCYvjfGYYSrR/7VZpTjCq1rq8oLsDzFiTYziSxWRZS0++PUJ36
	yphCs2ueUdAWTMoBhmBoUEFGMso4zgXIUYV9s+L/oM=
X-Google-Smtp-Source: AGHT+IHtc9LSF401XjgSVrDVFzb/appB40Pon6exSBxc8vCC646YYpkVsGJ6pJ1dlk9elLFrGG+IYg==
X-Received: by 2002:a05:7022:6392:b0:11b:9152:b3ad with SMTP id a92af1059eb24-11f296a2fb4mr1275063c88.31.1765354575652;
        Wed, 10 Dec 2025 00:16:15 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 7/7] python3-betamax: Skip ptests accessing network
Date: Wed, 10 Dec 2025 00:16:07 -0800
Message-ID: <20251210081607.3196421-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122494

cassette fixtures are not installed in ptests so skip
test_requests_with_json_body

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-use-pytest-vcr-or-skip-if-cassette.patch | 40 +++++++++++++++++++
 .../python/python3-betamax_0.9.0.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-betamax/0001-test_placeholders-use-pytest-vcr-or-skip-if-cassette.patch

diff --git a/meta-python/recipes-devtools/python/python3-betamax/0001-test_placeholders-use-pytest-vcr-or-skip-if-cassette.patch b/meta-python/recipes-devtools/python/python3-betamax/0001-test_placeholders-use-pytest-vcr-or-skip-if-cassette.patch
new file mode 100644
index 0000000000..64ff9be249
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-betamax/0001-test_placeholders-use-pytest-vcr-or-skip-if-cassette.patch
@@ -0,0 +1,40 @@
+From a7f1d08e073e60167c6ac9c72a0110c65f87a937 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Dec 2025 23:04:45 -0800
+Subject: [PATCH] test_placeholders: use pytest-vcr or skip if cassette missing
+
+Upstream-Status: Inappropriate [OE ptest specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/integration/test_placeholders.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+--- a/tests/integration/test_placeholders.py
++++ b/tests/integration/test_placeholders.py
+@@ -1,3 +1,6 @@
++import pytest
++import os
++
+ from betamax import Betamax
+ from betamax.cassette import Cassette
+
+@@ -18,6 +21,8 @@ class TestPlaceholders(IntegrationHelper
+         super(TestPlaceholders, self).tearDown()
+         Cassette.default_cassette_options = original_cassette_options
+
++    @pytest.mark.skipif(not os.path.exists('tests/cassettes/test_placeholders.json'),
++                    reason="Cassette fixture missing")
+     def test_placeholders_work(self):
+         placeholders = Cassette.default_cassette_options['placeholders']
+         assert placeholders == [{
+--- a/tests/regression/test_requests_2_11_body_matcher.py
++++ b/tests/regression/test_requests_2_11_body_matcher.py
+@@ -13,6 +13,7 @@ class TestRequests211BodyMatcher(unittes
+
+     @pytest.mark.skipif(requests.__build__ < 0x020401,
+                         reason="No json keyword.")
++    @pytest.mark.skip(reason="Requires cassette fixture not available in ptest")
+     def test_requests_with_json_body(self):
+         s = requests.Session()
+         with Betamax(s).use_cassette('requests_2_11_body_matcher',
diff --git a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
index f88d43a21a..8dbd21a938 100644
--- a/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-betamax_0.9.0.bb
@@ -10,6 +10,7 @@ SRC_URI += " \
         file://run-ptest \
         git://github.com/betamaxpy/betamax;protocol=https;branch=main \
         file://0001-Drop-ptests-fixtures-and-recorde_modes.patch \
+        file://0001-test_placeholders-use-pytest-vcr-or-skip-if-cassette.patch \
 "




Return-Path: <parthitce@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB687D9ED
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 17:19:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id o4so13374733wra.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 10:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ivUEK1PFI6Zk2mDVt3Wnx4h45gU6e3k8U90zS2doMOk=;
	b=fYRcGfwRESoTcCLZ5+iJQUAgtsPnViE4IiTzLJvvhByOW/69PLAzr0oGdiRcAtBfV0
	o1xXbI8yfZfLk+xhJyRvlqqH8Av0Rnack4HJNsH3eGuECO0RgTiIIlVQGl8cYm8x6JaL
	gTieLSarF1hEkMZ2yMuCycdiPGzKqrdr4E6khQ4Sk3ru9tDlgK81mGcKhtZiS1Az7yNF
	vJO9283rNf0zB8vcZGF943D7CEUOxmZo0RKobySrnr04wgeGWuV9yggr1f/q3LvIoE+W
	yCr7xvbOcZHHaxvfSolTPoUMmCwu1xnvNQgJqZAbI5dwVFZuGlnDViay9ZlUwsRzPB0G
	0LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ivUEK1PFI6Zk2mDVt3Wnx4h45gU6e3k8U90zS2doMOk=;
	b=KAbukxKRGJEd1rtQq8WDNKBzudCwUcTqr0S/sb6o/zsOhzaA4T68nvmcqhsSUZOR4K
	2uNUuvCklsQKbUptN2P9CmlNOK5JxAxmRa+1rq3ScQ0V4eflu2CElwq8VTiZ0TBfbr2K
	Ph6AsnI66MJYgLHYUEKwStl50qFO5fJ2wiiUEweH2J/bagYbVMt9kLCmx4exHN54IFxE
	DkPS+QmV5GtACLhotLHdSIYbq7JWgNjBmi36aNoAkS1Wv6x6OQgP8i6RNIXzwdZGEL0b
	59Tvxu8g7lfnvBZZA+encPS4GbyWifIntEkBkt+LcC7TOLuPH42xnaSDXysiwWQ3OM7i
	fu+Q==
X-Gm-Message-State: APjAAAVMvYEtp+eRbOCse6XTgLFXsqswgmIcnP0efVqQZ1lWuqqszdUi
	lPkB7jPnX2rwsNPv8Hiudhcnj0PuPg==
X-Google-Smtp-Source: APXvYqzWNR9EolRwjkpxMzFlsfhH1rhfQabi51RIgnA+enATKtdrM3paBFX76a5AzPjBffHCh97ohg==
X-Received: by 2002:a5d:5092:: with SMTP id a18mr7690799wrt.112.1556731192761; 
	Wed, 01 May 2019 10:19:52 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180]) by smtp.gmail.com with ESMTPSA id
	c63sm8503083wma.29.2019.05.01.10.19.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 10:19:52 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 19:19:45 +0200
Message-Id: <20190501171945.2999954-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-raven: add version 6.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2019 17:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-raven.inc        | 13 +++++++++++++
 .../recipes-devtools/python/python3-raven_6.10.0.bb |  2 ++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-raven.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-raven_6.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-raven.inc b/meta-python/recipes-devtools/python/python-raven.inc
new file mode 100644
index 000000000..1c65e1176
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-raven.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Raven is the legacy Python client for Sentry (getsentry.com)"
+DESCRIPTION = "\
+Raven is the official legacy Python client for Sentry, officially \
+supports Python 2.6–2.7 & 3.3–3.7, and runs on PyPy and Google App Engine."
+HOMEPAGE = "https://github.com/getsentry/raven-python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b9a4414e08f0571d55184531cefc131b"
+
+SRC_URI[md5sum] = "3676f31dadfa61526444dd0245c78a38"
+SRC_URI[sha256sum] = "3fa6de6efa2493a7c827472e984ce9b020797d0da16f1db67197bcc23c8fae54"
+
+PYPI_PACKAGE = "raven"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
new file mode 100644
index 000000000..0f346e45e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-raven_6.10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-raven.inc
-- 
2.17.2



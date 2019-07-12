Return-Path: <parthitce@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id BA1306C0C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 10:01:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n4so9349073wrs.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xgwfAg9OI++RXvyEQ4NACKa9emUI69t4R4w0zM+nXyU=;
	b=ndV490mdyXO1Jyl7vTphy3M9W1VT0pBpaNAm9i5s/ZWQLL7P2AE3EZwtdHTKqXpU8p
	FSw2U8b9cj5cwVw3e8CAcwNBoEan/I9f/rffz2ZMTstlXG5JYvYZQY/RsfOPBpCZXHIo
	q5Xumka+5HsSfa15FRhnu+HTWtpEBiU/ff6ydYxD2O5e2ESjrfTBuQNrwTa5tkyhzO2/
	L6l7wl8L/91/mQ/RK1b+N1ZVdMPBNOZak4Ce7eL+h5OdW9iWL7sGVKacafqOlFCQkdb2
	kPP+xYfEr2S5rw+byTm1dMrMRvI3AuGfCQILU8WtYpuNSpnadHjyin7upWcRlHcITefV
	cUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xgwfAg9OI++RXvyEQ4NACKa9emUI69t4R4w0zM+nXyU=;
	b=mR7iHHHuOWKnUzA5PLZDrmvttfFJUP0PXQtr30or9gziWPLakGhOZ6TIGavStIsIRK
	21QrgiYmZLA+mEOLSogvlAxkOgzxfnHLnsDynPO/4oiRmaQqUgV/C+r5BKlPmon9kHmd
	SThn7hEhjELPoyYl5qPp5t+e8eYnX9Zg6JTuh0YEUesN1TBkWGbnFvKmji8RIGx6aQZC
	Z29hd8203D+rLtHi5ymqr/9Rh5bUv13MNA2ydNR8goj2ieAFdfbZihs4yGlHfmER7RcF
	JZl442tSkkpTZIKoOBYSPxlDFb5D0ks5cyuCFtvPZkiuRTtB/KwnLPLQUkkHfrZgWKah
	6cAg==
X-Gm-Message-State: APjAAAUd+vGJ6Uyo39vDB75WpAhZzZ7+Q8QzQxiAL4iPCdpESRZgLFPd
	upI54ZijywUCJzw/SGXqypDXjPFQ8Q==
X-Google-Smtp-Source: APXvYqx4w/2NKYzhpcKYb+DFSbFe0hEuVwRNZDsTvX/9ZF/NBQIFAAtQiwzCJxj7FHaGFM2ZYFS/IQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr10857190wrw.138.1562925704956;
	Fri, 12 Jul 2019 03:01:44 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180]) by smtp.gmail.com with ESMTPSA id
	j10sm13170851wrd.26.2019.07.12.03.01.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 03:01:43 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jul 2019 12:01:35 +0200
Message-Id: <20190712100135.456990-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-matplotlib: add version 3.1.1
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
X-List-Received-Date: Fri, 12 Jul 2019 10:01:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../python/python-matplotlib.inc                | 17 +++++++++++++++++
 .../python/python3-matplotlib_3.1.1.bb          |  2 ++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-matplotlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb

diff --git a/meta-python/recipes-devtools/python/python-matplotlib.inc b/meta-python/recipes-devtools/python/python-matplotlib.inc
new file mode 100644
index 000000000..fb5ec9d6a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-matplotlib.inc
@@ -0,0 +1,17 @@
+SUMMARY = "matplotlib: plotting with Python"
+DESCRIPTION = "\
+Matplotlib is a Python 2D plotting library which produces \
+publication-quality figures in a variety of hardcopy formats \
+and interactive environments across platforms."
+HOMEPAGE = "https://github.com/matplotlib/matplotlib"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
+
+DEPENDS = "python3-numpy-native python3-numpy freetype libpng python3-dateutil python3-pytz"
+RDEPENDS_${PN} = "python3-numpy freetype libpng python3-dateutil python3-pytz"
+
+SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
+SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
+
+PYPI_PACKAGE = "matplotlib"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
new file mode 100644
index 000000000..bbeebe20c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-matplotlib.inc
-- 
2.21.0



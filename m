Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABD260291
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2019 05:27:32 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id d4so61425668edr.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 22:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0VeE8zT7ptobSxKvN9F6MJKr02p2wGqxtbgXm8T1jfM=;
	b=Jwni5QuF02J/Egg3/eGIiX278UOGjrCtPGLGbsH8EO2M5grtXJQ9vBtHMjM6pPx/+q
	EwNuQUIOjm/GSjoxJiWzUf8OByb3qb8lZejZonsfitT/obFHbqkVLRrhN1A1CvsQPV9x
	gXmvpbTaHGOrGdBqYytjrD+C+weh0TFMYrEOxQlPcBQcX4fs/lNmHPsrH+D27wkbQt9I
	jMZgV0sjzTJfyXYvXwrPRO2irhxS62xyGZi6+zcWsQOSn/pyUoVqgyzsbZkfqd6MWfoD
	yL1mEtHBZudomFVurWyIGbutKKA4PES8BX0vBHEvOOiU07QX6fShqdGEiWksYZ8fPVjL
	OAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0VeE8zT7ptobSxKvN9F6MJKr02p2wGqxtbgXm8T1jfM=;
	b=o2jiwDXmAR8lT6ScppOJHNxVXx+h2K93MK8ojvk4sIimj43kB9SqMwbUrMSavE+Ynr
	qVOglg4K5DtjZaSOJAuIL3sfV6iJmv/3PRg+KRIFqnffeHU5t3Yp2ufDxrxbrkLVq9i9
	40U1U6UmwB9kM/8SB0CGYNCa/QA7em1QXwoFmsFx3fTuTow4yRMWC/FMMsVjS2t1hXKP
	RMN2Y2IXVAX3XDU27JQWeS4Yq456kurbYLpAsfoTFMvAloeKwtc3e85Sv21Sl5hGU5oE
	CGVeORcKr7Rrp1D5qB9t/hOOJslD49BysIKYiotSZHYot/k+Oh5EudXjQ6hQIaJKqGxM
	bSzw==
X-Gm-Message-State: APjAAAVLXN8tDZkPOqXogg0dGJ8dQ/IB8Jq+TYEtVN2yfmFTCgIOz691
	zwzEP9JFct++ekHMmWYzcY50fNXL
X-Google-Smtp-Source: APXvYqxWdM6QmZD3ARYl7mrhB2a/YXyiYSGpMeGeDBdpNjM/2C9Ydh7/V7V2T5+t/AkUamZ2IrSvPA==
X-Received: by 2002:a17:906:698e:: with SMTP id
	i14mr70891065ejr.122.1564464452562; 
	Mon, 29 Jul 2019 22:27:32 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id
	a67sm16277084edf.6.2019.07.29.22.27.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 22:27:31 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jul 2019 07:27:21 +0200
Message-Id: <20190730052721.15128-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH v3] Add recipe for the coloredlogs python package.
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
X-List-Received-Date: Tue, 30 Jul 2019 05:27:32 -0000

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 .../python/python-coloredlogs.inc             | 24 +++++++++++++++++++
 .../python/python-coloredlogs_10.0.bb         |  2 ++
 .../python/python3-coloredlogs_10.0.bb        |  2 ++
 3 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs.inc
 create mode 100644 meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb

diff --git a/meta-python/recipes-devtools/python/python-coloredlogs.inc b/meta-python/recipes-devtools/python/python-coloredlogs.inc
new file mode 100644
index 000000000..f43bea1f7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-coloredlogs.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Colored terminal output for Python's logging module"
+HOMEPAGE = "https://coloredlogs.readthedocs.io"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+
+SRC_URI[md5sum] = "0a186966a1955fff8cf9489373e691d9"
+SRC_URI[sha256sum] = "b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36"
+
+inherit pypi
+
+do_compile_prepend() {
+    sed -ie "s/find_pth_directory(),/'',/g" setup.py
+}
+
+do_install_append() {
+    rm -rf ${D}${datadir}
+}
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-humanfriendly \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
new file mode 100644
index 000000000..0fc1b258c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-coloredlogs_10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-coloredlogs.inc
diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
new file mode 100644
index 000000000..387239966
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_10.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-coloredlogs.inc
-- 
2.17.1



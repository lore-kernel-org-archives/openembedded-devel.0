Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17C1D786FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y89so5553718pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=daVm69xCEJ70D7Hvb66dAdPxTxpNYZpyJoiEvze9v5k=;
	b=CBZQuzPoGkcFBpdDHLpI204XYz+E2E3YsZtKJ+7mb9mcYUHN16ez+fENTFJG4bAyhS
	sixG1pevcgqzhTa91JErDms1nh8dsA7idKY2VdS+ANDbW5Vl9J6JydqhHOq11xR6HCJ9
	InfODl2RjqqMiw7QA27UiWOjJh7G9153u2WTvNKRAdWygnIfzkczKjfVP6g/lEmLDrC1
	CcpxhbnkG6tw66Aa1rN4QjA989KvIrZ3RXm8OTuQQx023qfmuWfHTsHBdTFABlf281a6
	QLIROC3q3B5iHKOBxJicefwKzPTKogW/UmaH4iBV2l1SidMHaFBZdpQIoCWux3WRzkks
	VkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=daVm69xCEJ70D7Hvb66dAdPxTxpNYZpyJoiEvze9v5k=;
	b=WE3X/bULb5nq+s7XJX5s0cdjRBH4DwZbB2zNEEIyqQuHfy/eQW5ZNpXZQjORJp/hij
	213hMUbLZBFw8aCx3VMvCkBQITJT5sMY4FZfMZBGfpwqKTa8Dn1KGkVO1Ld2xIgRGkZy
	K6qtaS9Yigxf1Jm60eweRV5lAJvJ4YaMbhTTDNh6LCEpwrHt/wJiXJUBX/fyX3Afn1bS
	+PkEyRpvoXBflFPavkHlo9T8MzPsN/E4IE3tt7/bKokEV34w7iEKDUeVx8JTApK+ew1B
	RyT7PZ4+HZlz8jkJ20bZTCXLo/i+aUCSxQ+sV9ZnQzz3KTiQboG4MIqUmY2qM++W8SMP
	tMxg==
X-Gm-Message-State: AJaThX5sQc8eKDbSzA9BCEbCi2FaMUw1oDgjSitti3zB+Ye5NXVS36Ef
	rdpPRDtZva4KghDJ0+5tWrvVnA==
X-Google-Smtp-Source: AGs4zMZ/1EDbDwfq8lE4WE32h9/LjE0Dbym2tQJ9IXMH25CktTL/ID8zBw8dc/IDTcfijJ7QnYJuWA==
X-Received: by 10.101.80.1 with SMTP id f1mr8051801pgo.262.1512191593981;
	Fri, 01 Dec 2017 21:13:13 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:12 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:49 -0800
Message-Id: <1512191576-2302-7-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 06/13] python[3]-flask-script: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:13 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-script.inc  | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-script_2.0.6.bb     |  2 ++
 .../recipes-devtools/python/python3-flask-script_2.0.6.bb    |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-script.inc b/meta-python/recipes-devtools/python/python-flask-script.inc
new file mode 100644
index 0000000..fca777b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-script.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Scripting support for flask"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e686048adb69341fc8a08caeda528b41"
+
+SRC_URI[md5sum] = "3fbd91fe13cebedfb2431331f6eabb68"
+SRC_URI[sha256sum] = "6425963d91054cfcc185807141c7314a9c5ad46325911bd24dcb489bd0161c65"
+
+PYPI_PACKAGE = "Flask-Script"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
new file mode 100644
index 0000000..b7d55af
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-script_2.0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-script.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
new file mode 100644
index 0000000..9f88519
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-script.inc
-- 
2.7.4



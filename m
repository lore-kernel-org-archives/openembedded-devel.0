Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBB877707F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:31:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so477670wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=nPf8eaOMXO3XB67d2qWKI/0WyCD5kVb7Gid6GAeXRds=;
	b=UWVkuvB6cuHW2TjqMJOvSfE5KBrHG8MHG49N7yU8ljYl5LAzG8Eefydsu28jndS1Mm
	r+KHHLrkrrP59bENafarmDFIV4EuQfs5IeheSXVeBiVtZgNTiRm5chMuVC6/k/JoOEyR
	ZEBcqZbQgyWQJad0PJQQA11lAR0AiEOPKCDw5LJvJmLh/dLrT4VSpMIHdkA/N29rp8ip
	wKxpt996KA+E4t669C1u8PzvRxmOqOklp73wt36Iflt/GxWumX3WR6QeitizVMwUfTIj
	AebgPh8abPJ7NMwUsa22wuTG/gjIi+sXXT4fGGHLVSvQ3HR9MEoxjmq05kTdYgXW2HHe
	ECfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=nPf8eaOMXO3XB67d2qWKI/0WyCD5kVb7Gid6GAeXRds=;
	b=fQzJUJF7fSOzr6sw3SeDb1iDsZZZXp5vu0CGMWs5RPdxXyXrAnZYnSAy1WiD1pmPiy
	apC+pmOE/Jl9jOLUNMSEdtsgTvHAoa+4YsDzCv4XHhsZgHN3kwivrpXC3B7HmytKzmz1
	M5tCoINRR0iMsPJ+cwAVYJYsrJC+N75da78VJC7ZMFgnDriKLgyb8YyXzzQBhd0r3woP
	KOyBcM0etC6lo6Sm/ckzhCx0Ftep0l+ijzeO8ZrUyagk5QyT3khKvR6V7C0k+wDWiWKs
	OAyd5PGxkyJzrIAKm8YsGzPQViV2VQkbsaoaiu2R23eKl3rb2imJS+EIOV2ACDn9HMR7
	MLVA==
X-Gm-Message-State: AG10YOQP5C6ZvzZcwjGFPfwmO1gIf/DqfaGslmPVIvj+K94o3bOLDA00J7GsKRyJ/Ofqdg==
X-Received: by 10.195.12.75 with SMTP id eo11mr5529102wjd.50.1453505463386;
	Fri, 22 Jan 2016 15:31:03 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:31:02 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:21 +0100
Message-Id: <c04f6878154e7ecb474a922ac7d70184286680f0.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 19/21] python(3)-flask: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask.inc       | 14 ++++++++++++++
 meta-python/recipes-devtools/python/python-flask_0.10.1.bb |  2 ++
 .../recipes-devtools/python/python3-flask_0.10.1.bb        |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask_0.10.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask_0.10.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
new file mode 100644
index 0000000..4923726
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -0,0 +1,14 @@
+SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
+DESCRIPTION = "\
+Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
+intentions. And before you ask: It’s BSD licensed!"
+HOMEPAGE = "https://github.com/mitsuhiko/flask/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79aa8b7bc4f781210d6b5c06d6424cb0"
+
+SRC_URI[md5sum] = "378670fe456957eb3c27ddaef60b2b24"
+SRC_URI[sha256sum] = "4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373"
+
+PYPI_PACKAGE = "Flask"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-werkzeug ${PYTHON_PN}-jinja2 ${PYTHON_PN}-itsdangerous"
diff --git a/meta-python/recipes-devtools/python/python-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python-flask_0.10.1.bb
new file mode 100644
index 0000000..7ec8123
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask_0.10.1.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-flask.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
new file mode 100644
index 0000000..1ab2c02
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-flask.inc
-- 
1.9.1


